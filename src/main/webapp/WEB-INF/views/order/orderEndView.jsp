<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="total" value="0"/>
         <c:forEach var='i' items='${carts}'>
            <c:set var="total" value="${total + (i.productAmount * i.productPrice) }"/>            				
          </c:forEach>

총 ${ total }원 결제를 완료하였습니다.
주문한 상품
<table>
	<tr>
	<th>상품이미지</th>
	<th>상품번호</th>
	<th>상품이름</th>
	<th>상품가격</th>
	<th>주문개수</th>
	</tr>
	<c:forEach var="c" items="${ carts }" varStatus="status">
	          <input type="hidden" value="${ images[status.index].changeName }" name="changeName">
	          <input type="hidden" value="${c.cartNo}" name="cartNo">
	          <input type="hidden" value="${ c.productName }" name="productName">
	          <input type="hidden" value="${ c.productPrice }" name="productPrice">
	          <input type="hidden" value="${ c.productAmount }" name="productAmount">
	          <input type="hidden" value="${ c.emailId }" name="emailId">
	          <input type="hidden" value="${ c.productNo}" name="productNo">
	
		<tr>
			<td><img src="${ contextPath }/resources/productImgUploadFiles/${ images[status.index].changeName }" alt="상품이미지"></td>
			<td>${ c.productNo}</td>
			<td>${ c.productName }"</td>
			<td>${ c.productPrice }</td>
			<td>${ c.productAmount }</td>	
		</tr>
	</c:forEach>
</table>		
	<a href="home.do">메인으로 </a>
</body>
</html>