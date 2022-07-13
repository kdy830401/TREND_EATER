<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>TREND EATER</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>


</style>
</head>
<body>

	<c:import url="myPageMenu.jsp"/>

				
					<div class=" uk-align-center">
						<h3 class="uk-heading-bullet">나의 시식 신청</h3>

						
						<table class="uk-table uk-table-middle uk-table-divider">
							<tr>
								<th class = "uk-table-expand">신청 제품명</th>
								<th class = "uk-width-small">신청 일</th>
							</tr>
							<c:forEach var="a" items="${ list }">
							
							<tr>
								<td>${ a.productName }</td>
								<td>${ a.applyDate }</td>
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
					
	<!--------------------------------------------------------------------------------->
					
				
			</div>
			
		</div>















</body>
</html>