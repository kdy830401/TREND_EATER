<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit.min.css" />


<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/animate.css/animate.min.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/glyphicons/glyphicons.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/font-awesome/css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/material-design-icons/material-design-icons.css" type="text/css" />

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/bootstrap/dist/css/bootstrap.min.css" type="text/css" />
<!-- build:css ../assets/styles/app.min.css  -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/styles/app.css" type="text/css" />
<!-- endbuild -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/styles/font.css" type="text/css" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script type="text/javascript" src="https://d3js.org/d3.v4.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<style>
* {
	font-family: "Noto Sans KR", sans-serif;
	word-break: keep-all;
}
.floating-button {
	width: 40px;
	height: 40px;
	cursor: pointer;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.2);
	position: fixed;
	right: 30px;
	z-index: 5;
}

.edit {
	bottom: 30px;
	background: #FF5C58 !important;
}

.addCart {
	bottom: 80px;
	background: #FE8F8F;
}

.buy {
	bottom: 130px;
	background: #FCD2D1;
}

.favorite {
	bottom: 180px;
	background: #FFEDD3 !important;
}

.icon {
	position: absolute;
	font-size: 20px;
	top: 10px;
	left: 10px;
	color: #fff;
}

.changColor {
	color: #FF5C58;
}

.uk-progress {
	display: inline-block;
}

.flavor {
	background-color: #e71313;
}

.overview {
	background-color: #9b0303;
}

.material-symbols-outlined.emoji {
	color: #e71313;
	font-size: 40px;
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 48
}

.nofill {
	font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 48;
	color:  #FF5C58;
}

.fill {
	font-variation-settings: 'FILL' 1, 'wght' 300, 'GRAD' 0, 'opsz' 48;
	color: #FF5C58;
}

