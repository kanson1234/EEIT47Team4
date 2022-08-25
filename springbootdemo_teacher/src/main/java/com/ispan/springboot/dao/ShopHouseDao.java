package com.ispan.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.springboot.model.Message;
import com.ispan.springboot.model.ShopHouseBean;

public interface ShopHouseDao extends JpaRepository<ShopHouseBean, Integer>{

	//模糊查詢
	@Query(value=" select * FROM StoreHouse WHERE SH_ItemName LIKE %:word% " +
	               "OR C2_Id LIKE %:word% OR SH_Classify LIKE %:word%",nativeQuery = true)
	public List<ShopHouseBean> findByKeyword(@RequestParam(name = "word") String word);
	
	@Transactional // 蓋掉上方交易預設設定
	@Modifying
	@Query(value="delete from StoreHouse where SH_Item_Id = :SH_Item_Id", nativeQuery = true)
	public void deleteByItemId(@Param("SH_Item_Id") Integer id);
	
	
	//產品類型搜尋    @RequestParam(name="classify")
	@Query(value="select * FROM StoreHouse WHERE SH_Classify=:word",nativeQuery = true)
	public List<ShopHouseBean> findByClassify(String word);
	
	//店家ID找商品
	@Query(value="select * FROM StoreHouse WHERE C2_Id=:id",nativeQuery = true)
	public List<ShopHouseBean> findByC2Id( Integer id);
	 
	//價格排序由大至小
	public List<ShopHouseBean> getByOrderByPriceDesc();
	
	//價格排序由小至大
	public List<ShopHouseBean> getByOrderByPriceAsc();
	
	//種類價格排序由小至大
	@Query(value="SELECT * FROM StoreHouse WHERE SH_Classify=':name' ORDER BY SH_Price ASC;",nativeQuery = true)
	public List<ShopHouseBean> sortByClassifyAsc(String name);
	
	//種類價格排序由大至小
	@Query(value="SELECT * FROM StoreHouse WHERE SH_Classify=':name' ORDER BY SH_Price DESC;",nativeQuery = true)
	public List<ShopHouseBean> sortByClassifyDesc(String name);
	
}	




