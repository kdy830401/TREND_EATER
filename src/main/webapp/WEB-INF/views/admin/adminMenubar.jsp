<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<meta name="description" content="Admin, Dashboard, Bootstrap, Bootstrap 4, Angular, AngularJS" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- for ios 7 style, multi-resolution icon of 152x152 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-barstyle" content="black-translucent">
<link rel="apple-touch-icon" href="${ pageContext.servletContext.contextPath }/resources/assets/images/logo.png">
<meta name="apple-mobile-web-app-title" content="Flatkit">
<!-- for Chrome on Android, multi-resolution icon of 196x196 -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="shortcut icon" sizes="196x196" href="${ pageContext.servletContext.contextPath }/resources/assets/images/logo.png">

<!-- 제이쿼리 -->
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<!-- style -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/animate.css/animate.min.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/glyphicons/glyphicons.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/font-awesome/css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/material-design-icons/material-design-icons.css" type="text/css" />

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/bootstrap/dist/css/bootstrap.min.css" type="text/css" />
<!-- build:css ../assets/styles/app.min.css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/styles/app.css" type="text/css" />
<!-- endbuild -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/styles/font.css" type="text/css" />

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
a {
	color: rgba(255, 255, 255, 0.87);
}
a:hover {
	text-decoration: none;
	color: white;
}
table{
	font-size: 0.8rem;
}

</style>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
	<div class="app" id="app">

		<!-- ############ LAYOUT START-->

		<!-- aside -->
		<div id="aside" class="app-aside modal fade nav-dropdown">
			<!-- fluid app aside -->
			<div class="left navside dark dk" data-layout="column">
				<div class="navbar no-radius">
					<!-- brand -->
					<a class="navbar-brand">
						<div ui-include="'${ pageContext.servletContext.contextPath }/resources/admin/assets/images/logo.svg'"></div>
						<img src="${ pageContext.servletContext.contextPath }/resources/admin/assets/images/logo.png" alt="." class="hide">
						<div class="clear hidden-folded p-x">
							<span style="text-align: center;">TREND EATER</span>
						</div>
					</a>
					<!-- / brand -->
				</div>
				<div class="hide-scroll" data-flex>
					<nav class="scroll nav-light">
						<div class="b-t">
							<br>
							<div style="text-align: center;">
								<img src="${ pageContext.servletContext.contextPath }/resources/admin/assets/images/a0.jpg" alt="..." class="w-40 img-circle">
							</div>
							<div class="nav-fold">
								<div class="clear hidden-folded p-x">
									<span class="block _500" style="text-align: center;"></span>
									<small class="block text-muted" style="text-align: center;">${adminUser.name}님 환영합니다.</small>
								</div>
							</div>
						</div>


						<ul class="nav" ui-nav>
							<li class="nav-header hidden-folded">
								<small class="text-muted">Admin</small>
							</li>

							<li>
								<a href="adminjoinform.ad">
									<span class="nav-text">관리자 등록</span>
								</a>
							</li>
							<li>
								<a href="member.ad">
									<span class="nav-text">회원 관리</span>
								</a>
							</li>

							<li>
								<a>
									<span class="nav-caret">
										<i class="fa fa-caret-down"></i>
									</span>
									<span class="nav-text">게시판 관리</span>
								</a>
								<ul class="nav-sub nav-mega nav-mega-3">
									<li>
										<a href="prbAdminList.ad">
											<span class="nav-text">제품/리뷰 게시판</span>
										</a>
									</li>
									<li>
										<a href="reviewList.ad">
											<span class="nav-text">리뷰 리스트</span>
										</a>
									</li>
									<li>
										<a href="requestProductList.ad">
											<span class="nav-text">상품 등록 요청 관리</span>
										</a>
									</li>
									<li>
										<a href="applyTaste.ad">
											<span class="nav-text">시식 게시판</span>
										</a>
									</li>
									<li>
										<a href="applyPersonList.ad">
											<span class="nav-text">시식 신청 리스트</span>
										</a>
									</li>
									<li>
										<a href="eventlist.ad">
											<span class="nav-text">이벤트 게시판</span>
										</a>
									</li>
									<li>
										<a href="adminNoticeList.ad">
											<span class="nav-text">공지사항 게시판</span>
										</a>
									</li>
									<li>
										<a href="adminQnaList.ad">
											<span class="nav-text">문의사항 게시판</span>
										</a>
									</li>
								</ul>
							</li>

							<li>
								<a href="orderAdminList.ad">
									<span class="nav-text">주문 관리</span>
								</a>
							</li>


							<li>
								<a href="productList.ad">
									<span class="nav-text">상품 관리</span>
								</a>
							</li>

							<li>
								<a href="reportedReview.ad">
									<span class="nav-text">신고 리뷰 현황</span>
								</a>
							</li>



						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- / -->

		<!-- content -->
		<!-- 상단 시작 -->
		<div id="content" class="app-content box-shadow-z0" role="main">
			<div class="app-header white box-shadow">
				<div class="navbar">
					<span onclick = "location.href = 'adminLogout.ad';" style="text-align: right; margin-top: auto; margin-bottom: auto;cursor:pointer;">로그아웃</span>
				</div>

			</div>
			<!-- 상단 끝  -->
			<!-- 하단 시작 -->
			<div class="app-footer">
				<div class="p-2 text-xs">
					<div class="pull-right text-muted py-1">
						&copy; Copyright
						<strong>TREND EATER</strong>
						<span class="hidden-xs-down">- Built with Love v1.1.3</span>
						<a ui-scroll-to="content">
							<i class="fa fa-long-arrow-up p-x-sm"></i>
						</a>
					</div>
					<div class="nav">
						<a class="nav-link" href="../">About</a>
						<a class="nav-link" href="http://themeforest.net/user/flatfull/portfolio?ref=flatfull">Get it</a>
					</div>
				</div>
			</div>

			<br>
			<div ui-view class="app-body" id="view">
				<!-- 하단 끝 -->

				<!-- ############ PAGE START 여기에 내용 넣어주세요 -->




				<!-- ############ PAGE END 끝~ -->
				
	
	<script>
	//플랜a
	 $(function(){
		 var msg = '${msg}';
		 if(msg != ''){
			 alert(msg);
		 }	
	 });	
	</script>

				
</body>
</html>