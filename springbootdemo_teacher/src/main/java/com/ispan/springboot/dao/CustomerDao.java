package com.ispan.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.springboot.model.Customer;

@Repository
public interface CustomerDao extends JpaRepository<Customer, Integer> {

	@Query("from Customer where caccount=:caccount and cpwd=:cpwd")
	public Customer findByCustomerAccount(@Param("caccount") String caccount, @Param("cpwd") String cpwd);

	@Query("from Customer where caccount=:caccount")
	public Customer findCustomerAccount(@Param("caccount") String caccount);

	public List<Customer> findAll();

	@Query("from Customer where cid=:cid")
	public Customer getById(@Param("cid") Integer cid);

//	@("from Customer where cstatus=:cstatus")
//	public Customer get

}
