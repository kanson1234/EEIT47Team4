package com.ispan.springboot.demol;

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

	@Column(name = "sr_state", nullable = true, columnDefinition = "boolean default true")
	private boolean srState;

	@Column(name = "sr_count")
	private Integer srCount;

	@Column(name = "c1_id")
	@Transient
	private Integer cid;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "c1_id")
	private Customer customer;

//	@ManyToOne
//	@JoinColumn(name = "sh_item_id")
	@Column(name = "sh_item_id")
	private Integer shItemId;

//	=========================================================
	public ShoppingRecord() {
		// TODO Auto-generated constructor stub
	}


	public ShoppingRecord(Integer srShoppingRecord_Id, Date srtime, boolean srState, Integer srCount, Integer cid,
			Customer customer, Integer shItemId) {
		super();
		this.srShoppingRecord_Id = srShoppingRecord_Id;
		this.srtime = srtime;
		this.srState = srState;
		this.srCount = srCount;
		this.cid = cid;
		this.customer = customer;
		this.shItemId = shItemId;
	}


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


	public Integer getCid() {
		return cid;
	}


	public void setCid(Integer cid) {
		this.cid = cid;
	}


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public Integer getShItemId() {
		return shItemId;
	}


	public void setShItemId(Integer shItemId) {
		this.shItemId = shItemId;
	}



//	=========================================================

}
