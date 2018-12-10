package com.hana.imsure.recommendation.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class RecommendServiceTests {

	@Inject
	private RecommendationService service;

	@Test
	public void testGetList() throws Exception {

		Map<String, String> params = new HashMap<>();
		params.put("birthNumber", "19930131");
		params.put("income", "3500");
		params.put("job", "사무종사자");
		 log.info("***************************"+service.drawGraphBasedOnDemographicalFeatures(params).toString());
	}
}
