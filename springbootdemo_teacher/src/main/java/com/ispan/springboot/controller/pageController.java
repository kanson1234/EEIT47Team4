package com.ispan.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class pageController {
	
	@GetMapping("/")
	public String welcomeIndex() {
		return "index";
	}
	
	@GetMapping("shopHouse/add")
	public String addItem() {
		return "shopHouseTest";
	}

	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/registerR")
	public String register() {
		return "registerR";
	}


}
