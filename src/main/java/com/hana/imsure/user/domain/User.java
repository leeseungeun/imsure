package com.hana.imsure.user.domain;

import lombok.Data;

/**
 * User 기본 정보 관리를 위한 도메인 객체
 * 
 * @author 김홍기
 */
@Data
public class User {
	private String userId;
	private String email;
	private String password;
	private String regdate;
	private String authority;
	
	/**
	 * 이메일과 비밀번호 null값을 체크하는 메소드.
	 * @param userVO : 이메일과 비밀번호가 포함된 객체
	 * @return 결과값 반환
	 */
	public boolean checkNull(User user) {
		
		if(user.getEmail() == null || user.getPassword() == null
				|| user.getEmail().trim().length() == 0 || user.getPassword().trim().length() == 0) {
			return false;
		}
		return true;
	}
}
