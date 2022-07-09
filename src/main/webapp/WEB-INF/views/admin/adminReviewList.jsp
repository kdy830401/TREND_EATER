<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
  <meta name="description" content="Admin, Dashboard, Bootstrap, Bootstrap 4, Angular, AngularJS" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
  <!-- UIkit CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />
<!-- UIkit JS -->
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

  <!-- for ios 7 style, multi-resolution icon of 152x152 -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-barstyle" content="black-translucent">
  <link rel="apple-touch-icon" href="../assets/images/logo.png">
  <meta name="apple-mobile-web-app-title" content="Flatkit">
  <!-- for Chrome on Android, multi-resolution icon of 196x196 -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="shortcut icon" sizes="196x196" href="../assets/images/logo.png">
  
  <!-- style -->
  <link rel="stylesheet" href="../assets/animate.css/animate.min.css" type="text/css" />
  <link rel="stylesheet" href="../assets/glyphicons/glyphicons.css" type="text/css" />
  <link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="../assets/material-design-icons/material-design-icons.css" type="text/css" />

  <link rel="stylesheet" href="../assets/bootstrap/dist/css/bootstrap.min.css" type="text/css" />
  <!-- build:css ../assets/styles/app.min.css -->
  <link rel="stylesheet" href="../assets/styles/app.css" type="text/css" />
  <!-- endbuild -->
  <link rel="stylesheet" href="../assets/styles/font.css" type="text/css" />
<style>
/*  body {  */
/*  	background: #F3F5F7;  */
/*  	font-family: noto sans;  */
/*  }  */

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

.reportQuestion{
	color: rgb(255, 99, 132);
	font-size: 17px;
	font-weight: bold;
}

 textarea {
    resize: none;
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
</head>
<body>
 <c:import url="adminMenubar.jsp" />
  <!-- 하단 끝 -->

<!-- ############ PAGE START 여기에 내용 넣어주세요 -->

	
	<div class="uk-container uk-container-midium" id="review-container">
		<div class="uk-inline" style="margin-top: 30px">
				<input class="uk-input uk-width-medium" id="searchValue" name="seachValue" type="search" placeholder="회원 닉네임을 검색하세요">
				<a class="uk-form-icon uk-form-icon-flip" id="search" href="javascript:void(0)" uk-icon="icon: search"></a>
		</div>
		<h1  id="review-header" class="review-header">
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
			
<!-- 		<div style="margin-right:1px;"> -->
	
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
					</div>
				</div>
							<button class="uk-button uk-button-default uk-button-small"
								type="button" id="chart-button">리뷰 삭제</button>
						<ul class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
							<li>${ rev.flavor1 } / ${ rev.flavor2 } / ${ rev.flavor3 }</li>
						</ul>
						<ul
							class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
<%-- 							<li>${ 상품정보.productNo }</li> --%>
							<li>${ rev.modifyDate }</li>
						</ul>
						<span class="star">★★★★★${ rev.reviewRating }</span>
<!-- 					</div> -->
			</header>
			<!-- 슬라이더 -->
			<div class="uk-position-relative uk-visible-toggle uk-light"
				tabindex="-1" uk-slider>

				<ul
					class="uk-slider-items uk-child-width-1-2 uk-child-width-1-6@m uk-grid">
					<li>
						<span class="uk-panel">
						<c:forEach var="img" items="${ reviewImageList }">
							<c:if test="${ img.reviewNo == rev.reviewNo }">
								<img class="uk-align-center" src="${ contextPath }/resources/reviewImages/${ img.changeName }"  width="400" height="600" alt="리뷰이미지">
							</c:if>
						</c:forEach>
						</span>
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
		
		<ul class="uk-pagination uk-flex-center" uk-margin>
            <!-- [이전] -->
            <c:if test="${ pi.currentPage <= 1 }">
               <li><a href="#" onclick="return false;"><span uk-pagination-previous></span></a></li> &nbsp;
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
               <c:url var="before" value="rlist.bo">
                  <c:param name="page" value="${ pi.currentPage - 1 }"/>
               </c:url>
               <li><a href="${ before }"><span uk-pagination-previous></span></a></li>
            </c:if>
            
            <!-- 페이지 -->
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
               <c:if test="${ p eq pi.currentPage }">
                  <li class="uk-active"><span style="font-weight: bold;">${ p }</span></li>
               </c:if>
               
               <c:if test="${ p ne pi.currentPage }">
                  <c:url var="pagination" value="rlist.bo">
                     <c:param name="page" value="${ p }"/>
                  </c:url>
                   <li><a href="${ pagination }">${ p }</a></li>&nbsp;
               </c:if>
            </c:forEach>
            
            <!-- [다음] -->
            <c:if test="${ pi.currentPage >= pi.maxPage }">
               <li><a href="#" onclick="return false;"><span uk-pagination-next></span></a></li> &nbsp;
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
               <c:url var="after" value="rlist.bo">
                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
               </c:url> 
               <li><a href="${ after }"><span uk-pagination-next></span></a></li>
            </c:if>
     	 </ul>
	
		</div>
<!-- ############ PAGE END 끝~ -->

    </div>
  </div>
  <!-- / -->

  <!-- theme switcher -->

<!-- ############ LAYOUT END-->

  </div>
<!-- build:js scripts/app.html.js -->
<!-- jQuery -->
  <script src="../libs/jquery/jquery/dist/jquery.js"></script>
<!-- Bootstrap -->
  <script src="../libs/jquery/tether/dist/js/tether.min.js"></script>
  <script src="../libs/jquery/bootstrap/dist/js/bootstrap.js"></script>
<!-- core -->
  <script src="../libs/jquery/underscore/underscore-min.js"></script>
  <script src="../libs/jquery/jQuery-Storage-API/jquery.storageapi.min.js"></script>
  <script src="../libs/jquery/PACE/pace.min.js"></script>

  <script src="scripts/config.lazyload.js"></script>

  <script src="scripts/palette.js"></script>
  <script src="scripts/ui-load.js"></script>
  <script src="scripts/ui-jp.js"></script>
  <script src="scripts/ui-include.js"></script>
  <script src="scripts/ui-device.js"></script>
  <script src="scripts/ui-form.js"></script>
  <script src="scripts/ui-nav.js"></script>
  <script src="scripts/ui-screenfull.js"></script>
  <script src="scripts/ui-scroll-to.js"></script>
  <script src="scripts/ui-toggle-class.js"></script>

  <script src="scripts/app.js"></script>

  <!-- ajax -->
  <script src="../libs/jquery/jquery-pjax/jquery.pjax.js"></script>
  <script src="scripts/ajax.js"></script>
<!-- endbuild -->
</body>
</html>
