package com.fpj.trendeater.order.model.vo;

import java.sql.Date;

public class OrderStatus extends Order{
	private String orderStatusName;

	public OrderStatus() {}

	public OrderStatus(int orderNo, Date orderDate, int totalPrice, String orderRequest, String email,
			int orderStatusNo, String orderStatusName) {
		super(orderNo, orderDate, totalPrice, orderRequest, email, orderStatusNo);
		this.orderStatusName = orderStatusName;
	}

	public String getOrderStatusName() {
		return orderStatusName;
	}

	public void setOrderStatusName(String orderStatusName) {
		this.orderStatusName = orderStatusName;
	}

	@Override
	public String toString() {
		return "OrderStatus [orderStatusName=" + orderStatusName + ", getOrderNo()=" + getOrderNo()
				+ ", getOrderDate()=" + getOrderDate() + ", getTotalPrice()=" + getTotalPrice() + ", getOrderRequest()="
				+ getOrderRequest() + ", getEmail()=" + getEmail() + ", getOrderStatusNo()=" + getOrderStatusNo()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}


}
