package com.hana.imsure.user.mapper;

import java.util.Map;

/**
 * User와 관련된  Mapper 인터페이스
 * 
 * @author 김홍기
 */
public interface UserMapper {
	//로그인
	public Map<String, String> certify(String email, String password);
}
