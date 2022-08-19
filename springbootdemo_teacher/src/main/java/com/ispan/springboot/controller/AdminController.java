//
//package com.ispan.springboot.controller;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.ispan.springboot.model.Admin;
//import com.ispan.springboot.service.AdminService;
//
//@Controller
//public class AdminController {
//	@Autowired
//	private AdminService aService;

//
////	@PostMapping("admin/add")
////	public Admin addAdmin() {
////		Admin ad = new Admin();
////		ad.setFirstName("liu");
////		ad.setLastName("anson");
////		ad.setAccount("771915");
////		ad.setPwd("123");
////		ad.setPhone("123456");
////		Admin sAd = aDao.save(ad);
////
////		return sAd;
////	}
//
//	@PostMapping("/checkadminlogin")
//	public String adminLogin(@RequestParam("adAccount") String account, @RequestParam("adPwd") String pwd, Model m) {
//		Map<String, String> errors = new HashMap<String, String>();
//		m.addAttribute("errors", errors);
//
//		if (account == null || account.length() == 0) {
//			errors.put("name", "account is required!");
//		}
//
//		if (pwd == null || pwd.length() == 0) {
//			errors.put("pwd", "password is required!");
//		}
//
//		if (errors != null && !errors.isEmpty()) {
//			return "login";
//		}
//
//		Admin result = aService.checkAdminLogin(account, pwd);
//
//		if (result != null) {
//			m.addAttribute("account", account);
//			m.addAttribute("pwd", pwd);
//			return "loginSuccess";
//		}
//
//		errors.put("msg", "please input correct account or password");
//		return "login";
//	}
//
//}
