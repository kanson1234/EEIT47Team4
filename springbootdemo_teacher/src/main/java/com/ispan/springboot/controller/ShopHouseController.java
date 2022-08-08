package com.ispan.springboot.controller;

import java.io.IOException;

import javax.print.PrintException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	
	//新增商品
	@PostMapping("/shopHouse/addItem")
	public String addItem(@RequestParam("itemName")String ItemName,
						  @RequestParam("file")MultipartFile itemImg,
						  @RequestParam("itemPrice")double itemPrice,
						  @RequestParam("classfify")String classcify,
						  @RequestParam("State")boolean itemState,
						  @RequestParam("c2Id")Integer c2Id) {
		try {
		ShopHouseBean newShopHouse = new ShopHouseBean();
		    newShopHouse.setItemName(ItemName);
			newShopHouse.setItemImg(itemImg.getBytes());
			newShopHouse.setPrice(itemPrice);
			newShopHouse.setClassify(classcify);
			newShopHouse.setStatus(itemState);
			newShopHouse.setC2Id(c2Id);
			
			sService.addItem(newShopHouse);
			
			return "ShopHouse/addItem";
		} catch (IOException e) {
			e.printStackTrace();
			return "ShopHouse/addItem";
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
	
	//用id找商品
	@GetMapping("ShopHouse/findItemById")
	@ResponseBody
	public ShopHouseBean findItemById(@RequestParam Integer id) {
		return sService.findItemById(id);	  
	}
	
	//刪除
    @GetMapping("ShopHouse/deleteById/{id}")
    @ResponseBody
	public void deleteItemById(@PathVariable Integer id) {
    	sService.deleteItem(id);
    }
	
	//抓ID
	@GetMapping("ShopHouse/editItem/{id}")
	public String updateItemPage(@PathVariable Integer id,Model model) {
		ShopHouseBean item = sService.findItemById(id);
		
		model.addAttribute("shopHouseItem", item);
        return "editItem";		
	}
	
//  修改商品
	
//    public String editItemPost("ShopHouse/editItem") {
//    	
//    }
	
	
	
	
	
	
	
}
