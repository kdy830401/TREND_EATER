<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>

<style type="text/css">
.uk-breadcrumb>:nth-child(n+2):not(.uk-first-column)::before {
	margin: 0 5px 0 calc(5px - 4px) !important;
}

.date {
	width: 355px;
}

* {
	word-break: keep-all;
}

.productNo {
	display: none;
}
</style>
</head>
<body>

	<c:import url="adminMenubar.jsp" />
	<!-- 하단 끝 -->

	<!-- ############ PAGE START 여기에 내용 넣어주세요 -->
	<div class="uk-container uk-tile uk-tile-default uk-padding-small">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-medium">제품 및 리뷰 게시판 관리</h2>
		<div class="margin uk-width-1-1 uk-text-center">
			<!-- 			<form id="searchForm" action="searchProduct.ad" method="get" class="uk-text-center"> -->
			<!-- 			<div class="inline"> -->
			<!-- 				<div class="uk-align-center"> -->
			<!-- 					<div class="uk-inline"> -->
			<!-- 						<input class="uk-input uk-width-medium date" id="form-s-date" name="date1" type="date" placeholder="1970-01-01"> -->
			<!-- 					</div> -->
			<!-- 					<span>~</span> -->
			<!-- 					<div class="uk-inline"> -->
			<!-- 						<input class="uk-input uk-width-medium date" id="form-s-date" name="date2" type="date" placeholder="1970-01-01"> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="uk-inline"> -->
			<!-- 					<select class="uk-select uk-width-medium" id="seachCondition" name="searchCondition"> -->
			<!-- 						<option value="" disabled selected>검색조건을 선택하세요</option> -->
			<!-- 						<option value="requestProduct">제품명</option> -->
			<!-- 						<option value="manufacturer">제조사</option> -->
			<!-- 					</select> -->
			<!-- 				</div> -->
			<div class="uk-inline">
				<input class="uk-input uk-width-medium" id="searchValue" name="seachValue" type="search" placeholder="상품명 입력">
				<a class="uk-form-icon uk-form-icon-flip" id="search" href="javascript:void(0)" uk-icon="icon: search"></a>
			</div>
			<script>
					$('#search').on('click', function(){
					    var searchValue = $('#searchValue').val();
					    location.href="searchPrbAdmin.ad?searchValue="+searchValue;
					});
				</script>
			<!-- 				<div class="uk-inline"> -->
			<!-- 					<button class="uk-text-bottom uk-button uk-button-primary">검색하기</button> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			</form>
		</div>
		<script>
			$(function() {
				$('#registerProduct').on('click', function() {
					location.href = 'productRegistrationView.ad'
				});
			});
		</script>


	</div>
	<div class="uk-container uk-tile uk-tile-default uk-margin-medium">
		<ul class="uk-breadcrumb uk-align-right">
			<li>
				<a href="prbAdminList.ad">전체보기</a>
			</li>
			<li>
				<a href="prbAdminList.ad?value=productName">상품명순</a>
			</li>
			<li>
				<a href="prbAdminList.ad?value=reviewCount">리뷰순</a>
			</li>
			<li>
				<a href="prbAdminList.ad?value=scrapCount">스크랩순</a>
			</li>

		</ul>
		<table class="table table-hover b-t">
			<thead>
				<tr class="contentTr">
					<th colspan="10" style="color: black; font-weight: bold;">
						전체 상품
						<span style="color: #FF5C58;"> ${pi.listCount}</span>
						건
					</th>
				</tr>
				<tr>
					<!-- 					<th>상품No.</th> -->
					<th>상품명</th>
					<th>가격</th>
					<th>판매여부</th>
					<th>한줄평</th>
					<th>상품소개</th>
					<th>리뷰</th>
					<th>스크랩</th>
					<th>작성자</th>
					<th>수정</th>
					<th>게시</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${ list }">
					<tr>
						<td class="productNo">${ p.productNo }</td>
						<td>${ p.productName }</td>
						<td>
							<fmt:formatNumber value="${ p.productPrice }" type="currency" />
						</td>
						<td>
							<c:if test="${ p.productType == 1}">
											판매
										</c:if>
							<c:if test="${ p.productType == 2}">
											미판매
										</c:if>
						</td>
						<td>${ p.productOneLine }</td>
						<td>${ p.boardContent }</td>
						<td>${ p.reviewCount }건</td>
						<td>${ p.scrapCount }건</td>
						<td>${ p.adminName }</td>
						<td>
							<form id="productForm${ p.productNo }" action="updateProductForm.ad" method="POST">
								<a class="uk-margin-small-right edit" href="javascript:void(0)" onclick="edit(this)" uk-icon="pencil"></a>
								<input type="hidden" name="productNo" value="${ p.productNo }">

								<script>
								function edit(e){
									var formId = "productForm" + $(e).next().val();
									var $selectForm = $('#'+ formId);
									$selectForm.submit();
								}
							</script>

							</form>
						</td>
						<td>
							<c:if test="${ p.boardStatus == 'Y'}">
								<label class="ui-switch warning m-t-xs m-r">
									<input type="checkbox" name="boardStatus" checked id="boardStatus${ p.productNo }" class="has-value status">
									<i></i>
								</label>
							</c:if>
							<c:if test="${ p.boardStatus == 'N'}">
								<label class="ui-switch warning m-t-xs m-r">
									<input type="checkbox" name="boardStatus" id="boardStatus${ p.productNo }" class="has-value status">
									<i></i>
								</label>
							</c:if>
							<script>
							var $inputStatus = $('#boardStatus'+${ p.productNo });
							console.log($inputStatus);
							$inputStatus.on('change', function(){
								var pno = $(this).parent().parent().parent().children().eq(0).text();
								console.log(pno);
								
								var bool = $(this).is(":checked");
								console.log(bool);
								
								$.ajax({
									url: 'deleteProductBoard.ad',
									data: {bool:bool, pno:pno},
									type: 'post',
									success: function(data){
										console.log(data);
									},
									error: function(data){
										console.log(data);
									}
								});
								
							});
	
							
						</script>
						</td>


					</tr>

				</c:forEach>
			</tbody>
		</table>
		<script>
			$(function() {
				var btn = $('.tasteBtn');
// 				console.log(btn);
				btn.each(function(index, element) {
					var checkBtn = $(this);
					var productNo = $(this).parent().parent().children().eq(0)
							.text();
// 					console.log(productNo);
					$.ajax({
						url : 'checkTasteIng.ad',
						data : {
							productNo : productNo
						},
						success : function(data) {
							console.log(data);
							if (parseInt(data) > 0) {
								console.log(checkBtn);
								checkBtn.attr('disabled', true)
								checkBtn.text("진행중");
							} else {

							}

						},
						error : function(data) {
							console.log(data);

						}

					});
				})

			})
		</script>


		<!-- 페이징 처리 -->
		<ul class="uk-pagination uk-flex-right uk-margin-medium-top" uk-margin>
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
		<!-- 페이징 처리 끝  -->

	</div>





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
