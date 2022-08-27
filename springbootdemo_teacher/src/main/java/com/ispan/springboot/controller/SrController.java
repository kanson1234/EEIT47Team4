package com.ispan.springboot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ispan.springboot.dao.ShoppingRecordDao;
import com.ispan.springboot.dto.DateDto;
import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.model.ShoppingRecord;
import com.ispan.springboot.service.SrService;

@SessionAttributes(names = { "customerLoginOk", "adminLoginOk", "retailerLoginOk" })
@Controller
public class SrController {
	@Autowired
	private SrService SrService;

	@Autowired
	private ShoppingRecordDao srDao;
//	---------------------------------------------------------------------------------

	@GetMapping("/Admin/SalesRecord3")
	private String findAllByTime(Model model) {
		List<ShoppingRecord> findAllToA1 = SrService.findAllByTime();
		model.addAttribute("data", findAllToA1);

		return "AdminSR2";
	}
	
	@GetMapping("/Member/MemberCenter")
	public String MemberCenter(Model model) {
		
		Customer customerSession = ((Customer) model.getAttribute("customerLoginOk"));
		Integer cid = customerSession.getcId();
		
		System.out.println(cid);
		
		
		
		List<ShoppingRecord> findAllToA1ByC1 = SrService.findAllByC1_id(cid);
		model.addAttribute("data", findAllToA1ByC1);
		return "MemberCenter";
		
		
	}
	
	
	
	
	
	@GetMapping("/findbyKeyWord")
	private String findbyKeyWord(Model model, @RequestParam(name = "keyword") String keyword) {
		System.out.println(keyword);

		int intKeyWord = 0;

		try {
			intKeyWord = Integer.parseInt(keyword);
		} catch (Exception e) {

		}
		// 卻認為商家
		if (1000000 <= intKeyWord & intKeyWord < 2000000) {
			System.out.println("C2_ID " + keyword);
			List<ShoppingRecord> findAllToA1ByC2 = srDao.findALLByc2id(intKeyWord);
			model.addAttribute("data", findAllToA1ByC2);

			return "AdminSR-findby-c2";
			// 卻認為客戶
		} else if (2000000 <= intKeyWord) {
			System.out.println("C1_ID " + keyword);
			List<ShoppingRecord> findAllToA1ByC1 = SrService.findAllByC1_id(intKeyWord);
			model.addAttribute("data", findAllToA1ByC1);
			return "AdminSR-findby-c1";
			// 卻認為其他
		} else if (intKeyWord < 1000000) {
			System.out.println(" str " + keyword);
//			商品查找
			List<ShoppingRecord> findByitemNameLike = SrService.findByitemNameLike(keyword);
			model.addAttribute("data", findByitemNameLike);

			if (!findByitemNameLike.isEmpty()) {
				System.err.println(" not id " + keyword);
				
				
				return "AdminSR-findby-it-Name";
			}
			return "AdminSR-findby-it-Name";
		}
		model.addAttribute("data", null);
		return "AdminSR2";

	}

//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
//========================================================================================================================================================
	@ResponseBody
	@GetMapping("record/add")
	public ShoppingRecord addSR(Model model) {
		Customer customerSession = (Customer) model.getAttribute("customerLoginOk");
		Integer cid = customerSession.getcId();

		Customer customer = new Customer();
		customer.setcId(cid);
		ShopHouseBean shophousebean = new ShopHouseBean();
		shophousebean.setId(10);

		int price = 0;
		int count = 0;

		ShoppingRecord newSR = new ShoppingRecord();
		newSR.setCustomer(customer);
		newSR.setShophousebean(shophousebean);
		newSR.setSrTotalPrice(price);
		newSR.setSrDiscount(1);
		newSR.setSrCount(count);
		newSR.setSrState(true);

		System.out.println(newSR.getSrtime());

		ShoppingRecord success = SrService.addSR(newSR);

		System.out.println(newSR.getSrtime());
		return newSR;
	}

	// find all sr to A1

	// find all sr to C1
	@GetMapping("record/findallbyCid")
	private List<ShoppingRecord> findallbyC1id(Model model, @RequestParam(name = "cid") Integer ci) {

		Customer customerSession = (Customer) model.getAttribute("customerLoginOk");
		Integer cid = customerSession.getcId();

		List<ShoppingRecord> findAllByC1_id = SrService.findAllByC1_id(cid);
		System.out.println(findAllByC1_id.isEmpty());
		if (findAllByC1_id.isEmpty()) {
			return null;
		} else {
			return findAllByC1_id;
		}

	}

	
	// find all sr to C2
	@GetMapping("/record/c2id") // findbyc2id
	private List<ShoppingRecord> findALLByc2id(Model model) {
		Retailer retailerSession = (Retailer) model.getAttribute("retailerLoginOk");
		Integer c2id = retailerSession.getRid();
		return srDao.findALLByc2id(c2id);
	}

	@GetMapping("record/SRTRUE") // 成交
	private List<ShoppingRecord> findBysrStateTrue() {
		return SrService.findBysrStateTrue();
	}

	@GetMapping("record/SRFalse") // 退貨
	private List<ShoppingRecord> findBysrStateSRFalse() {
		return SrService.findBysrStateFalse();
	}

	@GetMapping("/admin/record/byName") // findbyName
	private List<ShoppingRecord> findBysrStateSRFalse(@RequestParam(name = "name") String name) {
		return SrService.findByitemNameLike(name);
	}

	@GetMapping("record/changeStste") // findbyName
	private Boolean changeStste(@RequestParam(name = "setbool") Boolean setbool,
			@RequestParam(name = "srid") Integer srid) {
		return SrService.changeStste(setbool, srid);
	}
	

	@PostMapping("admin/record/date") // findbyName
	private List<ShoppingRecord> Between(@RequestBody DateDto dateDto) {

		String dateS = dateDto.getDateStar();
		String dateE = dateDto.getDateEnd();

		System.out.println(dateS);
		System.out.println(dateE);

		Date date1 = null;
		Date date2 = null;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			date1 = formatter.parse(dateS);
			date2 = formatter.parse(dateE);
			System.out.println("date teans suss");
		} catch (ParseException e) {
			System.out.println("date teans fail");
			e.printStackTrace();
		}
		return srDao.findBySrtimeBetween(date1, date2);
	}

}
