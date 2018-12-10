package com.hana.imsure.management.mapper;

import java.util.List;
import java.util.Map;

public interface ManagementMapper {
	
	// 심리 측정치를 기반으로 생명 보험 추천한 결과를 가져오는 메소드
	public List<Map<String, String>> selectPsychologicalResults(String userId);
	// 인구 통계학적 정보를 기반으로 생명 보험 추천한 결과를 가져오는 메소드
	public List<Map<String, String>> selectDemographicResults(String userId);
	// 가입 보험 정보를 스크래핑해 데이터베이스에 저장하는 메소드
	public int insertEnrolledInsurance(Map<String, String> insurance);
	// 가입 보험 목록을 가져오는 메소드
	public List<Map<String, String>> selectEnrolledInsurances(String userId);
	// 가입 보험 상세보기를 가져오는 메소드
	public Map<String, String> selectEnrolledInsuranceDetail(Map<String, String> params);
}
