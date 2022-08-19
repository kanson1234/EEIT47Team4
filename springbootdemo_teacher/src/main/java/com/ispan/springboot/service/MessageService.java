package com.ispan.springboot.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.springboot.dao.MessageDao;
import com.ispan.springboot.model.Message;

@Service
@Transactional
public class MessageService {
	@Autowired
	private MessageDao mDao;
	
	public  Message insertMessage(Message msg) {
		return mDao.save(msg);
	}
//	public ShoppingRecord addSR(ShoppingRecord sr) {
//		return SrDao.save(sr);
//	}
	

	
	

}
