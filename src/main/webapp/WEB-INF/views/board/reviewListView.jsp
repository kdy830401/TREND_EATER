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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />




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
	font-size: 30px;
	font-weight: 500;
}
#review-count {
	font-size: 20px;
	color: rgba(255, 99, 132, 0.6);
}
#total-arrange {
	margin-left: 59%;
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


.profileImg{
background: gray; width: 50px; height: 50px; border-radius: 50px;
}

.nofill{
 font-size : 20px;
  font-variation-settings:
  'FILL' 0,
  'wght' 200,
  'GRAD' 100,
  'opsz' 30;
 
}

 .fill{
 font-size : 20px;
  font-variation-settings:
  'FILL' 1,
  'wght' 200,
  'GRAD' 100,
  'opsz' 30;
 
}

.thumb-like {
	font-size: 12px;
}

.thumb{
	cursor: pointer;
	margin: 0 7px 0 30px;
	font-size: 20px;
}

.thumb:hover{
border-color: rgba(255, 99, 132, 0.6);
}

.img{
width: 270px;
height: 180px;
}


</style>
<%--   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }resources/assets/reviewCss/reviewList.css" type="text/css" /> --%>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>	

	<div class="uk-container uk-container-midium" id="review-container">

		<h1  id="review-header" class="review-header">
			리뷰 목록<span id="review-count">(${ pi.listCount })</span>
		</h1>
		<ul
			class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top"
			id="total-arrange">
			 <c:url var="nes" value="rlist.bo">
                    <c:param name="page" value="${ p }"/>
                    <c:param name="pno" value="${ pno }"/>
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
				<div class="uk-grid-medium uk-flex-top" uk-grid>
					<div>
						<c:if test="${ empty rev.changeName }">
							<img class="uk-border-circle" width="40" height="40" src="${ contextPath }/resources/images/avatar.png" alt="프로필사진">
						</c:if>
						<c:if test="${ not empty rev.changeName }">
							<img class="uk-border-circle" width="40" height="40" src="${ contextPath }/resources/uploadFiled/${ rev.changeName }" alt="프로필사진">
						</c:if>
						<div class="uk-inline" >
				<input type="hidden" class="review" name="nickName" value="${ rev.nickName }">
						<a href="someReviewList.bo?nickName=${rev.nickName }" class="uk-text-emphasis uk-text-normal uk-text-default" id="someMember">${ rev.nickName } </a>
						</div>
					</div>
			  
					<div class="uk-width-expand">
						<c:forEach var="like" items="${ likeList }">
							<c:if test="${ like.reviewNo == rev.reviewNo and like.emailId == loginUser.email}">
							<a href="javascript:void(0)" class="thumb">
								<span class="material-symbols-outlined fill">thumb_up</span>
								<span>좋아요</span> <span class="rcount">${ rev.likeCount }</span>
							</a>
							</c:if>
							<c:if test ="${ like.reviewNo == rev.reviewNo and like.emailId != loginUser.email }">
							<a href="javascript:void(0)" class="thumb">
								<span class="material-symbols-outlined nofill">thumb_up</span>
								<span>좋아요</span> <span class="rcount">${ rev.likeCount }</span>
							</a>
	                         </c:if>
	                       
                         </c:forEach>
					</div>
				</div>
				
				
			
	                  
					<div class="uk-margin uk-align-right">
						<div class="uk-inline">
							<button class="uk-button uk-button-default uk-button-small chart-button "
								type="button" aria-haspopup="true" aria-expanded="false">맛 평가</button>
							<div uk-drop="pos: left-center" class="uk-drop">

								<div class="uk-card uk-card-body uk-card-default">
									추천의사
									<c:choose>
									<c:when test="${ rev.recommend == 1 }">
									<div class="star">★ ${  rev.recommend }</div>
									</c:when>
									<c:when test="${ rev.recommend == 2 }">
									<div class="star">★★ ${  rev.recommend }</div>
									</c:when>
									<c:when test="${ rev.recommend == 3 }">
									<div class="star">★★★ ${  rev.recommend }</div>
									</c:when>
									<c:when test="${ rev.recommend == 4 }">
									<div class="star">★★★★ ${  rev.recommend }</div>
									</c:when>
									<c:when test="${ rev.recommend == 5 }">
									<div class="star">★★★★★ ${  rev.recommend }</div>
									</c:when>
									</c:choose>
