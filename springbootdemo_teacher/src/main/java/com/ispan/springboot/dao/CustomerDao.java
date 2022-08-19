package com.ispan.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.springboot.model.Customer;

@Repository
public interface CustomerDao extends JpaRepository<Customer, Integer> {

	@Query("from Customer where cAccount=:cAccount and cPwd=:cPwd")
	public Customer findByCustomerAccount(@Param("cAccount") String cAccount, @Param("cPwd") String cPwd);

	@Query("from Customer where cAccount=:cAccount")
	public Customer findCustomerAccount(@Param("cAccount") String cAccount);

	public List<Customer> findAll();

	@Query("from Customer where cId=:cId")
	public Customer getById(@Param("cId") Integer cId);

//	@("from Customer where cstatus=:cstatus")
//	public Customer get

}
