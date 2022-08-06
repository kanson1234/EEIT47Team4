package com.ispan.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.springboot.dao.AdminDao;
import com.ispan.springboot.model.Admin;

@RestController
public class AdminController {
	@Autowired
	private AdminDao aDao;

	@PostMapping("admin/add")
	public Admin addAdmin() {
		Admin ad = new Admin();
		ad.setFirstName("liu");
		ad.setLastName("anson");
		ad.setAccount("771915");
		ad.setPwd("123");
		ad.setPhone("123456");
		Admin sAd = aDao.save(ad);

		return sAd;
	}
	


}
