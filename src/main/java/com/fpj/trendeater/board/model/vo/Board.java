
package com.fpj.trendeater.board.model.vo;

import java.sql.Date;


public class Board {

	private int boardId;
	private String boardTitle;
	private String boardWriter;
	private String nickName;
	private String boardContent;
	private String originalFileName;
	private String renameFileName;
	private int boardCount;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private String boardStatus;
	private String adminId;
	
	public Board() {}

	public Board(int boardId, String boardTitle, String boardWriter, String nickName, String boardContent,
			String originalFileName, String renameFileName, int boardCount, Date boardCreateDate, Date boardModifyDate,
			String boardStatus, String adminId) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.nickName = nickName;
		this.boardContent = boardContent;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.boardCount = boardCount;
		this.boardCreateDate = boardCreateDate;
		this.boardModifyDate = boardModifyDate;
		this.boardStatus = boardStatus;
		this.adminId = adminId;
	}

	@Override
	public String toString() {
		return "Board [boardId=" + boardId + ", boardTitle=" + boardTitle + ", boardWriter=" + boardWriter
				+ ", nickName=" + nickName + ", boardContent=" + boardContent + ", originalFileName=" + originalFileName
				+ ", renameFileName=" + renameFileName + ", boardCount=" + boardCount + ", boardCreateDate="
				+ boardCreateDate + ", boardModifyDate=" + boardModifyDate + ", boardStatus=" + boardStatus
				+ ", adminId=" + adminId + "]";
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public Date getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public Date getBoardModifyDate() {
		return boardModifyDate;
	}

	public void setBoardModifyDate(Date boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
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

	
	
	
	
	
	
}

