package com.ispan.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringbootdemoTeacherApplication {
	
//	@Autowired
//	private EmailSenderService senderService;

	public static void main(String[] args) {
		SpringApplication.run(SpringbootdemoTeacherApplication.class, args);
		
	}
	
//	@EventListener(ApplicationReadyEvent.class)
//	public void  sendMail() {
//		senderService.sendEmail("ansonliu0301@gmail","你好","來也!");
//	}

}
