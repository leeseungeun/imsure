package com.hana.imsure.user.security;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * 인증하지 않은 사용자나 권한이 없는 사용자에 대한 처리
 * 
 * @author 이승은
 *
 */
public class AccessDeniedHandler implements org.springframework.security.web.access.AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException)
			throws IOException, ServletException {
		// 응답을 위한 변수
		PrintWriter out = null;
		Map<String, String> result = new HashMap<String, String>();
		// Spring Security에 의해 로그인할 경우 만들어지는 인증된 사용자에 대한 정보
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		try {
			out = response.getWriter();
			
			// 해당 객체가 없는 경우 로그인하지 않음
			if (auth == null) {
				
			
			// 해당 객체가 있는데 이 클래스로 왔다면 인가되지 않은 사용자
			// 권한 확인 후 해당되는 페이지로 이동해야 함
			} else {
				
				List authorities = (List) auth.getAuthorities();
				
			}
			
			// JSON 변환
			Gson gson = new GsonBuilder().create();
			String jsonResult = gson.toJson(result);
			// 응답
			out.println(jsonResult);
		
		// 자원 누수를 방지하기 위해 자원 반납
		} finally {
			if (out != null) out.close();
		}
		
	}

}
