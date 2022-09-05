package com.ispan.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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

	public Srno() {
		// TODO Auto-generated constructor stub
	}

}
