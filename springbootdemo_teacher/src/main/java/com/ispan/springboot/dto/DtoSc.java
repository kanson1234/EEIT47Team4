package com.ispan.springboot.dto;

public class DtoSc {

	private Integer scid;
	private Integer price;
	private Integer sccount;
	private Integer scTotalPrice;
	private String itname;

	public String getItname() {
		return itname;
	}

	public void setItname(String itname) {
		this.itname = itname;
	}

	public DtoSc(Integer scid, Integer price, Integer sccount, Integer scTotalPrice, String itname) {
		super();
		this.scid = scid;
		this.price = price;
		this.sccount = sccount;
		this.scTotalPrice = scTotalPrice;
		this.itname = itname;
	}

	public DtoSc() {
		super();
	}

	public DtoSc(Integer scid, Integer price, Integer sccount, Integer scTotalPrice) {
		super();
		this.scid = scid;
		this.price = price;
		this.sccount = sccount;
		this.scTotalPrice = scTotalPrice;
	}

	public Integer getScid() {
		return scid;
	}

	public void setScid(Integer scid) {
		this.scid = scid;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = Math.round(price);
	}

	public Integer getSccount() {
		return sccount;
	}

	public void setSccount(Integer sccount) {
		this.sccount = sccount;
	}

	public Integer getScTotalPrice() {
		return scTotalPrice;
	}

	public void setScTotalPrice(Integer scTotalPrice) {
		this.scTotalPrice = scTotalPrice;
	}

}
