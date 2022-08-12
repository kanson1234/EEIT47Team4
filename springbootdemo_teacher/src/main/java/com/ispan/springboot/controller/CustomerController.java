package com.ispan.springboot.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.springboot.model.Customer;
import com.ispan.springboot.service.CustomerService;
import com.ispan.springboot.service.EmailSenderService;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService cService;
	@Autowired
	private EmailSenderService emailService;

	@PostMapping("/Customer/insert")
	public String insertCustomer(@RequestParam("cFirstName") String cf, @RequestParam("cLastName") String cl,
			@RequestParam("cAccount") String ca, @RequestParam("cPwd") String cpw, @RequestParam("cbDate") String cbd,
			@RequestParam("cImg") MultipartFile cimg, Model m) {
		try {
			Customer c = new Customer();
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dutyDay =new Date();
			try {
				dutyDay = (java.util.Date) sdf.parse(cbd);
				c.setCbirthdate(dutyDay);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			c.setCfirstName(cf);
			c.setClasstName(cl);
			c.setCaccount(ca);
			c.setCpwd(cpw);
			c.setCdate(d);
			c.setCimg(cimg.getBytes());
			c.setCstatus(true);

			cService.insertCustomer(c);

			return "loginSuccess";

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "login";
		}

	}

}
