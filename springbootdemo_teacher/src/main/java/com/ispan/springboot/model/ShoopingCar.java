package com.ispan.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "shoopingcar")

public class ShoopingCar {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "sc_id")
	private Integer scId;
	@Column(name = "sc_count")
	private Integer scCount;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "c1_id")
	private Customer customer;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sh_item_id")
	private StoreHouse storehouse;

	public ShoopingCar() {
		// TODO Auto-generated constructor stub
	}

	public ShoopingCar(Integer scId, Integer scCount) {
		super();
		this.scId = scId;
		this.scCount = scCount;
	}

	public Integer getScCount() {
		return scCount;
	}

	public void setScCount(Integer scCount) {
		this.scCount = scCount;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}
