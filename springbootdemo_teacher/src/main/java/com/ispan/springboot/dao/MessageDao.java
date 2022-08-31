package com.ispan.springboot.dao;

import java.util.List;

import org.springframework.data.annotation.Transient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.springboot.model.Message;
import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.model.ShoppingRecord;

public interface MessageDao extends JpaRepository<Message, Integer> {
	@Query(value="SELECT * FROM Message WHERE Msg_Context like %:context%"
			, nativeQuery = true)
	public List<Message> findAllbyMsgcontext(@Param("context") String keyword);
	
	@Query("from Message where Msg_State=:mstate")
	 public List<Message> showAllByStatus(@Param("mstate") boolean state);
  
	
	@Transactional
	@Modifying
	@Query(value = "DELETE FROM [dbo].[Message]"
			+ "WHERE [Msg_Message_Id] =:mid", nativeQuery = true)
	public void deleteMByMid(@Param("mid") Integer mid);
	

	
}


