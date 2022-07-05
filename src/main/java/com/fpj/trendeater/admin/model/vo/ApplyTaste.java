package com.fpj.trendeater.admin.model.vo;

import java.sql.Date;

public class ApplyTaste {
	private int tasteNo;
	private int productNo;
	private String productName;
	private Date startDate;
	private Date endDate;
	private int tasteIng;
	private String boardStatus;
	private String adminId;
	private String adminName;
	private String applyCount;
	
	public ApplyTaste() {}

	public ApplyTaste(int tasteNo, int productNo, String productName,
			Date startDate, Date endDate, int tasteIng, String boardStatus,
			String adminId, String adminName, String applyCount) {
		super();
		this.tasteNo = tasteNo;
		this.productNo = productNo;
		this.productName = productName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.tasteIng = tasteIng;
		this.boardStatus = boardStatus;
		this.adminId = adminId;
		this.adminName = adminName;
		this.applyCount = applyCount;
	}

	public int getTasteNo() {
		return tasteNo;
	}

	public void setTasteNo(int tasteNo) {
		this.tasteNo = tasteNo;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getTasteIng() {
		return tasteIng;
	}

	public void setTasteIng(int tasteIng) {
		this.tasteIng = tasteIng;
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

	public String getApplyCount() {
		return applyCount;
	}

	public void setApplyCount(String applyCount) {
		this.applyCount = applyCount;
	}

	@Override
	public String toString() {
		return "ApplyTaste [tasteNo=" + tasteNo + ", productNo=" + productNo
				+ ", productName=" + productName + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", tasteIng=" + tasteIng
				+ ", boardStatus=" + boardStatus + ", adminId=" + adminId
				+ ", adminName=" + adminName + ", applyCount=" + applyCount
				+ "]";
	}


	
}
