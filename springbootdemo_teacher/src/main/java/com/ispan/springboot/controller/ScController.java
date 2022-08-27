package com.ispan.springboot.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ispan.springboot.dao.ScDao;
import com.ispan.springboot.dto.DtoSc;
import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.ShoopingCar;
import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.model.ShoppingRecord;
import com.ispan.springboot.service.ScService;
import com.ispan.springboot.service.ShopHouseService;
import com.ispan.springboot.service.SrService;

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
	private SrService SrService;

	@Autowired
	private ScDao scDao;

//	U	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	// remove one SC by scid

	@GetMapping("ShoppingCar/removebyscid")
	private String remove(@RequestParam(name = "scid") Integer scid, Model model, HttpSession session) {
		try {
			scDao.deleteByScId(scid);
			Customer customerSession = ((Customer) model.getAttribute("customerLoginOk"));

			Integer cid = customerSession.getcId();
			List<ShoopingCar> findAllByScId = scService.findAllByScId(cid);
			model.addAttribute("data", findAllByScId);

			return "ShoppingCar";

		} catch (Exception e) {
			Customer customerSession = ((Customer) model.getAttribute("customerLoginOk"));

			Integer cid = customerSession.getcId();
			List<ShoopingCar> findAllByScId = scService.findAllByScId(cid);
			model.addAttribute("data", findAllByScId);

			return "ShoppingCar";

		}
	}

//	R	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// find all sc for C1
	@GetMapping("Member/ShoppingCar")
	public String findAllByScId2(Model model, HttpSession session) {
		Customer customerSession = ((Customer) model.getAttribute("customerLoginOk"));
		model.getAttribute("customerLoginOk");

		if (model.getAttribute("customerLoginOk") == null) {
			return "loginC";
		} else {
			Integer cid = customerSession.getcId();
			List<ShoopingCar> findAllByScId = scService.findAllByScId(cid);
			model.addAttribute("data", findAllByScId);

			return "ShoppingCar";
		}

	}

	@ResponseBody
	@GetMapping("Member/ShoppingCar/test")
	public List<ShoopingCar> findAllByScId() {

		List<ShoopingCar> findAllByScId = scService.findAllByScId(2000004);

		return findAllByScId;
	}
//	============================================================================
//	============================================================================
//	============================================================================

//	C	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// add 1 or more sc to sc or
	
	@ResponseBody
	@PostMapping("ShoppingCar/checkout")
	public String addToCar(@RequestBody List<DtoSc> scDto, Model model, HttpSession session) {
		Customer customerSession = (Customer) session.getAttribute("customerLoginOk");
		Integer cid = customerSession.getcId();
		Customer customer = new Customer();
		customer.setcId(cid);
		System.err.println("++++++++++++++++++++++++++++++++++" + scDto.get(0).getPrice());
		System.err.println("++++++++++++++++++++++++++++++++++" + scDto.size());
		for (Iterator iterator = scDto.iterator(); iterator.hasNext();) {
			DtoSc dtoSc = (DtoSc) iterator.next();
			System.out.println(cid + "\t" + dtoSc.getScid() + "\t" + dtoSc.getSccount() + "\t" + dtoSc.getPrice() + "\t"+ dtoSc.getScTotalPrice());
			Integer itId = dtoSc.getScid();
			Integer num = dtoSc.getSccount();
			Integer ScPrice = dtoSc.getPrice();
			Integer ScTotalPrice = dtoSc.getScTotalPrice();
//			======================================================
			ShopHouseBean shophousebean = new ShopHouseBean();
			shophousebean.setId(itId);
			int price = ScPrice;
			int count = num;
			int totoprice = ScTotalPrice;
			ShoppingRecord newSR = new ShoppingRecord();
			newSR.setCustomer(customer);
			newSR.setShophousebean(shophousebean);	
			newSR.setSrTotalPrice(totoprice);
			newSR.setSrDiscount(1);
			newSR.setSrCount(count);
			newSR.setSrState(true);
			ShoppingRecord success = SrService.addSR(newSR);
//			======================================================
		
			scDao.deleteByC1id(cid);
		}
		

		return "AAA" ;
		
	}
//	______________________________________________________________________________________________________
	@GetMapping("ShoppingCar/add")
	public String addToCar(@RequestParam(name = "num") Integer num, Model model, HttpSession session,
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
			return "成功加入新商品";
		} else {
			scDao.change(cid, itid, num + check);

			return "成功加入購物車";

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