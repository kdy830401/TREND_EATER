<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>TREND EATER</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- uikit -->
<link rel="stylesheet" href="${ contextPath }/resources/css/uikit.min.css" />
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
<script src="${ contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<style>
/*탭 메뉴*/
* {
	box-sizing: border-box
}

body {
	font-family: "Lato", sans-serif;
}

/*탭전체 아래로 내리기*/
.tabdiv {
	margin-top: 50px;
}

/* Style the tab */
.tab {
	float: left;
	/*   border: 1px solid #ccc; */
	/*  background-color: white; */
	width: 200px;
	height: 150px;
}

/* Style the buttons inside the tab */
.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding-left: 16px;
	width: 200px;
	/*  border: none; */
	outline: none;
	text-align: left;
	cursor: pointer;
	transition: 0.3s;
	font-size: 14px;
	border: 1px solid #ccc;
	height: 55px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #F5F5F5;
}

/* Create an active/current "tab button" class */
.tab button.active {
	background-color: #F5F5F5;
}

/* Style the tab content */
.tabcontent {
	float: top;
	padding: 0px 10px;
	/*  border: 1px solid #ccc; */
	width: 70%;
	border-left: none;
	/*  height: 500px; */
}

.hr1 {
	background-color: black;
	height: 1px;
}

.hr2 {
	background-color: black;
}

.uk-input {
	border: 1px solid #BDBDBD;
	border-radius: 3px !important;
	font-size: 15px;
}

.input:placeholder {
	color: #FF5C58;
}

.uk-input:focus {
	border: none !important;
	outline: thin solid black !important;
}

::selection {
	background-color: #FF5C58;
}

.birthday {
	padding-top: 13px;
	padding-left: 16px;
	border: none;
	width: 74px;
}

.birthdaydiv {
	border: 1px solid #e5e5e5;
	border-radius: 3px;
	font-size: 15px;
	width: 285px;
	padding-left: 15px;
	height: 43px;
}

.birthday:focus {
	outline: none;
	border: none;
}

/* 주소 검색 버튼*/
.address {
	color: #FF5C58 !important;
	border: thin solid #FF5C58 !important;
	background-color: white !important;
	border-radius: 3px !important;
	height: 40px !important;
	width: 97px !important;
	cursor: pointer !important;
	/* margin-top:5px; */
	padding: 0px !important;
}

/*주소 입력란*/
#sample6_address {
	border: 1px solid #BDBDBD;
	border-radius: 3px;
	font-size: 15px;
	width: 200px;
	height: 40px;
}
/*상세주소 입력란*/
#sample6_detailAddress {
	border: 1px solid #BDBDBD;
	border-radius: 3px;
	font-size: 15px;
	height: 40px;
	width: 300px;
}

#sample6_detailAddress:focus {
	border: none;
	outline: thin solid black;
}

#sample6_address:focus {
	border: none;
	outline: thin solid black;
}
/*이메일 인증 버튼*/
.email {
	color: #FF5C58 !important;
	border: 1px solid #FF5C58 !important;
	background-color: white !important;
	border-radius: 3px !important;
	height: 44px !important;
	width: 130px !important;
	cursor: pointer !important;
	padding: 0px !important;
}
/*이메일 인증 입력란*/
.checkemail4 {
	border: 1px solid #BDBDBD;
	border-radius: 3px;
	font-size: 15px;
	height: 40px;
	width: 280px;
	padding-left: 10px;
}

/*이메일 인증 입력란 클릭시*/
.checkemail4:focus {
	border: none;
	outline: 1px solid black;
}

.uk-select {
	border: 1px solid #BDBDBD;
	border-radius: 3px;
	font-size: 15px;
	width: 80px;
}

.uk-select:focus {
	border: none;
	outline: 1px solid black;
}

h5 {
	display: inline-block;
	width: 150px;
}

