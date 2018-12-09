package com.hana.imsure.user.service;

import java.util.Map;

/**
 * User와 관련된 비즈니스 로직 수행을 위한 인터페이스
 * 
 * @author 이승은
 */
public interface UserService {
	
	// 회원 가입
	public boolean register(Map<String, String> user);
	
	// 이메일 관련
	public String generateEmailValidationUrl(String email, String validationNumber);
	public void sendEmailValidation(String email, String url);
	public boolean validateEmail(String email, String validationNumber);
}
