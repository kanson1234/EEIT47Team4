package com.ispan.springboot.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.springboot.model.Admin;

@Repository
public interface AdminDao extends JpaRepository<Admin, Integer> {
	
	@Query("from Admin where account=:account and pwd=:pwd" )
	public Admin findByAdminAccount(@Param("account")String account,@Param("pwd")String pwd);

}
