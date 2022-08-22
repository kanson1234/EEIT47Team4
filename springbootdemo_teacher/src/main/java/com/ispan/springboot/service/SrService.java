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
//	public List<ShoppingRecord> findAllByC2_id(Integer rid) {
//		return SrDao.findALLByshophousebean_c2Id(rid);
//	}

	public List<ShoppingRecord> findBysrStateTrue() {
		return SrDao.findBysrStateTrue();
	}

	public List<ShoppingRecord> findBysrStateFalse() {
		return SrDao.findBysrStateFalse();
	}

	public List<ShoppingRecord> findByitemNameLike(String name) {
		return SrDao.findByshophousebean_itemNameLike(name);
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
