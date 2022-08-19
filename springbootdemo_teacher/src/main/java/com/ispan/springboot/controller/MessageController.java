package com.ispan.springboot.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.springboot.model.Message;
import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.service.MessageService;
import com.ispan.springboot.service.ShopHouseService;

@Controller
public class MessageController {
	
	@Autowired
	private ShopHouseService sService;
    @Autowired	
	private ShopHouseController sController;
	
    
	@GetMapping("/message/add")
	public String addMessagePage(Model model) {

		Message newMsg = new Message();

		model.addAttribute("Messages", newMsg);

		return "ItemDetail";
	}

	@PostMapping("/ShopHouse/postMessages")
	public String postMessage(@RequestParam("newMsg") String mcontext, @RequestParam("SH_Item_Id") Integer SH_Item_Id, Model model) {

		ShopHouseBean shopHouseBean = sService.findItemById(SH_Item_Id);
//		Set<ShopHouseBean> shopHouseBean = rId.getShopHouseBean();

		Set<Message> msgList = shopHouseBean.getMessage();
		Message message = new Message();
		message.setMcontext(mcontext);
		message.setMrid(1);
		message.setMsid(1);
		message.setShopHouseBean(shopHouseBean);//實體化shopHouseBean
		msgList.add(message);
		sService.insertNewShopHouseBean(shopHouseBean);
		return "redirect:/ShopHouse/itemDetail/"+Integer.toString(SH_Item_Id);
	}

//	@GetMapping("/")
//	public String findAllMessage(model) {
//		
//	}
//		

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
//	newSR.setSR_State(true);
//		ShoppingRecord success = SrService.addSR(newSR);
//
//		return newSR;
//	}

}
