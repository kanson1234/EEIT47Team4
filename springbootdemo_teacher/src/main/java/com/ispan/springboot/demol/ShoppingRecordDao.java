package com.ispan.springboot.demol;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ShoppingRecordDao extends JpaRepository<ShoppingRecord, Integer> {
	
	public List<ShoppingRecord> findAllByOrderBySrtime();
	
	
	@Query(value = "SELECT * FROM  [dbo].[ShoppingRecord] ORDER BY C1_Id",nativeQuery = true )
	public List<ShoppingRecord> findAllByOrderByCid( );
	
//	public List<ShoppingRecord> findByCidByOrderBySrtime(Integer cid );
	
	
	
	
	
}	
