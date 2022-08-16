package com.ispan.springboot.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.springboot.model.Admin;
import com.ispan.springboot.model.Customer;
import com.ispan.springboot.service.CustomerService;
import com.ispan.springboot.service.EmailSenderService;

@Controller
@SessionAttributes("loginOk")
public class CustomerController {
	@Autowired
	private CustomerService cService;
	@Autowired
	private EmailSenderService emailService;

	// 註冊
	@PostMapping("/Customer/insert")
	public String insertCustomer(@RequestParam("cFirstName") String cf, @RequestParam("cLastName") String cl,
			@RequestParam("cAccount") String ca, @RequestParam("cPwd") String cpw, @RequestParam("cbDate") String cbd,
			@RequestParam("cEmail") String cmail, @RequestParam("cImg") MultipartFile cimg, Model m) {
		try {
			Map<String, String> errors = new HashMap<String, String>();
			m.addAttribute("errors", errors);

			Customer c = new Customer();
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date dutyDay = new Date();
			try {
				dutyDay = (java.util.Date) sdf.parse(cbd);
				c.setCbirthdate(dutyDay);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			c.setCfirstName(cf);
			c.setClastName(cl);
			c.setCaccount(ca);
			c.setCpwd(cpw);
			c.setCdate(d);
			c.setCemail(cmail);
			c.setCimg(cimg.getBytes());
			c.setCstatus(true);

			cService.insertCustomer(c);

			return "loginSuccess";

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "registerC";
		}

	}

	// 找所有
	@GetMapping("/customer/findAll")
	public String findAllCustomer(Model m) {

		List<Customer> allCustomer = cService.findAllCustomer();

		m.addAttribute("customer", allCustomer);

		return "allCustomer";
	}

	// 圖片處理
	@GetMapping("/downloadImage/{id}")
	public ResponseEntity<byte[]> downloadImage(@PathVariable Integer id) {
		Customer photo = cService.getPhotoById(id);
		byte[] photoByte = photo.getCimg();

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(photoByte, header, HttpStatus.OK);

	}

	// 刪除，用不到
	@GetMapping("/deleteCustomer/{id}")
	public String deleteById(@PathVariable Integer id) {
		cService.deleteCustomer(id);
		return "redirect:/customer/findAll";
	}

	// 找自己
	@GetMapping("/customer/findOne")
	public String findOneById() {
		return "personalFile";
	}

}
