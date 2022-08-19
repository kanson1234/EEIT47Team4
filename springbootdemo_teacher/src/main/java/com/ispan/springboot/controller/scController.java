package com.ispan.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.springboot.model.ShoopingCar;
import com.ispan.springboot.service.ScService;

@RestController
public class scController {
	@Autowired
	private ScService scService;
	
	@GetMapping("ShoppingCar/findAll")
	private List<ShoopingCar> findAllByScId(@RequestParam(name = "cid") Integer cid){
		List<ShoopingCar> findAllByScId = scService.findAllByScId(cid);
		
		return findAllByScId;
	
	
	}
}
