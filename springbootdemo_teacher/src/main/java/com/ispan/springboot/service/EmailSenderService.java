package com.ispan.springboot.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService {
	@Autowired
	private JavaMailSender mailSender;

	public void sendEmail(String toEmail, String subject, String body) throws Exception {

		MimeMessage mimeMessage = mailSender.createMimeMessage();

		MimeMessageHelper eMsg = new MimeMessageHelper(mimeMessage, true);

		eMsg.setFrom("ansonliu0301@gmail");
		eMsg.setTo(toEmail);
		eMsg.setText(body,true);
		eMsg.setSubject(subject);

		mailSender.send(mimeMessage);

		System.out.println("Mail Sended!");
	}

}
