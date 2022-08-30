package com.ispan.springboot.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.springboot.dao.MessageDao;
import com.ispan.springboot.model.Message;
import com.ispan.springboot.model.Retailer;

@Service
@Transactional
public class MessageService {
	@Autowired
	private MessageDao mDao;
	
	public  Message insertMessage(Message msg) {
		return mDao.save(msg);
	}
	public Message findMessageById(Integer mid) {
		Optional<Message> optional = mDao.findById(mid);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	//找全部
	public List<Message> findAllmessage(){
		return mDao.findAll();
	}
	//刪除
	public void deletemessage(Integer mid) {
		mDao.deleteById(mid);
	}
	//根據留言內容搜尋
	public List<Message> listAll(String keyword){
		if(keyword !=null) {
			return mDao.findAllbyMsgcontext(keyword);
		}
		
		return mDao.findAllbyMsgcontext(keyword);
		
	}
	

	
	

}
