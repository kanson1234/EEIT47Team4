package com.ispan.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="Retailer")
public class RetailerBean {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="C2_Id")
	private Integer id;
	
	@Column(name="C2_FirstName")
	private String firstName;
	
	@Column(name="C2_LastName")
	private String lastName;
	
	@Column(name="C2_Account")
	private String account;
	
	@Column(name="C2_Pwd")
	private String pwd;
	
	@Lob
	@Column(name="C2_Phone")
	private String phone;
	
//	@Column(name="C2_Date")
//	private String outPutdate;
	
	@Column(name="C2_State")
	private Boolean state;
	
	@Column(name="C2_logo")
	private byte[] logo;
	
	@Column(name="C2_photo")
	private byte[] photo;
	
	@Column(name="C2_info")
	private String info;
	
	

	
	public RetailerBean() {
	}
	
	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}





	public String getFirstName() {
		return firstName;
	}





	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}





	public String getLastName() {
		return lastName;
	}





	public void setLastName(String lastName) {
		this.lastName = lastName;
	}





	public String getAccount() {
		return account;
	}





	public void setAccount(String account) {
		this.account = account;
	}





	public String getPwd() {
		return pwd;
	}





	public void setPwd(String pwd) {
		this.pwd = pwd;
	}





	public String getPhone() {
		return phone;
	}





	public void setPhone(String phone) {
		this.phone = phone;
	}



	public Boolean getState() {
		return state;
	}

	public void setState(Boolean state) {
		this.state = state;
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
