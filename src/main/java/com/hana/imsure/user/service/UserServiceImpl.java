package com.hana.imsure.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hana.imsure.common.utils.Mail;
import com.hana.imsure.common.utils.RandomStringGenerator;
import com.hana.imsure.user.domain.User;
import com.hana.imsure.user.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * User와 관련된 비즈니스 로직 수행을 위한 Service 객체
 * 
 * @author 이승은
 */
@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService, UserDetailsService {

	private UserMapper mapper;
	private PasswordEncoder encoder;

	@Override
	@Transactional
	public boolean register(Map<String, String> user) {

		String email = user.get("email");
		String password = user.get("password");

		// 이메일 중복 확인
		if (mapper.read(email) != null) {
			return false;
		}

		// 비밀번호 암호화
		user.put("password", encoder.encode(password));

		// 기본 정보 삽입
		mapper.insertUser(user);

		// 권한 정보 삽입
		Map<String, String> authority = new HashMap<String, String>();
		authority.put("email", email);
		authority.put("role", "ROLE_UNCERTIFIED_USER");
		mapper.insertAuthority(authority);

		// 이메일 인증 정보 삽입
		String validationNumber = RandomStringGenerator.generateRandomString(15);
		Map<String, String> emailValidation = new HashMap<String, String>();
		emailValidation.put("type", "REGISTER");
		emailValidation.put("validationNumber", validationNumber);
		mapper.insertEmailValidation(emailValidation);

		// 인증을 위한 이메일 보내기
		String url = this.generateEmailValidationUrl(email, validationNumber);
		this.sendEmailValidation(email, url);

		return true;
	}

	// 이메일 관련 메소드
	// 인증 위한 API 주소 생성 메소드
	public String generateEmailValidationUrl(String email, String validationNumber) {

		String baseUrl = "http://localhost/all/validate-user-validation-number?";

		return baseUrl + "email=" + email + "&validationNumber=" + validationNumber;
	}

	// 재사용을 위해 메일 전송 메소드 분리
	public void sendEmailValidation(String email, String url) {
		new Mail(email, "회원 가입을 축하드립니다!", "인증을 통해 보다 많은 I'MSURE의 즐겨보세요!\n" + url);
	}

	// 이메일 인증을 수행하는 메소드
	@Override
	@Transactional
	public boolean validateEmail(String email, String validationNumber) {

		int updateEmailValidationResult = 0;
		int updateAuthorityResult = 0;
		
		Map<String, String> emailValidation = new HashMap<String, String>();
		emailValidation.put("email", email);
		emailValidation.put("validationNumber", validationNumber);
		emailValidation.put("type", "REGISTER");
		updateEmailValidationResult = mapper.updateEmailValidation(emailValidation);
		
		boolean isEmailValidationUpdated = updateEmailValidationResult == 1;
		
		if (isEmailValidationUpdated) {
			Map<String, String> authority = new HashMap<String, String>();
			authority.put("email", email);
			authority.put("role", "ROLE_USER");
			
			updateAuthorityResult = mapper.updateAuthority(authority);
		}

		return isEmailValidationUpdated && updateAuthorityResult == 1;
		
	}

	// Spring Security를 위한 메소드 오버라이드
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

		User user = mapper.read(email);
		return user == null ? null : new com.hana.imsure.user.domain.UserDetails(user);
	}

	@Override
	public boolean loginAfterEmailValidation() {
		
		try {
			
			// 현재 정보로부터 새로운 정보를 불러옴
			Authentication currentAuth = SecurityContextHolder.getContext().getAuthentication();
			String email = ((com.hana.imsure.user.domain.UserDetails)currentAuth.getPrincipal()).getUsername();
			UserDetails userDetails = this.loadUserByUsername (email);
			
			log.debug(userDetails);
			log.debug(userDetails.getAuthorities());
			
			// 새로운 정보를 넣어줌
			Authentication newAuth = new UsernamePasswordAuthenticationToken (userDetails, null, userDetails.getAuthorities ());
			SecurityContextHolder.getContext().setAuthentication(newAuth);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
