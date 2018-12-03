package com.hana.imsure.recommendation.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hana.imsure.recommendation.service.RecommendationService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 생명보험 추천 관련 컨트롤러
 * 
 * @author 이승은
 *
 */
@Log4j
@Controller
@AllArgsConstructor
public class RecommendationController {
	
	private RecommendationService service;
	
	// 이하 화면 라우팅
	@GetMapping("/user/demographicPage")
	public String demographicPage() {
		
		log.debug("demographicPage.jsp called");
		
		return "components/recommendation/demographicPage";
	}
	
	@GetMapping("/user/demographicResultPage")
	public String demographicResultPage() {
		
		log.debug("demographicResultPage.jsp called");
		
		return "components/recommendation/demographicResultPage";
	}
		
	@GetMapping("/uncertified-user/psychologicPage")
	public String psychologicPage() {
		
		log.debug("psychologicPage.jsp called");
		
		return "components/recommendation/psychologicPage";
	}
	
	@GetMapping("/user/psychologicResultPage")
	public String psychologicResultPage() {
		
		log.debug("psychologicResultPage.jsp called");
		
		return "components/recommendation/psychologicResultPage";
	}
	
	// 심리학적 특성을 이용한 생명보험 추천
	@RequestMapping(
		method = RequestMethod.POST,
		value = "/user/recommend-based-on-psychological-features",
		consumes = "application/json",
		produces = MediaType.APPLICATION_JSON_UTF8_VALUE
	)
	public ResponseEntity<List<Map<String, String>>> recommendBasedOnPsychologicalFeatures(
		@RequestBody Map<String, Object> params
	) {
		try {
			
			log.debug("recommend based on psychological features called");
			
			List<Map<String, String>> result = service.recommendBasedOnPsychologicalFeatures(params);
			return new ResponseEntity<List<Map<String,String>>>(result, HttpStatus.CREATED);
		
		} catch (Exception e) {
			log.debug(e);
			return new ResponseEntity<List<Map<String,String>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	} 
	
	/*@GetMapping(
		value = "/user/insurances/{insuranceId}",
		produces = MediaType.APPLICATION_JSON_UTF8_VALUE
	)
	public ResponseEntity<> getInsuranceDetail() {
		return new ResponseEntity<>();
	}*/
	
}
