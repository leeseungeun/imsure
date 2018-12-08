package com.hana.imsure.user.service;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.hana.imsure.user.domain.User;
import com.hana.imsure.user.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
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
	
	@Override
	public boolean register(User user) {
		return false;
	}
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		User user = mapper.certify(email);
		
		return user == null? null : new com.hana.imsure.user.domain.UserDetails(user);
	}
	
}
