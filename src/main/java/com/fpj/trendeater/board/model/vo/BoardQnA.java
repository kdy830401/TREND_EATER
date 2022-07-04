package com.fpj.trendeater.board.model.vo;

import java.sql.Date;

public class BoardQnA {
	
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaCreateDate;
	private Date qnaModifyDate;
	private String qnaStatus;
	private String qnaAnsStatus;
	private String emailId;
	
	public BoardQnA() {}

	public BoardQnA(int qnaNo, String qnaTitle, String qnaContent, Date qnaCreateDate, Date qnaModifyDate,
			String qnaStatus, String qnaAnsStatus, String emailId) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaCreateDate = qnaCreateDate;
		this.qnaModifyDate = qnaModifyDate;
		this.qnaStatus = qnaStatus;
		this.qnaAnsStatus = qnaAnsStatus;
		this.emailId = emailId;
	}

	@Override
	public String toString() {
		return "BoardQnA [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaCreateDate="
				+ qnaCreateDate + ", qnaModifyDate=" + qnaModifyDate + ", qnaStatus=" + qnaStatus + ", qnaAnsStatus="
				+ qnaAnsStatus + ", emailId=" + emailId + "]";
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaCreateDate() {
		return qnaCreateDate;
	}

	public void setQnaCreateDate(Date qnaCreateDate) {
		this.qnaCreateDate = qnaCreateDate;
	}

	public Date getQnaModifyDate() {
		return qnaModifyDate;
	}

	public void setQnaModifyDate(Date qnaModifyDate) {
		this.qnaModifyDate = qnaModifyDate;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	public String getQnaAnsStatus() {
		return qnaAnsStatus;
	}

	public void setQnaAnsStatus(String qnaAnsStatus) {
		this.qnaAnsStatus = qnaAnsStatus;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}


	
	
}
