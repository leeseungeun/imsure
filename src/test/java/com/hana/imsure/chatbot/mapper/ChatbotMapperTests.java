package com.hana.imsure.chatbot.mapper;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ChatbotMapperTests {
	
	@Inject
	private ChatbotMapper mapper;
	
	@Test
	public void testRead() {

		String message = mapper.read("1");
		log.info("==============" + message + "==============");
	}
}
