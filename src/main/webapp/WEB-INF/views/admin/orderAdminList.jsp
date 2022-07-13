<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>주문 관리</title>
   <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<!-- UIkit CSS -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />
	
	
	<!-- UIkit JS -->
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>

    <style>
    	body{font-family: noto sans;}
/*         #check{ margin: auto; width: 80%; height: 60px; padding-bottom: 40px;} */
         #check td, #check th{text-align: center; border: 1px solid #f1f3f5; width: 120px; height: 60px; font-weight: bold;} 
        #search{margin: auto; width: 70%; align:center;}
        .button{background-color: rgb(255, 92, 88); border: 1px solid #f1f3f5; color: white;}
/*         #navOrder{padding-top: 50px; padding-bottom: 50px; padding-left: 200px;} */
/*         #orderList{margin: auto; padding-top:20px; text-align: center; width: 70%; background-color: rgb(218, 218, 218); height:600px;} */
/*         #orderCate{padding-bottom: 20px; font-size: large; border: 1px solid black;; height: 30px;} */
		#orderCate tr td{font-weight: bold;}
        .chooseOrderStatus:hover{cursor:pointer;}
    </style>
</head>
<body>
	<c:import url="adminMenubar.jsp" />


    <div class="uk-container uk-tile uk-tile-default uk-padding-small uk-margin-medium">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-medium">주문관리</h2>
	  
	
   
	<!-- 주문 상태 중계 -->
    <table id="check" class="table table-hover b-t">
    	<!-- forEach 돌려서 배송 준비, 배송 중, 배송 완료, 환불, 취소 해당될 때마다 1씩 증가-->
    	<c:set var="ordered" value="0"/>
    	<c:set var="preparingPdt" value="0"/>
    	<c:set var="preparingDlv" value="0"/>
    	<c:set var="delivering" value="0"/>
    	<c:set var="complete" value="0"/>
    	<c:set var="refund" value="0"/>
    	<c:set var="cancel" value="0"/>
    	<c:forEach var="i" items='${orderCountList }'>
    		<c:if test="${i.orderStatusName == '주문'}">
    			<c:set var= "ordered" value="${ordered + 1 }"/>
    		</c:if>
    		<c:if test="${i.orderStatusName == '상품 준비'}">
    			<c:set var= "preparingPdt" value="${ordered + 1 }"/>
    		</c:if>
    		<c:if test="${i.orderStatusName =='배송 준비' }">
    			<c:set var= "preparingDlv" value="${ordered + 1 }"/>
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
                <p>주문 접수</p> 
                <p> ${ordered }</p>                  
            </td>
            <td>
                <p>상품 준비</p> 
                <p> ${preparingPdt }</p>                  
            </td>
            <td>
                <p>배송 준비</p> 
                <p> ${preparingDlv }</p>                  
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
    </div> 

	<!-- 검색 창 -->
<!-- 	<form action="searchAdminOrder.sp" method="post">
	    <div id="search">
  	    	<select name="selectCategory">
	    		<option value="주문">주문</option>
	    		<option value="환불">환불</option>
	    		<option value="취소">취소</option>
	    		<option value="상품 준비">상품 준비</option>
	    		<option value="배송 준비">배송 준비</option>
	    		<option value="배송 중">배송 중</option>
	    		<option value="배송 완료">배송 완료</option>
	    	</select> 
			<input type="text" name="keyword" autocomplete="off" id="keyword" outline="none">
			<input type="submit" value="검색" class="button">
	    </div>
    </form> -->

	<!-- 관리 창 -->
    <div id="navOrder" class="uk-container uk-tile uk-tile-default uk-text-center uk-padding-medium">
        <ul class="uk-breadcrumb">
                <li><a href="${pageContext.request.contextPath}/admin/orderAdminList.ad">전체</a></li>
                <li>
	                <a class="selectedList" id="ordered">주문 접수</a>
	                <input type="hidden" name="ordered" value="주문">
                </li>                
                <li>
                	<a class="selectedList" id="refund">환불</a>
                	<input type="hidden" name="refund" value="환불">
                </li>
                <li>
                	<a class="selectedList" id="cancel">취소</a>
                	<input type="hidden" name="cancel" value="취소">
                </li>
                <li>
               		<a class="selectedList" id="preparingPdt" >상품 준비</a>
               		<input type="hidden" name="preparingPdt" value="상품 준비">
                </li>
                <li>
                	<a class="selectedList" id="preparingDlv" >배송 준비</a>
                	<input type="hidden" name="preparingDlv" value="배송 준비">
                </li>
                <li>
                	<a class="selectedList" id="delivering" >배송 중</a>
                	<input type="hidden" name="delivering" value="배송 중">
                </li>
                <li>
                	<a class="selectedList" id="complete" >배송 완료</a>
                	<input type="hidden" name="complete" value="배송 완료">
                </li>
 
                <!-- <li><span></span></li> -->
        </ul>
    </div>
	<div class="uk-container uk-tile uk-tile-default uk-padding-remove-top">
	<!-- 주문 목록 -->
    <table id="orderList" class="table table-hover b-t">
        <thead id="orderCate">
            <tr>
                <td>주문번호</td>
                <td>주문자명</td>
                <td>주문 방법</td>
                <td>결제 금액</td>
                <td>주문 상태</td>
                <td>상세보기</td>
            </tr>
         </thead>
         
         
         <tbody>
         	<c:forEach var="i" items="${orderAdminList}">
	            <tr>
	                <td>${i.orderNo }</td>
	                <td>${i.email }</td>
	                <td>카드 결제</td>
	                <td>${i.totalPrice }</td>
	                <td id="info">
	                    <!-- ajax -->
	                    	<input type="hidden" id="orderNo" name="orderNo" value="${i.orderNo }">	                    	
	                    	<input type="hidden" name="originStatus" value="${i.orderStatusName }">                    	
	                        <select class="uk-text-middle" id="newStatus" name="newStatus">
	                            <option id="ordered" value="주문" <c:if test="${i.orderStatusName == '주문'}">selected</c:if>>주문접수</option>
	                            <option id="refund" value="환불" <c:if test="${i.orderStatusName == '환불'}">selected</c:if>>환불</option>
	                            <option id="cancel" value="취소" <c:if test="${i.orderStatusName == '취소'}">selected</c:if>>주문취소</option>
	                            <option id="preparingPdt" value="상품 준비" <c:if test="${i.orderStatusName == '상품 준비'}">selected</c:if>>상품 준비</option>
	                            <option id="preparingDlv" value="배송 준비" <c:if test="${i.orderStatusName == '배송 준비'}">selected</c:if>>배송 준비</option>
	                            <option id="delivering" value="배송 중" <c:if test="${i.orderStatusName == '배송 중'}">selected</c:if>>배송 중</option>
	                            <option id="complete" value="배송 완료" <c:if test="${i.orderStatusName == '배송 완료'}">selected</c:if>>배송 완료</option>
	                        </select>
	                        <button class="chooseOrderStatus btn btn-sm white">선택</button>                    
	                </td>
	                <td><button class="orderDetail btn btn-sm white">상세보기</button></td>
	            </tr>               
            </c:forEach>     
         </tbody>
         
    </table>
	</div>
<!--     <ul class="uk-pagination uk-flex-center" uk-margin>
            <li><a href="#"><span uk-pagination-previous></span></a></li>
            <li><a href="#">1</a></li>
            <li class="uk-disabled"><span>...</span></li>
            <li><a href="#">5</a></li>
            <li><a href="#">6</a></li>
            <li class="uk-active"><span>7</span></li>
            <li><a href="#">8</a></li>
            <li><a href="#"><span uk-pagination-next></span></a></li>
    </ul> -->
    
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
    
    <!-- 주문 카데고리 리스트  -->
    <script>
    	$('.selectedList').on('click', function(){
    		var orderStatusName = $(this).next().val();
    		
    		/* location.href="categoryList.ad?orderStatusName="+orderStatusName; */
    		location.href="categoryList.ad?orderStatusNam="+orderStatusName;
    	});
    </script>
    
    <!-- 주문 상태 변경 -->
    <script>
    	$('.chooseOrderStatus').on('click', function(){
    		var orderNo = $(this).siblings('#orderNo').val();
    		console.log('orderNo : ' + orderNo);
    		var orderStatusName = $(this).siblings('#newStatus').val();
    		console.log(orderStatusName);
    		var originStatus = $(this).siblings('input[name=originStatus]').val();
    		var $status = $('select[name=newStatus]');

    		$.ajax({
    			url:'changeOrderStatus.ad',
 				data:{orderNo:orderNo, orderStatusName:orderStatusName},
 				type:'post',
 				async:false,
 				success:function(data){
 					if(newStatus=='주문'){
 						$(this).siblings('#newStatus').children('#ordered').prop("selected", true);
 					} else if(newStatus='환불'){
 						$(this).siblings('#newStatus').children('#refund').prop("selected", true);
 					}else if(newStatus='취소'){
 						$(this).siblings('#newStatus').children('#cancel').prop("selected", true);
 					}else if(newStatus='상품 준비'){
 						$(this).siblings('#newStatus').children('#preparingPdt').prop("selected", true);
 					}else if(newStatus='배송 준비'){
 						$(this).siblings('#newStatus').children('#preparingDlv').prop("selected", true);
 					}else if(newStatus='배송 중'){
 						$(this).siblings('#newStatus').children('#delivering').prop("selected", true);
 					}else if(newStatus='배송 완료'){
 						$(this).siblings('#newStatus').children('#complete').prop("selected", true);
 					}
 					
 					window.location.reload(); /* 물어보기 */
 				},
 				error: function(data){
 					console.log('오류입니다');
 				}
    		});
    	});
    </script>
    
    <!-- 주문 상세보기 -->
    <script>
    	$('.orderDetail').on('click', function(){
    		var orderNo = $(this).parent().siblings('#info').children('#orderNo').val();
    		
    		window.open('orderDetail.or?orderNo='+orderNo, '주문 상세', 'width=1000, height=600');    	
    	});
    </script>
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