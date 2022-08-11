package com.ispan.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ispan.springboot.model.Message;
import com.ispan.springboot.service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService mService;
	
//	@GetMapping("/message/add")
//	public String addMessagePage(Model model) {
//		
//		Message newMsg = new Message();
//		
//		model.addAttribute("workMessages", newMsg);
//		
//		return "addMessage";
//	}
	
//	@PostMapping("/postMessages")
//	public String postMessage(@ModelAttribute Message msg,Model model) {
//		mService.insertMessage(msg);
//		
//		Message newMsg = new Message();
//		
//		model.addAttribute("workMessages", newMsg);
//		
//		return "addMessage";
//	}
	
//	@GetMapping("message/add")
//	public Message addmessage() {
//		Message newMG = new Message();
//		newMG.setMcontext("測試");
//		newMG.setMstate(true);
//		newMG.setMstatec(true);
//		newMG.setMshid(10);
//		newMG.setMsid(123);
//		newMG.setMrid(2000002);
//		Message success = mService.insertMessage(newMG);
//		
//		return null;
//		
//	}
	
	
	
	
	
//	@GetMapping("record/add")
//	public ShoppingRecord addSR() {
//		Customer customer = new Customer();
//		customer.setC1_Id(2000002);
//
//		ShoppingRecord newSR = new ShoppingRecord();
//		newSR.setCustomer(customer);;
//		newSR.setShItemId(1);
//		newSR.setSrCount(5);
//		newSR.setSrState(true);
////	newSR.setSR_State(true);
//		ShoppingRecord success = SrService.addSR(newSR);
//
//		return newSR;
//	}

}
