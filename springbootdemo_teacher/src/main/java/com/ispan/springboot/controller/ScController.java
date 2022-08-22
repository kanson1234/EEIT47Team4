package com.ispan.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ispan.springboot.dao.ScDao;
import com.ispan.springboot.model.Customer;
import com.ispan.springboot.model.ShoopingCar;
import com.ispan.springboot.model.ShopHouseBean;
import com.ispan.springboot.model.ShoppingRecord;
import com.ispan.springboot.service.ScService;
import com.ispan.springboot.service.ShopHouseService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;
@SessionAttributes(names = { "customerLoginOk", "adminLoginOk", "retailerLoginOk" })
@RestController
public class ScController {
 @Autowired
 private ShopHouseService shService;
 
 @Autowired
 private ScService scService;
 @Autowired
 private ScDao scDao;

 @GetMapping("ShoppingCar/findAll")
 private List<ShoopingCar> findAllByScId(@RequestParam(name = "cid") Integer cid) {
  return scService.findAllByScId(cid);
 }

 @GetMapping("ShoppingCar/change")
 private List<ShoopingCar> change(@RequestParam(name = "cid") Integer cid, @RequestParam(name = "itid") Integer itid,
   @RequestParam(name = "num") Integer num) {
  scDao.change(cid, itid, num);
  return scService.findAllByScId(cid);
 }

 @GetMapping("ShoppingCar/remove")
 private Boolean remove(@RequestParam(name = "scid") Integer scid) {
  try {
   scDao.deleteByScId(scid);
   return true;
  } catch (Exception e) {
   return false;
  }
 }

 @GetMapping("ShoppingCar/add")
 public List<ShoopingCar> addToCar(@RequestParam(name = "num") Integer num ,Model model) {
  
  Customer customerSession = (Customer) model.getAttribute("customerLoginOk");
//  Integer cid= customerSession.getcId();
  Integer cid= 2000002;
  
  
  
  System.out.println(cid);
  
  
  
  shService.findItemById(cid);
  
  
  
  Integer itid = 10;

  Customer customer = new Customer();
  customer.setcId(cid);
  ShopHouseBean shophousebean = new ShopHouseBean();
  shophousebean.setId(itid);

  ShoopingCar newSC = new ShoopingCar();
  newSC.setCustomer(customer);
  newSC.setShophousebean(shophousebean);
  newSC.setScCount(num);

  ShoopingCar success = scDao.save(newSC);

  return scService.findAllByScId(cid);
 }

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