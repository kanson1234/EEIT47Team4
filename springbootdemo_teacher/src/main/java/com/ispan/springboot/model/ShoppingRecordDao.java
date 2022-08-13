
//package com.ispan.springboot.demol;
//
//import java.util.List;
//
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//
//public interface ShoppingRecordDao extends JpaRepository<ShoppingRecord, Integer> {
//	
//	public List<ShoppingRecord> findAllByOrderBySrtime();
//	
//	
//	@Query(value = "SELECT * FROM  [dbo].[ShoppingRecord] ORDER BY C1_Id",nativeQuery = true )
//	public List<ShoppingRecord> findAllByOrderByCid( );
//	
////	public List<ShoppingRecord> findByCidByOrderBySrtime(Integer cid );
//	
//	
//	
//	
//	
//}	

package com.ispan.springboot.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ShoppingRecordDao extends JpaRepository<ShoppingRecord, Integer> {
	
	public List<ShoppingRecord> findAllByOrderBySrtime();
	
	
	@Query("from Customer where C1_id = :cid")
	public List<ShoppingRecord> findALLByC1_id(@Param("cid") Integer cid);
	
	
//	@Query(value = "SELECT * FROM  [dbo].[ShoppingRecord] ORDER BY C1_Id",nativeQuery = true )
//	public List<ShoppingRecord> findAllByOrderByC1_Id( );
	
//	public List<ShoppingRecord> findByCidByOrderBySrtime(Integer cid );
	
	
	
	
	
}	
