package com.fpj.trendeater.member.model.vo;

import java.sql.Date;

public class Member {
	private String email;
	private String pwd;
	private String name;
	private String nickName;
	private String phone;
	private Date birthday;
	private String gender;
	private String status;
	private Date createDate;
	private Date modifyDate;
	private String address;
	private int point; //포인트
	private String radio3; //입맛 1순위
	private String radio4; //입맛 2순위
	private String radio5; //입맛 3순위	
	private int reportCount; //피신고횟수
	private String profilePath; //프로필사진경로
	private String originName; //프로필사진 원래 이름
	private String changeName; //프로필사진 변경 이름
	private int loginType;
	
	public Member() {}

	public Member(String email, String pwd, String name, String nickName, String phone, Date birthday, String gender,
			String status, Date createDate, Date modifyDate, String address, int point, String radio3, String radio4,
			String radio5, int reportCount, String profilePath, String originName, String changeName, int loginType) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.nickName = nickName;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
		this.status = status;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.address = address;
		this.point = point;
		this.radio3 = radio3;
		this.radio4 = radio4;
		this.radio5 = radio5;
		this.reportCount = reportCount;
		this.profilePath = profilePath;
		this.originName = originName;
		this.changeName = changeName;
		this.loginType = loginType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getRadio3() {
		return radio3;
	}

	public void setRadio3(String radio3) {
		this.radio3 = radio3;
	}

	public String getRadio4() {
		return radio4;
	}

	public void setRadio4(String radio4) {
		this.radio4 = radio4;
	}

	public String getRadio5() {
		return radio5;
	}

	public void setRadio5(String radio5) {
		this.radio5 = radio5;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getLoginType() {
		return loginType;
	}

	public void setLoginType(int loginType) {
		this.loginType = loginType;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", pwd=" + pwd + ", name=" + name + ", nickName=" + nickName + ", phone="
				+ phone + ", birthday=" + birthday + ", gender=" + gender + ", status=" + status + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", address=" + address + ", point=" + point + ", radio3="
				+ radio3 + ", radio4=" + radio4 + ", radio5=" + radio5 + ", reportCount=" + reportCount
				+ ", profilePath=" + profilePath + ", originName=" + originName + ", changeName=" + changeName
				+ ", loginType=" + loginType + "]";
	}

	
	
}