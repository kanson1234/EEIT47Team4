package com.ispan.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	@PostMapping("/")
	public String welcomeIndex2() {
		return "index";
	}
	
	@GetMapping("/test")
	public String test() {
		return "ECPAYTEST";
	}


	
	@GetMapping("shopHouse/addItem")
	public String addItem() {
		return "shopHouseTest";
	}


	@GetMapping("/loginA")
	public String loginA() {
		return "loginA";
	}

	@GetMapping("/registerR")
	public String registerR() {
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

	@GetMapping("/registerC")
	public String registerC() {
		return "registerC";
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

	@GetMapping("/forgotPassword")
	public String forgotPassword() {
		return "forgotPassword";
	}


	@GetMapping("/record/srselectpage")
	public String srselectpage() {
		return "srselectpage";
	}
	
	
	


	@GetMapping("/record/srselectpageALL")
	public String srselectpageALL() {
		return "srselectpageALL";
	}

	@GetMapping("/Admin/SalesRecord")
	public String AdminSR() {
		return "AdminSR";
	}
	

	@GetMapping("/customerFile")
	public String customerFile() {
		return "customerFile";
	}

	@GetMapping("/newMessage")
	public String newMessage() {
		return "newMessage";
	}

	@GetMapping("/gotoShoppingCar")
	public String ShoppingCar() {
		return "ShoppingCar";
	}
	

	@GetMapping("/forgotPwdEmailUpdate")
	public String resetPassword() {
		return "forgotPwdEmailUpdate";
	}
}
