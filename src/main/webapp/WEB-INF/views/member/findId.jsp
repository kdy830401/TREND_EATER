<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<!-- uikit -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${ contextPath }/resources/css/uikit.min.css" />
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>

<style>
input {
	border: 1px solid #BDBDBD;
	border-radius: 3px;
	font-size: 15px;
}

input::placeholder {
	color: #D8D8D8;
}

input:focus {
	border: none;
	outline: 1px solid black;
}

.name {
	height: 40px;
	width: 280px;
	text-align: left;
	padding-left: 20px;
}

.phone {
	height: 40px;
	width: 280px;
	text-align: left;
	padding-left: 20px;
}

.login {
	background-color: #FF5C58;
	border: none;
	border-radius: 3px;
	height: 60px;
	width: 100%;
	color: white;
	font-size: 18px;
	cursor: pointer;
}

.findPwd {
	background-color: white;
	border: thin solid #FF5C58;
	border-radius: 3px;
	height: 60px;
	width: 100%;
	color: #FF5C58;
	font-size: 18px;
	cursor: pointer;
}

button {
	cursor: pointer;
}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"></c:import>
	<div class="uk-position-center" style="margin-top: 100px;">


		<p style="font-weight: bold; font-size: 20px;">고객님의 트렌드잇터 계정을 찾았습니다.</p>
		<p style="margin-top: 1px;">아이디 확인 후 로그인 해주세요.</p>


		<!-- 널일 경우 프로필 사진-->
		<div class="uk-grid  uk-child-width-1-2@m uk-margin" uk-grid>
			<div class="uk-margin uk-text-center">
				<c:if test="${empty member.changeName}">
					<img name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/profile.png" style="background: gray; width: 100px; height: 100px;  border-radius: 50px;">
				</c:if>

				<c:if test="${!empty member.changeName}">
					<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiled/${member.changeName}" style="background: gray; width: 100px; height: 100px; border-radius: 50px;">
				</c:if>
			</div>

			<div class="uk-margin-small uk-margin-remove-bottom uk-padding-remove">
				<p style="font-weight: bold; font-size: 17px; display: inline-block; margin: 0px; padding: 0px;">${member.email}</p>
				<p style="font-size: 14px; padding: 0px;">가입일 ${member.createDate}</p>
			</div>
		</div>

		<button class="uk-margin-small login" onclick="location.href ='loginform.me'">로그인</button>
		<br>
		<button class="uk-margin-small findPwd" onclick="location.href ='findPwdform.me'">비밀번호 찾기</button>
	</div>

</body>
</html>