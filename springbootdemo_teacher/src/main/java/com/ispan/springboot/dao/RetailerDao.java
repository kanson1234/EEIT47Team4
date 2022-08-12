package com.ispan.springboot.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.springboot.model.Retailer;
@Repository
public interface RetailerDao extends JpaRepository<Retailer, Integer> {
	
	@Query("from Retailer where raccount=:raccount")
	public Retailer findByRetailerAccount(@Param("raccount")String raccount);

	@Query(value="SELECT * FROM Retailer WHERE C2_FirstName like %:name%"
			+" OR C2_LastName like %:name%", nativeQuery = true)
	public List<Retailer> findAll(@Param("name") String keyword);
}
