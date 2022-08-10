package com.ispan.springboot.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class StoreHouse {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "sh_item_id",nullable = false)
	private	int SH_Item_Id	;
	
	@Column(name = "sh_itemname")
	private String	SH_ItemName	;
	
	@Column(name = "sh_img")
	private Byte[] SH_Img	;
	
	@Column(name = "sh_price")
	private Double	SH_Price	;
	
	@Column(name = "sh_classify")
	private String	SH_Classify	;
	
	@Column(name = "sh_state")
	private Boolean	SH_State	;
	
	@Column(name = "")
	private Date	SH_Date	;
	
	@Column(name = "")
	private	int	C2_Id;
	
	
	
	public StoreHouse() {
		// TODO Auto-generated constructor stub
	}

}
