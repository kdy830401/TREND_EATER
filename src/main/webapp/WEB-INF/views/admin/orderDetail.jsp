<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<!-- UIkit CSS -->
	<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<!-- UIkit CSS -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />
	
	
	<!-- UIkit JS -->
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
	
<style>
	body{font-family:noto sans; text-align:center;}
	.all{border:1px solid rgb(255, 92, 88); width: 800px; height: 500px; margin:auto;}
	table,tr,td{border: 1px solid gray; margin:auto; width: 700px; border-collapse : collapse;}
/* 	#marginCnr{height:100px;} */
	#but{margin:auto; display:block;}
	
</style>
</head>
<body>
<div class="all">
	<table>
		<thead>
			<tr>
				<td>주문 상품</td>
				<td>주문 날짜</td>
				<td>상품 명</td>
				<td>단위 금액</td>
				<td>주문 수량</td>
<!-- 				<td>택배사</td>
				<td>상태</td>
				<td>기타</td> -->
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="i" items="${orderDetailList }">								
						<tr>
							<td>
								<c:forEach var="j" items="${orderImgList }">
									<c:if test="${i.productNo == j.identifyNo }">
										<img src="resources/productImgUploadFiles/${j.changeName}" width="100px" height="100px">
									</c:if>
								</c:forEach>
							</td>
							<td>${i.orderDate }</td>
								<c:forEach var="a" items="${productList }">
									<c:if test="${i.productNo == a.productNo }">
										<td>${a.productName }</td>
										<td>${a.productPrice }</td>
									</c:if>
								</c:forEach>																				
							<td>${i.orderAmount }</td>
		<!-- 					<td>CJ</td>
							<td>배송 중</td>
							<td>담당 택배기사 코로나 확진으로 지연 예정</td> -->
						</tr>			
			</c:forEach>			
		</tbody>
<!-- 		<tfoot>
			<tr>
				<td>총 금액</td>
				<td></td>
			</tr>
		</tfoot> -->
	</table>
	
	<div id="marginCnr">
	
	</div>
	
    <span id="inputBtn">
    <p>
        <button class="uk-button uk-button-danger" onclick="closeWindow()" id="but">확인</button>
    </p>
    </span>
</div>


<script>
	function closeWindow(){
		window.close();
	}
</script>
</body>
</html>