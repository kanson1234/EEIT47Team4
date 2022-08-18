package com.ispan.springboot.service;

import java.util.List;
import java.util.Optional;

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
	
	public List<Retailer> listAll(String keyword){
		if(keyword !=null) {
			return rDao.findAll(keyword);
		}
		return rDao.findAll();
		
	}
	
	public List<Retailer> getAllRetailer() {
		return rDao.findAll();
	}
	

	public Retailer findById(Integer id) {
		Optional<Retailer> optional= rDao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}


}