a:hover{
	border-color: #FF5C58 !important;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

.highcharts-container {
	margin: 0 auto;
}

.plus, .minus {
	width: 30px;
	height: 30px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	padding: 0;
	font-size: 10px;
	font-weight: 900;
}

.plus, .minus:hover {
	cursor: pointer;
}



.amount {
	width: 50px;
	height: 30px;
	padding: 0;
	font: inherit;
	border: 1px solid #e5e5e5;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.uk-button-primary:hover {
    background-color: #e50f8c;
    color: #fff;
}
</style>



<body>
	<c:import url="../common/menubar.jsp" />


	<div class="floating">
		<div class="uk-margin uk-border-circle floating-button edit" uk-tooltip="리뷰작성하기">

			<a href="rinsertView.bo?productNo=${ p.productNo }">

				<span class="material-symbols-outlined icon">edit</span>
			</a>
		</div>
		<div class="uk-margin uk-border-circle floating-button addCart" uk-tooltip="장바구니">
			<a href="javascript:void(0)" id="addCartSide">
				<span class="material-symbols-outlined icon">shopping_cart</span>
			</a>
		</div>
		<div class="uk-margin uk-border-circle floating-button buy" uk-tooltip="구매하기">
			<a href="javascript:void(0)" id="buySide">
				<span class="material-symbols-outlined icon changColor">credit_card</span>
			</a>
		</div>
		<div class="uk-margin uk-border-circle floating-button favorite" uk-tooltip="스크랩">
			<a class="scrap scrap-float" href="javascript:void(0)">
				<c:if test="${ scrapCheckNum == 1 }">
					<span class="material-symbols-outlined icon fill">favorite</span>
				</c:if>
				<c:if test="${ scrapCheckNum == 0 }">
					<span class="material-symbols-outlined icon nofill">favorite</span>
				</c:if>
			</a>
		</div>
	</div>




	<div class="uk-container">
		<br>
		<!--form 태그 시작  -->
		<form action="direct.or" method="post">
		<div class="uk-grid uk-grid-divider uk-child-width-1-2@m uk-margin" uk-grid>
			<div class="uk-margin">
				<c:forEach var="img" items="${ imgList }">
					<c:if test="${ img.fileType == 1 }">
						<img class="uk-align-center" src="${ contextPath }/resources/productImgUploadFiles/${ img.changeName }" alt="상품대표사진">
					</c:if>
				</c:forEach>
				<c:if test="${ p.productType == 1 }">
					<a class="uk-width-1-3 uk-align-center uk-button uk-button-default" href="#modal-overflow" uk-toggle>상품상세정보 보기</a>
				</c:if>
			</div>
			<div id="modal-overflow" class="" uk-modal>
				<div class="uk-modal-dialog">
					<button class="uk-modal-close-outside" type="button" uk-close></button>
					<div class="uk-modal-body" uk-overflow-auto>
						<c:forEach var="img" items="${ imgList }">
							<c:if test="${ img.fileType == 2 }">
								<img class="uk-align-center" src="${ contextPath }/resources/productImgUploadFiles/${ img.changeName }" alt="상세정보사진">
							</c:if>
						</c:forEach>
						<div class="uk-margin">
							<table class="uk-table uk-table-justify">
								<tbody>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>제품명</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>식품의 유형</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>제조업소의 명칭과 소재지</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>제조연월일, 유통기한</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>포장단위별 내용물의 용량(중량), 수량</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>원재료명 및 함량</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>영양정보</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>기능정보</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>섭취량, 섭취방법, 섭취 시 주의사항 및 부작용 발생 가능성</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>의약품 여부</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>유전자변형건강식품에 해당하는 경우의 표시</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>소비자안전을 위한 주의사항</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>수입식품 문구</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
										<th class="uk-table-small uk-background-muted uk-text-top">
											<small>소비자상담관련 전화번호</small>
										</th>
										<td class="uk-table-expand uk-text-small">
											<small>상품이미지 참조</small>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>



				</div>
			</div>
			<div class="uk-margin">
				<div>
					<h3 class="uk-text-bold uk-margin-small">[상품명] ${ p.productName }</h3>
					<p class="uk-text-meta uk-margin-remove-top uk-margin-medium">${ p.productOneLine }</p>
					<p class="uk-text-medium uk-text-bold uk-margin-remove-bottom">상품가격</p>
					<h3 class="uk-h3 uk-text-bold uk-margin-remove" id="productPrice">
						<fmt:formatNumber value="${ p.productPrice }" pattern="#,###" />
						원
					</h3>
					<hr>
				</div>
				<div class="uk-margin">
					<p class="uk-text-medium uk-text-bold uk-margin-remove-bottom">상품소개</p>
					<p class="uk-text-small uk-margin-remove-top">${ p.boardContent }</p>
					<hr>
				</div>
				<!-- <form action="addCart.ct" method="post" class="uk "> -->
					<!-- 구매수량(productAmount) 정보 -->
					<label for="amount" class="uk-text-small uk-text-bold">구매수량</label>
					<div class="uk-margin" id="pdtAmount">
						<div class="uk-grid-collapse uk-margin-remove" uk-grid>
						<c:if test="${ p.productType == 1 }">
							<button class="minus" type="button">
								<span uk-icon="icon: minus; ratio: 1"></span>
							</button>
							
							<!-- Cart(장바구니)에 추가할 정보 1-->
							<!-- 구매 상품 수량 -->
							<!-- <input class="uk-input amount uk-text-center" id="amount" type="number" min="1" name="productAmount" value="1"> -->
							<input class="uk-input amount uk-text-center" id="amount" type="number" min="1" name="productAmount" value="1">						
							<button class="plus" type="button">
								<span class=" uk-text-middle" uk-icon="icon: plus; ratio: 1"></span>
							</button>
							</c:if>
							<c:if test="${ p.productType == 2 }">
							<button class="minus" type="button" disabled="disabled">
								<span uk-icon="icon: minus; ratio: 1"></span>
							</button>
							
							<!-- Cart(장바구니)에 추가할 정보 1-->
							<!-- 구매 상품 수량 -->
							<!-- <input class="uk-input amount uk-text-center" id="amount" type="number" min="1" name="productAmount" value="1"> -->
							<input class="uk-input amount uk-text-center" id="amount" type="number" min="1" name="productAmount" value="1" disabled="disabled">						
							<button class="plus" type="button" disabled="disabled">
								<span class=" uk-text-middle" uk-icon="icon: plus; ratio: 1"></span>
							</button>
							</c:if>
						</div>
					</div>
					<script>
					// productQuantity
					 $('.minus').on('click', function() {

								var amount = parseInt($(this).next().val());
								var price = $('#productPrice').text();
								price = parseInt(price.replace(/(,|원)/g, ""));
								console.log(price);
								if (amount > 0) {
									amount = parseInt(amount) - 1; 
									$(this).next().val(amount);
									var totalPrice = amount * price;
									$('#totalPrice').val(totalPrice);
									localeTotal = totalPrice.toLocaleString('ko-KR') + "원";
									$('#totalPriceText').text(localeTotal);
								}

							});

							$('.plus').on('click', function() {
								var amount = parseInt($(this).prev().val());
							
								var price = $('#productPrice').text();
								price = parseInt(price.replace(/(,|원)/g, ""));

								if (amount >= 0) {
									amount = parseInt(amount) + 1;
									console.log("amount:" + amount);
									$(this).prev().val(amount);
									var totalPrice = amount * price;
									console.log(totalPrice);
									$('#totalPrice').val(totalPrice);
									localeTotal = totalPrice.toLocaleString('ko-KR') + "원";
									$('#totalPriceText').text(localeTotal);
								}
							});

					
					</script>
				
					
					
					<div class="uk-width-1-1 uk-text-right ">
						<span class="uk-text-bold uk-text-small">총 상품금액</span>
						<h3 class="uk-h3 uk-text-right uk-text-bold uk-margin-remove" id="totalPriceText">
							<fmt:formatNumber value="${ p.productPrice }" pattern="#,###" />
							원
						</h3>
					</div>
					<div class="uk-margin-medium uk-child-width-1-2@m uk-grid-small" uk-grid>
						<div class="uk-width-1-1 uk-text-right">
							<input type="hidden" name="productNo" value="${ p.productNo }">
							<a class="uk-width-auto@m uk-button-default uk-button scrap scrap-no-float" href="javascript:void(0);">
									<c:if test="${ scrapCheckNum == 0 }">
										<span class="material-symbols-outlined nofill uk-text-middle">favorite</span>
									</c:if>
									<c:if test="${ scrapCheckNum == 1 }">
										<span class="material-symbols-outlined fill uk-text-middle">favorite</span>
									</c:if>
							</a>

							<script>
                                    $('.scrap').on('click', function() {
                                        var pNo = ${ p.productNo};
                                        console.log(pNo);
                                        
                                        var span1 = $('<span>');
                                        var span2 = $('<span>');
                                        $.ajax({
                                            url : 'scrap.me',
                                            data : {
                                                pNo : pNo
                                            },
                                            type : 'POST',
                                            success : function(data) {
                                                console.log(data)
                                                if (parseInt(data) == 2) {
                                                    $('.fill').empty();
                                                    span1.attr('class','material-symbols-outlined icon nofill scspan uk-text-middle');
                                                    span1.text('favorite')
                                                    $('.scrap-float').append(span1);
                                                    span2.attr('class','material-symbols-outlined nofill scspan uk-text-middle');
                                                    span2.text('favorite')
                                                    $('.scrap-no-float').append(span2);
//                                                    
                                                } else if (parseInt(data) == 1) {
                                                    $('.nofill').empty();
                                                    
                                                    span1.attr('class','material-symbols-outlined icon fill scspan uk-text-middle');
                                                    span1.text('favorite')
                                                    $('.scrap-float').append(span1);
                                                    span2.attr('class','material-symbols-outlined fill scspan uk-text-middle');
                                                    span2.text('favorite')
                                                    $('.scrap-no-float').append(span2);
//                                                 
                                                }

                                            },
                                            error : function(data) {
                                                console.log(data)

                                            }
                                        });
                                    });
                            </script>
                            
                         
							<c:if test="${ p.productType == 1 }">

							<!-- 장바구니 -->
							<input type="button" class="uk-button uk-button-default uk-width-auto@m" id="addCart" value="장바구니"/>
							<!-- Cart(장바구니)에 추가할 정보 2-->
							<!-- 구매 상품 번호, 가격, 이름 -->
							<input type="hidden" name="productNo" id="productNo" value="${p.productNo}">
							<input type="hidden" name="productPrice" id="productPrice" value="${p.productPrice}">
							<input type="hidden" name="productName" id="productName" value="${p.productName}">	
							<!-- 구매하기 -->
							<!--hidden  -->
							<input type="hidden" name="changeName" value="${ imgList[0].changeName }">
							<button class="uk-button uk-button-primary uk-width-1-2@m" id="buyBtn">구매하기</button>
<script>
	 $('#buyBtn').on('click', function(){
	var productNo = $(this).siblings('#productNo').val();
	var productName = $(this).siblings('#productName').val();
	var productPrice = $(this).siblings('#productPrice').val();
	var productAmount = $(this).parent().parent().siblings('#pdtAmount').find('#amount').val();
	
	location.href ='direct.or?productNo='+productNo+'&productName='+productName+'&productPrice='+productPrice+'&productAmount='+productAmount; 	
		
}); 
	

</script>
							</c:if>
							<c:if test="${ p.productType == 2 }">
								<button class="uk-button uk-button-default uk-width-4-5@m" disabled>미판매 상품입니다.</button>
							</c:if>
						</div>
					</div>
				<!-- </form> -->
			</div>
		</div>
		</form>
		<!-- form태그 end -->
	</div>


	
	<script>
		$('#addCart').on('click', function(){
			var productNo = $(this).siblings('#productNo').val();
			var productName = $(this).siblings('#productName').val();
			var productPrice = $(this).siblings('#productPrice').val();
			var productAmount = $(this).parent().parent().siblings('#pdtAmount').find('#amount').val();
			
			$.ajax({
				url:'checkCart.ct',
				data: {productNo:productNo},
				type:'post',
				async:false,
				success : function(data){
					if(data=='true'){
						console.log(data);
						alert('이미 장바구니에 추가된 품목입니다.');
					} else{
						console.log("false : " + data);
						location.href ='addCart.ct?productNo='+productNo+'&productName='+productName+'&productPrice='+productPrice+'&productAmount='+productAmount; 	
					}
				}, 
				error : function(data){
					alert('오류입니다.');
				}
			});
		});
	</script>
	<script type="text/javascript">
		$('#addCartSide').on('click', function(){
		   $('#addCart').click(); 
		});
		
		$('#buySide').on('click', function(){
		   $('#buyBtn').click(); 
		});
	</script>
	
	



	<div class="uk-container uk-margin">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center">종합 리뷰</h2>
		
	</div>
	
	<c:if test="${ p.reviewCount == 0  }">
		<div class="uk-align-center">
			<div class="uk-placeholder uk-text-center">리뷰가 없습니다. 리뷰를 작성해주세요</div>
			<br>
		</div>
	</c:if>
		

	<c:if test="${ p.reviewCount != 0  }">
	<div class="uk-text-center uk-margin-large-bottom">
	<button class="btn btn-outline rounded p-x-md b-warning text-warning" onclick="location.href='rlist.bo?pno=${ p.productNo }'">리뷰 보러 가기</button>
	</div>
		<div class="uk-container">
			<div class="uk-child-width-1-4@s uk-grid" uk-grid uk-height-match="target: > .uk-card-body">

				<div class="uk-card">
					<div class="uk-card-header uk-text-center">
						<span class="uk-label uk-text-bold overview">평균 만족도</span>
					</div>
					<div class="uk-card uk-card-body uk-padding-remove">
						<div class="uk-text-center">
							<c:choose>
								<c:when test="${ p.totalAvg == 5 }">
									<span class="material-symbols-outlined emoji">sentiment_very_satisfied</span>
								</c:when>
								<c:when test="${ p.totalAvg < 5 && p.totalAvg >= 4 }">
									<span class="material-symbols-outlined emoji">sentiment_satisfied</span>
								</c:when>
								<c:when test="${ p.totalAvg < 4 && p.totalAvg >= 3 }">
									<span class="material-symbols-outlined emoji">sentiment_neutral</span>
								</c:when>
								<c:when test="${ p.totalAvg < 3 && p.totalAvg >= 2 }">
									<span class="material-symbols-outlined emoji">sentiment_very_dissatisfied</span>
								</c:when>
								<c:when test="${ p.totalAvg < 2 && p.totalAvg >= 1 }">
									<span class="material-symbols-outlined emoji">sentiment_extremely_dissatisfied</span>
								</c:when>
							</c:choose>
						</div>
						<div class="uk-text-center">
							<span class="uk-text-primary uk-h5 uk-text-bold">${ p.totalAvg } / 5</span>
						</div>
						<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
							<div class="uk-width-auto uk-margin-right">
								<p class="uk-text-small uk-text-bold">5점</p>
							</div>
							<div class="uk-padding-remove">
								<progress class="uk-progress" value="${ ratingRatioArr[4] }" max="100"></progress>
							</div>
							<div class="uk-width-auto uk-padding-remove">
								<p class="uk-text-small uk-text-bold uk-text-primary">${ ratingRatioArr[4] }%</p>
							</div>
						</div>

						<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
							<div class="uk-width-auto uk-margin-right">
								<p class="uk-text-small uk-text-bold">4점</p>
							</div>
							<div class="uk-padding-remove">
								<progress class="uk-progress" value="${ ratingRatioArr[3] }" max="100"></progress>
							</div>
							<div class="uk-width-auto uk-padding-remove">
								<p class="uk-text-small uk-text-bold uk-text-primary">${ ratingRatioArr[3] }%</p>
							</div>
						</div>

						<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
							<div class="uk-width-auto uk-margin-right">
								<p class="uk-text-small uk-text-bold">3점</p>
							</div>
							<div class="uk-padding-remove">
								<progress class="uk-progress" value="${ ratingRatioArr[2] }" max="100"></progress>
							</div>
							<div class="uk-width-auto uk-padding-remove">
								<p class="uk-text-small uk-text-bold uk-text-primary">${ ratingRatioArr[2] }%</p>
							</div>
						</div>

						<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
							<div class="uk-width-auto uk-margin-right">
								<p class="uk-text-small uk-text-bold">2점</p>
							</div>
							<div class="uk-padding-remove">
								<progress class="uk-progress" value="${ ratingRatioArr[1] }" max="100"></progress>
							</div>
							<div class="uk-width-auto uk-padding-remove">
								<p class="uk-text-small uk-text-bold uk-text-primary">${ ratingRatioArr[1] }%</p>
							</div>
						</div>

						<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
							<div class="uk-width-auto uk-margin-right">
								<p class="uk-text-small uk-text-bold">1점</p>
							</div>
							<div class="uk-padding-remove">
								<progress class="uk-progress" value="${ ratingRatioArr[0] }" max="100"></progress>
							</div>
							<div class="uk-width-auto uk-padding-remove">
								<p class="uk-text-small uk-text-bold uk-text-primary">${ ratingRatioArr[0] }%</p>
							</div>
						</div>
					</div>
				</div>


				<div class="uk-card">
					<div class="uk-card-header uk-text-center">
						<span class="uk-label uk-text-bold overview">추천할까요?</span>
					</div>
					<div class="uk-text-center">
						<c:choose>
							<c:when test="${ p.recommendAvg == 5 }">
								<span class="material-symbols-outlined emoji">sentiment_very_satisfied</span>
								<div class="uk-text-center">
									<span class="uk-text-primary uk-h5 uk-text-bold">매우 추천</span>
								</div>
							</c:when>
							<c:when test="${ p.recommendAvg < 5 && p.recommendAvg >= 4 }">
								<span class="material-symbols-outlined emoji">sentiment_satisfied</span>
								<div class="uk-text-center">
									<span class="uk-text-primary uk-h5 uk-text-bold">추천</span>
								</div>
							</c:when>
							<c:when test="${ p.recommendAvg < 4 && p.recommendAvg >= 3 }">
								<span class="material-symbols-outlined emoji">sentiment_neutral</span>
								<div class="uk-text-center">
									<span class="uk-text-primary uk-h5 uk-text-bold">보통</span>
								</div>
							</c:when>
							<c:when test="${ p.recommendAvg < 3 && p.recommendAvg >= 2 }">
								<span class="material-symbols-outlined emoji">sentiment_very_dissatisfied</span>
								<div class="uk-text-center">
									<span class="uk-text-primary uk-h5 uk-text-bold">비추</span>
								</div>
							</c:when>
							<c:when test="${ p.recommendAvg < 2 && p.recommendAvg >= 1 }">
								<span class="material-symbols-outlined emoji">sentiment_extremely_dissatisfied</span>
								<div class="uk-text-center">
									<span class="uk-text-primary uk-h5 uk-text-bold">매우 비추</span>
								</div>
							</c:when>
						</c:choose>



					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-1-3 uk-margin-right">
							<p class="uk-text-small uk-text-bold uk-text-right">매우 추천</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="${ recommendRatioArr[4] }" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">${ recommendRatioArr[4] }%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-1-3 uk-margin-right">
							<p class="uk-text-small uk-text-bold uk-text-right">추천</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="${ recommendRatioArr[3] }" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">${ recommendRatioArr[3] }%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-1-3 uk-margin-right">
							<p class="uk-text-small uk-text-bold uk-text-right">보통</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="${ recommendRatioArr[2] }" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">${ recommendRatioArr[2] }%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-1-3 uk-margin-right">
							<p class="uk-text-small uk-text-bold uk-text-right">비추</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="${ recommendRatioArr[1] }" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">${ recommendRatioArr[1] }%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-1-3 uk-margin-right">
							<p class="uk-text-small uk-text-bold uk-text-right">절대 비추</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="${ recommendRatioArr[0] }" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">${ recommendRatioArr[0] }%</p>
						</div>
					</div>
				</div>

				<div class="uk-card">
					<div class="uk-card-header uk-tile-mute uk-text-center">
						<span class="uk-label uk-text-bold overview">또 먹을까요?</span>
					</div>
					<div class="uk-text-center">
						<c:choose>
							<c:when test="${ p.reorderAvg == 5 }">
								<span class="material-symbols-outlined emoji">sentiment_very_satisfied</span>
								<div class="uk-text-center">
									<span class="uk-text-primary uk-h5 uk-text-bold">꼭 무조건</span>
								</div>
							</c:when>
							<c:when test="${ p.reorderAvg < 5 && p.reorderAvg >= 4 }">
								<span class="material-symbols-outlined emoji">sentiment_satisfied</span>
								<div class="uk-text-center">
									<span class="uk-text-primary uk-h5 uk-text-bold">먹을래요</span>
								</div>
							</c:when>
							<c:when test="${ p.reorderAvg < 4 && p.reorderAvg >= 3 }">
								<span class="material-symbols-outlined emoji">sentiment_neutral</span>
								<div class="uk-text-center">
									<span class="uk-text-primary uk-h5 uk-text-bold">보통</span>
								</div>
							</c:when>
							<c:when test="${ p.reorderAvg < 3 && p.reorderAvg >= 2 }">
								<span class="material-symbols-outlined emoji">sentiment_very_dissatisfied</span>
								<div class="uk-text-center">
									<span class="uk-text-primary uk-h5 uk-text-bold">안삼</span>
								</div>
							</c:when>
							<c:when test="${ p.reorderAvg < 2 && p.reorderAvg >= 1 }">
								<span class="material-symbols-outlined emoji">sentiment_extremely_dissatisfied</span>
								<div class="uk-text-center">
									<span class="uk-text-primary uk-h5 uk-text-bold">절대 안삼</span>
								</div>
							</c:when>
						</c:choose>
					</div>
					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-1-3 uk-margin-right">
							<p class="uk-text-small uk-text-bold uk-text-right">꼭 무조건</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="${ repurcharseRatioArr[4] }" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">${ repurcharseRatioArr[4] }%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-1-3  uk-margin-right">
							<p class="uk-text-small uk-text-bold uk-text-right">먹을래요</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="${ repurcharseRatioArr[3] }" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">${ repurcharseRatioArr[3] }%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-1-3  uk-margin-right">
							<p class="uk-text-small uk-text-bold uk-text-right">보통</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="${ repurcharseRatioArr[2] }" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">${ repurcharseRatioArr[2] }%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-1-3  uk-margin-right">
							<p class="uk-text-small uk-text-bold uk-text-right">안삼</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="${ repurcharseRatioArr[1] }" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">${ repurcharseRatioArr[1] }%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-1-3 uk-margin-right">
							<p class="uk-text-small uk-text-bold uk-text-right">절대 안삼</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="${ repurcharseRatioArr[0] }" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">${ repurcharseRatioArr[0] }%</p>
						</div>
					</div>
				</div>

				<div class="uk-card">
					<div class="uk-card-header uk-text-center uk-margin-remove">
						<span class="uk-label uk-text-bold overview">무슨맛일까?</span>
					</div>
					<!-- 				<div class="uk-card uk-width-auto@s uk-card-body chart4 uk-padding-remove"> -->
					<div class="uk-margin-small uk-padding-remove" id="chart4"></div>
					<!-- 				</div> -->
				</div>

			</div>


		</div>
	</c:if>
	<script>
	// highChart 
	
 	var data = [ ${p.spicyAvg}, ${p.sweetAvg}, ${p.bitterAvg}, ${p.saltyAvg}, ${p.sourAvg} ];

			data.forEach(function(element, index) {
				if (element.value === 0) {
					data[index] = null;
				}
			});

			Highcharts.chart('chart4', {
				chart : {
					type : "area",
					polar : true,
					// 		    width: 280,
					height : 280,

				},
				xAxis : {
					min : 0.5,
					max : 5.5,
					categories : [ '매운맛', '단맛', '쓴맛', '짠맛', '신맛' ],
					labels : {
						distance : 2,
						style : {
							color : 'red',
							fontSize : "11px",
							fontWeight : "bold"
						}

					},
					tickmarkPlacement : "on",
					lineWidth : 0,
					gridLineColor : "",
					title : {
						"style" : {
							"fontFamily" : "\"Lucida Grande\", \"Lucida Sans Unicode\", Verdana, Arial, Helvetica, sans-serif",
							"color" : "#666666",
							"fontSize" : "10px",
							"fontWeight" : "bold",
							"fontStyle" : "normal"
						}
					}
				},
				yAxis : {
					// 		    plotBands: [{
					// 		      from: 1,
					// 		      to: 2,
					// 		      color: "#f8c4c0",
					// 		      outerRadius: "105%",
					// 		      thickness: "50%"
					// 		    }, {
					// 		      from: 2,
					// 		      to: 3,
					// 		      color: "#f39d96",
					// 		      outerRadius: "105%",
					// 		      thickness: "50%"
					// 		    }, {
					// 		      from: 3,
					// 		      to: 4,
					// 		      color: "#ee766d",
					// 		      outerRadius: "105%",
					// 		      thickness: "50%"
					// 		    }, {
					// 		      from: 4,
					// 		      to: 5,
					// 		      color: "#eb584d",
					// 		      outerRadius: "105%",
					// 		      thickness: "50%"
					// 		    }],
					plotBands : [ {
						from : 1,
						to : 2,
						color : "rgba(248, 196, 192, 0.9)",
						outerRadius : "105%",
						thickness : "50%"
					}, {
						from : 2,
						to : 3,
						color : "rgba(243, 157, 150, 0.9)",
						outerRadius : "105%",
						thickness : "50%"
					}, {
						from : 3,
						to : 4,
						color : "rgba(238, 118, 109, 0.9)",
						outerRadius : "105%",
						thickness : "50%"
					}, {
						from : 4,
						to : 5,
						color : "rgba(235, 88, 77, 0.9)",
						outerRadius : "105%",
						thickness : "50%"
					} ],
					reversed : false,
					min : 0,
					max : 5,
					allowDecimals : true,
					tickInterval : 1,
					tickAmount : 6,
					tickLength : 10,
					gridLineInterpolation : "polygon",
					gridLineColor : "",
					lineWidth : 0,
					tickmarkPlacement : "between",
					tickPixelInterval : 100,
					tickPosition : "outside",
					labels : {
						enabled : false,
					}
				},
				title : {
					"text" : ""
				},
				series : [ {
					name : "맛",
					data : data,
				} ],
				responsive : {
					rules : [ {
						condition : {
							maxWidth : 300,
						}
					} ]
				},
				plotOptions : {
					series : {
						animation : true,
						lineWidth : 1,
						color : "rgba(255, 237, 211, 0.8)",
						fillOpacity : 0.6,
						marker : {
							radius : 1.2,
							symbol : "circle"
						},

						_colorIndex : 0,
						_symbolIndex : 0
					}
				},
				legend : {
					enabled : false
				},
				exporting : {
					enabled : false
				},
				credits : {
					enabled : false
				},
				colors : [ "#7cb5ec", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354", "#2b908f", "#f45b5b", "#91e8e1" ]
			});
	</script>
	
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