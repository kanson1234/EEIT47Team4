package com.ispan.springboot.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.springboot.dao.MessageDao;
import com.ispan.springboot.model.Message;

@Service
@Transactional
public class MessageService {
	@Autowired
	private MessageDao MDao;
	
	public  Message insertMessage(Message msg) {
		return MDao.save(msg);
	}
//	public ShoppingRecord addSR(ShoppingRecord sr) {
//		return SrDao.save(sr);
//	}
	
	

}
