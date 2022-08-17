package com.ispan.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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


}
