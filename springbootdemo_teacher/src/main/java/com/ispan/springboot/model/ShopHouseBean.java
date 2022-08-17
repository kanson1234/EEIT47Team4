package com.ispan.springboot.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "StoreHouse")
public class ShopHouseBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "sh_item_Id")
	private Integer id;

	@Column(name = "SH_ItemName")
	private String itemName;

	@Lob
	@Column(name = "SH_Img")
	private byte[] itemImg;

	@Column(name = "SH_Price")
	private double price;

	@Column(name = "SH_Classify")
	private String classify;

	@Column(name = "SH_State")
	private boolean status;

	@Column(name = "C2_Id")
	private Integer c2Id;

	
//	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss",timezone="Asia/Taipei")
//	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
//	@Temporal(TemporalType.TIMESTAMP)
//	@Column(name="SH_Date")
//	private Date date;

	
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "C2_Id")
//
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "StoreHouse", cascade = CascadeType.ALL)
//	private Set<EvolutionSystem> books = new LinkedHashSet<EvolutionSystem>();
//
//	@ManyToOne(fetch = FetchType.LAZY, mappedBy = "StoreHouse", cascade = CascadeType.ALL)
//	private ShopingCar shoppingCar = new ShopingCar();
//
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "StoreHouse", cascade = CascadeType.ALL)
//	private Set<Message> message = new LinkedHashSet<Message>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "shopHouseBean", cascade = CascadeType.ALL)
	private Set<Message> message = new LinkedHashSet<Message>();

	public ShopHouseBean() {
	}

	public ShopHouseBean(Integer id, String itemName, byte[] itemImg, Integer price, String classify, boolean status,
			Date date, Integer c2Id) {
		super();
		this.id = id;
		this.itemName = itemName;
		this.itemImg = itemImg;
		this.price = price;
		this.classify = classify;
		this.status = status;
//		this.date = date;
//		this.c2Id = c2Id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public byte[] getItemImg() {
		return itemImg;
	}

	public void setItemImg(byte[] itemImg) {
		this.itemImg = itemImg;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	

//	public Date getDate() {
//		return date;
//	}

//	public void setDate(Date date) {
//		this.date = date;
//	}


	public Set<Message> getMessage() {
		return message;
	}

	public void setMessage(Set<Message> message) {
		this.message = message;
	}

	public Integer getC2Id() {
		return c2Id;
	}
//
	public void setC2Id(Integer c2Id) {
		this.c2Id = c2Id;
	}

}
