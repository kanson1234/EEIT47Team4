package com.ispan.springboot.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.service.MessageService;
import com.ispan.springboot.service.RetailerService;
import com.ispan.springboot.service.ShopHouseService;

@Controller
public class ShopHouseController {

	@Autowired
	private ShopHouseService sService;

	@Autowired
	private MessageService mService;

	@Autowired
	private RetailerService rService;

	// 抓資料庫圖片
	@GetMapping("/downloadImg/{id}")
	public ResponseEntity<byte[]> downloadImg(@PathVariable Integer id) {
		ShopHouseBean item = sService.findItemById(id);

		byte[] itemImg = item.getItemImg();

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(itemImg, header, HttpStatus.OK);
	}

	// 抓C2_ID
	@GetMapping("shopHouse/add")
	public String getC2Id(HttpSession session, Model model) {
		Integer c2Id = ((Retailer) session.getAttribute("retailerLoginOk")).getRid();

		model.addAttribute("c2Id", c2Id);
//        System.out.println("c2Id:"+c2Id);
		return "shopHouseTest";
	}

	// 新增商品
	@PostMapping("/shopHouse/addItem")
	public String addItem(@RequestParam("itemName") String itemName,
			@RequestParam("file") MultipartFile itemImg, @RequestParam("itemPrice") double Price,
			@RequestParam("classify") String classify, @RequestParam(name="State") boolean status,
			@RequestParam("c2Id") Integer c2Id,HttpSession session) {
		  
		
//			Integer c2Id = ((Retailer)session.getAttribute("retailerLoginOk")).getRid();
            try {
			ShopHouseBean newShopHouse = new ShopHouseBean();
			newShopHouse.setItemName(itemName);
			newShopHouse.setItemImg(itemImg.getBytes());
			newShopHouse.setPrice(Price);
			newShopHouse.setClassify(classify);
			newShopHouse.setStatus(status);
			newShopHouse.setC2Id(c2Id);

			sService.addItem(newShopHouse);
//   model.addAttribute("Msg", "新增成功");

//   List<ShopHouseBean> all = sService.findAllItem();
//   model.addAttribute("AllItem", all);
//   return "shopHouseItems";
			return "redirect:/ShopHouse/viewC2IdItems";
		} catch (IOException e) {
			e.printStackTrace();
			return "index";
		}
	}

	// 刪除
	@GetMapping("/ShopHouse/deleteById/{id}")
	public String deleteItemById(@PathVariable Integer id) {
		sService.deleteByItemId(id);
		return "redirect:/ShopHouse/viewC2IdBlockedItems";
	}

	// 抓商品ID
	@GetMapping("/ShopHouse/editItemId/{id}")
	public String updateItemPage(@PathVariable Integer id, Model model) {
		ShopHouseBean item = sService.findItemById(id);

		model.addAttribute("shopHouseItem", item);
		return "updateItem";
	}

//  抓商品ID跳商品頁面
// @GetMapping("/ShopHouse/itemDetail/{id}")
// public String ItemDetail(@PathVariable Integer id, Model model) {
//  ShopHouseBean item = sService.findItemById(id);
//
//  model.addAttribute("shopHouseItem", item);
//  return "ItemDetail";
// }

	// 單一商品頁面
	@GetMapping("/ShopHouse/itemDetail/{id}")
	public String ItemDetail(@PathVariable Integer id, Model model) {
		ShopHouseBean item = sService.findItemById(id);
		List<ShopHouseBean> category = sService.findByClassify(item.getClassify());
//  System.out.println("category.size()"+category.size());
//  for (int i=0;i<category.size();i++) {
//   System.out.println(category.get(i).getId());
//   System.out.println(category.get(i).getItemName());
//  }

		model.addAttribute("category", category);
		model.addAttribute("shopHouseItem", item);
		return "ItemDetail2";
	}

	// itemDetail你可能會喜歡
	@GetMapping("/ShopHouse/mayLike/{id}")
	public String MayLike(@RequestParam(name = "classify", defaultValue = "") String classify, Model model) {
		List<ShopHouseBean> category = sService.findByClassify(classify);
		model.addAttribute("category", category);
		return "ItemDetail2";
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
//            System.out.println("111");
			sService.addItem(newShopHouse);

			List<ShopHouseBean> all = sService.findAllItem();
			model.addAttribute("AllItem", all);
			return "redirect:/ShopHouse/viewC2IdItems";
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/ShopHouse/viewC2IdItems";
	}

//  後台分頁顯示商品
	@GetMapping("/ShopHouse/viewItems")
	public String viewItemsPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {

//        rService.findById(pageNumber)

		Page<ShopHouseBean> page = sService.findByPage(pageNumber);
		model.addAttribute("page", page);
		return "shopHouseItems";
	}

    //後臺抓c2Id所有商品
	@GetMapping("/ShopHouse/viewC2IdItems")
	public String viewItemsByC2Id(HttpSession session, Model model) {
		Integer c2Id = ((Retailer) session.getAttribute("retailerLoginOk")).getRid();
		List<ShopHouseBean> c2IdItems = sService.findByC2Id(c2Id);
        
		model.addAttribute("c2IdItems", c2IdItems);
		return "shopHouseC2IdItems";
	}
	
