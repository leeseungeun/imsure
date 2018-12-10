package com.hana.imsure.chatbot.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hana.imsure.chatbot.service.ChatbotService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 챗봇 관련 컨트롤러
 * 
 * @author 김홍기
 */
@Log4j
@Controller
@AllArgsConstructor
public class ChatbotController {
	
	private ChatbotService service;

	@GetMapping("/user/chatbotPage")
	public String chattingPage() {
		
		log.debug("chatbotPage.jsp called");
		
		return "components/chatbot/chatbotPage";
	}
	
	// 챗봇 에코 메시지
	@RequestMapping(
		method = RequestMethod.POST,
		value = "/user/send-message",
		consumes = "application/json",
		produces = MediaType.APPLICATION_JSON_UTF8_VALUE
	)
	public ResponseEntity<Map<String, String>> analyzeMessage(
		@RequestBody Map<String, String> params
	) {
		try {
				
			log.debug("send message called...");
			
			Map<String, String> map = service.analyzeMessage(params.get("message"));
			return new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			log.debug(e);
			return new ResponseEntity<Map<String,String>>(HttpStatus.BAD_REQUEST);
		}
	} 
}
