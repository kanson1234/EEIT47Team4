package com.ispan.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.springboot.dao.RetailerDao;
import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.Retailer;

@Service
@Transactional
public class RetailerService {

	@Autowired
	private RetailerDao rDao;

	public Retailer checkRetailerLogin(String raccount, String rpwd) {
		Retailer ra = rDao.findByRetailerAccount(raccount, rpwd);
		return ra;
	}

	public Retailer findRetailerAccount(String raccount) {
		Retailer fra = rDao.findRetailerAccount(raccount);
		return fra;
	}

	public void insertRetailer(Retailer rt) {
		rDao.save(rt);
	}

}
