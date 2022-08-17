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
@SessionAttributes(names = { "customerLoginOk", "adminLoginOk" })
public class loginController {
	@Autowired
	private AdminService aService;

	@Autowired
	private RetailerService rService;

	@Autowired
	private CustomerService cService;

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
			return "login";
		}

		Admin adminLoginResult = aService.checkAdminLogin(account);

		if (adminLoginResult != null) {
			model.addAttribute("adminLoginOk", adminLoginResult);
			return "redirect:/customer/findAll";
		}

		errors.put("msg", "帳號或密碼有誤，請重新輸入!");
		return "login";
	}

	// 商家登入
	@PostMapping("/checkretailerlogin")
	public String retailerLogin(@RequestParam("rAccount") String raccount, @RequestParam("rPwd") String rpwd, Model m) {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (raccount == null || raccount.length() == 0) {
			errors.put("caccount", "請輸入商家帳號!");
		}

		if (rpwd == null || rpwd.length() == 0) {
			errors.put("cpwd", "請輸入商家密碼!");
		}

		if (errors != null && !errors.isEmpty()) {
			return "loginR";
		}

		Retailer result = rService.checkRetailerLogin(raccount);

		if (result != null) {

			return "loginSuccess";
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

		Customer customerLoginResult = cService.checkCustomerLogin(caccount);

		if (customerLoginResult != null) {
			model.addAttribute("loginOk", customerLoginResult);

			return "loginSuccess";
		}

		errors.put("cmsg", "您的帳號或密碼有誤，請重新輸入!");
		return "loginC";
	}

//所有登出
	@GetMapping("/logout")
	public String logout(SessionStatus status, Model model) {
		if (model.getAttribute("customerLoginOk") != null || model.getAttribute("adminLoginOk") != null) {
			status.setComplete();
		}
		return "redirect:/logindex";
	}

}
