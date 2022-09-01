package com.ispan.springboot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
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
			model.addAttribute("title", "依「商家ID」查詢");

			return "AdminSR2";
			// 卻認為客戶
		} else if (2000000 <= intKeyWord) {
			System.out.println("C1_ID " + keyword);
			List<ShoppingRecord> findAllToA1ByC1 = SrService.findAllByC1_id(intKeyWord);
			model.addAttribute("data", findAllToA1ByC1);
			model.addAttribute("title", "依「客戶ID」查詢");
			return "AdminSR2";
			// 卻認為其他
		} else if (intKeyWord < 1000000) {
			System.out.println(" str " + keyword);
//			商品查找
			List<ShoppingRecord> findByitemNameLike = SrService.findByitemNameLike(keyword);
			model.addAttribute("data", findByitemNameLike);
			model.addAttribute("title", "依「商品名稱」查詢");
			if (!findByitemNameLike.isEmpty()) {
				System.err.println(" not id " + keyword);
				return "AdminSR2";
			} else {
				List<ShoppingRecord> findByC2NameLike = SrService.findByC2NameLike(keyword);
				model.addAttribute("data", findByC2NameLike);
				model.addAttribute("title", "依「商店名稱」查詢");
				return "AdminSR2";
			}

		}
		model.addAttribute("data", null);
		return "AdminSR2";

	}

	@ResponseBody
	@GetMapping("/DeleteSrByScId")
	public List<ShoppingRecord> DeleteSrByScId(@RequestParam(name = "srid") Integer srid) {
		srDao.DeleteSrByScId(srid);
		List<ShoppingRecord> findAllToA1 = SrService.findAllByTime();
		return findAllToA1;
	}

	@GetMapping("/RetailerCenter")
	public String gotoC2page(Model model) {
		Retailer retailerSession = (Retailer) model.getAttribute("retailerLoginOk");
		Integer c2id = retailerSession.getRid();
		System.out.println(c2id);
		List<ShoppingRecord> findALLByc2id = srDao.findALLByc2id(c2id);
		model.addAttribute("data", findALLByc2id);
		return "C2Center";
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

//	@ResponseBody
//	// find all sr to C2
	@GetMapping("/Admin/Chart") // findbyc2id
	private String Chart() {
		
		return "chartjsA1";
	}

	@ResponseBody
	// find all sr to C2
	@GetMapping("/record/c2id") // findbyc2id
	private List<ShoppingRecord> findALLByc2id(Model model) {
		Retailer retailerSession = (Retailer) model.getAttribute("retailerLoginOk");
		Integer c2id = retailerSession.getRid();
		System.out.println(c2id);
		return srDao.findALLByc2id(c2id);
	}

	@ResponseBody
	@GetMapping("/c2RTG") // 成交
	private String c2RTG(Model model) {
		Retailer customerSession = ((Retailer) model.getAttribute("retailerLoginOk"));
		Integer c2id = customerSession.getRid();
		Date day1 = new Date();
		Date day2 = new Date();
		day1.setDate(-7);
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		String format1 = ft.format(day1);
		String format2 = ft.format(day2);
		System.out.println(format1);
		System.out.println(format2);

		if (SrService.c2RTG(c2id, format1, format2).isEmpty()) {

			return "T";
		} else {

			return "F";
		}

	}

	@ResponseBody
	@GetMapping("record/SRTRUE") // 成交
	private List<ShoppingRecord> findBysrStateTrue() {
		return SrService.findBysrStateTrue();
	}

	@GetMapping("/Member/RTG") // 待退款
	private String returnTheGoods(@RequestParam(name = "srid") Integer srid, Model model) {

		Customer customerSession = ((Customer) model.getAttribute("customerLoginOk"));
		Integer cid = customerSession.getcId();
		System.out.println(cid);
		SrService.returnTheGoods(srid);

		List<ShoppingRecord> findAllToA1ByC1 = SrService.findAllByC1_id(cid);
		model.addAttribute("data", findAllToA1ByC1);
		return "MemberCenter";
	}

	@ResponseBody
	@GetMapping("/C2/rejectRTG") // 拒絕退款
	private Boolean returnTheGoods(@RequestParam(name = "srid") Integer srid) {
		return SrService.rejectRTG(srid);
	}

	@ResponseBody
	@GetMapping("/C2/deleteBySR") // 退款刪除紀錄
	private Boolean SRdelete(@RequestParam(name = "srid") Integer srid) {
		return SrService.deleteBySR(srid);
	}

	@ResponseBody
	@GetMapping("/admin/record/byName") // findbyName
	private List<ShoppingRecord> findBysrStateSRFalse(@RequestParam(name = "name") String name) {
		return SrService.findByitemNameLike(name);
	}

	@ResponseBody
	@GetMapping("record/changeStste") // findbyName
	private Boolean changeStste(@RequestParam(name = "setbool") Boolean setbool,
			@RequestParam(name = "srid") Integer srid) {
		return SrService.changeStste(setbool, srid);
	}

	@ResponseBody
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

	@ResponseBody
	@PostMapping("admin/record/dateforc2id")
	private List<ShoppingRecord> findByc2idBetweenDay(@RequestBody DateDto dateDto, Model model) {

		Retailer customerSession = ((Retailer) model.getAttribute("retailerLoginOk"));
		Integer c2id = customerSession.getRid();
		System.out.println(c2id);
		String dateS = dateDto.getDateStar();
		String dateE = dateDto.getDateEnd();
		System.out.println(dateS);
		System.out.println(dateE);
		List<ShoppingRecord> findByc2idBetweenDay = srDao.findByc2idBetweenDay(c2id, dateS, dateE);
		if (findByc2idBetweenDay.isEmpty()) {
			return null;
		} else {
			return findByc2idBetweenDay;
		}
	}

	@ResponseBody
	@GetMapping("findallbyCidtoC2")
	private List<ShoppingRecord> findallbyCidtoC2(Model model, @RequestParam(name = "cid") Integer c1id) {
		Retailer customerSession = ((Retailer) model.getAttribute("retailerLoginOk"));
		Integer c2id = customerSession.getRid();
		System.out.println(c2id);
		System.out.println(c1id);
		List<ShoppingRecord> findallbyCidtoC2 = srDao.findallbyCidtoC2(c2id, c1id);

		if (findallbyCidtoC2.isEmpty()) {
			return null;
		} else {
			return findallbyCidtoC2;
		}
	}

	@ResponseBody
	@GetMapping("findallbyItNameToC2")
	private List<ShoppingRecord> findallbyItNameToC2(Model model, @RequestParam(name = "name") String name) {
		Retailer customerSession = ((Retailer) model.getAttribute("retailerLoginOk"));
		Integer c2id = customerSession.getRid();
		System.out.println(c2id);
		System.out.println(name);
		List<ShoppingRecord> findallbyItNameToC2 = srDao.findallbyItNameToC2(c2id, name);
		if (findallbyItNameToC2.isEmpty()) {
			return null;
		} else {
			return findallbyItNameToC2;
		}

	}

}
