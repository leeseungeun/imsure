package com.hana.imsure.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hana.imsure.user.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * User와 관련된 비즈니스 로직 수행을 위한 Service 객체
 * 
 * @author 김홍기
 */
@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{
	
	private UserMapper mapper;
	
	//로그인
	@Override
	public Map<String, String> login(String email, String password) {
		log.debug(email + "로그인 시도 중...");
		return mapper.certify(email, password);
	}
	
}
