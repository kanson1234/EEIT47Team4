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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.springboot.model.Admin;
import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.model.ShoppingRecord;
import com.ispan.springboot.service.CustomerService;
import com.ispan.springboot.service.EmailSenderService;
import com.ispan.springboot.service.SrService;

@Controller
@SessionAttributes(names = { "customerLoginOk", "adminLoginOk", "retailerLoginOk" })
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

			if (customerService.findCustomerAccount(cAccount) != null) {
				errors.put("used", "該帳號已被註冊!");
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

			if (cImg.isEmpty()) {
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
				newCustomer.setcBirthdate(dutyDay);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			newCustomer.setcFirstName(cFirstName.trim());
			newCustomer.setcLastName(cLastName.trim());
			newCustomer.setcAccount(cAccount.trim());
			newCustomer.setcPwd(cPwd.trim());
			newCustomer.setcDate(registerTime);
			newCustomer.setcEmail(cEmail.trim());
			newCustomer.setcImg(cImg.getBytes());
			newCustomer.setcStatus(true);

			customerService.insertCustomer(newCustomer);
			Map<String, String> msg = new HashMap<String, String>();
			model.addAttribute("msg", msg);
			msg.put("success", "會員註冊成功!");

			return "registerC";

		} catch (IOException e) {
			e.printStackTrace();
			return "registerC";
		}

	}

	// 找所有會員，已被取代
	@GetMapping("/customer/findAll")
	public String findAllCustomer(Model model) {

		Customer customerSession = (Customer) model.getAttribute("customerLoginOk");
		Admin adminSession = (Admin) model.getAttribute("adminLoginOk");
		Retailer retailerSession = (Retailer) model.getAttribute("retailerLoginOk");

		if (adminSession == null) {
			if (customerSession != null && retailerSession != null) {
				return "loginSuccess";
			}
			return "redirect:/login";

		} else {

			List<Customer> allCustomer = customerService.findAllCustomer();

			model.addAttribute("customer", allCustomer);

			return "allCustomer";
		}
	}

	// 會員 圖片處理
	@GetMapping("/downloadImage/{id}")
	public ResponseEntity<byte[]> downloadImage(@PathVariable Integer id) {
		Customer photo = customerService.getPhotoById(id);
		byte[] photoByte = photo.getcImg();

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
		Customer customerSession = (Customer) model.getAttribute("customerLoginOk");
		Admin adminSession = (Admin) model.getAttribute("adminLoginOk");
		Retailer retailerSession = (Retailer) model.getAttribute("retailerLoginOk");

		if (customerSession == null) {
			if (adminSession != null && retailerSession != null) {
				return "loginSuccess";
			}
			return "redirect:/loginC";
		} else {

			Customer oneCustomer = customerService.findCustomerById(customerSession.getcId());
			model.addAttribute("oneCustomer", oneCustomer);

			return "customerFile";
		}

	}

	// 已登入會員之個人資料編輯
	@GetMapping("/customer/editOne")
	public String editOneById(Model model) {
		Customer customerSession = (Customer) model.getAttribute("customerLoginOk");
		Admin adminSession = (Admin) model.getAttribute("adminLoginOk");
		Retailer retailerSession = (Retailer) model.getAttribute("retailerLoginOk");

		if (customerSession == null) {
			if (adminSession != null && retailerSession != null) {
				return "loginSuccess";
			}
			return "redirect:/loginC";
		} else {

			Customer oneCustomer = customerService.findCustomerById(customerSession.getcId());
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

		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (cPwd == null || cPwd.length() == 0) {
			errors.put("cPwd", "請輸入您的密碼!");
		}

		if (cFirstName == null || cFirstName.length() == 0) {
			errors.put("cFirstName", "姓氏不得為空!");
		}

		if (cLastName == null || cLastName.length() == 0) {
			errors.put("cLastName", "名稱不得為空!");
		}

		if (cbDate == null) {
			errors.put("cbDate", "請輸入您的出生年月日!");
		}

		if (cEmail == null || cEmail.length() == 0) {
			errors.put("cEmail", "請輸入個人電子郵件!");
		}

//		if (cImg.isEmpty()) {
//			errors.put("cImg", "請選擇一張個人圖片!");
//		}

		if (errors != null && !errors.isEmpty()) {

			return "redirect:/customer/editOne";
		}

		try {

			Customer updateCustomer = customerService.findCustomerById(customerId);
			Date d = new Date();

			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date dutyDay = new Date();
				dutyDay = (java.util.Date) sdf.parse(cbDate);
				updateCustomer.setcBirthdate(dutyDay);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			updateCustomer.setcFirstName(cFirstName.trim());
			updateCustomer.setcLastName(cLastName.trim());
			updateCustomer.setcPwd(cPwd.trim());
			updateCustomer.setcEmail(cEmail.trim());

			if (cImg.isEmpty()) {
				updateCustomer.setcImg(updateCustomer.getcImg());
			} else {
				updateCustomer.setcImg(cImg.getBytes());
			}

			updateCustomer.setcDate(d);

			customerService.insertCustomer(updateCustomer);
			Map<String, String> msg = new HashMap<String, String>();
			model.addAttribute("msg", msg);
			msg.put("success", "修改成功");

			return "redirect:/customer/findOne";

		} catch (IOException e) {
			e.printStackTrace();
			return "customerFile";
		}

	}

	// 切換會員狀態
	@GetMapping("/changeCustomerStatus/{id}")
	public String changeCustomerStatus(@PathVariable Integer id, Model model) {
		Customer customer = customerService.findCustomerById(id);
		boolean iscStatus = customer.iscStatus();
		if (iscStatus == true) {
			customer.setcStatus(false);
			customerService.insertCustomer(customer);
			return "redirect:/customer/findTrue";

		} else {
			customer.setcStatus(true);

			customerService.insertCustomer(customer);
			return "redirect:/customer/findFalse";
		}

	}

	// 忘記密碼寄信
	@PostMapping("/sendForgotMail")
	public String sendMail(@RequestParam("sendEmailAccount") String customerAccount,
			@RequestParam("sendCustomerEmail") String customerEmail, Model model) {

		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (customerAccount == null || customerAccount.length() == 0) {
			errors.put("customerAccount", "請輸入帳號!");
		}

		if (customerEmail == null || customerEmail.length() == 0) {
			errors.put("customerEmail", "請輸入電子信箱!");
		}

		if (errors != null && !errors.isEmpty()) {
			return "forgotPassword";
		}

		if (customerService.forgotPassword(customerAccount, customerEmail) == null) {
			errors.put("errorAccount", "帳號或電子信箱輸入錯誤，請重新輸入!");
			return "forgotPassword";
		} else {
			Customer forgotCustomer = customerService.forgotPassword(customerAccount, customerEmail);
			try {
				emailService.sendEmail(forgotCustomer.getcEmail(), forgotCustomer.getcFirstName() + " 會員，您好!",
						"露營王會員 " + forgotCustomer.getcFirstName() + forgotCustomer.getcLastName()
								+ " 您好!<br>請點選連結以更改密碼，謝謝!<br>http://localhost:8080/forgotPwdEmailUpdate");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			errors.put("success", "驗證成功!請至註冊信箱收取信件!");

			return "forgotPassword";
		}

	}

	// 寄信後修改會員密碼
	@PostMapping("/customerUpdatePassword")
	public String updateEmailPassword(@RequestParam("cAccount") String cAccount, @RequestParam("cPwd1") String cPwd1,
			@RequestParam("cPwd2") String cPwd2, Model model) {
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (cAccount == null || cAccount.length() == 0) {
			errors.put("cAccount", "請輸入帳號");
		}

		if (customerService.findCustomerAccount(cAccount) == null) {
			errors.put("errorAccount", "帳號有誤，請重新輸入!");
		}

		if (cPwd1 == null || cPwd1.length() == 0) {
			errors.put("cPwd1", "請輸入新密碼");
		}

		if (cPwd2 == null || cPwd2.length() == 0) {
			errors.put("cPwd2", "請再次輸入新密碼");
		}

		if (!cPwd1.equals(cPwd2)) {
			errors.put("pwdError", "兩次輸入密碼不同，請重新輸入!");
		}

		if (errors != null && !errors.isEmpty()) {
			return "forgotPwdEmailUpdate";
		}

		Customer emailAccount = customerService.findCustomerAccount(cAccount);

		emailAccount.setcPwd(cPwd1.trim());
		customerService.insertCustomer(emailAccount);
		Map<String, String> msg = new HashMap<String, String>();
		model.addAttribute("msg", msg);
		msg.put("updateSuccess", "修改成功，請重新登入!");

		return "forgotPwdEmailUpdate";

	}

	// 模糊搜尋會員資料，已由前端取代
	@GetMapping("/findCustomerByKeywords")
	public String findSpecialCustomer(@RequestParam("keywords") String keywords, Model model) {
		List<Customer> findSpecialCustomer = customerService.findSpecialCustomer(keywords);
		model.addAttribute("customer", findSpecialCustomer);
		return "allCustomer";
	}

	// Ajax驗證帳號
	@GetMapping("/checkAccount/{account}")
	public boolean checkAccount(@PathVariable String cAccount) {
		Customer findCustomerAccount = customerService.findCustomerAccount(cAccount);
		if (findCustomerAccount != null) {
			return false;
		}
		return true;
	}

	// 找未停權會員
	@GetMapping("/customer/findTrue")
	public String findTrueCustomer(Model model) {

		Customer customerSession = (Customer) model.getAttribute("customerLoginOk");
		Admin adminSession = (Admin) model.getAttribute("adminLoginOk");
		Retailer retailerSession = (Retailer) model.getAttribute("retailerLoginOk");

		if (adminSession == null) {
			if (customerSession != null && retailerSession != null) {
				return "loginSuccess";
			}
			return "redirect:/loginA";

		} else {

			List<Customer> customerTrue = customerService.findCustomerByTrue();

			model.addAttribute("customer", customerTrue);

			return "allCustomer";
		}
	}

	// 找已停權會員
	@GetMapping("/customer/findFalse")
	public String findFalseCustomer(Model model) {

		Customer customerSession = (Customer) model.getAttribute("customerLoginOk");
		Admin adminSession = (Admin) model.getAttribute("adminLoginOk");
		Retailer retailerSession = (Retailer) model.getAttribute("retailerLoginOk");

		if (adminSession == null) {
			if (customerSession != null && retailerSession != null) {
				return "loginSuccess";
			}
			return "redirect:/loginA";

		} else {

			List<Customer> customerFalse = customerService.findCustomerByFalse();

			model.addAttribute("customer", customerFalse);

			return "CustomerBlockList";
		}
	}

}
