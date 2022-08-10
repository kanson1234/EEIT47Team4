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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "customer")

public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "c1_id", nullable = false)
	private int cId;

	@Column(name = "c1_lastname")
	private String cLastName;

	@Column(name = "c1_status")
	private boolean cStatus;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "customer", cascade = CascadeType.ALL)
	private Set<ShoppingRecord> SR = new LinkedHashSet<>();

//==================================================================================
	public Customer() {

	}

	public Customer(int c1_Id, String c1_LastName, boolean c1_Status) {
		super();
		cId = c1_Id;
		cLastName = c1_LastName;
		cStatus = c1_Status;
	}

//==================================================================================

	public int getcId() {
		return cId;
	}

	public void setcId(int c1_Id) {
		cId = c1_Id;
	}

	public String getcLastName() {
		return cLastName;
	}

	public void setcLastName(String c1_LastName) {
		cLastName = c1_LastName;
	}

	public boolean iscStatus() {
		return cStatus;
	}

	public void setcStatus(boolean c1_Status) {
		cStatus = c1_Status;
	}

}
