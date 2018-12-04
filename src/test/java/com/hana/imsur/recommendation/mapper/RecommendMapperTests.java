package com.hana.imsur.recommendation.mapper;

import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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

	@Test
	public void testRead() {

		Map<String, String> board = mapper.selectInsuranceDatail("26");
		log.info(board);
	}
}
