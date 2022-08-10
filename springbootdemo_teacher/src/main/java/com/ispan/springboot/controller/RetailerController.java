package com.ispan.springboot.controller;


import java.util.List;
import java.util.Optional;
import java.io.IOException;
import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.service.RetailerService;

@Controller
public class RetailerController {
	@Autowired
	private RetailerService rService;
//	@Autowired
//	private RetailerRepository rDao;
	
	@GetMapping("Retailer/RetailerCRUD")
	public String showAllCustomer(Model model) {
		List<Retailer> list = rService.getAllPhoto(); 
		model.addAttribute("listRetailer",list);
		return "RetailerCRUD";
	}
	@PostMapping("/Retailer/registerPage")
	 public String addRetailer(@RequestParam("rFirstName") String rf, @RequestParam("rLastName") String rl,
				@RequestParam("rAccount") String ra, @RequestParam("rPwd") String rpw, 
				@RequestParam("rPhone") String rph, @RequestParam("logo") MultipartFile logo,
				@RequestParam("photo") MultipartFile photo,@RequestParam("rInfo") String rInfo) throws IOException {
	  
		  Retailer r = new Retailer();
		  r.setRfirstName(rf);
			r.setRlastName(rl);
			r.setRaccount(ra);
			r.setRpwd(rpw);
			r.setRphone(rph);
			r.setRstate(true);
			r.setPhoto(photo.getBytes());
			r.setLogo(logo.getBytes());
			r.setInfo(rInfo);
			rService.insertRetailer(r);
	   return "registerPage";
	  
	 }
//	@PostMapping("/Retailer/insert.controller")
//	public String insertRetailer(@RequestParam("rFirstName") String rf, @RequestParam("rLastName") String rl,
//			@RequestParam("rAccount") String ra, @RequestParam("rPwd") String rpw, @RequestParam("rPhone") String rph,
//			Model m) {
//		Retailer r = new Retailer();
//		Date d =new Date();
//		r.setRfirstName(rf);
//		r.setRlastName(rl);
//		r.setRaccount(ra);
//		r.setRpwd(rpw);
//		r.setRphone(rph);
//		r.setRdate(d);
//		r.setRstate(true);
//		rService.insertRetailer(r);
//		return "loginSuccess";
//		
//	}
	@GetMapping("Retailer/get/{id}")
	public Retailer getCustomerById(@PathVariable Integer id) {
		Optional<Retailer> optional = rService.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;

	}
}
