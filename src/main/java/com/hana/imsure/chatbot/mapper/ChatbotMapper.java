package com.hana.imsure.chatbot.mapper;

/**
 * 챗봇과 관련된  Mapper 인터페이스 
 *
 * @author 김홍기
 */
public interface ChatbotMapper {
	//챗봇 메시지 내용 가져오기
	public String read(String messageId);
}
