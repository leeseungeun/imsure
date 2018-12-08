package com.hana.imsure.user.domain;

import lombok.Data;

/**
 * 이메일 인증 정보 관리를 위한 도메인 객체
 * 
 * @author 이승은
 */
@Data
public class EmailValidation {
	
	private Long validationId;
	private Long userId;
	private String validationNumber;
	private String isValidated;
	private String type;
	private String createdDate;
	
}
