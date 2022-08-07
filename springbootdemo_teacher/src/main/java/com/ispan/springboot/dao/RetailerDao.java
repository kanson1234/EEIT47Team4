package com.ispan.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.springboot.model.Retailer;
@Repository
public interface RetailerDao extends JpaRepository<Retailer, Integer> {
	
	@Query("from Retailer where raccount=:raccount")
	public Retailer findByRetailerAccount(@Param("raccount")String raccount);
	

}
