<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<!-- UIkit CSS -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />


<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/animate.css/animate.min.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/glyphicons/glyphicons.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/font-awesome/css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/material-design-icons/material-design-icons.css" type="text/css" />

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/bootstrap/dist/css/bootstrap.min.css" type="text/css" />
<!-- build:css ../assets/styles/app.min.css  -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/styles/app.css" type="text/css" />
<!-- endbuild -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/styles/font.css" type="text/css" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">





<style>
 body { 
 	background: #F3F5F7; 
 	font-family: noto sans; 
 } 

#review-container {
	margin-top: 120px;
	background: white;
}

#review-header {
	margin-top: 30px;
	padding: 15px 15px;
	/*  상자내부 간격 : 위아래 5px, 오른쪽왼쪽 15px  */
	font-size: 30px;
	font-weight: 500;
}

#review-count {
	font-size: 15px;
	color: rgba(255, 99, 132, 0.6);
}

#total-arrange {
	margin-left: 65%;
}

.arrange {
	font-size: 8px;
}

.uk-text-light {
	margin-top: 50px;
	margin-bottom: 50px;
	font-size: 25px;
	padding: 30px;
}

.uk-comment {
	/* 	margin-top: 100px; */
	
}

.uk-child-width-expand {
	font-size: 30px;
}

.star {
	color: rgb(255, 99, 132);
	font-size: 23px;
}

#thumb {
	margin: 0 7px 0 30px;
	font-size: 20px;
	color: black;
}

.thumb-like {
	font-size: 12px;
}

#chart-button {
	margin-left: 700px;
	/* 	color: rgb(255,99,132); */
	border-radius: 35%;
	border-radius: 15px;
	border: none;
	background: none;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
	text-decoration: none;
}

.siren {
	height: 32px;
	weight: 32px;
	margin: 0 0 5px 20px;
}
.first-hr{
margin-bottom: 50px;

}
.comment-hr{
margin: 50px 0 50px 0; 
}

.uk-pagination{
margin-top: 150px;
}

.good{
	font-size: 16px;
	font-weight: 700px;
	font-color: rgb(255,99,132);
}
.bad{
	font-size: 16px;
	font-weight: 700px;
	font-color: rgb(255,99,132);
}
#tothetop{
/* background-color: rgba(255, 99, 132, 0.3); */
position: fixed; 
bottom: 1rem; 
right: 1rem; 
cursor: pointer; 
padding-bottom: 10px;
width: 50px;
height: 50px;
box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
}

#write-review{
background-color: rgba(255, 99, 132, 0.3);
icon-color: red;
position: fixed; 
bottom: 5rem; 
right: 1rem; 
cursor: pointer; 
padding-bottom: 10px;
width: 50px;
height: 50px;
box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
}

</style>
  <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }resources/assets/reviewCss/reviewList.css" type="text/css" />
