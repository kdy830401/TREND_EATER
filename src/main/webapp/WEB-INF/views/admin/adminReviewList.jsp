<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>

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

.delete-button {
	margin-left: 600px;
	/* 	color: rgb(255,99,132); */
	border-radius: 35%;
	border-radius: 15px;
	border: none;
	background: none;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
	text-decoration: none;
}

.uk-grid-column-medium>*, .uk-grid-medium>* {
    padding-left: 15px !important;
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
.profileImg{
background: gray; width: 50px; height: 50px; border-radius: 50px;
}

.img2{
	width: 270px !important;
	height: 180px !important;
}

</style>
</head>
<body>
 <c:import url="adminMenubar.jsp" />
  <!-- 하단 끝 -->

<!-- ############ PAGE START 여기에 내용 넣어주세요 -->

	
	<div class="uk-container uk-container-midium" id="review-container">
		<h1  id="review-header" class="review-header">
			리뷰 목록<span id="review-count">${ pi.listCount }</span>
		</h1>
		<ul
			class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top"
			id="total-arrange">
			<c:url var="nes" value="reviewList.ad">
			 <c:param name="p" value="${ p }"/>
               </c:url>
               <li><a href="${ nes }"><span>최신순</span></a></li>
               <li><a href="${ nes }&value=old"><span>오래된순</span></a></li>
               <li><a href="${ nes }&value=likeCount"><span>좋아요순</span></a></li>
               <li><a href="${ nes }&value=reviewRatingHigh"><span>높은 평점순</span></a></li>
               <li><a href="${ nes }&value=reviewRatingLow"><span>낮은 평점순</span></a></li>
		</ul>
			<hr class="first-hr">
			
<!-- 		<div style="margin-right:1px;"> -->
	
		<!-- 내용 -->
		<c:forEach var="rev" items="${ reviewList }">
		<article class="uk-comment">
			<header class="uk-comment-header">
				<input type="hidden" class="review" name="reviewNo" value="${ rev.reviewNo }">
<%-- 				<input type="hidden" class="review" name="emailId" value="${ rev.emailId }"> --%>
				<div class="uk-grid-medium uk-flex-top " uk-grid>
					<div>
						<c:if test="${ empty loginUser.changeName }">
							<img class="uk-border-circle" width="40" height="40" src="${ contextPath }/resources/images/avatar.png" alt="프로필사진">
						</c:if>
						<c:if test="${ not empty loginUser.changeName }">
							<img class="uk-border-circle" width="40" height="40" src="${ contextPath }/resources/uploadFiled/${ loginUser.changeName }" alt="프로필사진">
						</c:if>
<!-- 					<div class="uk-width-expand uk-text-middle"> -->
						<span class="uk-comment-title uk-margin-remove uk-text-middle">${ rev.nickName }</span>
<!-- 					</div> -->
					</div>
					<div class="uk-width-expand">
						<button class="uk-button uk-button-default uk-button-small delete-button uk-align-right" 
						type="button" id="delete-button${ rev.reviewNo }" onclick="deleteReview(this);">리뷰 삭제</button>
						<input type="hidden" name="reviewNo" value="${ rev.reviewNo }">
					
					</div>

					 <c:url var="reviewDelete" value="reviewDelete.ad">
		         		<c:param name="reviewNo" value="${ rev.reviewNo }"/>
		         		<c:param name="page" value="${ pi.currentPage }"/> 
      				</c:url>
      				<input type="hidden" class="reviewNo" name="reviewNo" value="${ rev.reviewNo }">
							<button class="uk-button-small uk-button-default" type="button" onclick="location.href='${ reviewDelete }'">삭제</button>
					</div>


<!-- 				</div> -->
				
						<div class="uk-margin">
								<dl class="uk-description-list uk-description-list-divider">
								<dt>${ rev.flavor1 } / ${ rev.flavor2 } / ${ rev.flavor3 }</dt>
								<dd>${ rev.modifyDate }</dd>
								</dl>
						</div>
						<c:choose>
								<c:when test="${ rev.reviewRating == 1 }">
								<span class="star">★${ rev.reviewRating }</span>
								</c:when>
								<c:when test="${ rev.reviewRating == 2 }">
								<span class="star">★★${ rev.reviewRating }</span>
								</c:when>
								<c:when test="${ rev.reviewRating == 3 }">
								<span class="star">★★★${ rev.reviewRating }</span>
								</c:when>
								<c:when test="${ rev.reviewRating == 4 }">
								<span class="star">★★★★${ rev.reviewRating }</span>
								</c:when>
								<c:when test="${ rev.reviewRating == 5 }">
								<span class="star">★★★★★${ rev.reviewRating }</span>
								</c:when>
							</c:choose>

			</header>
			<!-- 슬라이더 -->
			<div uk-slider="" class="uk-slider uk-slider-container" center="0" sets="0">
                <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" uk-slideshow>
                    <ul class="uk-slider-items uk-child-width-1-2@s uk-child-width-1-4@m uk-grid" style="transform: translate3d(0px, 0px, 0px);">
                    	<c:forEach var="img" items="${ reviewImageList }" varStatus="status">
							<c:if test="${ img.reviewNo == rev.reviewNo }">
                        <li tabindex="-1" class="uk-active" style="">
                            <div class="uk-panel uk-transition-toggle uk-animation-kenburns uk-animation-reverse uk-transform-origin-center-left">
                                <img class="img2" src="${ contextPath }/resources/reviewImages/${ img.changeName }" width="400" height="200" alt="리뷰사진">
                                <div class="uk-position-center uk-panel"><h1 class="uk-transition-slide-bottom-small"></h1></div>
                            </div>
                        </li>
                        	</c:if>
						</c:forEach>
                    </ul>
					 <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
				    <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>

                </div>

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
               <c:url var="before" value="reviewList.ad">
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
                  <c:url var="pagination" value="reviewList.ad">
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
               <c:url var="after" value="reviewList.ad">
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
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/jquery/dist/jquery.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/tether/dist/js/tether.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/bootstrap/dist/js/bootstrap.js"></script>
	<!-- core -->
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/underscore/underscore-min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/jQuery-Storage-API/jquery.storageapi.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/PACE/pace.min.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/config.lazyload.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/palette.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-load.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-jp.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-include.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-device.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-form.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-nav.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/screenfull.js/5.1.0/screenfull.js" integrity="sha512-Dv9aNdD27P2hvSJag3mpFwumC/UVIpWaVE6I4c8Nmx1pJiPd6DMdWGZZ5SFiys/M8oOSD1zVGgp1IxTJeWBg5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-screenfull.js"></script> --%>
		<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-scroll-to.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-toggle-class.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/app.js"></script>

	<!-- ajax -->
	<%-- <script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/jquery-pjax/jquery.pjax.js"></script> --%>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ajax.js"></script>
	<!-- endbuild -->
</body>
</html>
