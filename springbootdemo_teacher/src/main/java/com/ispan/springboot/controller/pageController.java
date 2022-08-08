package com.ispan.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class pageController {
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/registerR")
	public String register() {
		return "registerR";
	}
	
	@GetMapping("/logindex")
	public String loginIndex() {
		return "loginindex";
	}


}
