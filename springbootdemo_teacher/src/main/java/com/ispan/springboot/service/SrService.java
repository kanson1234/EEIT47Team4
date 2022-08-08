//package com.ispan.springboot.service;
//
//import java.util.List;
//
//import javax.transaction.Transactional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.ispan.springboot.demol.ShoppingRecord;
//import com.ispan.springboot.demol.ShoppingRecordDao;
//
//@Service
//@Transactional
//public class SrService {
//	@Autowired
//	private ShoppingRecordDao SrDao;
//	
//	public ShoppingRecord addSR(ShoppingRecord sr) {
//		return SrDao.save(sr);
//	}
//	
//	public List<ShoppingRecord> findAllByTime() {
//		return SrDao.findAllByOrderBySrtime();
//	}
//	
//	public List<ShoppingRecord> findAllByCid() {
//		return SrDao.findAllByOrderByCid();
//	}
//	
//	
//}
