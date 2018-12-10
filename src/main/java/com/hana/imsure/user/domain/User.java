package com.hana.imsure.user.domain;

import java.util.List;

import lombok.Data;

/**
 * User 기본 정보 관리를 위한 도메인 객체
 * 
 * @author 이승은
 */
@Data
public class User {
	
	private Long userId;
	private String email;
	private String password;
	
	private String regdate;
	
	private List<Authority> authorities;
	
}