<%-- 									<div class="star">★★★★★ ${  rev.recommend }</div> --%>
									<br> 
									재구매의사
									<c:choose>
									<c:when test="${ rev.repurcharse == 1 }">
									<div class="star">★ ${  rev.repurcharse }</div>
									</c:when>
									<c:when test="${ rev.repurcharse == 2 }">
									<div class="star">★★ ${  rev.repurcharse }</div>
									</c:when>
									<c:when test="${ rev.repurcharse == 3 }">
									<div class="star">★★★ ${  rev.repurcharse }</div>
									</c:when>
									<c:when test="${ rev.repurcharse == 4 }">
									<div class="star">★★★★ ${  rev.repurcharse }</div>
									</c:when>
									<c:when test="${ rev.repurcharse == 5 }">
									<div class="star">★★★★★ ${  rev.repurcharse }</div>
									</c:when>
									</c:choose>
<%-- 									<div class="star">★★★★★ ${ rev.repurcharse }</div> --%>
									<br>
									<div>매운맛 ${ rev.spicy } </div>
									<div>단맛  ${ rev.sweet }</div>
									<div>쓴맛 ${ rev.bitter }</div>
									<div>짠맛 ${ rev.salty }</div>
									<div>신맛 ${ rev.sour }</div>
								</div>
							</div>

						
						<a href="#modal-center${ rev.reviewNo }" uk-toggle>
							<img class="siren" src="resources/images/siren.png" >
						</a>
					</div>
				</div>
	                  


							<div id="modal-center${ rev.reviewNo }" class="uk-flex-top" uk-modal>
									<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
									<button class="uk-modal-close-default" id="close${ rev.reviewNo }" type="button" uk-close></button>
										<div class="uk-modal-header">
											<h3 class="uk-modal-title">리뷰 신고하기</h3>
				       					</div>
				        			<div class="uk-modal-body">
				        				<p class="reportQuestion">신고하시는 사유가 무엇인가요?</p>
								        	<div><input type="radio" name="reportType" value="1" class="reportType">  욕설/비방</div>
								        	<div><input type="radio" name="reportType" value="2" class="reportType">  스팸/광고</div>
								        	<div><input type="radio" name="reportType" value="3" class="reportType">  음란성</div>
								        	<div><input type="radio" name="reportType" value="4" class="reportType">  양식 위반</div>
								        	<div><input type="radio" name="reportType" value="5" class="reportType">  기타</div>
							        	<br>
											<div class="uk-margin">
					        					<p class="reportQuestion">신고하시는 이유를 알려주세요</p>
					            				<textarea id="reportContent" class="reportContent uk-textarea" name="reportContent" rows="10" placeholder="최소 20자 이상 입력해주세요."></textarea>
									        </div>
									</div>   
				        			<div class="uk-modal-footer uk-text-right">
				            			<button class="uk-button uk-button-default uk-modal-close" type="button">취소</button>
				            			<input type="hidden" class="review" name="reviewNo" value="${ rev.reviewNo }">
				            			<button class="reportReview uk-button uk-button-primary" type="button" id="reportReview_${rev.reviewNo}">신고</button>
				            			
				        			</div>
									</div>
								</div>
