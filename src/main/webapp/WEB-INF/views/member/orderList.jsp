<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>주문 내역</title>
    <script src="resources/js/jquery-3.6.0.min.js"></script>
    <!-- UIkit CSS -->
	<link rel="stylesheet" href="${ contextPath }/resources/css/uikit.min.css" />
    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
    <style>
    	body{font-family: noto sans;}
        #check{ margin: auto;  width: 60%; height: 60px; padding-bottom: 40px; padding-top: 20px;}
        #check td{text-align: center; border: 1px solid rgb(255, 92, 88);; width: 120px; height: 60px; 
                   color: black;}
        #list{width:800px; margin:auto;}
        
        
        .click:hover{cursor: pointer;}
    </style>

</head>
<body>
	<%-- <c:import url="../common/menubar.jsp"/> --%>
	<c:import url="myPageMenu.jsp" />
    <div>
        <h2>주문 내역</h2>
    </div>

    <table id="check">
    	<!-- forEach 돌려서 배송 준비, 배송 중, 배송 완료, 환불, 취소 해당될 때마다 1씩 증가-->
    	<c:set var="ordered" value="0"/>
    	<c:set var="delivering" value="0"/>
    	<c:set var="complete" value="0"/>
    	<c:set var="refund" value="0"/>
    	<c:set var="cancel" value="0"/>
    	<c:forEach var="i" items='${allOrderList }'>
    		<c:if test="${i.orderStatusName == '주문' || i.orderStatusName == '상품 준비' || i.orderStatusName =='배송 준비' }">
    			<c:set var= "ordered" value="${ordered + 1 }"/>
    		</c:if>
    		<c:if test="${i.orderStatusName == '배송 중'}">
    			<c:set var="delivering" value="${delivering +1 }"/>
    		</c:if>
    		<c:if test="${i.orderStatusName == '배송 완료' }">
    			<c:set var="complete" value="${complete +1 }"/>
    		</c:if>
    		<c:if test="${i.orderStatusName == '환불' }">
    			<c:set var="refund" value="${refund +1 }"/>
    		</c:if>
    		<c:if test="${i.orderStatusName =='취소' }">
    			<c:set var="cancel" value="${cancel +1 }"/>
    		</c:if>
    	</c:forEach>
    	
        <tr>
            <td>
                <p>주문 </p> 
                <p> ${ordered }</p>                  
            </td>
            <td> 
                <p>배송 중</p> 
                <p> ${delivering }</p>  
            </td>
            <td> 
                <p>배송 완료</p> 
                <p> ${complete }</p>  
            </td>
            <td> 
                <p>환불</p> 
                <p> ${refund }</p>  
            </td>
            <td> 
                <p>취소</p> 
                <p>${cancel }</p>  
            </td>
        </tr>
    </table>
    
    <div class="uk-margin">
		<button class="uk-button uk-button-primary" onclick="location.href='qna.do'" id="qna">문의하기</button>
    </div>
    
    <div id="list">
            <table class="uk-table uk-table-divider">
                    <thead>
                        <tr>
                        	<th class="uk-width-small">주문 번호</th>
                            <th class="uk-table-expand">상태</th>
                            <th class="uk-width-small">상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    	<c:forEach var='i' items='${orderList }'>
	                        <tr>
	                        	<td align="center">
	                        		<div> ${i.orderNo }</div>
	                        	</td>
	                            <td>
	                                <p>
	                                    <c:if test="${i.orderStatusName == '주문' || i.orderStatusName == '상품 준비' || i.orderStatusName =='배송 준비' }">                                    	
	                                    	<div>${i.orderDate }에 주문</div>
	                                    	<div>${i.totalPrice }원</div>
	                                    	<div>고객님의 상품을 준비 중입니다</div>
	                                    </c:if>
	                                    <c:if test="${i.orderStatusName == '배송 중'}">
	                                    	<div>${i.orderDate }에 주문</div>
	                                    	<div>${i.totalPrice }원</div>                                  
	                                    	<div>고객님의 상품을 신속하게 배송 중입니다</div>
	                                    </c:if>	  
	                                    <c:if test="${i.orderStatusName == '배송 완료'}">
	                                    	<div>${i.orderDate }에 주문</div>
	                                    	<div>${i.totalPrice }원</div>                                   
	                                    	<div>고객님의 상품이 안전하게 도착했습니다</div>
	                                    </c:if>	
	                                    <c:if test="${i.orderStatusName == '환불' }">
	                                    	<div>주문 번호 ${i.orderNo }이 환불되었습니다</div>
	                                    </c:if>	
	                                    <c:if test="${i.orderStatusName == '취소'}">
	                                    	<div>주문 번호 ${i.orderNo }이 취소되었습니다</div>
	                                    </c:if>		                                    	                                    	                                                                      
	                                </p>
	                            </td>
	                            <td>
	                            	<button class="orderDetail uk-button uk-button-small uk-button-default">상세보기</button>
	                            	<input type="hidden" id="orderNo" name="orderNo" value="${i.orderNo }">
	                            </td>
	                        </tr> 
                        </c:forEach>                    
                    </tbody>
            </table>
    </div>

    
    	<!-- 페이징 처리 -->
	<ul class="uk-pagination uk-flex-center uk-margin-medium" uk-margin>
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
				<c:if test="${ searchValue ne null }">
					<c:param name="searchValue" value="${ searchValue }" />
				</c:if>
				<c:if test="${ value ne null }">
					<c:param name="value" value="${ value }" />
				</c:if>
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
					<c:if test="${ searchValue ne null }">
						<c:param name="searchValue" value="${ searchValue }" />
					</c:if>
					<c:if test="${ value ne null }">
						<c:param name="value" value="${ value }" />
					</c:if>
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
				<c:if test="${ searchValue ne null }">
					<c:param name="searchValue" value="${ searchValue }" />
				</c:if>
				<c:if test="${ value ne null }">
					<c:param name="value" value="${ value }" />
				</c:if>
			</c:url>
			<li>
				<a href="javascript:void(0);">
					<span uk-pagination-next></span>
				</a>
			</li>
		</c:if>
	</ul>
    
    
    <script>
    	$('.orderDetail').on('click', function(){
    		var orderNo = $(this).siblings('#orderNo').val();
    		
    		window.open('orderDetail.or?orderNo='+orderNo, '주문 상세', 'width=1000, height=600');    		
    	});
    
    </script>
</body>
</html>