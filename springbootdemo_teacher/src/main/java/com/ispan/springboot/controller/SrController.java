package com.ispan.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.ShoppingRecord;
import com.ispan.springboot.model.StoreHouse;
import com.ispan.springboot.service.SrService;

@RestController
public class SrController {
	@Autowired
	private SrService SrService;

	@GetMapping("record/add")
	public ShoppingRecord addSR() {
		Customer customer = new Customer();
		customer.setcId(2000002);
		StoreHouse storehouse = new StoreHouse();
		storehouse.setShItemId(1);
		
		

		ShoppingRecord newSR = new ShoppingRecord();
		newSR.setCustomer(customer);
		newSR.setStorehouse(storehouse);
		newSR.setSrCount(5);
		newSR.setSrState(true);

		System.out.println(newSR.getSrtime());

		ShoppingRecord success = SrService.addSR(newSR);

		System.out.println(newSR.getSrtime());
		return newSR;
	}

	@GetMapping("record/findallbytime")
	private List<ShoppingRecord> findAllByTime() {

		return SrService.findAllByTime();
	}

	@GetMapping("record/findallbyCid")
	private List<ShoppingRecord> findall2(@RequestParam(name = "cid", defaultValue = "1") Integer cid) {
		System.out.println(cid);
		List<ShoppingRecord> findAllByC1_id = SrService.findAllByC1_id(cid);
		System.out.println(findAllByC1_id.isEmpty());
		if (findAllByC1_id.isEmpty()) {
			return null;
		} else {
			return findAllByC1_id;
		}

	}

	@GetMapping("record/findAll2")
	private List<ShoppingRecord> findAll2(@RequestParam(name = "word", defaultValue = "") String word) {

		return SrService.findAll2(word);
	}

}
