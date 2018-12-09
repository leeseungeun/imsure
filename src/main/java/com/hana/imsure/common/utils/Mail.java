package com.hana.imsure.common.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class Mail {
	
	// 설정 파일로부터 설정을 읽어옴
	ApplicationContext context = new ClassPathXmlApplicationContext("mail-config.xml");
	// 메일을 보내는 custom class 불러옴
	MailSender mailSender = (MailSender) context.getBean("mailSender");
	
	// 이하 메일 내용 생성 관련
	private String from = "I'MSURE Manager<hana.staffmanager@gmail.com>";
	private String to;
	private String title;
	private String content;
	
	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Mail(){
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom(this.from);
		message.setTo(this.to);
		message.setSubject(this.title);
		message.setText(this.content);
		
		mailSender.send(message);
	}
	
	public Mail(String to, String title, String content){
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom(this.from);
		message.setTo(to);
		message.setSubject(title);
		message.setText(content);
		
		mailSender.send(message);
	}
}
