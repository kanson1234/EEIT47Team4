package com.ispan.springboot.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.CustomerRepository;

@RestController
public class CustomerApi {
	
	@Autowired
	private CustomerRepository dao;
	
	@GetMapping("customer/get/{id}")
	public Customer getCustomerById(@PathVariable Long id) {
		Optional<Customer> optional = dao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
}
