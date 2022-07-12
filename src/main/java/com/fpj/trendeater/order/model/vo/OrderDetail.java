package com.fpj.trendeater.order.model.vo;

import java.sql.Date;

// 주문 정보 - 개별 결제 품목
public class OrderDetail extends Order{
	private int orderDetailNo;
	private int orderAmount;
	private int productNo;
	
	public OrderDetail() {}



	public OrderDetail(int orderNo, Date orderDate, int totalPrice, String orderRequest, String email,
			int orderStatusNo, int orderDetailNo, int orderAmount, int productNo) {
		super(orderNo, orderDate, totalPrice, orderRequest, email, orderStatusNo);
		this.orderDetailNo = orderDetailNo;
		this.orderAmount = orderAmount;
		this.productNo = productNo;
	}



	public int getOrderDetailNo() {
		return orderDetailNo;
	}

	public void setOrderDetailNo(int orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}



	@Override
	public String toString() {
		return "OrderDetail [orderDetailNo=" + orderDetailNo + ", orderAmount=" + orderAmount + ", productNo="
				+ productNo + ", getOrderNo()=" + getOrderNo() + ", getOrderDate()=" + getOrderDate()
				+ ", getTotalPrice()=" + getTotalPrice() + ", getOrderRequest()=" + getOrderRequest() + ", getEmail()="
				+ getEmail() + ", getOrderStatusNo()=" + getOrderStatusNo() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}



}
