<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<!-- UIkit CSS -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
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
	word-break: keep-all !important;
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
</style>



<body>
	<c:import url="../common/menubar.jsp" />


	<div class="floating">
		<div class="uk-margin uk-border-circle floating-button edit" uk-tooltip="리뷰작성하기">
			<a href="#">
				<span class="material-symbols-outlined icon">edit</span>
			</a>
		</div>
		<div class="uk-margin uk-border-circle floating-button addCart" uk-tooltip="장바구니">
			<a href="#">
				<span class="material-symbols-outlined icon">shopping_cart</span>
			</a>
		</div>
		<div class="uk-margin uk-border-circle floating-button buy" uk-tooltip="구매하기">
			<a href="#">
				<span class="material-symbols-outlined icon changColor">credit_card</span>
			</a>
		</div>
		<div class="uk-margin uk-border-circle floating-button favorite" uk-tooltip="스크랩">
			<a href="#">
				<span class="material-symbols-outlined icon changColor">favorite</span>
			</a>
		</div>
	</div>



	<div class="uk-container">
		<br>
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
										<th class="uk-table-small uk-background-muted uk-text-top"><small>제품명</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>식품의 유형</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>제조업소의 명칭과 소재지</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>제조연월일, 유통기한</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>포장단위별 내용물의 용량(중량), 수량</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>원재료명 및 함량</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>영양정보</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>기능정보</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>섭취량, 섭취방법, 섭취 시 주의사항 및 부작용 발생 가능성</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>의약품 여부</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>유전자변형건강식품에 해당하는 경우의 표시</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>소비자안전을 위한 주의사항</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
									</tr>
									<tr>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>수입식품 문구</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
										<th class="uk-table-small uk-background-muted uk-text-top"><small>소비자상담관련 전화번호</small></th>
										<td class="uk-table-expand uk-text-small"><small>상품이미지 참조</small></td>
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
							<button class="minus" type="button">
								<span uk-icon="icon: minus; ratio: 1"></span>
							</button>
							<!-- Cart(장바구니)에 추가할 정보 1-->
							<!-- 구매 상품 수량 -->
							<!-- <input class="uk-input amount uk-text-center" id="amount" type="number" min="1" name="productAmount" value="1"> -->
							<input class="uk-input amount uk-text-center" id="amount" type="number" min="1" name="productAmount">						
							<button class="plus" type="button">
								<span class=" uk-text-middle" uk-icon="icon: plus; ratio: 1"></span>
							</button>
						</div>
					</div>
					<div class="uk-width-1-1 uk-text-right ">
						<span class="uk-text-bold uk-text-small">총 상품금액</span>
						<h3 class="uk-h3 uk-text-right uk-text-bold uk-margin-remove" id="totalPriceText">
							<fmt:formatNumber value="${ p.productPrice }" pattern="#,###" />
							원
						</h3>
					</div>
					<div class="uk-margin-medium uk-child-width-1-2@m uk-grid-small" uk-grid>
						<div class="uk-width-1-1 uk-text-right">
							<a class="uk-width-auto@m uk-button-default uk-button scrap" href="javascript:void(0);" uk-icon="icon:heart"></a>
							<c:if test="${ p.productType == 1 }">
							<!-- 장바구니 -->
							<button class="uk-button uk-button-default uk-width-auto@m" id="addCart">장바구니</button>
							<!-- Cart(장바구니)에 추가할 정보 2-->
							<!-- 구매 상품 번호, 가격, 이름 -->
							<input type="hidden" name="productNo" id="productNo" value="${p.productNo}">
							<input type="hidden" name="productPrice" id="productPrice" value="${p.productPrice}">
							<input type="hidden" name="productName" id="productName" value="${p.productName}">	
							<!-- 구매하기 -->
							<button class="uk-button uk-button-primary uk-width-1-2@m">구매하기</button>
							</c:if>
							<c:if test="${ p.productType == 2 }">
							<button class="uk-button uk-button-default uk-width-4-5@m" disabled>미판매 상품입니다.</button>
							</c:if>
						</div>
					</div>
				<!-- </form> -->
			</div>
		</div>
	</div>
	<script>
	
