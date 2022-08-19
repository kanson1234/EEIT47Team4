package com.ispan.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.ispan.springboot.model.Message;

public interface MessageDao extends JpaRepository<Message, Integer> {
	
  

	
}