	//c2Id後台下架商品列表
	@GetMapping("/ShopHouse/viewC2IdBlockedItems")
	public String viewItemsByC2IdBlocked(HttpSession session, Model model) {
		Integer c2Id = ((Retailer) session.getAttribute("retailerLoginOk")).getRid();
		List<ShopHouseBean> c2IdItems = sService.findByC2IdBlocked(c2Id);
        
		model.addAttribute("c2IdItems", c2IdItems);
		return "shopHouseC2IdBlockedItems";
	}
	


	// 前台分頁顯示商品
	@GetMapping("/ShopHouse/FrontPageShopHouseItems")
	public String frontPageViewItemsPage(@RequestParam(name = "p", defaultValue = "1") Integer pagesNumber,
			Model model) {
		Page<ShopHouseBean> page = sService.frontPageFindByPage(pagesNumber);
		model.addAttribute("pages", page);
		return "FrontPageShopHouseItems";
//	@GetMapping("/ShopHouse/FrontPageShopHouseItems")
//	public String frontPageViewItemsPage(Model model) {
//		List<ShopHouseBean> allItems = sService.findAllItem();
//		model.addAttribute("allItems", allItems);
//		
//		return "FrontPageShopHouseItems";
	
	}

	// 首頁顯示商品
	@GetMapping("/ShopHouse/indexShopHouseItems")
	public String indexViewNewItems(Model model) {
		List<ShopHouseBean> allNewItems = sService.findAllItem();
		model.addAttribute("allNewItems", allNewItems);
		return "index";
	}
	

	// 模糊查詢
	@GetMapping("/ShopHouse/findByKeyword")
	public String findByKeyword(@RequestParam(name = "word", defaultValue = "") String word, Model model, HttpSession session) {
		List<ShopHouseBean> keyword = sService.findByKeyword(word);		
		model.addAttribute("keyword", keyword);
		session.setAttribute("word", word);
		return "FuzzySearchByWord";
	}
	
	//模糊搜尋價格排序由大至小
	@GetMapping("/ShopHouse/findByKeywordOrderByPrice")
	public String findByKeywordOrderByPrice(@RequestParam(name = "word", defaultValue = "") String word, Model model) {
//		String word = session.getAttribute(word).toString();
		List<ShopHouseBean> lowerkeyword = sService.findByKeywordOrderByPrice(word);
		model.addAttribute("higherPrice", lowerkeyword);
		return "FuzzySearchByWord";
	}
	
	//模糊搜尋價格排序由大至小
	@GetMapping("/ShopHouse/findByKeywordOrderByPriceASC")
	public String findByKeywordOrderByPriceASC(@RequestParam(name = "word", defaultValue = "") String word, Model model) {
//		String word = session.getAttribute(word).toString();
		List<ShopHouseBean> lowerkeyword = sService.findByKeywordOrderByPriceASC(word);
		model.addAttribute("lowerPrice", lowerkeyword);
		return "FuzzySearchByWord";
	}
	

	// 種類搜尋
	@GetMapping("/ShopHouse/findByClassify")
	public String findByClassify(@RequestParam(name = "classify", defaultValue = "") String classify, Model model) {
		List<ShopHouseBean> category = sService.findByClassify(classify);
		model.addAttribute("category", category);
		return "FrontPageShopHouseItems";
	}

	// 商品種類頁籤
	@GetMapping("ShopHouse/findByClassifyLabel")
	public String findByClassifyLabel(@RequestParam(name = "classify", defaultValue = "") String classify,
			Model model) {
		List<ShopHouseBean> category = sService.findByClassify(classify);
		model.addAttribute("category", category);
		return "ShopHouseFindByClassifyItems";
	}

// //商品店家頁籤
// @GetMapping("ShopHouse/findByRetailerLabel")
// public String findByRetailerLabel(@RequestParam(name = "c2Id", defaultValue = "") String classify,
//   Model model) {
//  List<ShopHouseBean> category = sService.findByClassify(classify);
//  model.addAttribute("category", category);
//  return "ShopHouseFindByRetailerLabel";
// }

	// 搜尋帳篷
	@GetMapping("/ShopHouse/findByTent")
	public String findByTent(Model model) {
		List<ShopHouseBean> category = sService.findByClassify("帳篷");

		model.addAttribute("tent", category);
		return "shopHouseTent";
	}

	// 搜尋照明設備
	@GetMapping("/ShopHouse/findByLight")
	public String findByLight(Model model) {
		List<ShopHouseBean> category = sService.findByClassify("燈具");

		model.addAttribute("tent", category);
		return "shopHouseLight";
	}

	// 搜尋背包
	@GetMapping("/ShopHouse/findByBackpack")
	public String findByBackpack(Model model) {
		List<ShopHouseBean> category = sService.findByClassify("背包");
		model.addAttribute("tent", category);
		return "shopHouseBackpack";
	}

