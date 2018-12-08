package com.hana.imsure.user.service;

import com.hana.imsure.user.domain.User;

/**
 * User와 관련된 비즈니스 로직 수행을 위한 인터페이스
 * 
 * @author 이승은
 */
public interface UserService {
	
	public boolean register(User user);
	
}
