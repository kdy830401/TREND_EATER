package com.fpj.trendeater.admin.model.vo;

import java.sql.Date;

public class ProductRequest {
	private int requestNo; //상품요청한 상품번호
	private String productName; //상품요청한 상품명
	private String manufacturer; //상품요청한 상품제조사명
	private Date createDate;
	private String email; //상품 요청한 회원이메일
	
	
	public ProductRequest() {}


	public ProductRequest(int requestNo, String productName, String manufacturer, Date createDate, String email) {
		super();
		this.requestNo = requestNo;
		this.productName = productName;
		this.manufacturer = manufacturer;
		this.createDate = createDate;
		this.email = email;
	}


	public int getRequestNo() {
		return requestNo;
	}


	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getManufacturer() {
		return manufacturer;
	}


	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	@Override
	public String toString() {
		return "ProductRequest [requestNo=" + requestNo + ", productName=" + productName + ", manufacturer="
				+ manufacturer + ", createDate=" + createDate + ", email=" + email + ", getRequestNo()="
				+ getRequestNo() + ", getProductName()=" + getProductName() + ", getManufacturer()=" + getManufacturer()
				+ ", getCreateDate()=" + getCreateDate() + ", getEmail()=" + getEmail() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}
