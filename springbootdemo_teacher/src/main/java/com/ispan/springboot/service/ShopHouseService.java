package com.ispan.springboot.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.springboot.dao.ShopHouseDao;
import com.ispan.springboot.model.ShopHouseBean;

@Service
@Transactional
public class ShopHouseService {
	
	@Autowired
	private ShopHouseDao sDao;
	
	//新增商品
	public void insertItem(ShopHouseBean shb) {
		sDao.save(shb);
	}
	
	//刪除商品
	public void deleteItem(Integer id) {
		sDao.deleteById(id);
	}
	
	//修改商品資訊
	
	
	//查詢一筆商品
	public shop findItemById(Integer id) {
		sDao.findById(id);
	}
	
	
	
	
	
	

	
}
