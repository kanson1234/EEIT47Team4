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

	@Column(name = "C2_Name")
	private String rname;

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

	@Column(name = "C2_info")
	private String rinfo;

	@Lob
	@Column(name = "C2_logo")
	private byte[] rlogo;

	@Column(name = "C2_photo")
	private byte[] rphoto;

	public Retailer() {
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
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

	public String getRinfo() {
		return rinfo;
	}

	public void setRinfo(String rinfo) {
		this.rinfo = rinfo;
	}

	public byte[] getRlogo() {
		return rlogo;
	}

	public void setRlogo(byte[] rlogo) {
		this.rlogo = rlogo;
	}

	public byte[] getRphoto() {
		return rphoto;
	}

	public void setRphoto(byte[] rphoto) {
		this.rphoto = rphoto;
	}

}
