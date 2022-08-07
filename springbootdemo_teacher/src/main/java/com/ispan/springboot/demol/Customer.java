package com.ispan.springboot.demol;



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
	@Column(name = "c1_id",nullable = false)
	private int C1_Id;

	@Column(name = "c1_lastname")
	private String C1_LastName;

	@Column(name = "c1_status")
	private boolean C1_Status;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer", cascade = CascadeType.ALL)
	private Set<ShoppingRecord> SR =new LinkedHashSet<>();

//==================================================================================
	public Customer() {

	}

	public Customer(int c1_Id, String c1_LastName, boolean c1_Status) {
		super();
		C1_Id = c1_Id;
		C1_LastName = c1_LastName;
		C1_Status = c1_Status;
	}


//==================================================================================

	public int getC1_Id() {
		return C1_Id;
	}

	public void setC1_Id(int c1_Id) {
		C1_Id = c1_Id;
	}

	public String getC1_LastName() {
		return C1_LastName;
	}

	public void setC1_LastName(String c1_LastName) {
		C1_LastName = c1_LastName;
	}

	public boolean isC1_Status() {
		return C1_Status;
	}

	public void setC1_Status(boolean c1_Status) {
		C1_Status = c1_Status;
	}
	
}
