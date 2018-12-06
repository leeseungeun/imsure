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
	
	//인구통계학적 보험추천에 필요한 정보 번호 구하기
	public String readDemographyId();
	//인구통계학적 보험추천에 필요한 정보 저장하기
	public int insertDemographicInfomation(Map<String, Object> result);
	//인구통계학적 보험추천 결과 저장하기
	public int insertDemographicResult(Map<String, Object> result);
}
