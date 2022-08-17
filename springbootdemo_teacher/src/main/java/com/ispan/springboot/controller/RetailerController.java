package com.ispan.springboot.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.springboot.dao.ShopHouseDao;
import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.service.RetailerService;

@Controller
public class RetailerController {
	@Autowired
	private RetailerService rService;

	@Autowired
	private ShopHouseDao sDao;


	// 取得id回傳RetailerBen給Ajax的url
//	@GetMapping(value = "/retailerGetAllItem/{id}", produces = { "application/json; charset=UTF-8" })
//	public @ResponseBody Retailer getAllItems(@PathVariable Integer id) {
//		Retailer rId = rService.findById(id);
//		Set<ShopHouseBean> shopHouseBean = rId.getShopHouseBean();
//		System.out.println("RetailerController:"+rId);
//		return rId;
//	}
	// 取得id後addAttribute給前端
	@GetMapping(value = "/retailerGetAllItem", produces = { "application/json; charset=UTF-8" })
	public String getAllItems(@RequestParam("id") Integer id,Model model,Model m2) {
		List<ShopHouseBean> t = sDao.findByC2Id(id);
		Retailer rInfo = rService.findById(id);
		model.addAttribute("listItem",t);
		m2.addAttribute("RetailerInfo",rInfo);
		return "RetailerShopPage";
	}
	// 後臺搜尋店家
	@GetMapping("Retailer/RetailerCRUD")
	public String showAllRetailer(Model model) {
		List<Retailer> list = rService.getAllRetailer();
		model.addAttribute("listRetailer", list);
		return "RetailerCRUD";
	}

	// 商家一覽頁面跳轉
	@GetMapping("/showAllRetailerFront")
	public String showAllRetailerFront(Model model) {
		List<Retailer> list = rService.getAllRetailer();
		model.addAttribute("listRetailer", list);
		return "ViewRetailer";
	}

	@GetMapping("/Retailer/getByAccount")
	public String searchByAccount(@RequestParam("keyword") String keyword, Model model) {
		List<Retailer> list = rService.listAll(keyword);
		model.addAttribute("listRetailer", list);
		return "RetailerCRUD";
	}

	@GetMapping("/showlogo/{id}")
	public ResponseEntity<byte[]> showlogo(@PathVariable Integer id) {
		Retailer logo = rService.findById(id);

		byte[] logoImg = logo.getLogo();

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(logoImg, header, HttpStatus.OK);
	}

	@GetMapping("/showphoto/{id}")
	public ResponseEntity<byte[]> showphoto(@PathVariable Integer id) {
		Retailer photo = rService.findById(id);

		byte[] photoImg = photo.getPhoto();

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(photoImg, header, HttpStatus.OK);
	}

	@PostMapping("/Retailer/registerPage")
	public String addRetailer(@RequestParam("rName") String rN, @RequestParam("rAccount") String ra,
			@RequestParam("rPwd") String rpw, @RequestParam("rPhone") String rph,
			@RequestParam("logo") MultipartFile logo, @RequestParam("photo") MultipartFile photo,
			@RequestParam("rInfo") String rInfo) throws IOException {

		Retailer r = new Retailer();
		r.setrName(rN);
		r.setRaccount(ra);
		r.setRpwd(rpw);
		r.setRphone(rph);
		r.setRstate(true);
		r.setPhoto(photo.getBytes());
		r.setLogo(logo.getBytes());
		r.setInfo(rInfo);
		rService.insertRetailer(r);
		return "registerPage";

	}

	@GetMapping("/Retailer/editRetailer/{id}")
	public String editMessagePage(@PathVariable Integer id, Model model) {
		Retailer r = rService.findById(id);

		model.addAttribute("Retailerinfo", r);
		return "editRetailer";
	}

	@PostMapping("/Retailer/editRetailer")
	public String editMessagePage(@RequestParam Integer id, @RequestParam("rName") String rN,
			@RequestParam("rAccount") String ra, @RequestParam("rPwd") String rpw, @RequestParam("rPhone") String rph,
			@RequestParam("logo") MultipartFile logo, @RequestParam("photo") MultipartFile photo,
			@RequestParam("rInfo") String rInfo) throws IOException {
		Retailer r = new Retailer();
		r.setRid(id);
		r.setrName(rN);
		r.setRaccount(ra);
		r.setRpwd(rpw);
		r.setRphone(rph);
		r.setRstate(true);
		r.setPhoto(photo.getBytes());
		r.setLogo(logo.getBytes());
		r.setInfo(rInfo);
		rService.insertRetailer(r);
		return "editRetailer";
	}

	@GetMapping("Retailer/get/{id}")
	public Retailer getRetailerById(@PathVariable Integer id) {
		Retailer rInfo = rService.findById(id);
		return rInfo;

	}
}
