package com.ispan.springboot.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ispan.springboot.model.Admin;
import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.service.AdminService;
import com.ispan.springboot.service.CustomerService;
import com.ispan.springboot.service.RetailerService;

@Controller
@SessionAttributes(names = { "customerLoginOk", "adminLoginOk", "retailerLoginOk" })
public class loginController {
	@Autowired
	private AdminService adminService;

	@Autowired
	private RetailerService retailerService;

	@Autowired
	private CustomerService customerService;

	// 管理者登入
	@PostMapping("/checkadminlogin")
	public String adminLogin(@RequestParam("adAccount") String account, @RequestParam("adPwd") String pwd,
			Model model) {
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (account == null || account.length() == 0) {
			errors.put("account", "請輸入帳號!");
		}

		if (pwd == null || pwd.length() == 0) {
			errors.put("pwd", "請輸入密碼!");
		}

		if (errors != null && !errors.isEmpty()) {
			return "loginA";
		}

		Admin adminLoginResult = adminService.checkAdminLogin(account, pwd);

		if (adminLoginResult != null) {
			model.addAttribute("adminLoginOk", adminLoginResult);
			return "index";
		}

		errors.put("msg", "帳號或密碼有誤，請重新輸入!");
		return "loginA";
	}

	// 商家登入
	@PostMapping("/checkretailerlogin")
	public String retailerLogin(@RequestParam("rAccount") String raccount, @RequestParam("rPwd") String rpwd,
			Model model) {
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (raccount == null || raccount.length() == 0) {
			errors.put("caccount", "請輸入商家帳號!");
		}

		if (rpwd == null || rpwd.length() == 0) {
			errors.put("cpwd", "請輸入商家密碼!");
		}

		if (errors != null && !errors.isEmpty()) {
			return "loginR";
		}

		Retailer retailerLoginResult = retailerService.checkRetailerLogin(raccount, rpwd);

		if (retailerLoginResult != null) {
			model.addAttribute("retailerLoginOk", retailerLoginResult);

			return "redirect:/ShopHouse/indexShopHouseItems";
		}

		errors.put("rmsg", "商家帳號或密碼有誤，請重新輸入!");
		return "loginR";
	}

	// 會員登入
	@PostMapping("/checkcustomerlogin")
	public String customerLogin(@RequestParam("cAccount") String caccount, @RequestParam("cPwd") String cpwd,
			Model model) {
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (caccount == null || caccount.length() == 0) {
			errors.put("caccount", "請輸入您的帳號!");
		}

		if (cpwd == null || cpwd.length() == 0) {
			errors.put("cpwd", "請輸入您的密碼!");
		}

		if (errors != null && !errors.isEmpty()) {
			return "loginC";
		}

		Customer customerLoginResult = customerService.checkCustomerLogin(caccount, cpwd);

		if (customerLoginResult == null) {
			errors.put("cmsg", "您的帳號或密碼有誤，請重新輸入!");
			return "loginC";
		}
		// 因在此位置判斷customerLoginResult有錯，故須將if customerLoginResult == null敘述移到上方做判斷
		Customer checkStatus = customerService.findCustomerById(customerLoginResult.getcId());
		boolean cstatus = checkStatus.iscStatus();

		if (cstatus == true) {

			model.addAttribute("customerLoginOk", customerLoginResult);
			return "index";

		} else {
			errors.put("status", "您的帳號尚未開通或已遭停權，詳情請向管理員洽詢。");
			return "loginC";
		}

	}

//所有登出
	@GetMapping("/logout")
	public String logout(SessionStatus status, Model model) {
		if (model.getAttribute("customerLoginOk") != null || model.getAttribute("adminLoginOk") != null
				|| model.getAttribute("retailerLoginOk") != null) {
			status.setComplete();
		}
		return "redirect:/";
	}

}