</head>
<body>
	<c:import url="../common/menubar.jsp"/>	

	<div class="uk-container uk-container-midium" id="review-container">

		<h1  id="review-header">
			리뷰 목록<span id="review-count">${ pi.listCount }</span>
		</h1>
		<ul
			class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top"
			id="total-arrange">
			<li class="arrange"><a href="">최신순</a></li>
			<li class="arrange"><a href="">추천순</a></li>
			<li class="arrange"><a href="">높은 평점순</a></li>
			<li class="arrange"><a href="">낮은 평점순</a></li>
		</ul>
			<hr class="first-hr">

		<!-- 내용 -->
		<c:forEach var="rev" items="${ reviewList }">
		<article class="uk-comment">
			<header class="uk-comment-header">
				<input type="hidden" class="review" name="reviewNo" value="${ rev.reviewNo }">
				<div class="uk-grid-medium uk-flex-top" uk-grid>
					<div>
						<a href=""><img class="uk-border-circle" width="40" height="40" src="" alt="프로필사진"></a>
					</div>
					<div class="uk-width-expand">
						<span class="uk-comment-title uk-margin-remove"><a class="uk-link-reset" href="#">${ rev.nickName }</a></span>
						 <a><i class="fa-regular fa-thumbs-up" id="thumb"></i></a>
							<span class="thumb-like">${ rev.likeCount }명이 좋아합니다.</span>
						<div class="uk-inline">
							<button class="uk-button uk-button-default uk-button-small"
								type="button" id="chart-button">맛 평가</button>
							<div uk-drop="pos: right-bottom">
								<div class="uk-card uk-card-body uk-card-default">
									추천의사<div class="star">★★★★★ ${ rev.recommend }</div>
									<br> 
									재구매의사<div class="star">★★★★★ ${ rev.repurcharse }</div>
									<br>
									<div>매운맛 ${ rev.spicy } </div>
									<div>단맛  ${ rev.sweet }</div>
									<div>쓴맛 ${ rev.bitter }</div>
									<div>짠맛 ${ rev.salty }</div>
									<div>신맛 ${ rev.sour }</div>
								</div>
							</div>
						</div>
						<a><span><img class="siren"
								src="resources/images/siren.png"></span></a>
						<ul
							class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
							<li>${ m.flavor1 } / ${ m.flavor2 } / ${ m.flavor3 }</li>
						</ul>
						<ul
							class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
<%-- 							<li>${ 상품정보.productNo }</li> --%>
							<li>${ rev.modifyDate }</li>
						</ul>
						<span class="star">★★★★★${ rev.reviewRating }</span>
					</div>
				</div>
			</header>
			<!-- 슬라이더 -->
			<div class="uk-position-relative uk-visible-toggle uk-light"
				tabindex="-1" uk-slider>

				<ul
					class="uk-slider-items uk-child-width-1-2 uk-child-width-1-6@m uk-grid">
					<li>
						<div class="uk-panel">
							<img src="${ contextPath }/resources/reviewImages/${ img.changeName }" width="400" height="600"
								alt="리뷰이미지">
						</div>
					</li>
				</ul>
				<a class="uk-position-center-left uk-position-small uk-hidden-hover"
					href="#" uk-slidenav-previous uk-slider-item="previous"></a> <a
					class="uk-position-center-right uk-position-small uk-hidden-hover"
					href="#" uk-slidenav-next uk-slider-item="next"></a>

			</div>
			<!-- 슬라이더 끝 -->
			<div class="uk-comment-body">
				<br>

				<ul uk-accordion > 
					<li><a
						class="uk-accordion-title" href="#" style="font-size: 15px;">
						내용 더보기</a>
						<div class="uk-accordion-content" style="font-size: 15px">
							<div class="good"><b>좋은 점</b></div>
							<p>${ rev.good }</p>
							<div class="bad"><b>아쉬운 점</b></div>
							<p>${ rev.bad }</p>

						</div></li>
				</ul>
			</div>
			<hr class="comment-hr">
		</article>
		</c:forEach>
		<!-- 코맨트 끝 -->
		

		<!-- 페이지네이션 -->
		<ul class="uk-pagination uk-flex-center" uk-margin>
		    <li><a href="#"><span uk-pagination-previous></span></a></li>
		    <li class="uk-active"><span>1</span></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li><a href="#"><span uk-pagination-next></span></a></li>
		</ul>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	<!-- container -->
	
	<!-- 고정 버튼 (탑버튼, 글쓰기 버튼) -->
	<ul class="uk-iconnav uk-iconnav-vertical uk-icon-button uk-margin-small-right" id="tothetop">
    <li><a href="#" uk-icon="icon: chevron-up; ratio: 2"></a></li>
</ul>
<ul class="uk-iconnav uk-iconnav-vertical uk-icon-button uk-margin-small-right" id="write-review">
    <li><a href="rinsertView.bo" uk-icon="icon: file-edit; ratio: 1.5"></a></li>
    </ul>
    
    <script>
// 		탑버튼
$( '#tothetop' ).click( function() {
    var htmloffset = $( 'html' ).offset();
    $( 'html, body' ).animate( { scrollTop : #review-header }, 400 );
});
	</script>
</body>
</html>