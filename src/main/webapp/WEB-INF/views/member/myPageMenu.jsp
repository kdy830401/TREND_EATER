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

</style>
</head>
<body>
   <c:import url="../common/menubar.jsp"></c:import>



   <!------------------------------------  여기서부터 ----------------------------------------------------->
   <!------------------------------------ 회원 이름 및 포인트 내역 --------------------------------------------->

   <div class="uk-container uk-margin-large">
      <div class="uk-child-width-expand" uk-grid>
         <div>
            <div class="uk-card uk-card-default uk-card-body">

               <div class="uk-grid  uk-child-width-1-2@m uk-margin" uk-grid>
                  <div class="uk-margin uk-text-center">
                     <!-- 사진이 널일 경우 -->
                     <c:if test="${empty loginUser.changeName}">
                        <img name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/images/profile.png" style="background: gray; width: 50px; height: 50px; margin-top: 10px; border-radius: 50px;">
                     </c:if>

                     <c:if test="${!empty loginUser.changeName}">
                        <img name="profileImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiled/${loginUser.changeName}" style="background: gray; width: 50px; height: 50px; margin-top: 10px; border-radius: 50px;">
                     </c:if>

                  </div>

                  <!-- 사진이 널이 아닐경우 -->
                  <div class="uk-margin-small uk-margin-remove-bottom uk-padding-remove" style="margin-bottom: 0px;">
                     <p style="margin: 0px;">${ loginUser.name }님</p>
                     <p style="margin: 0px;">환영합니다.</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="uk-width-1-5">
            <div class="uk-card uk-card-default uk-card-body ">
               <h3 class="uk-card-title">출석</h3>
               <a href="attendCalendar.me">
         			<c:if test="${ check1 ne true }">
         				출석체크하기
         			</c:if>
         			<c:if test="${ check1 eq true }">
         				출석완료
         			</c:if>
              </a>
            </div>
         </div>
         <div class="uk-width-1-5">
            <div class="uk-card uk-card-default uk-card-body">
               <h3 class="uk-card-title">포인트</h3>
               <a href="pointList.me">${ totalPoint }point</a>
            </div>
         </div>
         <div class="uk-width-1-5">
            <div class="uk-card uk-card-default uk-card-body ">
               <h3 class="uk-card-title">내 리뷰</h3>
               <a href="myReview.me">${ reviewCount }개</a>
            </div>
         </div>
      </div>
   </div>


   <!------------------------------------------ 탭 메뉴바 및 내용 --------------------------------------->


   <div class="uk-container uk-overflow-hidden">
      <div class="uk-grid uk-grid-large-uk-flex-center">
         <aside class="uk-width-1-5 uk-flex-first">
            <ul class="uk-nav uk-nav-default uk-margin-medium-bottom">
               <li>
                  <a href="myPageform.me">내 정보 수정</a>
               </li>
               <li>
                  <a href="myApplyTaste.me">나의 시식 신청</a>
               </li>
               <li>
                  <a href="myReview.me">내 리뷰</a>
               </li>
               <li>
                  <a href="reviewScrapList.me">좋아요한 리뷰</a>
               </li>
               <li>
                  <a href="scrapListView.me">게시글 스크랩</a>
               </li>
               <li>
                  <a href="attendCalendar.me">내 출석</a>
               </li>
               <li>
                  <a href="pointList.me">내 포인트</a>
               </li>
               <li>
                  <a href="orderList.me">주문 관리</a>
               </li>
            </ul>
         </aside>

         <div class="uk-container uk-width-expand" uk-scrollspy="cls:uk-animation-fade">

            <!-- 여기 사이에다가 넣기! -->

            <!-- ------------------------------------------------여기까지 넣어야함------------------------------------------------------------------->

		


</body>

</html>