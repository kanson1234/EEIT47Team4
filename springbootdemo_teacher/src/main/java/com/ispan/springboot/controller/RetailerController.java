package com.ispan.springboot.controller;

import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.springboot.model.Retailer;
import com.ispan.springboot.service.RetailerService;

@Controller
public class RetailerController {

	@Autowired
	private RetailerService rSrevice;

	@PostMapping("/Retailer/insert.controller")
	public String insertRetailer(@RequestParam("rName") String rn, @RequestParam("rAccount") String ra,
			@RequestParam("rPwd") String rpw, @RequestParam("rPhone") String rph, @RequestParam("rInfo") String rif,
			@RequestParam("rLogo") MultipartFile rlogo, @RequestParam("rPhoto") MultipartFile rphoto, Model m) {

		try {
			Retailer r = new Retailer();
			Date d = new Date();
			r.setRname(rn);
			r.setRaccount(ra);
			r.setRpwd(rpw);
			r.setRphone(rph);
			r.setRinfo(rif);
			r.setRlogo(rlogo.getBytes());
			r.setRphoto(rphoto.getBytes());

			r.setRdate(d);
			r.setRstate(true);
			rSrevice.insertRetailer(r);

			return "loginSuccess";

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			return "login";
		}

	}

}
