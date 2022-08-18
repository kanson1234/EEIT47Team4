package com.ispan.springboot.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.service.RetailerService;

@Controller
public class RetailerController {

	@Autowired
	private RetailerService retailerSrevice;

	// 註冊
	@PostMapping("/Retailer/insert")
	public String insertRetailer(@RequestParam("rName") String rName, @RequestParam("rAccount") String rAccount,
			@RequestParam("rPwd") String rPwd, @RequestParam("rPhone") String rPhone,
			@RequestParam("rInfo") String rInfo, @RequestParam("rLogo") MultipartFile rLogo,
			@RequestParam("rPhoto") MultipartFile rPhoto, Model model) {

		try {

			Map<String, String> errors = new HashMap<String, String>();
			model.addAttribute("errors", errors);

			if (rName == null || rName.length() == 0) {
				errors.put("rName", "姓名不得為空!");
			}

			if (rAccount == null || rAccount.length() == 0) {
				errors.put("rAccount", "請輸入您的帳號!");
			}

			if (retailerSrevice.findRetailerAccount(rAccount) != null) {
				errors.put("used", "該帳號已被註冊!");
			}

			if (rPwd == null || rPwd.length() == 0) {
				errors.put("rPwd", "請輸入您的密碼!");
			}

			if (rPhone == null || rPhone.length() == 0) {
				errors.put("rPhone", "請輸入電話!");
			}

			if (rInfo == null || rInfo.length() == 0) {
				errors.put("rInfo", "請輸入商家描述!");
			}

			if (rLogo.getBytes() == null) {
				errors.put("rLogo", "請選擇一張商家Logo!");
			}

			if (rPhoto.getBytes() == null) {
				errors.put("rPhoto", "請選擇商家照片!");
			}

			if (errors != null && !errors.isEmpty()) {
				return "registerR";
			}

			Retailer newRetailer = new Retailer();
			Date d = new Date();
			newRetailer.setRname(rName);
			newRetailer.setRaccount(rAccount);
			newRetailer.setRpwd(rPwd);
			newRetailer.setRphone(rPhone);
			newRetailer.setRinfo(rInfo);
			newRetailer.setRlogo(rLogo.getBytes());
			newRetailer.setRphoto(rPhoto.getBytes());

			newRetailer.setRdate(d);
			newRetailer.setRstate(true);
			retailerSrevice.insertRetailer(newRetailer);

			return "loginSuccess";

		} catch (IOException e) {
			e.printStackTrace();

			return "registerR";
		}

	}

}
