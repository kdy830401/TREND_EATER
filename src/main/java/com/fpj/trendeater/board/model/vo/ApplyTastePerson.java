package com.fpj.trendeater.board.model.vo;

import java.sql.Date;

public class ApplyTastePerson {
	private int applyNo;
	private String name;
	private String phone;
	private String address;
	private int tasteNo;
	private Date applyDate;
	private String emailId;
	private String productName;
	
	public ApplyTastePerson() {}

	public ApplyTastePerson(int applyNo, String name, String phone, String address, int tasteNo, Date applyDate, String emailId, String productName) {
		super();
		this.applyNo = applyNo;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.tasteNo = tasteNo;
		this.applyDate = applyDate;
		this.emailId = emailId;
		this.productName = productName;
	}

	public int getApplyNo() {
		return applyNo;
	}

	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTasteNo() {
		return tasteNo;
	}

	public void setTasteNo(int tasteNo) {
		this.tasteNo = tasteNo;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "ApplyTastePerson [applyNo=" + applyNo + ", name=" + name + ", phone=" + phone + ", address=" + address + ", tasteNo=" + tasteNo + ", applyDate=" + applyDate + ", emailId=" + emailId + ", productName=" + productName + "]";
	}


	
}
