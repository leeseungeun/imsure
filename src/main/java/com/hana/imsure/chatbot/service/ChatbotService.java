package com.hana.imsure.chatbot.service;

import java.util.Map;

/**
 * 챗봇 관련 비지니스 로직 수행을 위한 인터페이스 
 * 
 * @author 김홍기
 */
public interface ChatbotService {
	
	public Map<String, String> analyzeMessage(String target) throws Exception;
}
