package com.hana.imsure.management.service;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.hana.imsure.management.mapper.ManagementMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ManagementServiceImpl implements ManagementService {

	private ManagementMapper mapper;

	// 심리 측정치를 기반으로 생명 보험 추천한 결과를 가져오는 메소드
	@Override
	public List<Map<String, String>> getPsychologicalResults(String userId) {
		return mapper.selectPsychologicalResults(userId);
	}

	// 인구 통계학적 정보를 기반으로 생명 보험 추천한 결과를 가져오는 메소드
	@Override
	public List<Map<String, String>> getDemographicResults(String userId) {
		return mapper.selectDemographicResults(userId);
	}

	// 가입 보험 정보를 스크래핑해 데이터베이스에 저장하는 메소드
	@Override
	@Transactional
	public boolean saveEnrolledInsurancesToDB(String userId, String uuid) {
		
		try {
			
			// 파이썬 서버 url
			String url = "http://localhost:5000/python-server/scrape-to-get-enrolled-insurances";
			
			HttpClient httpClient = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost(url);
			
			// parameter 및 header 설정 후 요청 보냄
			Map<String, String> params = new HashMap<String, String>();
			log.debug(uuid);
			params.put("uuid", uuid);
			StringEntity postingString = new StringEntity(new Gson().toJson(params));
			log.debug(postingString);
			post.setEntity(postingString);
			post.setHeader("Content-type", "application/json");
			HttpResponse response = httpClient.execute(post);
			
			// 결과 값 파싱
			String responseString = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);
			log.debug(responseString);
			ObjectMapper javaObjectMapper = new ObjectMapper();
			List<Map<String, String>> insurances = javaObjectMapper.readValue(responseString, new TypeReference<List<Map<String, String>>>(){});
			
			for (Map<String, String> insurance : insurances) {
				
				log.debug(insurance);
				
				if (insurance.get("구분").equals("생명보험")) {
					
					Map<String, String> insuranceDB = new HashMap<String, String>();
					insuranceDB.put("insuranceName", insurance.get("상품명"));
					insuranceDB.put("userId", userId);
					insuranceDB.put("contractStatus", insurance.get("계약상태"));
					insuranceDB.put("stockNumber", insurance.get("증권번호"));
					insuranceDB.put("insuranceTerm", insurance.get("보험기간"));
					insuranceDB.put("storeInCharge", insurance.get("담당점포"));
					
					mapper.insertEnrolledInsurance(insuranceDB);
				}
			}
			
			return true;
			
		} catch (Exception e) {
			return false;
		}
	}
	
	// 가입 보험 목록을 가져오는 메소드
	@Override
	public List<Map<String, String>> getEnrolledInsurances(String userId) {
		return mapper.selectEnrolledInsurances(userId);
	}
	
	// 가입 보험 상세보기를 가져오는 메소드
	public Map<String, String> getEnrolledInsuranceDetail(Map<String, String> params) {
		return mapper.selectEnrolledInsuranceDetail(params);
	}
}