.join {
	background-color: #FF5C58;
	border: none;
	border-radius: 3px;
	height: 50px;
	width: 340px;
	color: white;
	font-size: 18px;
	cursor: pointer;
}
}
</style>
</head>
<body>



	<c:import url="myPageMenu.jsp" />

	<!-- ------------------------------------------------여기까지 넣어야함------------------------------------------------------------------->

	<div class="uk-align-center" style="margin-left: 125px;">
		<!-- margin-left로 중간으로 오게 만듬 -->
		<div class="uk-width-auto uk-align-center">

			<h3 class="uk-heading-bullet">개인 정보 수정</h3>

			<br>
			<form action="updateinfo.me" method="post" enctype="Multipart/form-data" onsubmit="return insertValidate();">

				<div class="uk-margin-small" style="margin-left: 230px;">
					<div class="uk-inline">

						<!-- 널일 경우  -->
						<div class="myProfile" id="myProfile" style="background: gray; width: 70px; height: 70px; margin: 0 auto; border-radius: 50px; cursor: pointer;">
							<c:if test="${empty loginUser.changeName}">
								<img name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/profile.png" style="background: gray; width: 70px; height: 70px; border-radius: 50px;">
							</c:if>
							<!-- 널이 아닐경우 -->
							<c:if test="${!empty loginUser.changeName}">
								<img name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiled/${loginUser.changeName}" style="background: gray; width: 70px; height: 70px; border-radius: 50px;">
							</c:if>

						</div>
						<!-- 파일 업로드 하는 부분 -->
						<div id="profileArea">
							<input type="file" id="profileImg" multiple="multiple" name="profileImg" style="display: none">
						</div>
						<div class="container">
							<div class="row no-gutters" id="profileLayout"></div>
						</div>


					</div>

				</div>


				<script>
								// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
								$(function(){
									$("#profileArea").hide();
									
									$("#myProfile").click(function(){
										$("#profileImg").click();
									});
								});
								
								

			
					
								// 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수 (이미지 미리보기)
						        var sel_files = [];
								
								$(document).ready(function(){
									$('#profileImg').on('change' , handleImgsFilesSelect);
								});
								
						        function handleImgsFilesSelect(e) {
						            var files = e.target.files;
						            var filesArr = Array.prototype.slice.call(files);
						 
						            filesArr.forEach(function(f) {
						                if(!f.type.match("image.*")) {
						                    alert("jpg,jpeg,png,bmp 확장자만 가능합니다.");
						                    return;
						                }
						 
						                sel_files.push(f);
						 
						                var reader = new FileReader();
						                reader.onload = function(e) {
						                
						                	var imgTag = $('<img>');
						                	imgTag.attr('class', 'img-fluid image');
						                	imgTag.attr('src', e.target.result);
						                	imgTag.css({'width' : '100%', 'height' : '100%' , 'border-radius' : '50px'});
						                	
						                	$('#myProfile').html(imgTag);

						                }
						                reader.readAsDataURL(f);
						            });
						        }
			           	 	</script>



				<br>
				<div class="uk-margin uk-margin-small">
					<div class="uk-inline">
						<div class="uk-margin">
							<div class="uk-inline">
								<h5 class="uk-text-bold ">
									이메일 <span class="star" style="color: #FF5C58;">*</span>
								</h5>
								<input class="uk-input" id="email" name="email" type="text" value="${loginUser.email}" placeholder="이메일 형식으로 입력해주세요" style="height: 44px; width: 300px; text-align: left; padding-left: 10px;" readonly>


								
							</div>

							
						</div>
					</div>
				</div>

				<div class="uk-margin uk-margin-small" id="emailin"></div>

				<div class="uk-margin-small">
					<div class="uk-inline">
						<h5 class="uk-text-bold">
							현재 비밀번호 <span class="star" style="color: #FF5C58;">*</span>
						</h5>
						<input class="uk-input" id="pwd2" name="oldpwd" type="password" placeholder="현재 비밀번호를 입력해주세요" style="height: 44px; width: 300px; text-align: left; padding-left: 10px;" required>
						<div class="pwd4" style="font-size: 12px; font-weight: bold; margin-left: 160px;"></div>
					</div>
				</div>

				<div class="uk-margin-small">
					<div class="uk-inline">
						<h5 class="uk-text-bold">
							변경 비밀번호 <span class="star" style="color: #FF5C58;">*</span>
						</h5>
						<input class="uk-input pwd" id="pwd" name="newpwd" value="" type="password" placeholder="변경할 비밀번호를 입력해주세요" style="height: 44px; width: 300px; text-align: left; padding-left: 10px;">
						<div class="pwd2" style="font-size: 12px; font-weight: bold; margin-left: 160px;"></div>
						<div class="pwd3" style="font-size: 12px; font-weight: bold; margin-left: 160px;"></div>
					</div>
				</div>




				<div class="uk-margin-small">
					<div class="uk-inline">
						<h5 class="uk-text-bold">
							이름 <span class="star" style="color: #FF5C58;">*</span>
						</h5>
						<input class="uk-input name" name="name" value="${loginUser.name}" }type="text" placeholder="이름을 입력해주세요" style="height: 44px; width: 300px; text-align: left; padding-left: 10px;" required>
					</div>
				</div>


				<div class="uk-margin-small">
					<div class="uk-inline">
						<h5 class="uk-text-bold">
							닉네임 <span class="star" style="color: #FF5C58;">*</span>
						</h5>
						<input class="uk-input nickname" name="nickName" value="${loginUser.nickName}" type="text" placeholder="닉네임을 입력해주세요" style="height: 44px; width: 300px; text-align: left;" required>
					</div>
				</div>

				<div class="uk-margin-small">
					<div class="uk-inline">
						<h5 class="uk-text-bold">
							휴대폰 <span class="star" style="color: #FF5C58;">*</span>
						</h5>
						<input class="uk-input phone" id="phone" name="phone" value="${loginUser.phone}" type="text" placeholder="숫자만 입력해주세요" style="height: 44px; width: 300px; text-align: left; padding-left: 10px;" required>
					</div>
				</div>



				<!--------------------------------- 생년월일------------------------------------------------>
				<h5 class="uk-text-bold uk-margin-small ">
					생년월일 <span class="star" style="color: #FF5C58;">*</span>
				</h5>
				<div class="uk-margin-small uk-inline uk-margin-small">
					<div class="birthdaydiv">
						<c:forTokens var="b" items="${loginUser.birthday}" delims="-" varStatus="bs">
							<c:if test="${Integer.parseInt(bs.count) == 1}">
								<input class=" birthday" name="year" type="text" value="${b}" placeholder="YYYY" maxlength='4'>
							</c:if>
						</c:forTokens>
						<c:forTokens var="b" items="${loginUser.birthday}" delims="-" varStatus="bs">
							<c:if test="${Integer.parseInt(bs.count) == 2}">
								<input class=" birthday" name="month" type="text" value="${b}" placeholder="MM" maxlength='2'>
							</c:if>
						</c:forTokens>
						<c:forTokens var="b" items="${loginUser.birthday}" delims="-" varStatus="bs">
							<c:if test="${Integer.parseInt(bs.count) == 3}">
								<input class=" birthday" name="date" type="text" value="${b}" placeholder="DD" maxlength='2'>
							</c:if>
						</c:forTokens>
					</div>
				</div>







				<!--------------------------------- 성별 ------------------------------------------------>
				<div class="uk-margin ">
					<h5 class="uk-text-bold">
						성별 <span class="star" style="color: #FF5C58;">*</span>
					</h5>
					<div class="uk-margin uk-grid-small uk-inline">
						<c:if test="${loginUser.gender == 'M'}">
							<label> <input class="uk-radio gender" name="gender" value='M' type="radio" name="radio2" checked> 남자
							</label>
							<label> <input class="uk-radio gender" name="gender" value='F' type="radio" name="radio2"> 여자
							</label>
						</c:if>
						<c:if test="${loginUser.gender == 'F'}">
							<label> <input class="uk-radio gender" name="gender" value='M' type="radio" name="radio2" checked> 남자
							</label>
							<label> <input class="uk-radio gender" name="gender" value='F' type="radio" name="radio2"> 여자
							</label>
						</c:if>
					</div>
				</div>


				<!--------------------------------- 주소검색 ------------------------------------------------>
				<div>
					<h5 class="uk-text-bold uk-margin-small">
						주소 <span class="star" style="color: #FF5C58;">*</span>
					</h5>


					<!-- for문을 돌려서 varStatus로 .count변수를 가지고오게 (/로 나눈 것의 1번째) 만 가지고오게 하기 -->
					<!-- for문을 전체로 돌릴 경우 br과 버튼도 반복되어 2번 출력되게됨 -->
					<c:forTokens var="a" items="${ loginUser.address}" delims="/" varStatus="vs">
						<c:if test="${Integer.parseInt(vs.count) == 1}">
							<input class="uk-input" type="text" id="sample6_address" value="${a}" name="address1" placeholder="주소">
						</c:if>

					</c:forTokens>
					<button class="uk-inline address uk-button uk-button-primary" type="button" onclick="sample6_execDaumPostcode()">주소검색</button>
					<br>
					<c:forTokens var="a" items="${ loginUser.address}" delims="/" varStatus="as">
						<c:if test="${Integer.parseInt(as.count) == 2}">
							<input class=" uk-input" type="text" id="sample6_detailAddress" value="${a}" name="address2" placeholder="상세주소" style="margin-left: 154px; margin-top: 5px;">
						</c:if>
					</c:forTokens>

				</div>


				<!--------------------------------- 선호입맛 ------------------------------------------------>
				<div class="uk-margin">
					<h5 class="uk-text-bold ">
						선호입맛(1순위) <span class="star" style="color: #FF5C58;">*</span>
					</h5>

					<div class="uk-margin uk-grid-small uk-inline">

						<c:if test="${loginUser.radio3 == '단맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="단맛" checked> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio3 == '짠맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="짠맛" checked> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio3 == '신맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="신맛" checked> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio3 == '매운맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="매운맛" checked> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio3 == '쓴맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio3" value="쓴맛" checked> 쓴맛
							</label>
						</c:if>

					</div>
					<br>

					<h5 class="uk-text-bold ">
						선호입맛(2순위) <span class="star" style="color: #FF5C58;">*</span>
					</h5>
					<div class="uk-margin uk-grid-small uk-inline">

						<c:if test="${loginUser.radio4 == '단맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="단맛" checked> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio4 == '짠맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="짠맛" checked> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio4 == '신맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="신맛" checked> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio4 == '매운맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="매운맛" checked> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio4 == '쓴맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio4" value="쓴맛" checked> 쓴맛
							</label>
						</c:if>

					</div>
					<br>
					<h5 class="uk-text-bold ">
						선호입맛(3순위) <span class="star" style="color: #FF5C58;">*</span>
					</h5>
					<div class="uk-margin uk-grid-small uk-inline">

						<c:if test="${loginUser.radio5== '단맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="단맛" checked> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio5 == '짠맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="짠맛" checked> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio5 == '신맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="신맛" checked> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio5 == '매운맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="매운맛" checked> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="쓴맛"> 쓴맛
							</label>
						</c:if>
						<c:if test="${loginUser.radio5 == '쓴맛'}">
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="단맛"> 단맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="짠맛"> 짠맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="신맛"> 신맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="매운맛"> 매운맛
							</label>
							<label> <input class="uk-radio eat" type="radio" name="radio5" value="쓴맛" checked> 쓴맛
							</label>
						</c:if>

					</div>
					<br>
				</div>


				<div>
					<button class="join" type="submit" style="margin-left: 155px;">수정하기</button>
				</div>

			</form>
			<br>
			<div>
				<a onclick="deleteMember();" class="uk-align-center" style="cursor: pointer;margin-left: 294px;">회원 탈퇴</a>
			</div>
		</div>
		<!-- 유케이 얼라인 센터 -->
	</div>
	<!-- 그리드 닫기 -->
	</div>

	<!-- 회원 탈퇴 -->
	<script>
	 function deleteMember(){
		var bool = confirm('정말 탈퇴하시겠습니까?');
		if(bool){
			location.href = 'deleteMember.me'; 
			}
		}
	  </script>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
	   		//개인정보 동의 체크박스 전체선택 이벤트
		   	const agreeChkAll = document.querySelector('input[name=agree_all]');
		    agreeChkAll.addEventListener('change', (e) => {
		    let agreeChk = document.querySelectorAll('input[name=agree]');
		    for(let i = 0; i < agreeChk.length; i++){
		      agreeChk[i].checked = e.target.checked;
		    }
			});

	   	</script>


	<script>   	

	 	 
		
		
		 var pwdChecked = false; //현재 비밀번호입력한게 맞는지?
		 var pwdChecked2 = false; //비밀번호 유효성 검사 
	
 	   
 	   

 	   
 	   
 	   
 	   
 	   
 	   //비밀번호 인풋창 클릭시
 	   $(function(){
 		   $("#pwd").on("focus",function(){
 			   $('.pwd2').html("✓ 8자 이상/숫자/대문자/소문자/특수문자를 모두 포함");
 		   });
 	   });
 	   

 	  //비밀번호 유효성검사
	$(function(){
	 		
	 		var checkpwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	 		$('#pwd').keyup(function(){
	 			if(!checkpwd.test($('#pwd').val())){
	 				$(".pwd2").css("color",'red');
	 				pwdChecked2 = false;
	 			}else{
	 				$(".pwd2").css("color",'green');
	 				pwdChecked2 =true;
	 			}
	 		});
	 	}); 
 	  
 	  
	//비밀번호 확인 인풋 클릭시
	  $(function(){
		   $("#pwd2").on("focus",function(){
			   $('.pwd4').html("✓ 비밀번호 일치");
		   });
	   });
	  
	  $(function(){

	 		$('#pwd2').keyup(function(){
	 			var pwd = $('#pwd2').val();
	 			$.ajax({
	 				type:'GET',
	 				url:'checkpwd.me?pwd=' + pwd,
	 				success:function(data){
	 					if(data =='true'){
	 						
	 						$('.pwd4').css("color","green");
	 						pwdChecked = true;
	 					}else{
	 						
	 						
	 						$('.pwd4').css("color","red");
	 						pwdChecked = false;
	 					}
	 					
	 					
	 				},
	 				error:function(data){
	 					console.log(data);
	 					
	 				}
	 				
	 				
	 				
	 			});
	 			
	 			
	 			
	 			
	 		
	 		});
	 	}); 
	  
	  //휴대폰 번호 자동 하이픈
	  $(document).on("keyup", ".phone", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
	  
	  
	  //생년월일 숫자만 들어가게
	  $(document).on("keyup", ".birthday", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, ""));
		});
		
	  
	  
	 	//우편번호 까지 가지고 올 수 있음.
	   /*  function sample6_execDaumPostcode() {
	    	$(".address2").append('<input type="text" id="sample6_postcode" placeholder="우편번호"><input type="text" id="sample6_address" placeholder="주소"><br><input type="text" id="sample6_detailAddress" placeholder="상세주소"><input type="text" id="sample6_extraAddress" placeholder="참고항목">');
	    	
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	               
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	       
	    } */
	    
	    
	    //카카오 주소 api
	    function sample6_execDaumPostcode() { //주소입력칸을 클릭하면
	    	/* $(".address2").append('<input type="text" id="sample6_address" placeholder="주소"><br><input type="text" id="sample6_detailAddress" placeholder="상세주소">'); */
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("sample6_address").value = data.address; // 주소 넣기
	                document.getElementById("sample6_detailAddress").focus(); //상세입력 포커싱
	            }
	        }).open();
	    };
	    
	   function insertValidate(){
			if(!pwdChecked) {
			 alert("비밀번호를 확인해주세요.");
			 return false;
		 } else{
			 alert("개인정보 수정이 완료되었습니다.");
			 return true;
			 
		 }
	 }   
	    
	   	</script>

	</div>
	</div>
	</div>




	<!--------------------------------------------------------------------------------->













</body>
</html>