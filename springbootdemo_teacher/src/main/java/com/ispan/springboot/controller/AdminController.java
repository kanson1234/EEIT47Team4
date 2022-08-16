package com.ispan.springboot.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.springboot.model.Admin;
import com.ispan.springboot.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService aService;

//	@PostMapping("admin/add")
//	public Admin addAdmin() {
//		Admin ad = new Admin();
//		ad.setFirstName("liu");
//		ad.setLastName("anson");
//		ad.setAccount("771915");
//		ad.setPwd("123");
//		ad.setPhone("123456");
//		Admin sAd = aDao.save(ad);
//
//		return sAd;
//	}

	
}
