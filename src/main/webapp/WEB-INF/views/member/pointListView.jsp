<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		*{font-family: 'Noto Sans KR'; box-sizing: border-box;}
		th{border-bottom: 1px solid black; text-align: center;}
		#tb{margin: auto; width: 1000px; border-collapse: collapse;}
		#tb tr td{padding: 5px;}
		#buttonTab{border-left: hidden; border-right: hidden;}
		
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
	
	<div class="uk-container uk-container-small" style="width: 100%">
		<ul class="uk-child-width-expand" uk-tab>
			<li><a href="#">전체내역</a></li>
			<li><a href="#">적립</a></li>
			<li><a href="#">사용</a></li>
		</ul>
				
		<ul class="uk-switcher uk-margin">
			<li>
				<table class="uk-table uk-table-divider">
					<thead>
						<tr>
							<th class="uk-width-small">날짜</th>
							<th class="uk-table-expand">내용</th>
							<th class="uk-width-small">적립/사용</th>
						</tr>
					</thead>
				    <tbody>
				    	<c:if test="${ ! empty list }">
						<c:forEach var="p" items="${ list }">
						<tr>
							<td>${ p.pointUpdateDate }</td>
							<td>${ p.categoryName }</td>
							<td>
								<c:if test="${ p.pointStatus eq '적립'}">
									+${ p.pointChange }<br>${ p.pointStatus }완료
								</c:if>
								<c:if test="${ p.pointStatus eq '사용'}">
									-${ p.pointChange }<br>${ p.pointStatus }완료
								</c:if>
							</td>
						</tr>
						</c:forEach>
						</c:if>
						
						<c:if test="${ empty list }">
						<tr>
							<td colspan="3" style="text-align: center;">내역이 존재하지 않습니다.</td>
						</tr>
						</c:if>

				    	<!-- <tr>
							<td>2022.06.17</td>
							<td>우와한 콩칩 시식 신청</td>
							<td>-500p<br>사용완료</td>
				    	</tr>
				    	<tr>
							<td>2022.06.16</td>
							<td>출석 포인트</td>
							<td>+10p<br>적립완료</td>
				    	</tr>
				    	<tr>
							<td>2022.06.16</td>
							<td>가입 보너스</td>
							<td>+500p<br>적립완료</td>
				    	</tr> -->
					</tbody>
				</table>
			</li>
			<li>
				<table class="uk-table uk-table-divider">
				    <thead>
						<tr>
							<th class="uk-width-small">날짜</th>
							<th class="uk-table-expand">내용</th>
							<th class="uk-width-small">적립/사용</th>
						</tr>
					</thead>
				    <tbody>
				    	<c:if test="${ ! empty list }">
						<c:forEach var="p" items="${ list }">
							<c:if test="${ p.pointStatus eq '적립'}">
							<tr>
								<td>${ p.pointUpdateDate }</td>
								<td>${ p.categoryName }</td>
								<td>
									+${ p.pointChange }<br>${ p.pointStatus }완료
								</td>
							</tr>
							</c:if>
						</c:forEach>
						</c:if>
						
						<c:if test="${ empty list }">
						<tr>
							<td colspan="3" style="text-align: center;">내역이 존재하지 않습니다.</td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</li>
			<li>
				<table class="uk-table uk-table-divider">
				    <thead>
						<tr>
							<th class="uk-width-small">날짜</th>
							<th class="uk-table-expand">내용</th>
							<th class="uk-width-small">적립/사용</th>
						</tr>
					</thead>
				    <tbody>
				    	<c:if test="${ ! empty list }">
						<c:forEach var="p" items="${ list }">
							<c:if test="${ p.pointStatus eq '사용'}">
							<tr>
								<td>${ p.pointUpdateDate }</td>
								<td>${ p.categoryName }</td>
								<td>
									-${ p.pointChange }<br>${ p.pointStatus }완료
								</td>
							</tr>
							</c:if>
						</c:forEach>
						</c:if>
						
						<c:if test="${ empty list }">
						<tr>
							<td colspan="3" style="text-align: center;">내역이 존재하지 않습니다.</td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</li>
		</ul>
	</div>

	</div>
	
	<br><br><br><br>
</body>
</html>