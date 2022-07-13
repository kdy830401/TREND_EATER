<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>

<style type="text/css">
.uk-breadcrumb>:nth-child(n+2):not(.uk-first-column)::before {
	margin: 0 5px 0 calc(5px - 4px) !important;
}
.date {
	width: 355px;
}
* {
	word-break: keep-all;
}

#report-header {
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
</style>
</head>
<body>

	<c:import url="adminMenubar.jsp" />
	<!-- 하단 끝 -->

<!-- ############ PAGE START 여기에 내용 넣어주세요 -->
   <div class="uk-container uk-container-midium uk-tile-default uk-margin-medium uk-padding-small" id="container">
   <h1 id="report-header" class="report-header uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-medium">
      신고된 리뷰 목록<span id="review-count">(${reportCount})</span>
   </h1>
   
   
 				<c:url var="nes" value="reportedReview.ad">
 				 <c:param name="reportNo" value="${ reportNo }"/>
               </c:url>
               <ul class="uk-breadcrumb uk-align-right">
               <li><a href="${ nes }"><span>최신순</span></a></li>
               <li><a href="${ nes }&value=old"><span>오래된순</span></a></li>
               <li><a href="${ nes }&value=reportType"><span>신고 종류순</span></a></li>
               </ul>
   <table class="table table-hover b-t">
    <thead>
        <tr id="table-title">
           <th></th>
            <th class="uk-width-small">리뷰 번호</th>
            <th>신고자</th>
            <th>신고일</th>
            <th>신고 종류</th>
            <th>신고 내용</th>
            <th>신고 확인</th>
            <th>해당 리뷰 삭제</th>
        </tr>
    </thead>
	<c:forEach var="rp" items="${reportList}" varStatus="status">
   <form action="reportConfirm.ad?=${rp.reportNo }" method="post">
    <tbody>
        <tr>
           <td><input type="hidden" class="reportNo" name="reportNo" value="${ rp.reportNo }"></td>
            <td>${rp.reviewNo}</td>
            <td>${rp.emailId}</td>
            <td>${rp.reportDate}</td>
          	<td>
            <c:if test="${ rp.reportType == 1 }">
			욕설/비방
       		 </c:if>
            <c:if test="${ rp.reportType == 2 }">
			스팸/광고
       		 </c:if>
            <c:if test="${ rp.reportType == 3 }">
			음란성
       		 </c:if>
            <c:if test="${ rp.reportType == 4 }">
         	   양식 위반	
       		 </c:if>
            <c:if test="${ rp.reportType == 5 }">
			기타
       		 </c:if>
       		</td>
<%--             <td>${rp.reportType }</td> --%>
            <td>${rp.reportContent }</td>
            
            <c:url var="reviewDelete" value="deleteReview.ad">
         		<c:param name="reviewNo" value="${ rp.reviewNo }"/>
         		<c:param name="page" value="${ pi.currentPage }"/> 
      		</c:url>
            <td><button class="uk-button-small uk-button-default">확인</button></td>
            <input type="hidden" class="reportNo" name="reportNo" value="${ rp.reportNo }">
            <td><button class="uk-button-small uk-button-default" type="button" onclick="location.href='${ reviewDelete }'">삭제</button></td>
<%-- 				<td><a href="javascript:void(0)" uk-icon="trash" id="delete${ rp.reviewNo }"></a></td> --%>
       		</form>
       </tr>
    </c:forEach>
    </tbody>
</table>

	<ul class="uk-pagination uk-flex-center" uk-margin>
            <!-- [이전] -->
            <c:if test="${ pi.currentPage <= 1 }">
               <li><a href="#" onclick="return false;"><span uk-pagination-previous></span></a></li> &nbsp;
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
               <c:url var="before" value="reportedReview.ad">
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
                  <c:url var="pagination" value="reportedReview.ad">
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
               <c:url var="after" value="reportedReview.ad">
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
	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/jquery/dist/jquery.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/tether/dist/js/tether.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/bootstrap/dist/js/bootstrap.js"></script>
	<!-- core -->
	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/underscore/underscore-min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/jQuery-Storage-API/jquery.storageapi.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/PACE/pace.min.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/config.lazyload.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/palette.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-load.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-jp.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-include.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-device.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-form.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-nav.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/screenfull.js/5.1.0/screenfull.js" integrity="sha512-Dv9aNdD27P2hvSJag3mpFwumC/UVIpWaVE6I4c8Nmx1pJiPd6DMdWGZZ5SFiys/M8oOSD1zVGgp1IxTJeWBg5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-screenfull.js"></script> --%>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-scroll-to.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-toggle-class.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/app.js"></script>

	<!-- ajax -->
	<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/jquery-pjax/jquery.pjax.js"></script> --%>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ajax.js"></script>
	<!-- endbuild -->
</body>
</html>