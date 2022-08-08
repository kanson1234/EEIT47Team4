package com.ispan.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.springboot.demol.Customer;
import com.ispan.springboot.demol.ShoppingRecord;
import com.ispan.springboot.service.SrService;

@RestController
public class SrController {
	@Autowired
	private SrService SrService;

	@GetMapping("record/add")
	public ShoppingRecord addSR() {
		Customer customer = new Customer();
		customer.setC1_Id(2000002);

		ShoppingRecord newSR = new ShoppingRecord();
		newSR.setCustomer(customer);;
		newSR.setShItemId(1);
		newSR.setSrCount(5);
		newSR.setSrState(true);
//	newSR.setSR_State(true);
		ShoppingRecord success = SrService.addSR(newSR);

		return newSR;
	}

	
	
	@GetMapping("record/findallbytime")
	private List<ShoppingRecord> findall() {
		
		return  SrService.findAllByTime();
	}
	
	@GetMapping("record/findallbyCid")
	private List<ShoppingRecord> findall2() {
		
		return  SrService.findAllByTime();
	}
	
	
}
