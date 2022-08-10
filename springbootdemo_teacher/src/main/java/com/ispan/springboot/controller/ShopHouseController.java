package com.ispan.springboot.controller;

import java.io.IOException;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.service.ShopHouseService;

@Controller
public class ShopHouseController {

	@Autowired
	private ShopHouseService sService;
	
	//顯示全部商品
		@GetMapping("/shopHouse/Allitem")
		public String findAllItem(Model model) {
			List<ShopHouseBean> all = sService.findAllItem();
			model.addAttribute("AllItem", all);
			return "shopHouseItems";
		}
		
	//抓資料庫圖片
		@GetMapping("/downloadImg/{id}")
		public ResponseEntity<byte[]> downloadImg(@PathVariable Integer id){
			ShopHouseBean item = sService.findItemById(id);
			
			byte[] itemImg = item.getItemImg();
			
			HttpHeaders header = new HttpHeaders();
			header.setContentType(MediaType.IMAGE_JPEG);
			
			return new ResponseEntity<byte[]>(itemImg,header,HttpStatus.OK);
		}

	// 新增商品
	@PostMapping("/shopHouse/addItem")
	public String addItem(@RequestParam("itemName") String itemName, @RequestParam("file") MultipartFile itemImg,
			@RequestParam("itemPrice") double Price, @RequestParam("classify") String classify,
			@RequestParam("State") boolean status, @RequestParam("c2Id") Integer c2Id,Model model) {
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

			List<ShopHouseBean> all = sService.findAllItem();
			model.addAttribute("AllItem", all);
			return "shopHouseItems";
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
//			sService.addItem(newShopHouse);
//			
//			return newShopHouse;
//	}

//	// 用id找商品
//	@GetMapping("/ShopHouse/findItemById/{id}")
//	public String findItemById(@PathVariable Integer id) {
//		sService.findItemById(id);
//
//		return "findItemById";
//	}

	// 刪除
	@GetMapping("/ShopHouse/deleteById/{id}")
	public String deleteItemById(@PathVariable Integer id,Model model) {
		sService.deleteItem(id);
		
		List<ShopHouseBean> all = sService.findAllItem();
		model.addAttribute("AllItem", all);
		return "shopHouseItems";
	}

	// 抓ID
	@GetMapping("/ShopHouse/editItemId/{id}")
	public String updateItemPage(@PathVariable Integer id, Model model) {
		ShopHouseBean item = sService.findItemById(id);

		model.addAttribute("shopHouseItem", item);
		return "updateItem";
	}

    //修改商品
    @PostMapping("/ShopHouse/editItem")
    public String updateItemPost(@RequestParam("itemName") String itemName, @RequestParam("file") MultipartFile itemImg,
			@RequestParam("itemPrice") double Price, @RequestParam("classify") String classify,
			@RequestParam("State") boolean status, @RequestParam("c2Id") Integer c2Id,Model model) {
    	
    	
		List<ShopHouseBean> all = sService.findAllItem();
		model.addAttribute("AllItem", all);
		return "shopHouseItems";
    }

}
