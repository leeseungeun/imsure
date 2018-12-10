package com.hana.imsure.management.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hana.imsure.management.service.ManagementService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class ManagementController {

	private ManagementService service;
	
	// 심리 측정치를 기반으로 생명 보험 추천한 결과를 가져오는 메소드
	@RequestMapping(
		method = RequestMethod.GET,
		value = "/user/users/{userId}/psychological-recommendation-results",
		produces = MediaType.APPLICATION_JSON_UTF8_VALUE
	)
	public ResponseEntity<List<Map<String, String>>> getPsychologicalResults(@PathVariable("userId") String userId) {
		
		try {

			log.debug("/user/users/" + userId + "/psychological-recommendation-results called");
			
			List<Map<String, String>> result = service.getPsychologicalResults(userId);
			return new ResponseEntity<List<Map<String,String>>>(result, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e);
			return new ResponseEntity<List<Map<String,String>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 인구 통계학적 정보를 기반으로 생명 보험 추천한 결과를 가져오는 메소드
	@RequestMapping(
		method = RequestMethod.GET,
		value = "/user/users/{userId}/demographic-recommendation-results",
		produces = MediaType.APPLICATION_JSON_UTF8_VALUE
	)
	public ResponseEntity<List<Map<String, String>>> getDemographicResults(@PathVariable("userId") String userId) {
		try {
			
			log.debug("/user/users/" + userId + "/demographic-recommendation-results called");
			
			List<Map<String, String>> result = service.getDemographicResults(userId);
			return new ResponseEntity<List<Map<String,String>>>(result, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e);
			return new ResponseEntity<List<Map<String,String>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 가입 보험을 스크래핑해 데이터베이스에 저장하는 메소드
	@RequestMapping(
		method = RequestMethod.POST,
		value = "/user/users/{userId}/insurances",
		produces = MediaType.APPLICATION_JSON_UTF8_VALUE
	)
	public ResponseEntity scrapeEnrolledInsurances(
		@PathVariable("userId") String userId,
		@RequestParam("uuid") String uuid 
	) {
		log.debug(uuid);
		log.debug("/user/users/" + userId + "/insurances called");
		
		boolean result = service.saveEnrolledInsurancesToDB(userId, uuid);
		if (result) {
			return new ResponseEntity(HttpStatus.CREATED);
		} else {
			return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 가입 보험 목록을 불러오는 메소드
	@RequestMapping(
		method = RequestMethod.GET,
		value = "user/users/{userId}/insurances",
		produces = MediaType.APPLICATION_JSON_UTF8_VALUE
	)
	public ResponseEntity<List<Map<String, String>>> getEnrolledInsurances(@PathVariable("userId") String userId) {
		
		try {
			
			log.debug("/user/users/" + userId + "/insurances called");
			
			List<Map<String, String>> result = service.getEnrolledInsurances(userId);
			return new ResponseEntity<List<Map<String,String>>>(result, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e);
			return new ResponseEntity<List<Map<String,String>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	// 가입 보험 상세보기 불러오는 메소드
	@RequestMapping(
		method = RequestMethod.GET,
		value = "/user/users/{userId}/insurances/{insuranceId}",
		produces = MediaType.APPLICATION_JSON_UTF8_VALUE
	)
	public ResponseEntity<Map<String, String>> getEnrolledInsuranceDetail(
		@PathVariable("userId") String userId,
		@PathVariable("insuranceId") String insuranceId
	) {
		try {
			
			log.debug("/user/users/" + userId + "/insurances/" + insuranceId + " called");
			
			Map<String, String> params = new HashMap<String, String>();
			params.put("userId", userId);
			params.put("insuranceId", insuranceId);
			
			Map<String, String> result = service.getEnrolledInsuranceDetail(params);
			return new ResponseEntity<Map<String,String>>(result, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e);
			return new ResponseEntity<Map<String,String>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
