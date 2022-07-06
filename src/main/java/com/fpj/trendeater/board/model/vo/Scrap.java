package com.fpj.trendeater.board.model.vo;

public class Scrap {
	private int scarpNo;
	private int emailId;
	private int productNo;
	
	public Scrap() {}

	public Scrap(int scarpNo, int emailId, int productNo) {
		super();
		this.scarpNo = scarpNo;
		this.emailId = emailId;
		this.productNo = productNo;
	}

	public int getScarpNo() {
		return scarpNo;
	}

	public void setScarpNo(int scarpNo) {
		this.scarpNo = scarpNo;
	}

	public int getEmailId() {
		return emailId;
	}

	public void setEmailId(int emailId) {
		this.emailId = emailId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "Scrap [scarpNo=" + scarpNo + ", emailId=" + emailId + ", productNo=" + productNo + "]";
	}
	
	
}
