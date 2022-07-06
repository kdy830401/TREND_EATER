package com.fpj.trendeater.admin.model.vo;

import java.sql.Date;

public class Product {
	private int productNo;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productOneLine;
	private int productType;
	private String productStatus;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private int boardCount;
	private int reviewCount;
	private int scrapCount;
	private String boardStatus;
	private String adminId;
	private String adminName;

	private double totalAvg;
	private double recommendAvg;
	private double reorderAvg;
	private double spicyAvg;
	private double sweetAvg;
	private double bitterAvg;
	private double saltyAvg;
	private double sourAvg;

	public Product() {
	}

	public Product(int productNo, String productName, int productPrice, int productStock, String productOneLine, int productType, String productStatus, String boardContent, Date createDate, Date modifyDate, int boardCount, int reviewCount,
			int scrapCount, String boardStatus, String adminId, String adminName, double totalAvg, double recommendAvg, double reorderAvg, double spicyAvg, double sweetAvg, double bitterAvg, double saltyAvg, double sourAvg) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productOneLine = productOneLine;
		this.productType = productType;
		this.productStatus = productStatus;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.boardCount = boardCount;
		this.reviewCount = reviewCount;
		this.scrapCount = scrapCount;
		this.boardStatus = boardStatus;
		this.adminId = adminId;
		this.adminName = adminName;
		this.totalAvg = totalAvg;
		this.recommendAvg = recommendAvg;
		this.reorderAvg = reorderAvg;
		this.spicyAvg = spicyAvg;
		this.sweetAvg = sweetAvg;
		this.bitterAvg = bitterAvg;
		this.saltyAvg = saltyAvg;
		this.sourAvg = sourAvg;
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

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductOneLine() {
		return productOneLine;
	}

	public void setProductOneLine(String productOneLine) {
		this.productOneLine = productOneLine;
	}

	public int getProductType() {
		return productType;
	}

	public void setProductType(int productType) {
		this.productType = productType;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getScrapCount() {
		return scrapCount;
	}

	public void setScrapCount(int scrapCount) {
		this.scrapCount = scrapCount;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public double getTotalAvg() {
		return totalAvg;
	}

	public void setTotalAvg(double totalAvg) {
		this.totalAvg = totalAvg;
	}

	public double getRecommendAvg() {
		return recommendAvg;
	}

	public void setRecommendAvg(double recommendAvg) {
		this.recommendAvg = recommendAvg;
	}

	public double getReorderAvg() {
		return reorderAvg;
	}

	public void setReorderAvg(double reorderAvg) {
		this.reorderAvg = reorderAvg;
	}

	public double getSpicyAvg() {
		return spicyAvg;
	}

	public void setSpicyAvg(double spicyAvg) {
		this.spicyAvg = spicyAvg;
	}

	public double getSweetAvg() {
		return sweetAvg;
	}

	public void setSweetAvg(double sweetAvg) {
		this.sweetAvg = sweetAvg;
	}

	public double getBitterAvg() {
		return bitterAvg;
	}

	public void setBitterAvg(double bitterAvg) {
		this.bitterAvg = bitterAvg;
	}

	public double getSaltyAvg() {
		return saltyAvg;
	}

	public void setSaltyAvg(double saltyAvg) {
		this.saltyAvg = saltyAvg;
	}

	public double getSourAvg() {
		return sourAvg;
	}

	public void setSourAvg(double sourAvg) {
		this.sourAvg = sourAvg;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice + ", productStock=" + productStock + ", productOneLine=" + productOneLine + ", productType=" + productType + ", productStatus="
				+ productStatus + ", boardContent=" + boardContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", boardCount=" + boardCount + ", reviewCount=" + reviewCount + ", scrapCount=" + scrapCount + ", boardStatus="
				+ boardStatus + ", adminId=" + adminId + ", adminName=" + adminName + ", totalAvg=" + totalAvg + ", recommendAvg=" + recommendAvg + ", reorderAvg=" + reorderAvg + ", spicyAvg=" + spicyAvg + ", sweetAvg=" + sweetAvg + ", bitterAvg="
				+ bitterAvg + ", saltyAvg=" + saltyAvg + ", sourAvg=" + sourAvg + "]";
	}

	
	

}
