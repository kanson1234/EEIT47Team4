package com.ispan.springboot.controller;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.Message;
import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.service.CustomerService;
import com.ispan.springboot.service.MessageService;
import com.ispan.springboot.service.ShopHouseService;

@SpringBootApplication
@Controller
@SessionAttributes(names = { "customerLoginOk", "adminLoginOk", "retailerLoginOk" })
public class MessageController {
	public static void main(String[] args) {
		System.setProperty("spring.devtools.restart.enabled", "false");
		SpringApplication.run(MessageController.class, args);
	}

	@Autowired
	private ShopHouseService sService;
	@Autowired
	private MessageService mService;
	@Autowired
	private CustomerService cService;
	@Autowired
	private ShopHouseController sController;

	@GetMapping("/message/add")
	public String addMessagePage(Model model) {

		Message newMsg = new Message();

		model.addAttribute("Messages", newMsg);

		return "ItemDetail2";
	}

	@PostMapping("/ShopHouse/postMessages")
	public String postMessage(@RequestParam("newMsg") String mcontext, @RequestParam("SH_Item_Id") Integer SH_Item_Id,
			@RequestParam("newMrid") Integer mrid, @RequestParam("CS_Id") Integer CS_Id,Model model) {

		ShopHouseBean shopHouseBean = sService.findItemById(SH_Item_Id);
//		Set<ShopHouseBean> shopHouseBean = rId.getShopHouseBean();
//		Customer loginCustomer = (Customer) model.addAttribute("customerLoginOk");
		Customer customerMsg = new Customer();
		customerMsg.setcId(CS_Id);

		Set<Message> msgList = shopHouseBean.getMessage();
		Message message = new Message();
		message.setMcontext(mcontext);
		message.setMstate(true);
		message.setMstatec(true);
		message.setMrid(mrid);
		message.setCustomerMsg(customerMsg);
		message.setShopHouseBean(shopHouseBean);// 實體化shopHouseBean
		msgList.add(message);
		sService.insertNewShopHouseBean(shopHouseBean);
		return "redirect:/ShopHouse/itemDetail/" + Integer.toString(SH_Item_Id);
	}

	// 進修改
	@GetMapping("/message/editMessage/{mid}")
	public String updateMessagePage(@PathVariable Integer mid, Model model) {
		Message newMsg = mService.findMessageById(mid);

		model.addAttribute("Message", newMsg);
		return "updateMessagex";
	}

	// 修改2
	@PostMapping("/message/editMessage")
	public String editMessagePost(@RequestParam("id") Integer mid, @RequestParam("newmcontext") String mcontext,
			@RequestParam("rid") Integer mrid, @RequestParam("SH_Item_Id") Integer SH_Item_Id, 
			@RequestParam("CS_Id") Integer CS_Id,Model model) {
		ShopHouseBean shopHouseBean = new ShopHouseBean();
		shopHouseBean.setId(SH_Item_Id);
		Customer customerMsg = new Customer();
		customerMsg.setcId(CS_Id);

		Message newMsg = new Message();
		Date d = new Date();
		newMsg.setMid(mid);
		newMsg.setMcontext(mcontext);
		newMsg.setMstate(true);
		newMsg.setMstatec(true);
		newMsg.setCustomerMsg(customerMsg);

		newMsg.setMrid(mrid);
		newMsg.setMdate(d);

		newMsg.setShopHouseBean(shopHouseBean);

		mService.insertMessage(newMsg);
		List<Message> all = mService.findAllmessage();
		model.addAttribute("AllItem", all);

		return "redirect:/message/view";
	}

	// 看全部
	@GetMapping("/message/view")
	public String findAllmessage(Model model) {
		List<Message> all = mService.findAllmessage();
		model.addAttribute("AllMessage", all);
		return "allmessage";
	}

//		 刪除()
	@GetMapping("/message/delete/{mid}")
	public String deletemessageById(@PathVariable Integer mid, Model model) {
		mService.deletemessage(mid);
	    
		System.out.println("--------------------------------------------"+mid);

//		List<Message> all = mService.findAllmessage();
//		model.addAttribute("AllMessage", all);
		return "redirect:/message/view";
	}
	//模糊查詢帳號及名稱
		@GetMapping("/Message/getByMsgcontext")
		public String searchBycontext(@RequestParam("keyword") String keyword, Model model) {
			List<Message> list = mService.listAll(keyword);
			model.addAttribute("AllMessage", list);
			return "allmessage";
		}
	
}
