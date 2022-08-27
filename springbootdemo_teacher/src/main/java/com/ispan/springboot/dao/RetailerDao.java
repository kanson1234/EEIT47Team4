package com.ispan.springboot.dao;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.springboot.model.Retailer;
@Repository
public interface RetailerDao extends JpaRepository<Retailer, Integer> {

 @Query("from Retailer where raccount=:raccount and  rpwd=:rpwd")
 public Retailer findByRetailerAccount(@Param("raccount") String raccount, @Param("rpwd") String rpwd);

 @Query("from Retailer where raccount=:raccount")
 public Retailer findRetailerAccount(@Param("raccount") String raccount);

 @Query(value="SELECT * FROM Retailer WHERE C2_Name like %:name%"
   +" OR C2_Account like %:name%", nativeQuery = true)
 public List<Retailer> findAll(@Param("name") String keyword);
 
 @Query("from Retailer where rstate=:rstate")
 public List<Retailer> showAllByStatus(@Param("rstate") boolean state);
 
 @Transactional // 蓋掉上方交易預設設定
 @Modifying
 @Query(value="update Retailer set C2_State = :rstate where C2_Id =:rid", nativeQuery = true)
 public void changeStatusById(@Param("rstate") boolean state,@Param("rid") Integer id);
 
}