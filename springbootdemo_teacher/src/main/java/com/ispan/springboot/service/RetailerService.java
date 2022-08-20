package com.ispan.springboot.service;

import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.springboot.dao.RetailerDao;
import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.model.ShopHouseBean;

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
	
	public void ChangeStatusById (boolean status,Integer rid) {
		rDao.changeStatusById(status, rid);
	}
	
	public List<Retailer> listAll(String keyword){
		if(keyword !=null) {
			return rDao.findAll(keyword);
		}
		return rDao.findAll();
		
	}
	
	public List<Retailer> getAllRetailer() {
		
		return rDao.showAllByStatus(true);
	}
	

	public Retailer findById(Integer id) {
		Optional<Retailer> optional= rDao.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	public List<Retailer> getAllItemBy() {
		return rDao.findAll();
	}


}
