package com.fpj.trendeater.order.model.vo;

public class Order {
	private int totalPrice;
	private String orderRequest;
	private String email;
	
	public Order() {}

	public Order(int totalPrice, String orderRequest, String email) {
		super();
		this.totalPrice = totalPrice;
		this.orderRequest = orderRequest;
		this.email = email;
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

	@Override
	public String toString() {
		return "Order [totalPrice=" + totalPrice + ", orderRequest=" + orderRequest + ", email=" + email + "]";
	}


	
	
	
}
