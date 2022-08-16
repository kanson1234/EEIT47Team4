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
	public String registerR() {
		return "registerR";
	}

	@GetMapping("/registerC")
	public String registerC() {
		return "registerC";
	}

	@GetMapping("/logindex")
	public String loginIndex() {
		return "loginindex";
	}
	
	
	
	@GetMapping("/personalFile")
	public String oneCustomer() {
		return "personalFile";
	}
	
	@GetMapping("/loginC")
	public String loginC() {
		return "loginC";
	}
	
	@GetMapping("/loginR")
	public String loginR() {
		return "loginR";
	}

}
