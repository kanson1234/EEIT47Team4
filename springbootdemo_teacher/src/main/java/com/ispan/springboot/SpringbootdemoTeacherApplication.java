package com.ispan.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

import com.ispan.springboot.service.EmailSenderService;

@SpringBootApplication
public class SpringbootdemoTeacherApplication {
	
//	@Autowired
//	private EmailSenderService senderService;

	public static void main(String[] args) {
		SpringApplication.run(SpringbootdemoTeacherApplication.class, args);
		
	}
//	
//	@EventListener(ApplicationReadyEvent.class)
//	public void  sendMail() {
//		senderService.sendEmail("ansonliu0301@gmail.com","你好","來也!");
//	}

}
