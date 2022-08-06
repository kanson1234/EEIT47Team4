package com.ispan.springboot.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.springboot.model.RetailerBean;
import com.ispan.springboot.model.RetailerRepository;

@RestController
public class RetailerController {
	
	@Autowired
	private RetailerRepository rDao;
	
	@PostMapping("Retailer/insert")
	public RetailerBean insert() {
		RetailerBean r1 = new RetailerBean();
		r1.setFirstName("Pee");
		r1.setLastName("Yen");
		r1.setAccount("peeyen123");
		r1.setPwd("9527");
		r1.setPhone("0911234567");
		r1.setState(true);
		r1.setInfo("歡迎光臨");
		RetailerBean respRetailer = rDao.save(r1);
		return respRetailer;
		
	}
	@GetMapping("Retailer/get/{id}")
	public RetailerBean getCustomerById(@PathVariable Integer id) {
		Optional<RetailerBean> optional = rDao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

}
