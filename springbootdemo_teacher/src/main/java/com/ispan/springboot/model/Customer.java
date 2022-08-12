package com.ispan.springboot.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "Customer")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "C1_Id")
	private Integer cid;

	@Column(name = "C1_FirstName")
	private String cfirstName;

	@Column(name = "C1_LastName")
	private String classtName;

	@Column(name = "C1_Account")
	private String caccount;

	@Column(name = "C1_Pwd")
	private String cpwd;

	@Column(name = "C1_Img")
	private byte[] cimg;

	@Column(name = "C1_Data")
	private Date cdate;

	@Column(name = "C1_BirthDay")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm") //SprongMVC
	@Temporal(TemporalType.TIMESTAMP)
	private Date cbirthdate;

	@Column(name = "C1_Status")
	private boolean cstatus;

	public Customer() {
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCfirstName() {
		return cfirstName;
	}

	public void setCfirstName(String cfirstName) {
		this.cfirstName = cfirstName;
	}

	public String getClasstName() {
		return classtName;
	}

	public void setClasstName(String classtName) {
		this.classtName = classtName;
	}

	public String getCaccount() {
		return caccount;
	}

	public void setCaccount(String caccount) {
		this.caccount = caccount;
	}

	public String getCpwd() {
		return cpwd;
	}

	public void setCpwd(String cpwd) {
		this.cpwd = cpwd;
	}

	public byte[] getCimg() {
		return cimg;
	}

	public void setCimg(byte[] cimg) {
		this.cimg = cimg;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public Date getCbirthdate() {
		return cbirthdate;
	}

	public void setCbirthdate(Date cbirthdate) {
		this.cbirthdate = cbirthdate;
	}

	public boolean isCstatus() {
		return cstatus;
	}

	public void setCstatus(boolean cstatus) {
		this.cstatus = cstatus;
	}

}
