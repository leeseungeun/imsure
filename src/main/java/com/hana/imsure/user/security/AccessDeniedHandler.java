package com.hana.imsure.user.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;

/**
 * 인증하지 않은 사용자나 권한이 없는 사용자에 대한 처리
 * 
 * @author 이승은
 *
 */
public class AccessDeniedHandler implements org.springframework.security.web.access.AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		response.sendError(HttpServletResponse.SC_FORBIDDEN);

	}

}
