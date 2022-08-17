
package com.ispan.springboot.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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

import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.service.MessageService;
import com.ispan.springboot.service.ShopHouseService;

@Controller
public class ShopHouseController {
	
	@Autowired
	private ShopHouseService sService;

	// 顯示全部商品
//	@GetMapping("/shopHouse/Allitem")
//	public String findAllItem(Model model) {
//		List<ShopHouseBean> all = sService.findAllItem();
//		model.addAttribute("AllItem", all);
//		return "shopHouseItems";
//	}

	// 抓資料庫圖片
	@GetMapping("/downloadImg/{id}")
	public ResponseEntity<byte[]> downloadImg(@PathVariable Integer id) {
		ShopHouseBean item = sService.findItemById(id);

		byte[] itemImg = item.getItemImg();

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(itemImg, header, HttpStatus.OK);
	}

	// 新增商品
	@PostMapping("/shopHouse/addItem")
	public String addItem(@RequestParam("itemName") String itemName, @RequestParam("file") MultipartFile itemImg,
			@RequestParam("itemPrice") double Price, @RequestParam("classify") String classify,
			@RequestParam("State") boolean status, @RequestParam("c2Id") Integer c2Id, Model model) {
		try {
			ShopHouseBean newShopHouse = new ShopHouseBean();
			newShopHouse.setItemName(itemName);
			newShopHouse.setItemImg(itemImg.getBytes());
			newShopHouse.setPrice(Price);
			newShopHouse.setClassify(classify);
			newShopHouse.setStatus(status);
			newShopHouse.setC2Id(c2Id);

			sService.addItem(newShopHouse);
//			model.addAttribute("Msg", "新增成功");

//			List<ShopHouseBean> all = sService.findAllItem();
//			model.addAttribute("AllItem", all);
//			return "shopHouseItems";
			return "redirect:/ShopHouse/viewItems";
		} catch (IOException e) {
			e.printStackTrace();
			return "index";
		}
	}

// 測試新增一筆資料	
//	@PostMapping("ShopHouse/addItem11")
//	@ResponseBody
//	public ShopHouseBean addItem1() {
//		ShopHouseBean newShopHouse = new ShopHouseBean();
//		    newShopHouse.setItemName("好帳篷");
//			newShopHouse.setPrice(200);
//			newShopHouse.setClassify("帳篷");
//			newShopHouse.setStatus(true);
//			newShopHouse.setC2Id(1000003);

//
//	// 用id找商品
//	@GetMapping("findItemById/{id}")

//	public String findItemById(@PathVariable Integer id) {
//		sService.findItemById(id);
//
//		return "findItemById";
//	}

	// 刪除
	@GetMapping("/ShopHouse/deleteById/{id}")
	public String deleteItemById(@PathVariable Integer id, Model model) {
		sService.deleteItem(id);

		List<ShopHouseBean> all = sService.findAllItem();
		model.addAttribute("AllItem", all);
		return "redirect:/ShopHouse/viewItems";
	}

	// 抓ID
	@GetMapping("/ShopHouse/editItemId/{id}")
	public String updateItemPage(@PathVariable Integer id, Model model) {
		ShopHouseBean item = sService.findItemById(id);

		model.addAttribute("shopHouseItem", item);
		return "updateItem";
	}

	// 抓商品ID跳商品頁面
	@GetMapping("/ShopHouse/itemDetail/{id}")
	public String ItemDetail(@PathVariable Integer id, Model model) {
		ShopHouseBean item = sService.findItemById(id);
//		                     sService.findAllMessage(

		model.addAttribute("shopHouseItem", item);
		return "ItemDetail";
	}

	// 修改商品
	@PostMapping("/ShopHouse/editItem")
	public String updateItemPost(@RequestParam("itemName") String itemName, @RequestParam("file") MultipartFile itemImg,
			@RequestParam("itemPrice") double Price, @RequestParam("classify") String classify,
			@RequestParam("state") boolean status, @RequestParam("c2Id") Integer c2Id, @RequestParam("id") Integer id,
			Model model) {
		try {
			ShopHouseBean newShopHouse = new ShopHouseBean();

			newShopHouse.setId(id);
			newShopHouse.setItemName(itemName);
			newShopHouse.setItemImg(itemImg.getBytes());
			newShopHouse.setPrice(Price);
			newShopHouse.setClassify(classify);
			newShopHouse.setStatus(status);
			newShopHouse.setC2Id(c2Id);
//			System.out.println("111");
			sService.addItem(newShopHouse);

			List<ShopHouseBean> all = sService.findAllItem();
			model.addAttribute("AllItem", all);
			return "redirect:/ShopHouse/viewItems";
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "updateItem";
	}

	// 分頁顯示商品
	@GetMapping("/ShopHouse/viewItems")
	public String viewMessagesPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Page<ShopHouseBean> page = sService.findByPage(pageNumber);
		model.addAttribute("page", page);
		return "shopHouseItems";
	}

	// 模糊查詢
	@GetMapping("/ShopHouse/findByKeyword")
	public String findByKeyword(@RequestParam(name = "word", defaultValue = "") String word, Model model) {
		List<ShopHouseBean> keyword = sService.findByKeyword(word);
//		System.out.println("size: " + keyword.size());
//		System.out.println("itemName: " + keyword.get(0).getItemName());
		model.addAttribute("keyword", keyword);
		return "shopHouseItems";
	}

	// 種類搜尋
	@GetMapping("/ShopHouse/findByClassify")
	public String findByClassify(@RequestParam(name = "classify", defaultValue = "") String classify, Model model) {
		List<ShopHouseBean> category = sService.findByClassify(classify);
		model.addAttribute("category", category);
		return "shopHouseItems";
	}
	
	// 搜尋帳篷
	@GetMapping("/ShopHouse/findByTent")
	public String findByTent(Model model) {
	List<ShopHouseBean> category = sService.findByClassify("帳篷");
	model.addAttribute("tent", category);
	return "shopHouseTent";
	}
	
	//搜尋照明設備
	@GetMapping("/ShopHouse/findByLight")
	public String findByLight(Model model) {
	List<ShopHouseBean> category = sService.findByClassify("燈具");
	model.addAttribute("tent", category);
	return "shopHouseLight";
	}
	
	//搜尋背包
	@GetMapping("/ShopHouse/findByBackpack")
	public String findByBackpack(Model model) {
	List<ShopHouseBean> category = sService.findByClassify("背包");
	model.addAttribute("tent", category);
	return "shopHouseBackpack";
	}
	
//	//單品項看所有留言
//	@GetMapping("/Shop/")
//	public String findAllMessageByItem() {
//		return "ItemDetail";
//	}

//	@GetMapping("/ShopHouse/memberSession")
//	public String MemberSession(HttpSession session) {
//		Customer cus = new Customer();
//		session.setAttribute("cus", cus);
//		
//		return"/";
//	}

}
