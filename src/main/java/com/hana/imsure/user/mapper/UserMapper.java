package com.hana.imsure.user.mapper;

import java.util.Map;

import com.hana.imsure.user.domain.User;

/**
 * User와 관련된  Mapper 인터페이스
 * 
 * @author 이승은
 */
public interface UserMapper {

	// 이메일 중복 확인
	public String checkEmailDuplication(String email);
	
	// 회원 가입
	// 회원 기본 정보
	public int insertUser(Map<String, String> user);
	// 권한 정보
	public int insertAuthority(Map<String, String> authority);
	// 인증 정보
	public int insertEmailValidation(Map<String, String> emailValidation);
	
	//로그인, 이메일 중복 확인
	public User read(String email);
}
