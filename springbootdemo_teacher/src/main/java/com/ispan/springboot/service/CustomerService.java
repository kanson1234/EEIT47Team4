package com.ispan.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.springboot.dao.CustomerDao;
import com.ispan.springboot.model.Customer;

@Service
@Transactional
public class CustomerService {
	@Autowired
	private CustomerDao cDao;

	public Customer checkCustomerLogin(String caccount) {
		Customer ca = cDao.findByCustomerAccount(caccount);
		return ca;
	}

	public void insertCustomer(Customer ct) {
		cDao.save(ct);
	}

}
