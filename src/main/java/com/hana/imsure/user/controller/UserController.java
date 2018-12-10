package com.hana.imsure.user.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hana.imsure.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class UserController {
	
	private UserService service;
	
	// 이하 화면 처리
	@GetMapping("/all/loginPage")
	public String loginPage() {
		
		log.debug("loginPage.jsp called...");
		
		return "components/user/loginPage";
	}
	
	@GetMapping("/all/registerPage")
	public String regiterPage() {
		
		log.debug("registerPage.jsp called...");
		
		return "components/user/registerPage";
	}
	
	@GetMapping("/all/resetPasswordPage")
	public String resetPasswordPage() {
		
		log.debug("resetPasswordPage.jsp called...");
		
		return "components/user/resetPasswordPage";
	}
	
	@GetMapping("/all/needEmailValidationPage")
	public String needEmailValidationPage() {
		
		log.debug("needEmailValidationPage.jsp called...");
		
		return "components/user/needEmailValidationPage";
	}
	
	// 회원 가입
	@RequestMapping(
		method = RequestMethod.POST,
		value = "/all/register",
		consumes = "application/json"
	)
	public ResponseEntity register(@RequestBody Map<String, String> user) {
		if (service.register(user)) {
			return new ResponseEntity(HttpStatus.CREATED);
		} else {
			return new ResponseEntity(HttpStatus.PRECONDITION_FAILED);
		}
	}
	
	// 이메일 인증
	@GetMapping("/all/validate-user-validation-number")
	public String validateUserValidationNumber(
			@RequestParam("email") String email, 
			@RequestParam("validationNumber") String validationNumber) {
		
		boolean result = service.validateEmail(email, validationNumber);
		
		if (result) {
			return "completeEmailValidation";
		} else {
			return "failEmailValidation";
		}
	}
	
	// 이메일 인증 후 재로그인
	@GetMapping("/uncertified-user/login-after-email-validation")
	public ResponseEntity loginAfterEmailValidation() {
		
		if (service.loginAfterEmailValidation()) {
			return new ResponseEntity(HttpStatus.OK);
		} else {
			return new ResponseEntity(HttpStatus.FORBIDDEN);
		}
		
	}
}
