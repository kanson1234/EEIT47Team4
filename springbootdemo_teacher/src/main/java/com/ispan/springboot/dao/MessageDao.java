package com.ispan.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.springboot.model.Message;
import com.ispan.springboot.model.Retailer;

public interface MessageDao extends JpaRepository<Message, Integer> {
	@Query(value="SELECT * FROM Message WHERE Msg_Context like %:context%"
			, nativeQuery = true)
	public List<Message> findAllbyMsgcontext(@Param("context") String keyword);
	
  

	
}


