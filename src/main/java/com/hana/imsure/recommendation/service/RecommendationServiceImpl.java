package com.hana.imsure.recommendation.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.hana.imsure.common.utils.UTF8;
import com.hana.imsure.recommendation.mapper.RecommendationMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 생명보험 추천 관련 비지니스 로직 수행을 위한 Service 객체
 * 
 * @author 이승은
 *
 */
@Log4j
@Service
@AllArgsConstructor
public class RecommendationServiceImpl implements RecommendationService {

	// personality parameter에서 index와 성격 매핑
	private static final int EXTRAVERSION = 0;
	private static final int AGREEABLENESS = 1;
	private static final int CONSCIENTIOUSNESS = 2;
	private static final int NEUROTICISM = 3;
	private static final int OPENNESS = 4;
	
	// python 서버 통신 결과 매칭
	private static final int PRODUCT_ID = 0;
	private static final int PRODUCT_NAME = 1;
	private static final int PRODUCT_TYPE = 2;
	private static final int DISTANCE = 3;
	
	private RecommendationMapper mapper;
	
	@Override
	public List<Map<String, String>> recommendBasedOnPsychologicalFeatures(Map<String, Object> params) 
			throws ClientProtocolException, IOException {
		// 결과를 담을 변수 선언
		Map<String, Object> resultForDatabase = new HashMap<String, Object>();
		List<Map<String, String>> resultForView = new ArrayList<Map<String, String>>();
		
		// userId와 성격 점수 넣어줌
		resultForDatabase.put("userId", params.get("userId"));
		@SuppressWarnings("unchecked")
		List<Integer> personality = (List<Integer>) params.get("personality");
		resultForDatabase.put("agreeableness", personality.get(AGREEABLENESS));
		resultForDatabase.put("conscientiousness", personality.get(CONSCIENTIOUSNESS));
		resultForDatabase.put("neuroticism", personality.get(NEUROTICISM));
		resultForDatabase.put("openness", personality.get(OPENNESS));
		resultForDatabase.put("extraversion", personality.get(EXTRAVERSION));
		
		// 파이썬 서버 url
		String url = "http://localhost:5000/python-server/recommand-based-on-psychological-features";
		
		HttpClient   httpClient    = HttpClientBuilder.create().build();
		HttpPost     post          = new HttpPost(url);
		
		// parameter 및 header 설정 후 요청 보냄
		StringEntity postingString = new StringEntity(new Gson().toJson(params));
		post.setEntity(postingString);
		post.setHeader("Content-type", "application/json");
		HttpResponse  response = httpClient.execute(post);
		
		// 결과 값 파싱
		String responseString = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);
		// 대괄호 제거 후 상품 별로 나눔
		String[] results = responseString.trim().substring(1, responseString.trim().length() - 2).split("],?");
		int insuraneIndex = 0;
		for (String insurance : results) {
			int insuranceDatumIndex = 0;
			Map<String, String> insuranceData = new HashMap<String, String>();
			// 대괄호 제거 후 쉼표를 기준으로 정보를 나눔
			String[] elements = insurance.trim().substring(1, insurance.trim().length()).split(",");
			for (String datum : elements) {
				
				datum = datum.trim();
				
				switch (insuranceDatumIndex) {
				case PRODUCT_ID:
					resultForDatabase.put("insuranceId" + (insuraneIndex + 1), datum);
					insuranceData.put("insurnaceId", datum);
					break;
				case PRODUCT_NAME:
					String decodedProductName = UTF8.decode(datum); 
					insuranceData.put("insurnaceName", decodedProductName.substring(1, decodedProductName.length() - 1));
					break;
				case PRODUCT_TYPE:
					String decodedProductType = UTF8.decode(datum); 
					insuranceData.put("insurnaceType", decodedProductType.substring(1, decodedProductType.length() - 1));
					break;
				}
				insuranceDatumIndex++;
			}
			resultForView.add(insuranceData);
			insuraneIndex++;
		}
		mapper.insertPsychologicResult(resultForDatabase);
		
		return resultForView;
	}

}
