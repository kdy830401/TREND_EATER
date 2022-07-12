package com.fpj.trendeater.member.model.vo;

import java.sql.Date;

public class PointList {
	private int pointNo;
	private Date pointUpdateDate;
	private String pointStatus;
	private int pointChange;
	private String categoryName;
	
	public PointList() {
		// TODO Auto-generated constructor stub
	}

	public PointList(int pointNo, Date pointUpdateDate, String pointStatus, int pointChange, String categoryName) {
		super();
		this.pointNo = pointNo;
		this.pointUpdateDate = pointUpdateDate;
		this.pointStatus = pointStatus;
		this.pointChange = pointChange;
		this.categoryName = categoryName;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public Date getPointUpdateDate() {
		return pointUpdateDate;
	}

	public void setPointUpdateDate(Date pointUpdateDate) {
		this.pointUpdateDate = pointUpdateDate;
	}

	public String getPointStatus() {
		return pointStatus;
	}

	public void setPointStatus(String pointStatus) {
		this.pointStatus = pointStatus;
	}

	public int getPointChange() {
		return pointChange;
	}

	public void setPointChange(int pointChange) {
		this.pointChange = pointChange;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "PointList [pointNo=" + pointNo + ", pointUpdateDate=" + pointUpdateDate + ", pointStatus=" + pointStatus
				+ ", pointChange=" + pointChange + ", categoryName=" + categoryName + "]";
	}

	
	
}
