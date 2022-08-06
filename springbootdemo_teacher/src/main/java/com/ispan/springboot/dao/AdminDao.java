package com.ispan.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ispan.springboot.model.Admin;

@Repository
public interface AdminDao extends JpaRepository<Admin, Integer> {
	
	

}
