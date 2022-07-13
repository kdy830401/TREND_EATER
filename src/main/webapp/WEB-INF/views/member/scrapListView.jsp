<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>TREND EATER</title>
	<!-- UIkit CSS & JS -->
	<link rel="stylesheet" href="${ contextPath }\resources\css\uikit\uikit.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
	
	<script src="${ contextPath }\resources\js\jquery-3.6.0.min.js"></script> 
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

	<style>
	
	</style>

</head>
<body>
	<c:import url="myPageMenu.jsp"/>
	
				<!--------------------------------------######여기서 부터 넣기------------------------------------------->
				<div class="uk-align-center">
				<h3 class="uk-heading-bullet">스크랩 보기</h3>
				<table class="uk-table uk-table-middle uk-table-divider">
				        <tr>
				            <th class="uk-table-expand">제품</th>
				            <th class="uk-width-small">바로가기</th>
				        </tr>
				        <c:forEach var="s" items="${ list }">
				        <tr>
				            <td>
				            	<div>${ s.productName }</div>
				            	<small>${ s.reviewCount }개의 리뷰</small>
				            </td>
				            <td><button class="uk-button uk-button-default" type="button" onclick='location.href="prbdetail.bo?pno=${ s.productNo }"'>바로가기</button></td>
				        </tr>
				        </c:forEach>
				      
				</table>
			
				
					<!-- 페이징 처리 -->
		<ul class="uk-pagination uk-flex-right uk-margin-medium-top" uk-margin>
			<c:if test="${ pi.currentPage <= 1 }">
				<li>
					<a href="javascript:void(0);">
						<span uk-pagination-previous></span>
					</a>
				</li>
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="${ loc }">
					<c:param name="page" value="${ pi.currentPage -1 }" />
				</c:url>
				<li>
					<a href="${ before }">
						<span uk-pagination-previous></span>
					</a>
				</li>
			</c:if>

			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<li class="uk-active">
						<span>${ p }</span>
					</li>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="pagination" value="${ loc }">
						<c:param name="page" value="${ p }" />
					</c:url>
					<li>
						<a href="${ pagination }">${ p }</a>
					</li>
				</c:if>
			</c:forEach>

			<c:if test="${ pi.currentPage >= pi.maxPage }">
				<li>
					<a href="#">
						<span uk-pagination-next></span>
					</a>
				</li>
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="${ loc }">
					<c:param name="page" value="${ pi.currentPage + 1 }" />
				</c:url>
				<li>
					<a href="javascript:void(0);">
						<span uk-pagination-next></span>
					</a>
				</li>
			</c:if>
		</ul>
		<!-- 페이징 처리 끝  -->
				
				
				</div>
				<!-- -----------------------------------########여기까지 ----------------------------------------------->
			</div>
		</div>

				

</body>
</html>