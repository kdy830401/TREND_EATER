<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>TREND EATER</title>
	<!-- UIkit CSS & JS -->
	<link rel="stylesheet" href="${ contextPath }\resources\css\uikit\uikit.css" />
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
	
	<script src="${ contextPath }\resources\js\jquery-3.6.0.min.js"></script> 
	
	<!-- font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<style>
		*{font-family: 'Noto Sans KR'; box-sizing: border-box}
		
		body {
			font-family: "Lato", sans-serif;
		}
		
		/*탭전체 아래로 내리기*/
		.tabdiv {
			margin-top: 50px;
		}
		
		/* Style the tab */
		.tab {
			float: left;
			/*   border: 1px solid #ccc; */
			/*  background-color: white; */
			width: 200px;
			height: 150px;
		}
		
		/* Style the buttons inside the tab */
		.tab button {
			display: block;
			background-color: inherit;
			color: black;
			padding-left: 16px;
			width: 200px;
			/*  border: none; */
			outline: none;
			text-align: left;
			cursor: pointer;
			transition: 0.3s;
			font-size: 14px;
			border: 1px solid #ccc;
			height: 55px;
		}
		
		/* Change background color of buttons on hover */
		.tab button:hover {
			background-color: #F5F5F5;
		}
		
		/* Create an active/current "tab button" class */
		.tab button.active {
			background-color: #F5F5F5;
		}
		
		/* Style the tab content */
		.tabcontent {
			float: top;
			padding: 0px 10px;
			/*  border: 1px solid #ccc; */
			width: 70%;
			border-left: none;
			/*  height: 500px; */
		}
	</style>
</head>
<body>
	<c:import url="myPageMenu.jsp"/>
	
	<div class="uk-container uk-container-small">
		<h3 class="uk-heading-bullet">내가 쓴 리뷰 보기</h3>
		<div class="uk-overflow-auto">
			<table class="uk-table uk-table-middle uk-table-divider">
				<thead>
					<tr>
						<th class="uk-table-shrink"></th>
						<th class="uk-table-expand"></th>
						<th class="uk-table-shrink"></th>
					</tr>
				</thead>
		        <tbody>
		        	<c:if test="${ ! empty list }">
		        	<c:forEach var="r" items="${ list }">
					<tr class="contentTr">
						<td>
<%-- 							<c:forEach var="img" items="${ reviewImageList }" begin="0" end="1"> --%>
<%-- 							<c:if test="${ img.reviewNo eq r.reviewNo }"> --%>
<%-- 								<img class="uk-preserve-width" src="${ contextPath }/resources/reviewImages/${ img.changeName }" width="200" height="200" alt="리뷰이미지"> --%>
<%-- 							</c:if> --%>
<%-- 							</c:forEach> --%>
						</td>
						<td>
							<h4>${ r.productName }</h4>
							<div>${ r.nickName }</div>
							<div>${ r.flavor1 }/${ r.flavor2 }/${ r.flavor3 }</div>
							<div>
								${ r.reviewRating }/5점 (<small>${ r.likeCount }명이 좋아합니다</small>)
							</div>
							<div>${ r.good }</div>
							<div>${ r.bad }</div>
							<c:url var="rdelete" value="deleteMyReview.me">
								<c:param name="rNo" value="${ r.reviewNo }"/>
							</c:url>
						</td>
						<td><a href="${ rdelete }" uk-icon="trash" style="width: 50px"></a></td>
					</tr>
					</c:forEach>
					</c:if>
					
					<c:if test="${ empty list }">
					<tr>
						<td colspan="3" style="text-align: center;">작성한 리뷰가 존재하지 않습니다.</td>
					</tr>
					</c:if>
					
					<!-- 이미지 주소 수정, 바로가기는 리뷰 디테일이 없어서 빼기로 -->
				</tbody>
				<tfoot>
					<tr>
				    	<td></td>
				    	<td></td>
				    	<td></td>
					</tr>
				</tfoot>
			</table>
			<br><br>
		</div>
				
		<!-- 페이징 처리 -->
		<div>
			<ul class="uk-pagination uk-flex-center uk-margin-medium-top" uk-margin>
				<c:if test="${ pi.currentPage <= 1 }">
					<li>
						<a href="#">
							<span uk-pagination-previous></span>
						</a>
					</li>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="reviewScrapList.me">
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
						<c:url var="pagination" value="reviewScrapList.me">
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
					<c:url var="after" value="reviewScrapList.me">
						<c:param name="page" value="${ pi.currentPage + 1 }" />
					</c:url>
					<li>
						<a href="#">
							<span uk-pagination-next></span>
						</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 처리 끝  -->
		<br><br>
	</div>
	</div>

</body>
</html>