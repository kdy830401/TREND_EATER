package com.fpj.trendeater.board.model.vo;

public class Scrap {
	private int scarpNo;
	private String emailId;
	private int productNo;
	private String productName;
	private int reviewCount;
	
	public Scrap() {}

	public Scrap(int scarpNo, String emailId, int productNo, String productName, int reviewCount) {
		super();
		this.scarpNo = scarpNo;
		this.emailId = emailId;
		this.productNo = productNo;
		this.productName = productName;
		this.reviewCount = reviewCount;
	}

	public int getScarpNo() {
		return scarpNo;
	}

	public void setScarpNo(int scarpNo) {
		this.scarpNo = scarpNo;
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

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "Scrap [scarpNo=" + scarpNo + ", emailId=" + emailId + ", productNo=" + productNo + ", productName=" + productName + ", reviewCount=" + reviewCount + "]";
	}


}
