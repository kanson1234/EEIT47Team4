package com.ispan.springboot.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.springboot.model.ShoppingRecord;
@Repository
public interface ShoppingRecordDao extends JpaRepository<ShoppingRecord, Integer> {

	public List<ShoppingRecord> findAllByOrderBySrtime();

//	@Query("from Retailer where raccount=:raccount")
//		public List<ShoppingRecord> findBysrStateTrueAndByOrderBySrtime();
//	//ByOrderBySrtime

	public List<ShoppingRecord> findBysrStateTrue();

	public List<ShoppingRecord> findBysrStateFalse();

	public List<ShoppingRecord> findALLBycustomer_cId(@Param("cid") Integer cid);

	public List<ShoppingRecord> findByshophousebean_itemNameLike(@Param("name") String name);
		
	public List<ShoppingRecord> findBySrtimeBetween(@Param("date1") Date date1,@Param("date2") Date date2);
	
	
	

	
	@Transactional
	@Modifying
	@Query(value ="update shoppingrecord  set SR_State = :setboo where SR_ShoppingRecord_Id = :id",nativeQuery = true)
	public void changeStste(@Param("setboo")Boolean setboo, @Param("id")Integer id);

//	public List<ShoppingRecord> findALLByshophousebean_rid(@Param("rid") Integer cid);

	// @Query(value = "SELECT * FROM [dbo].[ShoppingRecord] ORDER BY
	// C1_Id",nativeQuery = true )
//	public List<ShoppingRecord> findAllByOrderByC1_Id( );

//	public List<ShoppingRecord> findByCidByOrderBySrtime(Integer cid );

}
