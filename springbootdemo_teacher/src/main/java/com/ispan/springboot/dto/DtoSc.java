package com.ispan.springboot.dto;

public class DtoSc {

	private Integer scid;
	private Integer count;
	private Integer itid;

	public DtoSc(Integer scid, Integer count, Integer itid) {
		super();
		this.scid = scid;
		this.count = count;
		this.itid = itid;
	}

	public Integer getScid() {
		return scid;
	}

	public void setScid(Integer scid) {
		this.scid = scid;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getItid() {
		return itid;
	}

	public void setItid(Integer itid) {
		this.itid = itid;
	}

	public DtoSc() {
		// TODO Auto-generated constructor stub
	}

}
