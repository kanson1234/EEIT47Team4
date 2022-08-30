package com.ispan.springboot.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.ispan.springboot.dao.MessageDao;
import com.ispan.springboot.dao.ShopHouseDao;
import com.ispan.springboot.model.Message;
import com.ispan.springboot.model.ShopHouseBean;

@Service
@Transactional
public class ShopHouseService {


	@Autowired
	private MessageDao mDao2;

	@Autowired
	private ShopHouseDao sDao;

	// 新增商品 or 修改商品
	public void addItem(ShopHouseBean shb) {
		sDao.save(shb);
	}

	// 刪除商品
	@Transactional
	@Modifying
	public void deleteByItemId(Integer id) {
		sDao.deleteByItemId(id);
	}

	// 查詢一筆商品
	public ShopHouseBean findItemById(Integer id) {
		Optional<ShopHouseBean> optional = sDao.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	// 查詢全部
	public List<ShopHouseBean> findAllItem() {
		return sDao.showAllItems();
	}

	// 後台分頁
	public Page<ShopHouseBean> findByPage(Integer pageNumber) {
		PageRequest pgb = PageRequest.of(pageNumber - 1, 6, Sort.Direction.ASC, "id");
		Page<ShopHouseBean> page = sDao.findAll(pgb);
		return page;
	}

	// 前台分頁
	public Page<ShopHouseBean> frontPageFindByPage(Integer pagesNumber) {
		PageRequest pgb = PageRequest.of(pagesNumber - 1, 12, Sort.Direction.ASC, "id");
		Page<ShopHouseBean> page = sDao.findAll(pgb);
		return page;
	}

	// 模糊查詢
	public List<ShopHouseBean> findByKeyword(String word) {
		return sDao.findByKeyword(word);
	}
	
	//模糊搜尋價格排序由大至小
	public List<ShopHouseBean> findByKeywordOrderByPrice(String word){
		return sDao.findByKeywordOrderByPrice(word);
	}
	
	//模糊搜尋價格排序由大至小
	public List<ShopHouseBean> findByKeywordOrderByPriceASC(String word){
		return sDao.findByKeywordOrderByPriceASC(word);
	}

	// 產品類型搜尋
	public List<ShopHouseBean> findByClassify(String word) {
		return sDao.findByClassify(word);
	}

	// 建立實體化
	public ShopHouseBean insertNewShopHouseBean(ShopHouseBean shopHouseBean) {
		return sDao.save(shopHouseBean);
	}

	// 找c2Id的所有商品
	public List<ShopHouseBean> findByC2Id(Integer id) {
		return sDao.findByC2Id(id);
	}
	
	// 找c2Id的所有下架商品
    public List<ShopHouseBean> findByC2IdBlocked(Integer id){
    	return sDao.findByC2IdBlocked(id);
    }
	
	// 前台最新商品
    @Query(value="SELECT * FROM StoreHouse WHERE SH_State=1" ,nativeQuery = true)
	public Page<ShopHouseBean> frontPageItems(Integer pagesNumber) {
		PageRequest pgb = PageRequest.of(pagesNumber - 1, 12, Sort.Direction.DESC, "id");
		Page<ShopHouseBean> page = sDao.findAll(pgb);
		return page;
	}
	
	//價格排序由大至小
	public List<ShopHouseBean> getByOrderByPriceDesc(){
		return sDao.getByOrderByPriceDesc();
	}
	//價格排序由小至大
	public List<ShopHouseBean> getByOrderByPriceAsc(){
		return sDao.getByOrderByPriceAsc();
	}
	
	//種類價格排序由小至大
	public List<ShopHouseBean> sortByClassifyPriceAsc(String name){
		return sDao.sortByClassifyAsc(name);
	}
	
	//種類價格排序由大至小
	public List<ShopHouseBean> sortByClassifyPriceDesc(String name){
		return sDao.sortByClassifyDesc(name);
	}
	
	//改變status
	public boolean ChangeStatusById (boolean status,Integer id) {
		  sDao.changeStatusById(status, id);
		  return true;
    }
	
	//秀出所有狀態為true的商品
	public List<ShopHouseBean> showAllItems(){
		return sDao.showAllByStatus(true);
	}
	
	//秀出所有商品為false的商品
	public List<ShopHouseBean> showAllItemsBlocked(){
		return sDao.showAllByStatus(false);
	}
	
	//秀全部商品
	public List<ShopHouseBean> showBackAllItems(){
		return sDao.findAll();
	}
	
}

