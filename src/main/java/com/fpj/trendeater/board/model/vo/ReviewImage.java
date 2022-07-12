package com.fpj.trendeater.board.model.vo;

import java.sql.Date;

public class ReviewImage {
	private int imageNo;
	private String changeName;
	private String originName;
	private String filePath;
	private Date uploadDate;
	private Integer reviewNo;

	public ReviewImage() {}

	public ReviewImage(int imageNo, String changeName, String originName, String filePath, Date uploadDate, Integer reviewNo) {
		super();
		this.imageNo = imageNo;
		this.changeName = changeName;
		this.originName = originName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.reviewNo = reviewNo;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public Integer getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(Integer reviewNo) {
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "ReviewImage [imageNo=" + imageNo + ", changeName=" + changeName + ", originName=" + originName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", reviewNo=" + reviewNo + "]";
	}

	
	
}
