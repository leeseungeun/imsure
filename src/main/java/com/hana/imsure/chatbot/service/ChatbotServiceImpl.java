package com.hana.imsure.chatbot.service;

import java.util.ArrayList;
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
		List<String> result = new ArrayList<String>();
		
		//결과값을 저장하는 Map
		Map<String, String> map = new HashMap<String, String>();
		
		
		for(Token token : tokenList) {
			
			log.debug("형태소 분석 : " + token.getMorph());
			
			result.add(String.valueOf(token.getMorph()));
		}
		
		if (result.contains("안녕하세요") || result.contains("안녕") || result.contains("반갑")) {
			map.put("message", mapper.read("1"));
			return map;
		}
		if (result.contains("질병") && result.contains("보장") && result.contains("보험")) {
			map.put("message", mapper.read("2"));
			return map;
		}
		if (result.contains("사망") && result.contains("보험")) {
			map.put("message", mapper.read("3"));
			return map;
		}
		if (result.contains("연금") && result.contains("보험")) {
			map.put("message", mapper.read("4"));
			return map;
		}
		if (result.contains("보장") && result.contains("금액")) {
			map.put("message", mapper.read("5"));
			return map;
		}
		if (result.contains("I") && result.contains("MSURE")) {
			map.put("message", mapper.read("6"));
			return map;
		}
		if (result.contains("보험") && result.contains("왜")) {
			map.put("message", mapper.read("7"));
			return map;
		}
		if (result.contains("보험") && result.contains("추천")) {
			map.put("message", mapper.read("8"));
			return map;
		}
		map.put("message", mapper.read("9"));
		return map;
	}
}
