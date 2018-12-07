package com.hana.imsur.recommendation.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hana.imsure.recommendation.domain.GraphInformation;
import com.hana.imsure.recommendation.mapper.RecommendationMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class RecommendMapperTests {

	@Inject
	private RecommendationMapper mapper;

//	@Test
//	public void testRead() {
//
//		Map<String, String> board = mapper.selectInsuranceDatail("26");
//		log.info(board);
//	}
	
	@Test
	public void testReadGraphicResult() {

		Map<String, String> map = new HashMap<String, String>();
		map.put("age", "29세이하");
		map.put("income", "3600만원미만");
		map.put("job", "관리자");
		List<GraphInformation> list = mapper.readGraphInformation(map);
		log.info(list.toString());
	}
}
