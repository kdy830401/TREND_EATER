package com.fpj.trendeater.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String replyContent;
	private int refQnaNo;
	private String adminId;
	private Date replyCreateDate;
	private Date replyModifyDate;
	private String replyStatus;
	
	public Reply() {}

	public Reply(int replyNo, String replyContent, int refQnaNo, String adminId, Date replyCreateDate,
			Date replyModifyDate, String replyStatus) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refQnaNo = refQnaNo;
		this.adminId = adminId;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
		this.replyStatus = replyStatus;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", refQnaNo=" + refQnaNo + ", adminId="
				+ adminId + ", replyCreateDate=" + replyCreateDate + ", replyModifyDate=" + replyModifyDate
				+ ", replyStatus=" + replyStatus + "]";
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getRefQnaNo() {
		return refQnaNo;
	}

	public void setRefQnaNo(int refQnaNo) {
		this.refQnaNo = refQnaNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public Date getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public Date getReplyModifyDate() {
		return replyModifyDate;
	}

	public void setReplyModifyDate(Date replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	
	
}
