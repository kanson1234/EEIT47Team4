package com.ispan.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.Retailer;

@Repository
public interface CustomerDao extends JpaRepository<Customer, Integer> {

	// 登入驗證帳號密碼用
	@Query("from Customer where cAccount=:cAccount and cPwd=:cPwd")
	public Customer findByCustomerAccount(@Param("cAccount") String cAccount, @Param("cPwd") String cPwd);

	@Query("from Customer where cAccount=:cAccount")
	public Customer findCustomerAccount(@Param("cAccount") String cAccount);

	// 找全部
	public List<Customer> findAll();

	// 找ID
	@Query("from Customer where cId=:cId")
	public Customer getById(@Param("cId") Integer cId);

	// 模糊搜尋，已被前端取代
	@Query(value = "SELECT * FROM Customer where C1_Account like %:name% or C1_FirstName like %:name% or c1_Lastname like %:name%", nativeQuery = true)
	public List<Customer> findSpecial(@Param("name") String keywords);

//	@("from Customer where cstatus=:cstatus")
//	public Customer get

	// 驗證帳號電子信箱寄信用
	@Query("from Customer where cAccount=:cAccount and cEmail=:cEmail")
	public Customer findAccountAndEmail(@Param("cAccount") String cAccount, @Param("cEmail") String cEmail);

	// 找特定狀態
	@Query("from Customer where cStatus=:cStatus")
	public List<Customer> findByStatus(@Param("cStatus") boolean cStatus);
	
	//找重複
	@Query("from Customer where cAccount=:cAccount")
	public List<Customer> findAllByAccount(@Param("cAccount") String cAccount);

}
