<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  <!-- cartList 길이 구하기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>장바구니</title>
    <script src="resources/js/jquery-3.6.0.min.js"></script>
    
    <script src="resources/js/jquery-3.6.0.min.js"></script><!-- .js 넣기 -->
    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
	
    <style>
    	body{font-family: noto sans;}
        #imge{width:100px;}
        #checkbox{width: 30px;}
        #list{width:800px; margin:auto;}
        #pay{padding-left: 900px;}
        #all{content-align:right; }
        #checkAll{ background-color: rgb(255, 92, 88);}
        button{background-color:rgb(255, 92, 88);}
    </style>
</head>
<body>
	<c:import url="../common/menubar.jsp" />

	<%-- <c:import url="../common/menubar.jsp"/>  --%>
    <div>
        <h2>장바구니</h2>
 
		    
		    <div id="list">
		    <table class="uk-table uk-table-divider">
						<tr>
							<td>전체선택</td>
							<td></td>
							<td id="all"><input type="checkbox" id="checkAll" class="item"><td>
						</tr>
		            <thead>
		                <tr>
		                    <th class="uk-table-shrink" id="imge"> 상품명 </th>
		                    <th class="uk-table-expand">정보</th>
		                    <th class="uk-width-small">선택</th>
		                    <th class="uk-width-small">삭제</th>
		                </tr>
		            </thead>
		            <tbody>
		            	<c:forEach var="i" items="${cartList }"  varStatus='vs'>
		                   		<tr>
		                            <td>
										<c:forEach var="a" items="${thmbList }">
											<c:if test="${i.productNo== a.productNo }">
												<img src="resources/images/${a.changeName}" width="150px" height="200px"> <!-- src안 넣으면 그냥 검은 테두리의 흰 박스로 나옴-->
											</c:if>
										</c:forEach>
									</td>
		                            <td id="second">
		                                <p>
		                                    <div><a location.href=''>${i.productName }</a></div>
		                                    <div>총 가격 : ${i.productPrice }</div>                   
		                                    <div>안내사항</div>
		                                    <div id="amount">갯수 :
		                                    	<input type="number" id="productAmount" name="productAmount" min="1" max="10" name="age" value="${i.productAmount }"><br>
		                                    </div>
		                                </p>
		                            </td>
		                            <td id="checkbox">
		                            	<input type="checkbox" name="items" class="item" value="${i.cartNo }">
		                            </td> <!-- value에 상품번호 넣기 -->
		                       		<td>
		                       			<input type="hidden" id="cartNo${vs.index}" name="cartNo" value="${i.cartNo}">
		                       			<button type="button" id="cartDelete">삭제</button>
		                       		</td>
		                        </tr>
		                  </c:forEach>

		            </tbody>
		        </table>
		    </div>
		
		    <div id="pay">
		    <p uk-margin>
		        <button class="uk-button uk-button-danger" id="but">선택 결제</button>
		    </p>
		    </div>
		    


		    <ul class="uk-pagination uk-flex-center" uk-margin>
		            <li><a href="#"><span uk-pagination-previous></span></a></li>
		            <li><a href="#">1</a></li>
		            <li class="uk-disabled"><span>...</span></li>
		            <li><a href="#">5</a></li>
		            <li><a href="#">6</a></li>
		            <li class="uk-active"><span>7</span></li>
		            <li><a href="#">8</a></li>
		            <li><a href="#"><span uk-pagination-next></span></a></li>
		    </ul>
		
		    <!-- 전체 선택버튼 누르면 전체 선택 됨 -->
		    <script>
		    	$(document).ready(function(){
		    		/* 전체 선택 버튼 클릭 */
			    	$('#checkAll').click(function(){
			    		if($('#checkAll').prop("checked")){
			    			$('.item').prop("checked", true);
			    		} else{
			    			$('.item').prop("checked", false);
			    		}
			    	}); 
		    		
		    		// 전체 체크된 체크 박스 중 하나가 해제되면 전체 버튼 해제
		    		$(".item").click(function(){
		    			if($("input[name='items']:checked").length == ${fn:length(cartList)}){
		    				$('#checkAll').prop("checked", true);
		    			} else{
		    				$('#checkAll').prop("checked", false);
		    			}
		    				
		    		});
		    	});
    		</script>
    		
    		
    		<!-- 선택된 상품 정보만 결제 페이지로 이동 -->
		    <script>
		    $('#but').on('click', function(){
		    	var cartList = new Array();
		    	var cartAmountArr = new Array();
		    	/* var cartPdt = document.getElementsByName('items') */
		    	
		    	$("input[name=items]").each(function(index, item){
		    		if($(item).prop("checked")){
		    			cartList.push($(item).val());
		    			cartAmountArr.push($(item).parent().siblings('#second').find('#productAmount').val());
		    		}
		    	});		    	
		    	location.href = 'order.pa?cartList='+cartList+"&cartAmountArr="+cartAmountArr; 
		    });
		    </script>
		    

		    
		    <!-- 선택 상품 삭제 -->
		    <script>
		    	var cartNo = $(this).prev().val();
		    
		    	$('#cartDelete').on('click', function(){
		    		$.ajax({
		    			url:'deleteCart.ct',
		    			data : {cartNo:cartNo},
		    			type:'post',
		    			async : false,
		    			success : function(data){
		    				if(data == 'true'){
		    					alert('선택 상품이 장바구니에서 삭제되었습니다.');
		    				}else{
		    					throw new CartException("장바구니 삭제에 실패하였습니다.");
		    				}
		    			},
		    			error : function(data){
		    				console.log(data);
		    			}
		    		});
		    	});
		    </script>
</body>
</html>