package com.ispan.springboot.dao;


import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.model.ShopHouseBean;
@Repository
public interface RetailerDao extends JpaRepository<Retailer, Integer> {
	
	@Query("from Retailer where raccount=:raccount")
	public Retailer findByRetailerAccount(@Param("raccount")String raccount);

	@Query(value="SELECT * FROM Retailer WHERE C2_Name like %:name%"
			+" OR C2_Account like %:name%", nativeQuery = true)
	public List<Retailer> findAll(@Param("name") String keyword);
	
	
}
