package com.ispan.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.springboot.model.Message;
import com.ispan.springboot.model.ShopHouseBean;

public interface ShopHouseDao extends JpaRepository<ShopHouseBean, Integer>{

	//模糊查詢
	@Query(value=" select * FROM StoreHouse WHERE SH_ItemName LIKE %:word% " +
	               "OR C2_Id LIKE %:word%",nativeQuery = true)
	public List<ShopHouseBean> findByKeyword(@RequestParam(name = "word") String word);
	
	
	//產品類型搜尋    @RequestParam(name="classify")
	@Query(value="select * FROM StoreHouse WHERE SH_Classify=:word",nativeQuery = true)
	public List<ShopHouseBean> findByClassify(String word);
	
	//店家ID找商品
	@Query(value="select * FROM StoreHouse WHERE C2_Id=:id",nativeQuery = true)
	public List<ShopHouseBean> findByC2Id( Integer id);
	
	
	
}	




