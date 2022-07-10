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
<%--   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }resources/assets/reviewCss/reviewList.css" type="text/css" /> --%>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>	

	<div class="uk-container uk-container-midium" id="review-container">

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
<!--  						 <a><i class="fa-regular fa-thumbs-up" id="thumb"></i></a>  -->
<%--  							<span class="thumb-like">${ rev.likeCount }명이 좋아합니다.</span>  --%>
							<c:choose>
		                            	<c:when test = "${empty loginUser }">
		                                	<img id = "thumb" onclick = "alert('로그인 후 이용가능한 서비스 입니다')" src="${ pageContext.servletContext.contextPath }/resources/images/emptyThumb.png" style="width: 20px;">
		                                </c:when>
		                                <c:when test = "${count == 0}">
		                                	<img id = "thumb" onclick = "likeReview();" src="${ pageContext.servletContext.contextPath }/resources/images/emptyThumb.png" style="width: 20px;">
		                                </c:when>
		                                <c:otherwise>
		                                	<img id = "thumb" onclick = "likeDelete();" src="${ pageContext.servletContext.contextPath }/resources/images/thumb.png" style="width: 20px;">
		                                </c:otherwise>
	                       </c:choose>
	                                
	                                	<span>좋아요</span> <span id="rcount">0</span>
					</div>
				</div>
	                  

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
						<a href="#modal-center" uk-toggle>
							<img class="siren" src="resources/images/siren.png">
						</a>
							<div id="modal-center" class="uk-flex-top" uk-modal>
									<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
										<div class="uk-modal-header">
											<h3 class="uk-modal-title">리뷰 신고하기</h3>
				       					</div>
				        			<div class="uk-modal-body">
				        				<p class="reportQuestion">신고하시는 사유가 무엇인가요?</p>
								        	<div><input type="radio" name="reportType" value="1" class="reportType" id="reportType">  욕설/비방</div>
								        	<div><input type="radio" name="reportType" value="2" class="reportType" id="reportType">  스팸/광고</div>
								        	<div><input type="radio" name="reportType" value="3" class="reportType" id="reportType">  음란성</div>
								        	<div><input type="radio" name="reportType" value="4" class="reportType" id="reportType">  양식 위반</div>
								        	<div><input type="radio" name="reportType" value="5" class="reportType" id="reportType">  기타</div>
							        	<br>
											<div class="uk-margin">
				        					<p class="reportQuestion">신고하시는 이유를 알려주세요</p>
				            				<textarea id="reportContent" class="reportContent uk-textarea" name="reportContent" rows="10" placeholder="최소 20자 이상 입력해주세요."></textarea>
									        </div>
									</div>   
				        			<div class="uk-modal-footer uk-text-right">
				            			<button class="uk-button uk-button-default uk-modal-close" type="button">취소</button>
				            			<button class="reportReview uk-button uk-button-primary" type="submit">신고</button>
				        			</div>
									</div>
							</div>
<!-- 							신고 하기 끝 -->
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
	</div>
	
	
	<!-- container -->
	
	<!-- 고정 버튼 (탑버튼, 글쓰기 버튼) -->
	<ul class="uk-iconnav uk-iconnav-vertical uk-icon-button uk-margin-small-right" id="tothetop">
    <li><a href="#" uk-icon="icon: chevron-up; ratio: 2"></a></li>
</ul>
<ul class="uk-iconnav uk-iconnav-vertical uk-icon-button uk-margin-small-right" id="write-review">
    <li><a href="rinsertView.bo" uk-icon="icon: file-edit; ratio: 1.5"></a></li>
    </ul>
    <script type="text/javascript">	
$('.reportReview').on("click",function(){
	var rpType = $('.reportType').val();
	var rpContent = $('.reportContent').val();
	
	$.ajax({
		url:"reportReview.bo",
		type:"post",
		data:{	reportType:rpType, reportContent:rpContent},
		success:function(data){
		if(data == 'success'){
			alert("신고가 완료되었습니다.");
		} 
			
		},error:function(data){
			alert("신고에 실패하였습니다.");
			console.log(data);
			console.log(rpType);
			console.log(rpContent);
			console.log($('#reportContent1').val());
			
		}
		
		
	});
	
});

	</script>
	
    <script>
// 		탑버튼
$( '#tothetop' ).click( function() {
    var htmloffset = $( 'html' ).offset();
    $( 'html, body' ).animate( { scrollTop : review-header }, 400 );
});

</script>
<!-- 좋아요 버튼 사용하는 script -->
	                    <script>
	                    $(function(){
	                    	selectLikeCount();
	                    });
	                    
	                    function selectLikeCount(){
	                    	$.ajax({
	                    		url : "allLike.bo",
	                    		type : "post",
	                    		data : {
	                    			reviewNo : ${rev.reviewNo}
	                    		},
	                    		success : function(list){
	                    			$("#rcount").html(list.length);
	                    		}, error:function(){
	                    			console.log("좋아요 기능 통신 실패!");
	                    		}
	                    	})
	                    }
	                    function likeReview(){
	                    	$.ajax({
	                    		url : "likeInsert.bo",
	                    		type : "post",
	                    		data : {
	                    			reviewNo : ${rev.reviewNo},
	                    			email : ${loginUser.email}
	                    		},
	                    		success : function(status){
	                    			if(status == "success"){ // 좋아요 성공
	                    				$("#thumb").attr("src", '${ pageContext.servletContext.contextPath }/resources/images/thumb.png');
	                    				$("#thumb").attr("onclick", "likeDelete();");
	                    				selectLikeCount();
	                    			}
	                    		}, error:function(){
	                    			console.log("좋아요 실패");
	                    		}
	                    	})
	                    }
	                    function likeDelete(){
	                    	$.ajax({
	                    		url : "likeDelete.bo",
	                    		type : "post",
	                    		data : {
	                    			reviewNo : ${rev.reviewNo},
	                    			email : ${loginUser.email}
	                    		},
	                    		success : function(status){ // 좋아요 취소
	                    			$("#thumb").attr("src", '${ pageContext.servletContext.contextPath }/resources/images/emptyThumb.png');
	                    			$("#thumb").attr("onclick", "likeReview();")
	                    			selectLikeCount();
	                    		}, error : function(){
	                    			console.log("좋아요 취소 실패");
	                    		}
	                    	})
	                    }
	                    </script>

</body>
</html>