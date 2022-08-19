package com.ispan.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.springboot.dao.AdminDao;
import com.ispan.springboot.model.Admin;

@Service
@Transactional
public class AdminService {

	@Autowired
	private AdminDao aDao;

	public Admin checkAdminLogin(String account,String pwd) {
		Admin fa = aDao.findByAdminAccount(account,pwd);
		return fa;
	}

}
