package com.hana.imsure.user.domain;

import lombok.Data;

/**
 * 사용자 권한 관리를 위한 도메인 객체
 * 
 * @author 이승은
 *
 */
@Data
public class Authority {
	
	private String email;
	private String authority;
	
}
