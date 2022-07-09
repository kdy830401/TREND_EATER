package com.fpj.trendeater.board.model.vo;

public class UserLike {
	private int likeNo;
	private int reviewNo;
	private String emailId;
	private int likeCheck;
	
	public UserLike() {}

	public UserLike(int likeNo, int reviewNo, String emailId, int likeCheck) {
		super();
		this.likeNo = likeNo;
		this.reviewNo = reviewNo;
		this.emailId = emailId;
		this.likeCheck = likeCheck;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public int getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}

	@Override
	public String toString() {
		return "UserLike [likeNo=" + likeNo + ", reviewNo=" + reviewNo + ", emailId=" + emailId + ", likeCheck="
				+ likeCheck + "]";
	}
	
	
}