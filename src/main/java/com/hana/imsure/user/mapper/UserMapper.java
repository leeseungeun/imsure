package com.hana.imsure.user.mapper;

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
	public int insert(User user);
	
	//로그인
	public User certify(String email);
}
