//package com.ispan.springboot.model;
//
//import java.util.Date;
//import java.util.LinkedHashSet;
//import java.util.Set;
//
//import javax.persistence.CascadeType;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.OneToMany;
//import javax.persistence.Table;
//@Entity
//@Table(name = "storehouse")
//public class StoreHouse {
//
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "sh_item_id", nullable = false)
//	private int shItemId;
//
//	@Column(name = "sh_itemname")
//	private String shItemName;
//
//	@Column(name = "sh_img")
//	private Byte[] shImg;
//
//	@Column(name = "sh_price")
//	private Double shPrice;
//
//	@Column(name = "sh_classify")
//	private String shClassify;
//
//	@Column(name = "sh_state")
//	private Boolean shState;
//
//	@Column(name = "sh_date")
//	private Date shDate;
//
//	@Column(name = "c2_id")
//	private int c2Id;
//
//	@OneToMany(fetch = FetchType.EAGER, mappedBy = "storehouse", cascade = CascadeType.ALL)
//	private Set<ShoppingRecord> SR = new LinkedHashSet<>();
//
//	// ==================================================================================
//
//	public StoreHouse() {
//		// TODO Auto-generated constructor stub
//	}
//
//	public StoreHouse(int shItemId, String shItemName, Byte[] shImg, Double shPrice, String shClassify, Boolean shState,
//			Date shDate, int c2Id, Set<ShoppingRecord> sR) {
//		super();
//		this.shItemId = shItemId;
//		this.shItemName = shItemName;
//		this.shImg = shImg;
//		this.shPrice = shPrice;
//		this.shClassify = shClassify;
//		this.shState = shState;
//		this.shDate = shDate;
//		this.c2Id = c2Id;
//		SR = sR;
//	}
//	// ==================================================================================
//
//	public int getShItemId() {
//		return shItemId;
//	}
//
//	public void setShItemId(int shItemId) {
//		this.shItemId = shItemId;
//	}
//
//	public String getShItemName() {
//		return shItemName;
//	}
//
//	public void setShItemName(String shItemName) {
//		this.shItemName = shItemName;
//	}
//
//	public Byte[] getShImg() {
//		return shImg;
//	}
//
//	public void setShImg(Byte[] shImg) {
//		this.shImg = shImg;
//	}
//
//	public Double getShPrice() {
//		return shPrice;
//	}
//
//	public void setShPrice(Double shPrice) {
//		this.shPrice = shPrice;
//	}
//
//	public String getShClassify() {
//		return shClassify;
//	}
//
//	public void setShClassify(String shClassify) {
//		this.shClassify = shClassify;
//	}
//
//	public Boolean getShState() {
//		return shState;
//	}
//
//	public void setShState(Boolean shState) {
//		this.shState = shState;
//	}
//
//	public Date getShDate() {
//		return shDate;
//	}
//
//	public void setShDate(Date shDate) {
//		this.shDate = shDate;
//	}
//
//	public int getC2Id() {
//		return c2Id;
//	}
//
//	public void setC2Id(int c2Id) {
//		this.c2Id = c2Id;
//	}
//
//	
//
//}
