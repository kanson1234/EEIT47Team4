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
	//取得id,轉發到商家頁面
	//缺少標籤取值
//	@GetMapping(value = "/RetailerShowAllItem",produces = { "application/json; charset=UTF-8" })
//	public String RetailerShopPage(@RequestParam Integer id,Model model) {
//		model.addAttribute("RetailerShowAllid",id);
//		System.out.println("pageController"+id);
////		return"RetailerShopPage";
//		return"redirect:/retailerGetAllItem/{RetailerShowAllid}";
//	}
	
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
	@GetMapping("/srselectpage")
	public String srselectpage() {
		return "srselectpage";
	}
	
	@GetMapping("/srselectpageALL")
	public String srselectpageALL() {
		return "srselectpageALL";
	}

			

}
