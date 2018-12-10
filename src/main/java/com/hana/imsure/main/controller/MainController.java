package com.hana.imsure.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {
	
	@GetMapping("/")
	public String root() {
		
		return "forward:/all";
	}
	
	@GetMapping("/all")
	public String home() {
		
		log.debug("index.jsp called");
		
		return "index";
	}
	
	@GetMapping("/all/mainPage")
	public String mainPage() {
		
		log.debug("mainPage.jsp called");
		
		return "components/main/mainPage";
	}
	
	@GetMapping("/user/managementPage")
	public String managementPage() {
		
		log.debug("mainPage.jsp called");
		
		return "components/management/managementPage";
	}
	
}
