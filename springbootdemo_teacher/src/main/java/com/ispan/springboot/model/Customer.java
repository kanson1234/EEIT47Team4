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
import javax.persistence.Lob;
import javax.persistence.OneToMany;
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
	@Column(name = "c1_id", nullable = false)
	private Integer cId;

	@Column(name = "C1_FirstName")
	private String cFirstName;

	@Column(name = "c1_lastname")
	private String cLastName;

	@Column(name = "C1_Account")
	private String cAccount;

	@Column(name = "C1_Pwd")
	private String cPwd;

	@Lob
	@Column(name = "C1_Img")
	private byte[] cImg;

	@Column(name = "C1_Data")
	private Date cDate;

	@Column(name = "C1_BirthDay")
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd") // SpringMVC
	@Temporal(TemporalType.DATE)
	private Date cBirthdate;

	@Column(name = "C1_Email")
	private String cEmail;

	@Column(name = "c1_status")
	private boolean cStatus;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "customerMsg", cascade = CascadeType.ALL)
	private Set<Message> Message = new LinkedHashSet<Message>();

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "customer", cascade = CascadeType.ALL)
	private Set<ShoppingRecord> SR = new LinkedHashSet<>();

	public Customer() {
	}

	public Customer(int c1_Id, String c1_LastName, boolean c1_Status) {
		super();
		cId = c1_Id;
		cLastName = c1_LastName;
		cStatus = c1_Status;
	}

	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public String getcFirstName() {
		return cFirstName;
	}

	public void setcFirstName(String cFirstName) {
		this.cFirstName = cFirstName;
	}

	public String getcLastName() {
		return cLastName;
	}

	public void setcLastName(String cLastName) {
		this.cLastName = cLastName;
	}

	public String getcAccount() {
		return cAccount;
	}

	public void setcAccount(String cAccount) {
		this.cAccount = cAccount;
	}

	public String getcPwd() {
		return cPwd;
	}

	public void setcPwd(String cPwd) {
		this.cPwd = cPwd;
	}

	public byte[] getcImg() {
		return cImg;
	}

	public void setcImg(byte[] cImg) {
		this.cImg = cImg;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public Date getcBirthdate() {
		return cBirthdate;
	}

	public void setcBirthdate(Date cBirthdate) {
		this.cBirthdate = cBirthdate;
	}

	public String getcEmail() {
		return cEmail;
	}

	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}

	public boolean iscStatus() {
		return cStatus;
	}

	public void setcStatus(boolean cStatus) {
		this.cStatus = cStatus;
	}

}
