package com.ispan.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.springboot.model.ShopHouseBean;

public interface ShopHouseDao extends JpaRepository<ShopHouseBean, Integer>{

	
}
