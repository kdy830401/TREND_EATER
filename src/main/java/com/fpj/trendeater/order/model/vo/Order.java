package com.fpj.trendeater.order.model.vo;

import java.sql.Date;

public class Order {
	private int orderNo;
	private Date orderDate;
	private int totalPrice;
	private String orderRequest;
	private String email;
	private int orderStatusNo;
	
	public Order() {}

	public Order(int orderNo, Date orderDate, int totalPrice, String orderRequest, String email, int orderStatusNo) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.totalPrice = totalPrice;
		this.orderRequest = orderRequest;
		this.email = email;
		this.orderStatusNo = orderStatusNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOrderRequest() {
		return orderRequest;
	}

	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getOrderStatusNo() {
		return orderStatusNo;
	}

	public void setOrderStatusNo(int orderStatusNo) {
		this.orderStatusNo = orderStatusNo;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderDate=" + orderDate + ", totalPrice=" + totalPrice
				+ ", orderRequest=" + orderRequest + ", email=" + email + ", orderStatusNo=" + orderStatusNo + "]";
	}	
}
