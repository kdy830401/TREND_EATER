package com.fpj.trendeater.member.model.vo;

import java.sql.Date;

public class ReviewList {
	private int reviewNo;
	private int reviewRating;
	private int recommend;
	private int repurcharse;
	private int spicy;
	private int sweet;
	private int bitter;
	private int salty;
	private int sour;
	private String good;
	private String bad;
	private Date createDate;
	private Date modifyDate;
	private int likeCount;
	private int productNo;
	private String emailId;
	private String reviewStatus;
	private String nickName;
	private String productName;
	private String flavor1;
	private String flavor2;
	private String flavor3;
	
	public ReviewList() {}

	public ReviewList(int reviewNo, int reviewRating, int recommend, int repurcharse, int spicy, int sweet, int bitter,
			int salty, int sour, String good, String bad, Date createDate, Date modifyDate, int likeCount,
			int productNo, String emailId, String reviewStatus, String nickName, String productName, String flavor1,
			String flavor2, String flavor3) {
		super();
		this.reviewNo = reviewNo;
		this.reviewRating = reviewRating;
		this.recommend = recommend;
		this.repurcharse = repurcharse;
		this.spicy = spicy;
		this.sweet = sweet;
		this.bitter = bitter;
		this.salty = salty;
		this.sour = sour;
		this.good = good;
		this.bad = bad;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.likeCount = likeCount;
		this.productNo = productNo;
		this.emailId = emailId;
		this.reviewStatus = reviewStatus;
		this.nickName = nickName;
		this.productName = productName;
		this.flavor1 = flavor1;
		this.flavor2 = flavor2;
		this.flavor3 = flavor3;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getRepurcharse() {
		return repurcharse;
	}

	public void setRepurcharse(int repurcharse) {
		this.repurcharse = repurcharse;
	}

	public int getSpicy() {
		return spicy;
	}

	public void setSpicy(int spicy) {
		this.spicy = spicy;
	}

	public int getSweet() {
		return sweet;
	}

	public void setSweet(int sweet) {
		this.sweet = sweet;
	}

	public int getBitter() {
		return bitter;
	}

	public void setBitter(int bitter) {
		this.bitter = bitter;
	}

	public int getSalty() {
		return salty;
	}

	public void setSalty(int salty) {
		this.salty = salty;
	}

	public int getSour() {
		return sour;
	}

	public void setSour(int sour) {
		this.sour = sour;
	}

	public String getGood() {
		return good;
	}

	public void setGood(String good) {
		this.good = good;
	}

	public String getBad() {
		return bad;
	}

	public void setBad(String bad) {
		this.bad = bad;
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getFlavor1() {
		return flavor1;
	}

	public void setFlavor1(String flavor1) {
		this.flavor1 = flavor1;
	}

	public String getFlavor2() {
		return flavor2;
	}

	public void setFlavor2(String flavor2) {
		this.flavor2 = flavor2;
	}

	public String getFlavor3() {
		return flavor3;
	}

	public void setFlavor3(String flavor3) {
		this.flavor3 = flavor3;
	}

	@Override
	public String toString() {
		return "ReviewList [reviewNo=" + reviewNo + ", reviewRating=" + reviewRating + ", recommend=" + recommend
				+ ", repurcharse=" + repurcharse + ", spicy=" + spicy + ", sweet=" + sweet + ", bitter=" + bitter
				+ ", salty=" + salty + ", sour=" + sour + ", good=" + good + ", bad=" + bad + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", likeCount=" + likeCount + ", productNo=" + productNo
				+ ", emailId=" + emailId + ", reviewStatus=" + reviewStatus + ", nickName=" + nickName
				+ ", productName=" + productName + ", flavor1=" + flavor1 + ", flavor2=" + flavor2 + ", flavor3="
				+ flavor3 + "]";
	}

	
	
	}
