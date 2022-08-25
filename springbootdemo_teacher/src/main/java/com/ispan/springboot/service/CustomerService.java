package com.ispan.springboot.service;

import java.util.List;
import java.util.Optional;

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

	public Customer checkCustomerLogin(String caccount,String cpwd) {
		Customer ca = cDao.findByCustomerAccount(caccount,cpwd);
		return ca;
	}
	
	public Customer findCustomerAccount(String caccount) {
		Customer ca = cDao.findCustomerAccount(caccount);
		return ca;
	}

	public void insertCustomer(Customer ct) {
		cDao.save(ct);
	}

	public List<Customer> findAllCustomer() {
		return cDao.findAll();
	}

	public Customer getPhotoById(Integer id) {
		Optional<Customer> optional = cDao.findById(id);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	public void deleteCustomer(Integer id) {
		cDao.deleteById(id);
	}

	public  Customer findCustomerById(Integer id) {
		return cDao.getById(id);
	}
	
	public List<Customer> findSpecialCustomer(String keywords){
		return cDao.findSpecial(keywords);
	}

}
