package com.hana.imsure.recommendation.mapper;

import java.util.Map;

/**
 * 추천과 관련된  Mapper 인터페이스 
 *
 * @author 이승은
 *
 */
public interface RecommendationMapper {
	public int insertPsychologicResult(Map<String, Object> result);
	public Map<String, String> selectInsuranceDatail(String insuranceId);
	
}
