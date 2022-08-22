package com.ispan.springboot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.springboot.dao.ShoppingRecordDao;
import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.model.ShoppingRecord;
import com.ispan.springboot.service.SrService;

@RestController
public class SrController {
	@Autowired
	private SrService SrService;

	@Autowired
	private ShoppingRecordDao srDao;

	@GetMapping("record/add")
	public ShoppingRecord addSR() {
		Customer customer = new Customer();
		customer.setcId(2000002);
		ShopHouseBean shophousebean = new ShopHouseBean();
		shophousebean.setId(10);

		ShoppingRecord newSR = new ShoppingRecord();
		newSR.setCustomer(customer);
		newSR.setShophousebean(shophousebean);
		newSR.setSrCount(5);
		newSR.setSrState(true);

		System.out.println(newSR.getSrtime());

		ShoppingRecord success = SrService.addSR(newSR);

		System.out.println(newSR.getSrtime());
		return newSR;
	}

	@GetMapping("record/findallbytime")
	private List<ShoppingRecord> findAllByTime() {

		return SrService.findAllByTime();
	}

	@GetMapping("record/findallbyCid")
	private List<ShoppingRecord> findallbyC1id(@RequestParam(name = "cid", defaultValue = "1") Integer cid) {
		System.out.println(cid);
		List<ShoppingRecord> findAllByC1_id = SrService.findAllByC1_id(cid);
		System.out.println(findAllByC1_id.isEmpty());
		if (findAllByC1_id.isEmpty()) {
			return null;
		} else {
			return findAllByC1_id;
		}

	}

//	@GetMapping("record/findallbyRid")
//	private List<ShoppingRecord> findallbyC2id(@RequestParam(name = "cid", defaultValue = "1") Integer rid) {
//		System.out.println(rid);
//		List<ShoppingRecord> findAllByC2_id = SrService.findAllByC2_id(rid);
//		
//		if (findAllByC2_id.isEmpty()) {
//			return null;
//		} else {
//			return findAllByC2_id;
//		}
//		
//	}

	@GetMapping("record/SRTRUE") // 成交
	private List<ShoppingRecord> findBysrStateTrue() {
		return SrService.findBysrStateTrue();
	}

	@GetMapping("record/SRFalse") // 退貨
	private List<ShoppingRecord> findBysrStateSRFalse() {
		return SrService.findBysrStateFalse();
	}

	@GetMapping("record/byName") // findbyName
	private List<ShoppingRecord> findBysrStateSRFalse(@RequestParam(name = "name") String name) {
		return SrService.findByitemNameLike(name);
	}

	@GetMapping("record/changeStste") // findbyName
	private Boolean changeStste(@RequestParam(name = "setbool") Boolean setbool,
			@RequestParam(name = "srid") Integer srid) {
		return SrService.changeStste(setbool, srid);
	}

	@GetMapping("record/date") // findbyName
	private List<ShoppingRecord> Between(@RequestParam(name = "date1") String dateS,
			@RequestParam(name = "date2") String dateE) {
		Date date1 = null;
		Date date2 = null;
		try {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
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
