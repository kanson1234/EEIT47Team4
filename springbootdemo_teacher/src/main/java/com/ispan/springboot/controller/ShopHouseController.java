package com.ispan.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ispan.springboot.service.ShopHouseService;

@Service
public class ShopHouseController {

	@Autowired
	private ShopHouseService sService;
	
	@GetMapping("findItemById/{id}")
	public String findItemById(@PathVariable Integer id ) {
		sService.findItemById(id);
		
		return "findItemById";
	}
	
	
	
	
}
