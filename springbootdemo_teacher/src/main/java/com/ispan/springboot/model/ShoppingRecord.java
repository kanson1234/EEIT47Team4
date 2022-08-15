package com.ispan.springboot.model;

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
import javax.persistence.Transient;

@Entity
@Table(name = "shoppingrecord")
public class ShoppingRecord {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "sr_shoppingrecord_id")
	private Integer srShoppingRecord_Id;

	@Column(name = "sr_time")
	private Date srtime;

	@PrePersist
	public void onCreate() {
		if (srtime == null) {
			srtime = new Date();
		}
	}

	@Column(name = "sr_state", nullable = false, columnDefinition = "boolean default true")
	private boolean srState;

	@Column(name = "sr_count")
	private Integer srCount;

//	@Column(name = "C1_Id")
//	@Transient
//	private Integer cid;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "c1_id")
	private Customer customer;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sh_item_id")
	private StoreHouse storehouse;
//	=========================================================

	public ShoppingRecord(Integer srShoppingRecord_Id, Date srtime, boolean srState, Integer srCount, Customer customer,
			StoreHouse storehouse) {
		super();
		this.srShoppingRecord_Id = srShoppingRecord_Id;
		this.srtime = srtime;
		this.srState = srState;
		this.srCount = srCount;
		this.customer = customer;
		this.storehouse = storehouse;
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

	public boolean isSrState() {
		return srState;
	}

	public void setSrState(boolean srState) {
		this.srState = srState;
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

	public StoreHouse getStorehouse() {
		return storehouse;
	}

	public void setStorehouse(StoreHouse storehouse) {
		this.storehouse = storehouse;
	}
}
