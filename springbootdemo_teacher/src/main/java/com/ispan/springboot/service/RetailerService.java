package com.ispan.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.springboot.dao.RetailerDao;
import com.ispan.springboot.model.Retailer;

@Service
@Transactional
public class RetailerService {

	@Autowired
	private RetailerDao rDao;

	public Retailer checkRetailerLogin(String raccount) {
		Retailer ra = rDao.findByRetailerAccount(raccount);
		return ra;
	}

	public void insertRetailer(Retailer rt) {
		rDao.save(rt);
	}

}
