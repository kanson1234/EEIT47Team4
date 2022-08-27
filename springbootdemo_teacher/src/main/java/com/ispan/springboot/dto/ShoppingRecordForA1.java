package com.ispan.springboot.dto;

public class ShoppingRecordForA1 {
	private Integer c1id;
	private String time;
	private Integer num;
	private Integer itid;
	private String itname;
	private Integer price;
	private String classfly;
	private Integer c2id;
	private Boolean state;

	public ShoppingRecordForA1() {
		// TODO Auto-generated constructor stub
	}

	public ShoppingRecordForA1(Integer c1id, String time, Integer num, Integer itid, String itname, Integer price,
			String classfly, Integer c2id, Boolean state) {
		super();
		this.c1id = c1id;
		this.time = time;
		this.num = num;
		this.itid = itid;
		this.itname = itname;
		this.price = price;
		this.classfly = classfly;
		this.c2id = c2id;
		this.state = state;
	}

	public Integer getC1id() {
		return c1id;
	}

	public void setC1id(Integer c1id) {
		this.c1id = c1id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getItid() {
		return itid;
	}

	public void setItid(Integer itid) {
		this.itid = itid;
	}

	public String getItname() {
		return itname;
	}

	public void setItname(String itname) {
		this.itname = itname;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getClassfly() {
		return classfly;
	}

	public void setClassfly(String classfly) {
		this.classfly = classfly;
	}

	public Integer getC2id() {
		return c2id;
	}

	public void setC2id(Integer c2id) {
		this.c2id = c2id;
	}

	public Boolean getState() {
		return state;
	}

	public void setState(Boolean state) {
		this.state = state;
	}

}
