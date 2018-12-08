package com.hana.imsure.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
public class UserServiceImpl implements UserService, UserDetailsService{
	
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
		Map<String, String> emailValidation = new HashMap<String, String>();
		emailValidation.put("type", "REGISTER");
		emailValidation.put("validationNumber", RandomStringGenerator.generateRandomString(15));
		mapper.insertEmailValidation(emailValidation);
		
		return true;
	}
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		User user = mapper.read(email);
		
		return user == null? null : new com.hana.imsure.user.domain.UserDetails(user);
	}
	
}
