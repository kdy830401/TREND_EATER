package com.fpj.trendeater.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyId;
	private String replyContent;
	private int refBoardId;
	private String replyWriter;
	private String nickName;
	private Date replyCreateDate;
	private Date replyModifyDate;
	private String replyStatus;
	
	public Reply() {}

	public Reply(int replyId, String replyContent, int refBoardId, String replyWriter, String nickName,
			Date replyCreateDate, Date replyModifyDate, String replyStatus) {
		super();
		this.replyId = replyId;
		this.replyContent = replyContent;
		this.refBoardId = refBoardId;
		this.replyWriter = replyWriter;
		this.nickName = nickName;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
		this.replyStatus = replyStatus;
	}

	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", replyContent=" + replyContent + ", refBoardId=" + refBoardId
				+ ", replyWriter=" + replyWriter + ", nickName=" + nickName + ", replyCreateDate=" + replyCreateDate
				+ ", replyModifyDate=" + replyModifyDate + ", replyStatus=" + replyStatus + "]";
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getRefBoardId() {
		return refBoardId;
	}

	public void setRefBoardId(int refBoardId) {
		this.refBoardId = refBoardId;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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
