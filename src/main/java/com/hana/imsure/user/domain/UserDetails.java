package com.hana.imsure.user.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserDetails extends User{
	
	private static final long serialVersionUID = 1L;
	
	private com.hana.imsure.user.domain.User user;
	
	public UserDetails(String email, String password, Collection <? extends GrantedAuthority> authorities) {
		super(email, password, authorities);
	}
	
	public UserDetails(com.hana.imsure.user.domain.User user) {
		
		super(user.getEmail(), 
			user.getPassword(), 
			user.getAuthorities().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuthority())).collect(Collectors.toList())
		);
		
		this.user = user;
	}

}
