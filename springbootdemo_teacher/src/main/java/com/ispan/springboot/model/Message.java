package com.ispan.springboot.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.annotation.Transient;

@Entity
@Table(name = "Message")
public class Message {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Msg_Message_Id")
	private Integer mid;

	@Column(name = "Msg_Context")
	private String mcontext;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Msg_Time")
	private Date mdate;	

	@PrePersist
	public void onCreate() {
		if (mdate == null) {
			mdate = new Date();
		}
	}

	@Column(name = "Msg_State", nullable = true, columnDefinition = "boolean default true")
	private Boolean mstate;

	@Column(name = "Msg_C1C2_Status")
	private boolean mstatec;

//	@Column(name = "CS_Id")
//	private Integer msid;
	
	

	@Column(name = "CR_Id")
	private Integer mrid;

//	@Transient
//	@Column(name = "SH_Item_Id")
//	private Integer mshid;

	@ManyToOne(fetch = FetchType.EAGER/* ,targetEntity = ShopHouseBean.class */)
	@JoinColumn(name = "SH_Item_Id"/* ,referencedColumnName = "SH_Item_Id" */)
	private ShopHouseBean shopHouseBean;
	
	@ManyToOne(fetch = FetchType.EAGER/* ,targetEntity = Customer.class */)
	@JoinColumn(name = "CS_Id"/* ,referencedColumnName = "c1_id" */)
	private Customer customerMsg;
//	==============================================================================================================

	public Message(Integer mid, String mcontext, Date mdate ,boolean mstate, boolean mstatec, 
			Integer mrid,Customer customerMsg, ShopHouseBean shopHouseBean) {
		super();
		this.mid = mid;
		this.mcontext = mcontext;
		this.mdate=mdate;
		this.mstate = mstate;
		this.mstatec = mstatec;
		this.mrid = mrid;
		this.customerMsg = customerMsg;
		this.shopHouseBean = shopHouseBean;
	}

	public Message() {
		super();
	}

//	==============================================================================================================

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getMcontext() {
		return mcontext;
	}

	public void setMcontext(String mcontext) {
		this.mcontext = mcontext;
	}

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}

	public boolean isMstate() {
		return mstate;
	}

	public void setMstate(boolean mstate) {
		this.mstate = mstate;
	}

	public boolean isMstatec() {
		return mstatec;
	}

	public void setMstatec(boolean mstatec) {
		this.mstatec = mstatec;
	}

//	public Integer getMsid() {
//		return msid;
//	}
//
//	public void setMsid(Integer msid) {
//		this.msid = msid;
//	}
	

	public Integer getMrid() {
		return mrid;
	}

	public void setMrid(Integer mrid) {
		this.mrid = mrid;
	}

//	public Integer getMshid() {
//		return mshid;
//	}
//
//	public void setMshid(Integer mshid) {
//		this.mshid = mshid;
//	}
	
	public Customer getCustomerMsg() {
		return customerMsg;
	}

	public void setCustomerMsg(Customer customerMsg) {
		this.customerMsg = customerMsg;
	}
	public ShopHouseBean getShopHouseBean() {
		return shopHouseBean;
	}

	

	public void setShopHouseBean(ShopHouseBean shopHouseBean) {
		this.shopHouseBean = shopHouseBean;
	}

//	==============================================================================================================

}
