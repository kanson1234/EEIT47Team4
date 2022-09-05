package com.ispan.springboot.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Srno")
public class Srno {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "noid")
	private Integer noid;

	@Column(name = "SrnoX")
	private String srnox;

	@Column(name = "C1id")
	private Integer c1id;

	@Column(name = "Price")
	private Integer price;

	@OneToMany(mappedBy = "srno1")
	private Set<ShoppingRecord> SR = new LinkedHashSet<ShoppingRecord>();

	public Srno(Integer noid, String srnox, Integer c1id, Integer price, Set<ShoppingRecord> sR) {
		super();
		this.noid = noid;
		this.srnox = srnox;
		this.c1id = c1id;
		this.price = price;
		SR = sR;
	}

	public Srno() {
		// TODO Auto-generated constructor stub
	}

	public Integer getNoid() {
		return noid;
	}

	public void setNoid(Integer noid) {
		this.noid = noid;
	}

	public String getSrnox() {
		return srnox;
	}

	public void setSrnox(String srnox) {
		this.srnox = srnox;
	}

	public Integer getC1id() {
		return c1id;
	}

	public void setC1id(Integer c1id) {
		this.c1id = c1id;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Set<ShoppingRecord> getSR() {
		return SR;
	}

	public void setSR(Set<ShoppingRecord> sR) {
		SR = sR;
	}

}
