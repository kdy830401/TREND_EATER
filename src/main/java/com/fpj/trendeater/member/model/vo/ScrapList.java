package com.fpj.trendeater.member.model.vo;

public class ScrapList {
	private int scrapNo;
	private int productNo;
	private String productName;
	private int reviewCount;
	
	public ScrapList() {}

	public ScrapList(int scrapNo, int productNo, String productName, int reviewCount) {
		super();
		this.scrapNo = scrapNo;
		this.productNo = productNo;
		this.productName = productName;
		this.reviewCount = reviewCount;
	}

	public int getScrapNo() {
		return scrapNo;
	}

	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
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
		return "ScrapList [scrapNo=" + scrapNo + ", productNo=" + productNo + ", productName=" + productName
				+ ", reviewCount=" + reviewCount + "]";
	}

	
	
	
}