// 	$('.scrab').on('')
// 	var id = ${ loginUser.email }

// 	if(id = null){
// 		alert("로그인 후 이용해 주세요");
// 	}
	</script>
	
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


	<div class="uk-container uk-margin-large">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-large">종합 리뷰</h2>
	</div>

	<c:if test="${ p.totalAvg == 0  }">
		<div class="uk-align-center">
			<div class="uk-placeholder uk-text-center">리뷰가 없습니다. 리뷰를 작성해주세요</div>
			<br>
		</div>
	</c:if>
	
	
	<c:if test="${ p.totalAvg != 0  }">
	<div class="uk-container">
		<div class="uk-child-width-1-4@s uk-grid" uk-grid uk-height-match="target: > .uk-card-body">

			<div class="uk-card">
				<div class="uk-card-header uk-text-center">
					<span class="uk-label uk-text-bold overview">평균 만족도</span>
				</div>
				<div class="uk-card uk-card-body uk-padding-remove">
					<div class="uk-text-center">
						<span class="material-symbols-outlined emoji">sentiment_very_satisfied</span>
						<!-- 					<span class="material-symbols-outlined emoji">sentiment_satisfied</span> -->
						<!-- 					<span class="material-symbols-outlined emoji">sentiment_neutral</span> -->
						<!-- 					<span class="material-symbols-outlined emoji">sentiment_very_dissatisfied</span> -->
						<!-- 					<span class="material-symbols-outlined emoji">sentiment_extremely_dissatisfied</span> -->
					</div>
					<div class="uk-text-center">
						<span class="uk-text-primary uk-h5 uk-text-bold">4.5 / 5</span>
					</div>
					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-auto uk-margin-right">
							<p class="uk-text-small uk-text-bold">5점</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="45" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-auto uk-margin-right">
							<p class="uk-text-small uk-text-bold">4점</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="45" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-auto uk-margin-right">
							<p class="uk-text-small uk-text-bold">3점</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="45" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-auto uk-margin-right">
							<p class="uk-text-small uk-text-bold">2점</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="45" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
						</div>
					</div>

					<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
						<div class="uk-width-auto uk-margin-right">
							<p class="uk-text-small uk-text-bold">1점</p>
						</div>
						<div class="uk-padding-remove">
							<progress class="uk-progress" value="45" max="100"></progress>
						</div>
						<div class="uk-width-auto uk-padding-remove">
							<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
						</div>
					</div>
				</div>
			</div>


			<div class="uk-card">
				<div class="uk-card-header uk-text-center">
					<span class="uk-label uk-text-bold overview">추천할까요?</span>
				</div>
				<div class="uk-text-center">
					<span class="material-symbols-outlined emoji">sentiment_very_satisfied</span>
					<!-- 					<span class="material-symbols-outlined emoji">sentiment_satisfied</span> -->
					<!-- 					<span class="material-symbols-outlined emoji">sentiment_neutral</span> -->
					<!-- 					<span class="material-symbols-outlined emoji">sentiment_very_dissatisfied</span> -->
					<!-- 					<span class="material-symbols-outlined emoji">sentiment_extremely_dissatisfied</span> -->
				</div>
				<div class="uk-text-center">
					<span class="uk-text-primary uk-h5 uk-text-bold">매우 추천</span>
				</div>
				<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
					<div class="uk-width-1-3 uk-margin-right">
						<p class="uk-text-small uk-text-bold uk-text-right">매우 추천</p>
					</div>
					<div class="uk-padding-remove">
						<progress class="uk-progress" value="45" max="100"></progress>
					</div>
					<div class="uk-width-auto uk-padding-remove">
						<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
					</div>
				</div>

				<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
					<div class="uk-width-1-3 uk-margin-right">
						<p class="uk-text-small uk-text-bold uk-text-right">추천</p>
					</div>
					<div class="uk-padding-remove">
						<progress class="uk-progress" value="45" max="100"></progress>
					</div>
					<div class="uk-width-auto uk-padding-remove">
						<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
					</div>
				</div>

				<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
					<div class="uk-width-1-3 uk-margin-right">
						<p class="uk-text-small uk-text-bold uk-text-right">보통</p>
					</div>
					<div class="uk-padding-remove">
						<progress class="uk-progress" value="45" max="100"></progress>
					</div>
					<div class="uk-width-auto uk-padding-remove">
						<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
					</div>
				</div>

				<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
					<div class="uk-width-1-3 uk-margin-right">
						<p class="uk-text-small uk-text-bold uk-text-right">비추</p>
					</div>
					<div class="uk-padding-remove">
						<progress class="uk-progress" value="45" max="100"></progress>
					</div>
					<div class="uk-width-auto uk-padding-remove">
						<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
					</div>
				</div>

				<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
					<div class="uk-width-1-3 uk-margin-right">
						<p class="uk-text-small uk-text-bold uk-text-right">절대 비추</p>
					</div>
					<div class="uk-padding-remove">
						<progress class="uk-progress" value="45" max="100"></progress>
					</div>
					<div class="uk-width-auto uk-padding-remove">
						<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
					</div>
				</div>
			</div>

			<div class="uk-card">
				<div class="uk-card-header uk-tile-mute uk-text-center">
					<span class="uk-label uk-text-bold overview">또 먹을까요?</span>
				</div>
				<div class="uk-text-center">
					<span class="material-symbols-outlined emoji">sentiment_very_satisfied</span> <span class="material-symbols-outlined emoji">sentiment_satisfied</span> <span class="material-symbols-outlined emoji">sentiment_neutral</span> <span class="material-symbols-outlined emoji">sentiment_very_dissatisfied</span> <span class="material-symbols-outlined emoji">sentiment_extremely_dissatisfied</span>
				</div>
				<div class="uk-text-center">
					<span class="uk-text-primary uk-h5 uk-text-bold">꼭 무조건</span>
				</div>
				<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
					<div class="uk-width-1-3 uk-margin-right">
						<p class="uk-text-small uk-text-bold uk-text-right">꼭 무조건</p>
					</div>
					<div class="uk-padding-remove">
						<progress class="uk-progress" value="45" max="100"></progress>
					</div>
					<div class="uk-width-auto uk-padding-remove">
						<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
					</div>
				</div>

				<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
					<div class="uk-width-1-3  uk-margin-right">
						<p class="uk-text-small uk-text-bold uk-text-right">먹을래요</p>
					</div>
					<div class="uk-padding-remove">
						<progress class="uk-progress" value="45" max="100"></progress>
					</div>
					<div class="uk-width-auto uk-padding-remove">
						<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
					</div>
				</div>

				<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
					<div class="uk-width-1-3  uk-margin-right">
						<p class="uk-text-small uk-text-bold uk-text-right">보통</p>
					</div>
					<div class="uk-padding-remove">
						<progress class="uk-progress" value="45" max="100"></progress>
					</div>
					<div class="uk-width-auto uk-padding-remove">
						<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
					</div>
				</div>

				<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
					<div class="uk-width-1-3  uk-margin-right">
						<p class="uk-text-small uk-text-bold uk-text-right">안삼</p>
					</div>
					<div class="uk-padding-remove">
						<progress class="uk-progress" value="45" max="100"></progress>
					</div>
					<div class="uk-width-auto uk-padding-remove">
						<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
					</div>
				</div>

				<div class="uk-child-width-expand@m uk-margin-small" uk-grid>
					<div class="uk-width-1-3 uk-margin-right">
						<p class="uk-text-small uk-text-bold uk-text-right">절대 안삼</p>
					</div>
					<div class="uk-padding-remove">
						<progress class="uk-progress" value="45" max="100"></progress>
					</div>
					<div class="uk-width-auto uk-padding-remove">
						<p class="uk-text-small uk-text-bold uk-text-primary">45%</p>
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
	<script src="${ pageContext.servletContext.contextPath }/resources/js/prBoardDetail.js"></script>
	

</body>
</html>