	// 搜尋服飾
	@GetMapping("/ShopHouse/findByClothes")
	public String findByClothes(Model model) {
		List<ShopHouseBean> category = sService.findByClassify("服飾");

		model.addAttribute("tent", category);
		return "shopHouseClothes";
	}

	// 種類價格排序由小至大
	@GetMapping("/ShopHouse/classifyLowerPrice")
	public String sortByClassifyPriceAsc(@RequestParam("classify") String classify, Model model) {
		List<ShopHouseBean> classifylowerPrice = sService.sortByClassifyPriceAsc(classify);

		model.addAttribute("classifylowerPrice", classifylowerPrice);
		return "shopHouseClothes";
	}

	// 種類價格排序由大至小

	@GetMapping("/ShopHouse/classifyHigherPrice")
	public String sortByClassifyPriceDesc(@RequestParam("classify") String classify, Model model) {
		List<ShopHouseBean> classifyHigherPrice = sService.sortByClassifyPriceDesc(classify);


		model.addAttribute("classifyHigherPrice", classifyHigherPrice);
		return "shopHouseClothes";
	}



	// 帳篷價格排序由小至大
	@GetMapping("/ShopHouse/classifyLowerPriceTent")
	public String tentSortByClassifyPriceAsc(@RequestParam("classify") String classify, Model model) {
		List<ShopHouseBean> classifylowerPrice = sService.sortByClassifyPriceAsc(classify);

		model.addAttribute("classifylowerPrice", classifylowerPrice);
		return "shopHouseTent";
	}

	// 帳篷價格排序由大至小
	@GetMapping("/ShopHouse/classifyHigherPriceTent")
	public String tentSortByClassifyPriceDesc(@RequestParam("classify") String classify, Model model) {
		List<ShopHouseBean> classifyHigherPrice = sService.sortByClassifyPriceDesc(classify);

		model.addAttribute("classifyHigherPrice", classifyHigherPrice);
		return "shopHouseTent";
	}

	// 背包價格排序由小至大
	@GetMapping("/ShopHouse/classifyLowerPriceBackpack")
	public String backPackSortByClassifyPriceAsc(@RequestParam("classify") String classify, Model model) {
		List<ShopHouseBean> classifylowerPrice = sService.sortByClassifyPriceAsc(classify);

		model.addAttribute("classifylowerPrice", classifylowerPrice);
		return "shopHouseBackpack";
	}

	// 背包價格排序由大至小
	@GetMapping("/ShopHouse/classifyHigherPriceBackpack")
	public String backPackSortByClassifyPriceDesc(@RequestParam("classify") String classify, Model model) {
		List<ShopHouseBean> classifyHigherPrice = sService.sortByClassifyPriceDesc(classify);

		model.addAttribute("classifyHigherPrice", classifyHigherPrice);
		return "shopHouseBackpack";
	}
	
	// 燈價格排序由小至大
	@GetMapping("/ShopHouse/classifyLowerPriceLight")
	public String lightSortByClassifyPriceAsc(@RequestParam("classify") String classify, Model model) {
		List<ShopHouseBean> classifylowerPrice = sService.sortByClassifyPriceAsc(classify);

		model.addAttribute("classifylowerPrice", classifylowerPrice);
		return "shopHouseLight";
	}

	// 燈價格排序由大至小
	@GetMapping("/ShopHouse/classifyHigherPriceLight")
	public String lightSortByClassifyPriceDesc(@RequestParam("classify") String classify, Model model) {
		List<ShopHouseBean> classifyHigherPrice = sService.sortByClassifyPriceDesc(classify);

		model.addAttribute("classifyHigherPrice", classifyHigherPrice);
		return "shopHouseLight";
	}

	// 價格排序由大至小
	@GetMapping("/ShopHouse/highPrice")
	public String orderByHigherPrice(Model model) {
		List<ShopHouseBean> higherPrice = sService.getByOrderByPriceDesc();

		model.addAttribute("higherPrice", higherPrice);
		return "FrontPageShopHouseItems";
	}

	// 價格排序由小至大
	@GetMapping("/ShopHouse/lowerPrice")
	public String orderByLowerPrice(Model model) {
		List<ShopHouseBean> lowerPrice = sService.getByOrderByPriceAsc();

		model.addAttribute("lowerPrice", lowerPrice);
		return "FrontPageShopHouseItems";
	}
	
	//改變狀態為o
	@GetMapping("/ShopHouse/changeStatusF/{id}")
	public String ChangeStatusById(@PathVariable Integer id) {
		sService.ChangeStatusById(false, id);
		return "redirect:/ShopHouse/viewC2IdItems";
	}
	
	//改變狀態為1
	@GetMapping("/ShopHouse/changeStatusT/{id}")
	public String ChangeStatusToTrueById(@PathVariable Integer id) {
		sService.ChangeStatusById(true, id);
		return "redirect:/ShopHouse/viewC2IdItems";
	}

}