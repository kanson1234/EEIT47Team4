package com.ispan.springboot.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "Retailer")
public class Retailer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "C2_Id")
	private Integer rid;

	@Column(name = "C2_FirstName")
	private String rfirstName;

	@Column(name = "C2_LastName")
	private String rlastName;

	@Column(name = "C2_Account")
	private String raccount;

	@Column(name = "C2_Pwd")
	private String rpwd;

	@Column(name = "C2_Phone")
	private String rphone;

	@Column(name = "C2_Date")
	private Date rdate;

	@Column(name = "C2_State")
	private boolean rstate;

	@Column(name = "C2_logo")
	private byte[] logo;

	@Lob
	@Column(name = "C2_photo")
	private byte[] photo;

	@Column(name = "C2_info")
	private String info;

	public Retailer() {
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRfirstName() {
		return rfirstName;
	}

	public void setRfirstName(String rfirstName) {
		this.rfirstName = rfirstName;
	}

	public String getRlastName() {
		return rlastName;
	}

	public void setRlastName(String rlastName) {
		this.rlastName = rlastName;
	}

	public String getRaccount() {
		return raccount;
	}

	public void setRaccount(String raccount) {
		this.raccount = raccount;
	}

	public String getRpwd() {
		return rpwd;
	}

	public void setRpwd(String rpwd) {
		this.rpwd = rpwd;
	}

	public String getRphone() {
		return rphone;
	}

	public void setRphone(String rphone) {
		this.rphone = rphone;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public boolean isRstate() {
		return rstate;
	}

	public void setRstate(boolean rstate) {
		this.rstate = rstate;
	}

	public byte[] getLogo() {
		return logo;
	}

	public void setLogo(byte[] logo) {
		this.logo = logo;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
}
