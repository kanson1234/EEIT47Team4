package com.ispan.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class pageController {
	
	@GetMapping("home")
	public String Homepage() {
		return "index";
	}
	
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
	
	@GetMapping("/registerPage")
	public String registerPage() {
		return "registerPage";
	}
	
	@GetMapping("/admin/Admin")
	public String adminRetailer() {
		return "adminPage";
	}
	

	
	@GetMapping("/retailerCRUD")
	public String retailerCRUD() {
		return "RetailerCRUD";
	}

	@GetMapping("/srselectpage")
	public String srselectpage() {
		return "srselectpage";
	}
	
	@GetMapping("/srselectpageALL")
	public String srselectpageALL() {
		return "srselectpageALL";
	}

}
