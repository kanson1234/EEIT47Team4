package com.ispan.springboot.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
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
		return sDao.findAll();
	}

	// 後台分頁
	public Page<ShopHouseBean> findByPage(Integer pageNumber) {
		PageRequest pgb = PageRequest.of(pageNumber - 1, 6, Sort.Direction.ASC, "id");
		Page<ShopHouseBean> page = sDao.findAll(pgb);
		return page;
	}

	// 前台分頁
	public Page<ShopHouseBean> frontPageFindByPage(Integer pagesNumber) {
		PageRequest pgb = PageRequest.of(pagesNumber - 1, 9, Sort.Direction.ASC, "id");
		Page<ShopHouseBean> page = sDao.findAll(pgb);
		return page;
	}

	// 模糊查詢
	public List<ShopHouseBean> findByKeyword(String word) {
		return sDao.findByKeyword(word);
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

	// 前台最新商品
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
}
