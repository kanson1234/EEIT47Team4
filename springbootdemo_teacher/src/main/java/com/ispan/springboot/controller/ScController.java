package com.ispan.springboot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ispan.springboot.dao.ScDao;
import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.model.ShoopingCar;
import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.service.ScService;
import com.ispan.springboot.service.ShopHouseService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;

@SessionAttributes(names = { "customerLoginOk", "adminLoginOk", "retailerLoginOk" })
@Controller
public class ScController {
	@Autowired
	private ShopHouseService shService;

	@Autowired
	private ScService scService;

	@Autowired
	private ScDao scDao;

//	R	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// find all sc for C1
	@GetMapping("Member/ShoppingCar")

	public List<ShoopingCar> findAllByScId(Model model, HttpSession session) {
		System.out.println(1);

		Customer customerSession = ((Customer) model.getAttribute("customerLoginOk"));
		System.out.println(2);

		Integer cid = customerSession.getcId();
		System.out.println(3);
		System.err.println(cid);
		System.out.println(4);
		List<ShoopingCar> findAllByScId = scService.findAllByScId(cid);
//		model.addAttribute("data", findAllByScId);

		return null;
//		return findAllByScId;
	}

//	============================================================================
//	============================================================================
//	============================================================================

//	C	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// add 1 or more sc to sc or
	@ResponseBody
	@GetMapping("ShoppingCar/add")
	public List<ShoopingCar> addToCar(@RequestParam(name = "num") Integer num, Model model,
			HttpSession session,
			@RequestParam(name = "itid") Integer itid) {

		Customer customerSession = (Customer) session.getAttribute("customerLoginOk");
		Integer cid = customerSession.getcId();
		Customer customer = new Customer();
		customer.setcId(cid);

		Integer itId = itid;
		ShopHouseBean shophousebean = new ShopHouseBean();
		shophousebean.setId(itId);

		Integer check = scDao.check(cid, itid);
		ShoopingCar newSC = new ShoopingCar();
		newSC.setCustomer(customer);
		newSC.setShophousebean(shophousebean);
		newSC.setScCount(num);

		if (check == null) {
			scDao.save(newSC);
			return scService.findAllByScId(cid);
		} else {
			scDao.change(cid, itid, num + check);

			return scService.findAllByScId(cid);

		}

	}

//	U	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	// remove one SC by scid
	@ResponseBody
	@GetMapping("ShoppingCar/removebyscid")
	private Boolean remove(@RequestParam(name = "scid") Integer scid) {
		try {
			scDao.deleteByC1id(scid);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// change num for sc by c1_id & it_id
	@GetMapping("ShoppingCar/change")
	@ResponseBody
	private List<ShoopingCar> change(Model model, @RequestParam(name = "itid") Integer itid,
			@RequestParam(name = "num") Integer num) {
		Customer customerSession = (Customer) model.getAttribute("customerLoginOk");
		Integer cid = customerSession.getcId();
		Integer check = scDao.check(cid, itid);

		return scService.findAllByScId(cid);
	}

//	D	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	// delett all SC
	@GetMapping("ShoppingCar/deledeAll")
	@ResponseBody
	private List<ShoopingCar> delede(Model model) {
		Customer customerSession = (Customer) model.getAttribute("customerLoginOk");
		Integer cid = customerSession.getcId();
		scDao.deleteByC1id(cid);
		return scService.findAllByScId(cid);
	}

//	ECPAY	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	@GetMapping("/gotoecpay")
	public void gotoecpay() {
		AllInOne aio = new AllInOne("");
		AioCheckOutDevide obj = new AioCheckOutDevide();
		obj.setMerchantTradeNo("testorder20250315");
		obj.setMerchantTradeDate("2023/01/01 08:05:23");
		obj.setTotalAmount("20000");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("https://13ef-203-77-34-142.jp.ngrok.io/returnURL");
		obj.setNeedExtraPaidInfo("N");
		obj.setCreditInstallment("12");
		String form = aio.aioCheckOut(obj, null);
		System.out.println(form);
	}

	@PostMapping("/returnURL")
	public void returnURL(@RequestParam("RtnCode") int RtnCode) {
		if (RtnCode == 1) {
			System.out.println("susses");
		} else {
			System.out.println("error");
		}
	}

}