package com.ispan.springboot.service;

import java.util.Optional;

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
	
	//新增商品 or 修改商品
	public void addItem(ShopHouseBean shb) {
		sDao.save(shb);
	}
	
	//刪除商品
	public void deleteItem(Integer id) {
		sDao.deleteById(id);
	}
	
	//查詢一筆商品
	public ShopHouseBean findItemById(Integer id) {
		Optional<ShopHouseBean> optional = sDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	
	
	
	
	
	
	

	
}
