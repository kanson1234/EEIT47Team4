package com.ispan.springboot.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

public interface ScDao extends JpaRepository<ShoopingCar, Integer> {
	
	
	public List<ShoopingCar> findAllBycustomer_cId(@Param("cid") Integer cid) ;

}
