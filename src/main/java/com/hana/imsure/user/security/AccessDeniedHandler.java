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

import lombok.extern.log4j.Log4j;

/**
 * 인증하지 않은 사용자나 권한이 없는 사용자에 대한 처리
 * 
 * @author 이승은
 *
 */
@Log4j
public class AccessDeniedHandler implements org.springframework.security.web.access.AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {

		// 응답을 위한 변수
		PrintWriter out = null;
		Map<String, String> result = new HashMap<String, String>();

		try {
			out = response.getWriter();

			// JSON 변환
			Gson gson = new GsonBuilder().create();
			String jsonResult = gson.toJson(result);
			// 응답
			out.println(jsonResult);

		// 자원 누수를 방지하기 위해 자원 반납
		} finally {
			if (out != null)
				out.close();
		}

	}

}
