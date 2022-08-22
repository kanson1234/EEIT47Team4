package com.ispan.springboot.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.springboot.dao.ScDao;
import com.ispan.springboot.model.ShoopingCar;

@Service
@Transactional
public class ScService {
	@Autowired
	private ScDao scDao;
	
	
	
	
	public  List<ShoopingCar> findAllByScId(Integer cid ) {
		
		return scDao.findAllBycustomer_cId(cid);
	}

}
