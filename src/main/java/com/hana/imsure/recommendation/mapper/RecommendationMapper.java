package com.hana.imsure.recommendation.mapper;

import java.util.List;
import java.util.Map;

import com.hana.imsure.recommendation.domain.GraphInformation;

/**
 * 추천과 관련된  Mapper 인터페이스 
 *
 * @author 이승은
 *
 */
public interface RecommendationMapper {
	// 심리추천 결과 저장
	public int insertPsychologicResult(Map<String, Object> result);
	
	// 보험상세 가져오기
	public Map<String, String> selectInsuranceDatail(String insuranceId);
	
	//인구통계학적 보험추천에 필요한 정보 번호 구하기
	public String readDemographyId();
	
	//인구통계학적 보험추천에 필요한 정보 저장하기
	public int insertDemographicInfomation(Map<String, Object> result);
	
	//인구통계학적 보험추천 결과 저장하기
	public int insertDemographicResult(Map<String, Object> result);

	//인구통계 그래프 정보 가져오기
	public List<GraphInformation> readGraphInformation(Map<String, String> result);
}
