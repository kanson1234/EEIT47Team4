
package com.ispan.springboot.controller;


import java.util.List;
import java.util.Optional;
import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.service.RetailerService;

@Controller
public class RetailerController {
	@Autowired
	private RetailerService rSrevice;
//	@Autowired
//	private RetailerRepository rDao;
	
	@GetMapping("Retailer/RetailerCRUD")
	public String showAllCustomer(Model model) {
		List<Retailer> list = rSrevice.getAllPhoto(); 
		model.addAttribute("listRetailer",list);
		return "RetailerCRUD";
	}
	@PostMapping("/Retailer/insert.controller")
	public String insertRetailer(@RequestParam("rFirstName") String rf, @RequestParam("rLastName") String rl,
			@RequestParam("rAccount") String ra, @RequestParam("rPwd") String rpw, @RequestParam("rPhone") String rph,
			Model m) {
		Retailer r = new Retailer();
		Date d =new Date();
		r.setRfirstName(rf);
		r.setRlastName(rl);
		r.setRaccount(ra);
		r.setRpwd(rpw);
		r.setRphone(rph);
		r.setRdate(d);
		r.setRstate(true);
		rSrevice.insertRetailer(r);
		return "loginSuccess";
		
	}
	@GetMapping("Retailer/get/{id}")
	public Retailer getCustomerById(@PathVariable Integer id) {
		Optional<Retailer> optional = rSrevice.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;

	}
}

//package com.ispan.springboot.controller;
//
//
//
//
//import java.util.Date;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.ispan.springboot.model.Retailer;
//import com.ispan.springboot.service.RetailerService;
//
//@Controller
//public class RetailerController {
//	@Autowired
//	private RetailerService rSrevice;
//
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
//		
//		rSrevice.insertRetailer(r);
//		
//
//		return "loginSuccess";
//	}
//
//}

