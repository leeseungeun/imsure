package com.hana.imsure.user.service;

import java.util.Map;

/**
 * User와 관련된 비즈니스 로직 수행을 위한 인터페이스
 * 
 * @author 김홍기
 */
public interface UserService {
	//로그인
	public Map<String, String> login(String email, String password);
}
