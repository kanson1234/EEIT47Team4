package com.ispan.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService {
	@Autowired
	private JavaMailSender mailSender;

	public void sendEmail(String toEamil, String subject, String body) {
		SimpleMailMessage eMsg = new SimpleMailMessage();
		eMsg.setFrom("ansonliu0301@gmail");
		eMsg.setTo(toEamil);
		eMsg.setText(body);
		eMsg.setSubject(subject);

		mailSender.send(eMsg);
		
		System.out.println("Mail Sended!");
	}

}
