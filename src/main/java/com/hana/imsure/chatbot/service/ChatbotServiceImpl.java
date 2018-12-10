package com.hana.imsure.chatbot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hana.imsure.chatbot.mapper.ChatbotMapper;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import kr.co.shineware.nlp.komoran.model.Token;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 챗봇 관련 비지니스 로직 수행을 위한 Service 객체
 * 
 * @author 김홍기
 */
@Log4j
@Service
@AllArgsConstructor
public class ChatbotServiceImpl implements ChatbotService{
	
	private ChatbotMapper mapper;

	@Override
	public Map<String, String> analyzeMessage(String target) throws Exception {
		
		Komoran komoran = new Komoran(DEFAULT_MODEL.FULL);
		KomoranResult analyzeResultList = komoran.analyze(target);
		List<Token> tokenList = analyzeResultList.getTokenList();
		
		//결과값을 저장하는 Map
		Map<String, String> map = new HashMap<String, String>();
		
		for(Token token : tokenList) {
			
			log.debug("형태소 분석 : " + token);
			
			if (token.getMorph().equals("안녕하세요") || token.getMorph().equals("안녕")) {
				map.put("message", mapper.read("1"));
			}
			if (token.getMorph().equals("질병")) {
				map.put("message", mapper.read("2"));
			}
			if (token.getMorph().equals("사망")) {
				map.put("message", mapper.read("3"));
			}
			if (token.getMorph().equals("연금")) {
				map.put("message", mapper.read("4"));
			}
			if (token.getMorph().equals("보장")) {
				map.put("message", mapper.read("5"));
			}
			if (token.getMorph().equals("MSURE")) {
				map.put("message", mapper.read("6"));
			}
			if (token.getMorph().equals("필요")) {
				map.put("message", mapper.read("7"));
			}
			if (token.getMorph().equals("추천")) {
				map.put("message", mapper.read("8"));
			} 
			if (map.isEmpty()) {
				map.put("message", mapper.read("9"));
			}
		}
		return map;
	}

}
