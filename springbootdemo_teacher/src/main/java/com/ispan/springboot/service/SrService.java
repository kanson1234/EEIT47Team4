package com.ispan.springboot.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.ispan.springboot.dao.ShoppingRecordDao;
import com.ispan.springboot.model.ShoppingRecord;

@Service
@Transactional
public class SrService {
	@Autowired
	private ShoppingRecordDao SrDao;

	public ShoppingRecord addSR(ShoppingRecord sr) {
		return SrDao.save(sr);
	}

	public List<ShoppingRecord> findAllByTime() {
		return SrDao.findAllByOrderBySrtime();
	}

	public List<ShoppingRecord> findAllByC1_id(Integer cid) {
		return SrDao.findALLBycustomer_cId(cid);
	}

	public List<ShoppingRecord> findBysrStateTrue() {
		return SrDao.findBysrStateTrue();
	}

//	public List<?> chartjsA1() {
//		return SrDao.chartjsA1();
//	}

	public List<ShoppingRecord> findBysrStateFalse() {
		return SrDao.findBysrStateFalse();
	}

	public List<ShoppingRecord> findByitemNameLike(String name) {
		return SrDao.findByshophousebean_itemNameLike(name);
	}
	
	public List<ShoppingRecord> c2RTG(Integer c2id ,String day1,String day2) {
		return SrDao.c2RTG(c2id, day1, day2);
	}

	public List<ShoppingRecord> findByC2NameLike(String name) {
		return SrDao.findByC2NameLike(name);
	}

	public Boolean returnTheGoods(Integer srid) {
		try {
			SrDao.returnTheGoods(srid);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public Boolean rejectRTG(Integer srid) {
		try {
			SrDao.rejectRTG(srid);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public Boolean deleteBySR(Integer srid) {
		try {
			SrDao.deleteBySR(srid);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public Boolean changeStste(Boolean setbool, Integer srid) {
		if (setbool != null) {
			SrDao.changeStste(setbool, srid);
			return setbool;
		} else {
			return null;
		}
	}

}