<!-- 							신고 하기 끝 -->

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
<%-- 						<span class="star">★★★★★${ rev.reviewRating }</span> --%>
<!-- 					</div> -->

			</header>
			
			<!-- 슬라이더 -->
			
			<div uk-slider="" class="uk-slider uk-slider-container" center="0" sets="0">
                <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" uk-slideshow>
                    <ul class="uk-slider-items uk-child-width-1-2@s uk-child-width-1-4@m uk-grid" style="transform: translate3d(0px, 0px, 0px);">
                    	<c:forEach var="img" items="${ reviewImageList }" varStatus="status">
							<c:if test="${ img.reviewNo == rev.reviewNo }">
                        <li tabindex="-1" class="uk-active" style="">
                            <div class="uk-panel uk-transition-toggle uk-animation-kenburns uk-animation-reverse uk-transform-origin-center-left">
                                <img class="img" src="${ contextPath }/resources/reviewImages/${ img.changeName }" width="400" height="600" alt="리뷰사진">
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
                    <c:param name="pno" value="${ pno }"/>
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
                     <c:param name="pno" value="${ pno }"/>
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
                    <c:param name="pno" value="${ pno }"/>
               </c:url> 
               <li><a href="${ after }"><span uk-pagination-next></span></a></li>
            </c:if>
     	 </ul>
	
		</div>
	
	</div>
	</div>
	<!-- container -->
	
	<!-- 고정 버튼 (탑버튼, 글쓰기 버튼) -->
	<ul class="uk-iconnav uk-iconnav-vertical uk-icon-button uk-margin-small-right" id="tothetop">
    	<li><a href="#" uk-icon="icon: chevron-up; ratio: 2"></a></li>
	</ul>
	<ul class="uk-iconnav uk-iconnav-vertical uk-icon-button uk-margin-small-right" id="write-review">
  	 <li><a href="rinsertView.bo?productNo=${ pno }" uk-icon="icon: file-edit; ratio: 1.5"></a></li>
    </ul>


		<!-- 좋아요 버튼 사용하는 script -->
                    <script>
                    $()
                    
                    
                    $('.thumb').on('click', function(){
                        var reviewNo = $(this).parent().parent().prev().val();
                        var icon = $(this).children().eq(0);
                        var thumb = $(this);
                        var span = $('<span>');
                        var count = $(this).children('.rcount')
                        var num = parseInt(count.text());
                        console.log(count);
                        
                        $.ajax({
                          url: "reviewLike.bo",
                          type: "post",
                          data: { reviewNo : reviewNo},
                          success: function(data){
                              console.log(data);
                              if(data == "insert"){
                                 icon.empty();
                                 span.attr("class","material-symbols-outlined fill");
                                 span.text("thumb_up");
                                 thumb.prepend(span);
                                 num += 1;
                                 count.text(num);
                                 
                              }else if(data == "delete"){
                                 icon.empty();
                                 span.attr("class","material-symbols-outlined nofill");
                                 span.text("thumb_up");
                                 thumb.prepend(span);
                                 num -= 1;
                                 count.text(num);
                              }
                              
                          },
                          error: function(data){
                              console.log(data);
                          }
                          
                        })
                    });
                    
     </script>

    <script>
// 		탑버튼
$( '#tothetop' ).click( function() {
    var htmloffset = $( 'html' ).offset();
    $( 'html, body' ).animate( { scrollTop : review-header }, 400 );
});
</script>

	 <script defer type="text/javascript">	
// 	$(document).on("click",".reportReview", function(){
// 	$('.reportReview${rev.reviewNo}').on('click',function(){
	$("button[id^='reportReview']").on("click", function(e) {
		var rpType = $("input[name='reportType']:checked").val();
		var reviewNo = $(this).prev().val();
		var rpContent = $(this).parent().prev().children().children('textarea').val();
	
		$.ajax({
			url:'reportReview.bo',
			type:'post',
			data:{reviewNo:reviewNo, reportType:rpType, reportContent:rpContent },
			success:function(data){
			if(data == 'success'){
				alert("신고가 완료되었습니다.");
				console.log(rpType);
				console.log(rpContent);
				console.log(reviewNo);
				console.log($('#reportContent').val());
				$('#close'+reviewNo).click();
			} 
				
			},error:function(data){
				alert("신고에 실패하였습니다.");
				console.log(rpType);
				console.log(rpContent);
				console.log(reviewNo);
				
			}
			
			
		});
		
	});


	</script>
 
</body>
</html>

