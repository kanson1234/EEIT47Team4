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

	@GetMapping("/srselectpage")
	public String srselectpage() {
		return "srselectpage";
	}
	
	@GetMapping("/srselectpageALL")
	public String srselectpageALL() {
		return "srselectpageALL";
	}
	
	
	@GetMapping("/ShoppingCar")
	public String goToShoppingCar() {
		return "ShoppingCar";
	}

}
