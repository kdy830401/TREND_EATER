package com.fpj.trendeater.admin.model.vo;

import java.sql.Date;

public class Image {
	private int imageNo;
	private String changeName;
	private String originName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private int fileType;
	private int boardType;
	private int identifyNo;
	
	public Image() {}

	public Image(int imageNo, String changeName, String originName, String filePath, Date uploadDate, int fileLevel,
			int fileType, int boardType, int identifyNo) {
		super();
		this.imageNo = imageNo;
		this.changeName = changeName;
		this.originName = originName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.fileType = fileType;
		this.boardType = boardType;
		this.identifyNo = identifyNo;
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

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getFileType() {
		return fileType;
	}

	public void setFileType(int fileType) {
		this.fileType = fileType;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public int getIdentifyNo() {
		return identifyNo;
	}

	public void setIdentifyNo(int identifyNo) {
		this.identifyNo = identifyNo;
	}

	@Override
	public String toString() {
		return "Image [imageNo=" + imageNo + ", changeName=" + changeName + ", originName=" + originName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", fileType=" + fileType
				+ ", boardType=" + boardType + ", identifyNo=" + identifyNo + "]";
	};
	
	
	
	
}
