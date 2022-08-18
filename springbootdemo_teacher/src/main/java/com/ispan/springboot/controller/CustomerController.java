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
@SessionAttributes(names = { "customerLoginOk", "adminLoginOk" })
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private EmailSenderService emailService;

	// 會員註冊
	@PostMapping("/customer/insert")
	public String insertCustomer(@RequestParam("cFirstName") String cFirstName,
			@RequestParam("cLastName") String cLastName, @RequestParam("cAccount") String cAccount,
			@RequestParam("cPwd") String cPwd, @RequestParam("cbDate") String cbDate,
			@RequestParam("cEmail") String cEmail, @RequestParam("cImg") MultipartFile cImg, Model model) {
		try {
			Map<String, String> errors = new HashMap<String, String>();
			model.addAttribute("errors", errors);

			if (cFirstName == null || cFirstName.length() == 0) {
				errors.put("cFirstName", "姓氏不得為空!");
			}

			if (cLastName == null || cLastName.length() == 0) {
				errors.put("cLastName", "名稱不得為空!");
			}

			if (cAccount == null || cAccount.length() == 0) {
				errors.put("cAccount", "請輸入您的帳號!");
			}

			if (cPwd == null || cPwd.length() == 0) {
				errors.put("cPwd", "請輸入您的密碼!");
			}

			if (cbDate == null) {
				errors.put("cbDate", "請輸入您的出生年月日!");
			}

			if (cEmail == null || cEmail.length() == 0) {
				errors.put("cEmail", "請輸入個人電子郵件!");
			}

			if (cImg.getBytes() == null) {
				errors.put("cImg", "請選擇一張個人圖片!");
			}

			if (errors != null && !errors.isEmpty()) {
				return "registerC";
			}

			Customer newCustomer = new Customer();
			Date registerTime = new Date();
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date dutyDay = new Date();
				dutyDay = (java.util.Date) sdf.parse(cbDate);
				newCustomer.setCbirthdate(dutyDay);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			newCustomer.setCfirstName(cFirstName);
			newCustomer.setClastName(cLastName);
			newCustomer.setCaccount(cAccount);
			newCustomer.setCpwd(cPwd);
			newCustomer.setCdate(registerTime);
			newCustomer.setCemail(cEmail);
			newCustomer.setCimg(cImg.getBytes());
			newCustomer.setCstatus(true);

			customerService.insertCustomer(newCustomer);

			return "loginSuccess";

		} catch (IOException e) {
			e.printStackTrace();
			return "registerC";
		}

	}

	// 找所有會員
	@GetMapping("/customer/findAll")
	public String findAllCustomer(Model m) {

		List<Customer> allCustomer = customerService.findAllCustomer();

		m.addAttribute("customer", allCustomer);

		return "allCustomer";
	}

	// 會員 圖片處理
	@GetMapping("/downloadImage/{id}")
	public ResponseEntity<byte[]> downloadImage(@PathVariable Integer id) {
		Customer photo = customerService.getPhotoById(id);
		byte[] photoByte = photo.getCimg();

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(photoByte, header, HttpStatus.OK);

	}

	// 刪除會員，用不到
	@GetMapping("/deleteCustomer/{id}")
	public String deleteById(@PathVariable Integer id) {
		customerService.deleteCustomer(id);
		return "redirect:/customer/findAll";
	}

	// 找已登入會員之個人資料
	@GetMapping("/customer/findOne")
	public String findOneById(Model model) {
		Customer customer = (Customer) model.getAttribute("customerLoginOk");
		Admin admin = (Admin) model.getAttribute("adminLoginOk");

		if (customer == null) {
			if (admin != null) {
				return "loginSuccess";
			}
			return "redirect:/loginC";
		} else {

			Customer oneCustomer = customerService.findCustomerById(customer.getCid());
			model.addAttribute("oneCustomer", oneCustomer);

			return "personalFile";
		}

	}

	// 修改會員個人資料
	@PostMapping("/customer/update")
	public String updateCustomer(@RequestParam("customerId") Integer customerId,
			@RequestParam("cFirstName") String cFirstName, @RequestParam("cLastName") String cLastName,
			@RequestParam("cPwd") String cPwd, @RequestParam("cbDate") String cbDate,
			@RequestParam("cEmail") String cEmail, @RequestParam("cImg") MultipartFile cImg, Model model) {
		try {
//			Map<String, String> errors = new HashMap<String, String>();
//			model.addAttribute("errors", errors);

			Customer updateCustomer = customerService.findCustomerById(customerId);
			Date d = new Date();

			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date dutyDay = new Date();
				dutyDay = (java.util.Date) sdf.parse(cbDate);
				updateCustomer.setCbirthdate(dutyDay);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			updateCustomer.setCfirstName(cFirstName);
			updateCustomer.setClastName(cLastName);
			updateCustomer.setCpwd(cPwd);
			updateCustomer.setCemail(cEmail);

			updateCustomer.setCimg(cImg.getBytes());

			updateCustomer.setCdate(d);

			customerService.insertCustomer(updateCustomer);

			return "redirect:/customer/findOne";

		} catch (IOException e) {
			e.printStackTrace();
			return "registerC";
		}

	}

	// 修改會員狀態
	@GetMapping("/changeCustomerStatus")
	public String changeCustomerStatus(@RequestParam("customerStatus") boolean customerStatus, Model model) {
		

		return "loginSuccess";

	}

}
