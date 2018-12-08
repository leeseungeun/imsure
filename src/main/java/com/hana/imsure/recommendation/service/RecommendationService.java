package com.hana.imsure.recommendation.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.http.client.ClientProtocolException;

import com.hana.imsure.recommendation.domain.GraphInformation;

/**
 * 생명보험 추천 관련 비지니스 로직 수행을 위한 인터페이스 
 * 
 * @author 이승은
 *
 */
public interface RecommendationService {
	
	public List<Map<String, String>> recommendBasedOnPsychologicalFeatures(Map<String, Object> params) 
			throws ClientProtocolException, IOException;
	// 보험상품 상세 가져오는 메소드
	public Map<String, Object> getInsuranceDetail(String insuranceId) throws Exception;
	
	//인구통계학적 보험 추천
	public List<Map<String, String>> recommendBasedOnDemographicalFeatures(Map<String, Object> params)
			throws ClientProtocolException, IOException;
	
	//인구통계학적 보험 추천 - 그래프 그리기
	public List<GraphInformation> drawGraphBasedOnDemographicalFeatures(Map<String, String> params)
				throws Exception;
}
