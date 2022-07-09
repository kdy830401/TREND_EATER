package com.fpj.trendeater.cart.model.vo;

public class Cart {
	private int cartNo;
	private int productAmount;
	private String emailId;
	private int productNo;
	private String productName;
	private int productPrice;
	
	public Cart() {}

	public Cart(int cartNo, int productAmount, String emailId, int productNo, String productName, int productPrice) {
		super();
		this.cartNo = cartNo;
		this.productAmount = productAmount;
		this.emailId = emailId;
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", productAmount=" + productAmount + ", emailId=" + emailId + ", productNo="
				+ productNo + ", productName=" + productName + ", productPrice=" + productPrice + "]";
	}
}
