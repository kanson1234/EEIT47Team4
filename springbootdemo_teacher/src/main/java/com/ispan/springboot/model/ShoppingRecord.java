package com.ispan.springboot.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "shoppingrecord")
public class ShoppingRecord {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "sr_shoppingrecord_id")
	private Integer srShoppingRecord_Id;

	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "Asia/Taipei") // JSON
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") // SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "sr_time")
	private Date srtime;

	@PrePersist
	public void onCreate() {
		if (srtime == null) {
			srtime = new Date();
		}
	}

	@Column(name = "sr_state")
	private Boolean srState;

	@Column(name = "sr_count")
	private Integer srCount;

	@Column(name = "sr_discount")
	private Integer srDiscount;

	@Column(name = "sr_totalprice")
	private Integer srTotalPrice;

	@Column(name = "C1_Id")
	@Transient
	private Integer cid;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "c1_id")
	private Customer customer;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sh_item_id")
	private ShopHouseBean shophousebean;
//	=========================================================

	public ShoppingRecord(Integer srShoppingRecord_Id, Date srtime, Boolean srState, Integer srCount,
			Integer srDiscount, Integer srTotalPrice, Integer cid, Customer customer, ShopHouseBean shophousebean) {
		super();
		this.srShoppingRecord_Id = srShoppingRecord_Id;
		this.srtime = srtime;
		this.srState = srState;
		this.srCount = srCount;
		this.srDiscount = srDiscount;
		this.srTotalPrice = srTotalPrice;
		this.cid = cid;
		this.customer = customer;
		this.shophousebean = shophousebean;
	}

	public ShoppingRecord() {
		super();
	}

//	=========================================================

	public Integer getSrShoppingRecord_Id() {
		return srShoppingRecord_Id;
	}

	public void setSrShoppingRecord_Id(Integer srShoppingRecord_Id) {
		this.srShoppingRecord_Id = srShoppingRecord_Id;
	}

	public Date getSrtime() {

		return srtime;
	}

	public void setSrtime(Date srtime) {
		this.srtime = srtime;
	}

	public Boolean getSrState() {
		return srState;
	}

	public void setSrState(Boolean srState) {
		this.srState = srState;
	}

	public Integer getSrDiscount() {
		return srDiscount;
	}

	public void setSrDiscount(Integer srDiscount) {
		this.srDiscount = srDiscount;
	}

	public Integer getSrTotalPrice() {
		return srTotalPrice;
	}

	public void setSrTotalPrice(Integer srTotalPrice) {
		this.srTotalPrice = srTotalPrice;
	}

	public Integer getSrCount() {
		return srCount;
	}

	public void setSrCount(Integer srCount) {
		this.srCount = srCount;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public ShopHouseBean getShophousebean() {
		return shophousebean;
	}

	public void setShophousebean(ShopHouseBean shophousebean) {
		this.shophousebean = shophousebean;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

}
