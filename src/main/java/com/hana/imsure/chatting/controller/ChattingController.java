package com.hana.imsure.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 채팅 관련 컨트롤러
 * 
 * @author 김홍기
 *
 */
@Log4j
@Controller
@AllArgsConstructor
public class ChattingController {

	@GetMapping("/user/chatbotPage")
	public String chattingPage() {
		
		log.debug("chatbotPage.jsp called");
		
		return "components/chatbot/chatbotPage";
	}
}
