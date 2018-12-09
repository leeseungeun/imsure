package com.hana.imsure.user.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hana.imsure.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class UserController {
	
	private UserService service;
	
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
}
