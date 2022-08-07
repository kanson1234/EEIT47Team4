package com.ispan.springboot.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RetailerRepository extends JpaRepository<RetailerBean, Integer>{
	@Query(value="select * from Retailer where C2_FirstName = :name", nativeQuery = true)
	public List<RetailerBean> findCustomerByName2(@Param("name") String firstName);
}
