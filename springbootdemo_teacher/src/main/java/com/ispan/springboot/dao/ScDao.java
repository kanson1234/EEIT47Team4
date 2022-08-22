package com.ispan.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.springboot.model.ShoopingCar;

public interface ScDao extends JpaRepository<ShoopingCar, Integer> {

 public List<ShoopingCar> findAllBycustomer_cId(@Param("cid") Integer cid);

 @Transactional
 @Modifying
 @Query(value = "DELETE FROM ShopingCar WHERE SC_Id = :scId ",nativeQuery = true)
 public void deleteByScId(@Param("scId")Integer scId);

 @Transactional
 @Modifying
 @Query(value = "UPDATE ShopingCar SET SC_Count = :num WHERE C1_Id= :cid AND SH_Item_Id= :itid ",nativeQuery = true)
 public void change(@Param("cid")Integer cid ,@Param("itid")Integer itid,@Param("num")Integer num);

 
}