<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> TREND_EATER </title>

<!-- UIkit CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>

<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/board/boardQnaWriteForm.css">


</head>
<body>

	<c:import url="../common/menubar.jsp" />
	

<div class="head">
    <h2>1:1 문의</h2>
</div>

<div class="main">
   <form action="boardQnaUpdateForm.bo" method="post">
	    <div class="QuesType">
	        <div class="uk-form-select innerQuesType" data-uk-form-select>
	            <div class="innerQuesTypeLeft">
	                <span>유형</span>
	            </div>
	            <div class="innerQuesTypeRight">
	                <select>
	                    <option value="1" name="1">주문/결제/반품/교환문의</option>
	                    <option value="2">이벤트/쿠폰/적립금문의</option>
	                    <option value="3">상품문의</option>
	                    <option value="4">배송문의</option>
	                    <option value="5">상품 누락 문의</option>
	                    <option value="6" name="6">기타문의</option>
	                </select>
	                <c:if test="${ name eq 1 }">
	                    <select>
	                        <option value="">주문취소 해주세요</option>
	                        <option value="">상품 반품을 원해요</option>
	                        <option value="">상품 교환을 원해요</option>
	                        <option value="">주문/결제는 어떻게 하나요?</option>
	                        <option value="">오류로 주문/결제가 안 돼요</option>
	                        <option value="">기타</option>
	                    </select>
	                </c:if>
	            </div>             
	        </div>
	    </div>
	    <div class="QuesProduct">
	
	    </div>
	    <div class="QuesTitle">
	        <span>제목</span>
	        <input class="uk-input" name="qnaTitle" value="${ qna.qnaTitle }">
	        <input type="hidden" name="qnaNo" value="${qna.qnaNo }" > <!-- qnaNo를 컨트롤러로 보내서 어느 게시물이 수정되는지 알려 줘야함  -->
	       <%--  <input type="hidden" name="emailId" value="${qna.emailId }" > --%>
	    </div>
	    <div class="QuesContent">
	        <span>내용</span>
	        <textarea class="uk-textarea" name="qnaContent" value="${ qna.qnaContent }">${qna.qnaContent}</textarea>
	        
	    </div>
	
	
	    <div class="submitButton">
	        <button>수정 완료</button>

	        <button type="button" onclick="location.href='boardQna.bo'">목록으로</button> 
 	        <!--<button onclick="location.href='boardQna.bo'">수정 완료</button> -->

<!-- 	        <button onclick="location.href='boardQna.bo'">목록으로</button> 3번페이지면 3번으로 돌아갈 수 있게 page -->
	<!--         <button onclick="location.href='boardQna.bo?page'">목록으로</button> 3번페이지면 3번으로 돌아갈 수 있게 page -->
	    </div>
	</form> 
</div>

<c:import url="../common/footer.jsp" />
</body>
</html>