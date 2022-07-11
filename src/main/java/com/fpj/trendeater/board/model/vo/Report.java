package com.fpj.trendeater.board.model.vo;

import java.sql.Date;

public class Report {
	private int reportNo;
	private int reportType;
	private String reportContent;
	private String reportResult;
	private Date reportDate;
	private String emailId;
	private int reviewNo;
	
	public Report() {}

	public Report(int reportNo, int reportType, String reportContent, String reportResult, Date reportDate,
			String emailId, int reviewNo) {
		super();
		this.reportNo = reportNo;
		this.reportType = reportType;
		this.reportContent = reportContent;
		this.reportResult = reportResult;
		this.reportDate = reportDate;
		this.emailId = emailId;
		this.reviewNo = reviewNo;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getReportResult() {
		return reportResult;
	}

	public void setReportResult(String reportResult) {
		this.reportResult = reportResult;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportType=" + reportType + ", reportContent=" + reportContent
				+ ", reportResult=" + reportResult + ", reportDate=" + reportDate + ", emailId=" + emailId
				+ ", reviewNo=" + reviewNo + "]";
	}

	
	
}