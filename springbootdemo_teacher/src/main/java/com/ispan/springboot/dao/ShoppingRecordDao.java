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

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM [dbo].[ShoppingRecord] " 
				 + " WHERE SR_ShoppingRecord_Id= :srid ", nativeQuery = true)
	public void DeleteSrByScId(@Param("srid") Integer srid);

	@Query(value = "SELECT * FROM ShoppingRecord  AS SR INNER JOIN [StoreHouse]  As SH ON SR.SH_Item_Id = SH.SH_Item_Id And SH.SH_ItemName LIKE %:name% ", nativeQuery = true)
	public List<ShoppingRecord> findByshophousebean_itemNameLike(@Param("name") String name);
	
	@Query(value = "SELECT	* FROM"
			+ "[ShoppingRecord] AS SR "
			+ "INNER JOIN [StoreHouse]  As SH "
			+ "ON SR.SH_Item_Id   = SH.SH_Item_Id "
			+ "INNER JOIN [Retailer] AS R "
			+ "ON R.C2_Id=SH.C2_Id "
			+ "AND R.C2_Name LIKE %:name% ", nativeQuery = true)
	public List<ShoppingRecord> findByC2NameLike(@Param("name") String name);

	public List<ShoppingRecord> findBySrtimeBetween(@Param("date1") Date date1, @Param("date2") Date date2);

	@Transactional
	@Modifying
	@Query(value = "update shoppingrecord  set SR_State = :setboo where SR_ShoppingRecord_Id = :id", nativeQuery = true)
	public void changeStste(@Param("setboo") Boolean setboo, @Param("id") Integer id);

	@Query(value = "SELECT "// 1
			+ "*  "// 1
			+ "FROM[ShoppingRecord] AS SR "// 1
			+ "INNER JOIN [StoreHouse]  As SH "// 1
			+ "  ON SR.SH_Item_Id   = SH.SH_Item_Id "// 1
			+ " INNER JOIN [Retailer] AS R "// 1
			+ "   ON R.C2_Id=SH.C2_Id "
			+ "And R.C2_Id = :c2id ", nativeQuery = true)
	public List<ShoppingRecord> findALLByc2id(@Param("c2id") Integer c2id);

	@Query(value = "SELECT	* FROM[ShoppingRecord] AS SR " + "			INNER JOIN [StoreHouse]  As SH "
			+ "		 ON SR.SH_Item_Id   = SH.SH_Item_Id " + "			INNER JOIN [Retailer] AS R "
			+ "		 ON R.C2_Id=SH.C2_Id And R.C2_Id = :c2id "
			+ "		 AND SR_Time BETWEEN :day1 AND :day2", nativeQuery = true)
	public List<ShoppingRecord> findByc2idBetweenDay(@Param("c2id") Integer c2id, @Param("day1") String day1,
			@Param("day2") String day2);
	
	@Query(value = "SELECT  *  FROM "
			+ "[ShoppingRecord] AS SR      "
			+ "INNER JOIN "
			+ "[StoreHouse]  As SH      "
			+ " ON SR.SH_Item_Id = SH.SH_Item_Id      "
			+ "INNER JOIN "
			+ "[Retailer] AS R "
			+ "ON R.C2_Id  = SH.C2_Id   "
			+ "AND R.C2_Id= :c2id  "
			+ "AND SR.C1_Id= :c1id ", nativeQuery = true)
	public List<ShoppingRecord> findallbyCidtoC2(@Param("c2id") Integer c2id, @Param("c1id") Integer c1id);

	
	@Query(value = "SELECT  *  FROM "
			+ "[ShoppingRecord] AS SR  "
			+ "INNER JOIN "
			+ "[StoreHouse]  As SH  "
			+ " ON SR.SH_Item_Id = SH.SH_Item_Id "
			+ "INNER JOIN "
			+ "[Retailer] AS R  "
			+ "ON R.C2_Id  = SH.C2_Id   "
			+ "AND R.C2_Id= :c2id      "
			+ "AND SH.SH_ItemName LIKE  %:name%", nativeQuery = true)
	public List<ShoppingRecord> findallbyItNameToC2(@Param("c2id") Integer c2id, @Param("name") String name);
	
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE [dbo].[ShoppingRecord]"
			+ "SET "
			+ "[SR_State] =  0"
			+ "WHERE  SR_ShoppingRecord_Id= :srid ", nativeQuery = true)
	public void returnTheGoods(@Param("srid") Integer srid);

	@Transactional
	@Modifying
	@Query(value = "UPDATE [dbo].[ShoppingRecord]"
			+ "SET "
			+ "[SR_State] =  1"
			+ "WHERE  SR_ShoppingRecord_Id= :srid ", nativeQuery = true)
	public void rejectRTG(@Param("srid") Integer srid);
	
	
	@Transactional
	@Modifying
	@Query(value = "DELETE FROM [dbo].[ShoppingRecord]\r\n"
			+ "WHERE SR_ShoppingRecord_Id= :srid ", nativeQuery = true)
	public void deleteBySR(@Param("srid") Integer srid);
	
	
	
	
	
	
	
	
	// @Query(value = "SELECT * FROM [dbo].[ShoppingRecord] ORDER BY
	// C1_Id",nativeQuery = true )
//	public List<ShoppingRecord> findAllByOrderByC1_Id( );

//	public List<ShoppingRecord> findByCidByOrderBySrtime(Integer cid );

}
