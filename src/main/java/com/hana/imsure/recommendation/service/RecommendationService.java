package com.hana.imsure.recommendation.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.http.client.ClientProtocolException;

/**
 * 생명보험 추천 관련 비지니스 로직 수행을 위한 인터페이스 
 * 
 * @author 이승은
 *
 */
public interface RecommendationService {
	
	public List<Map<String, String>> recommendBasedOnPsychologicalFeatures(Map<String, Object> params) 
			throws ClientProtocolException, IOException;
	
}
