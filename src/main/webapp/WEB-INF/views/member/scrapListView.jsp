<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<!-- UIkit CSS & JS -->
	<link rel="stylesheet" href="${ contextPath }\resources\css\uikit\uikit.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
	
	<script src="${ contextPath }\resources\js\jquery-3.6.0.min.js"></script> 
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

	<style>
		#test1 td{text-align: center;}
		#test1 td:nth-of-type(3){text-align: left;}
		*{font-family: 'Noto Sans KR'; box-sizing: border-box;}
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
	
				<!--------------------------------------######여기서 부터 넣기------------------------------------------->
				<div class="uk-container uk-container-small" style="width: 100%;">
				<h3 class="uk-heading-bullet">스크랩 보기</h3>
				<table class="uk-table uk-table-middle uk-table-divider">
				    <thead>
				        <tr>
				        	<th class="uk-table-shrink"></th>
				            <th class="uk-width-small">카테고리</th>
				            <th class="uk-table-expand">제품</th>
				            <th class="uk-width-small">바로가기</th>
				        </tr>
				    </thead>
				    <tbody id="test1">
				        <tr>
				        	<td><input class="uk-checkbox" type="checkbox"></td>
				            <td>통조림/간편식</td>
				            <td>
				            	<div>오뚜기 진짜 열쫄면</div>
				            	<small>530개의 리뷰</small>
				            </td>
				            <td><button class="uk-button uk-button-default" type="button">바로가기</button></td>
				        </tr>
				        <tr>
				       		<td><input class="uk-checkbox" type="checkbox"></td>
				            <td>유제품</td>
				            <td>
				            	<div>덴마크 요거밀 흑임자</div>
				            	<small>140개의 리뷰</small>
				            </td>
				            <td><button class="uk-button uk-button-default" type="button">바로가기</button></td>
				        </tr>
				        <tr>
				        	<td><input class="uk-checkbox" type="checkbox"></td>
				            <td>통조림/간편식</td>
				            <td>
				            	<div>팔도 극한체험 불비빔면</div>
				            	<small>135개의 리뷰</small>
				            </td>
				            <td><button class="uk-button uk-button-default" type="button">바로가기</button></td>
				        </tr>
				        <tr>
				       		<td><input class="uk-checkbox" type="checkbox"></td>
				            <td>음료/커피/차</td>
				            <td>
				            	<div>베지밀 고단백두유 검은콩</div>
				            	<small>367개의 리뷰</small>
				            </td>
				            <td><button class="uk-button uk-button-default" type="button">바로가기</button></td>
				        </tr>
				        <tr>
				        	<td><input class="uk-checkbox" type="checkbox"></td>
				            <td>음료/커피/차</td>
				            <td>
				            	<div>웅진 빅토리아 비타비</div>
				            	<small>123개의 리뷰</small>
				            </td>
				            <td><button class="uk-button uk-button-default" type="button">바로가기</button></td>
				        </tr>
				        <tr>
				       		<td><input class="uk-checkbox" type="checkbox"></td>
				            <td>과자/간식</td>
				            <td>
				            	<div>농심 우와한 콩칩</div>
				            	<small>348개의 리뷰</small>
				            </td>
				            <td><button class="uk-button uk-button-default" type="button">바로가기</button></td>
				        </tr>
				    </tbody>
				    <tfoot>
				    	<tr>
				    		<td><input class="uk-checkbox" type="checkbox"></td>
				    		<td></td>
				    		<td></td>
				    		<td><button class="uk-button uk-button-default" type="button">선택 삭제</button></td>
				    	</tr>
				    </tfoot>
				</table>
				<br><br>
				
				<!-- 페이징 처리 -->
				<div>
					<ul class="uk-pagination uk-flex-center" uk-margin>
					    <li><a href="#"><span uk-pagination-previous></span></a></li>
					    <li><a href="#">1</a></li>
					    <li class="uk-disabled"><span>...</span></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li><a href="#">6</a></li>
					    <li class="uk-active"><span>7</span></li>
					    <li><a href="#">8</a></li>
					    <li><a href="#">9</a></li>
					    <li><a href="#">10</a></li>
					    <li class="uk-disabled"><span>...</span></li>
					    <li><a href="#">20</a></li>
					    <li><a href="#"><span uk-pagination-next></span></a></li>
					</ul>
				</div>
				<br><br>
				
				
				</div>
				<!-- -----------------------------------########여기까지 ----------------------------------------------->
				</div>
			</div>
		</div>

				

</body>
</html>