<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>


<style>
.uk-breadcrumb>:nth-child(n+2):not(.uk-first-column)::before {
	margin: 0 5px 0 calc(5px - 4px) !important;
}
</style>
<body>
	<c:import url="adminMenubar.jsp" />
	<!-- ############ PAGE START 여기에 내용 넣어주세요 -->

	<div class="uk-container uk-tile uk-tile-default uk-padding-small">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-medium">시식게시판 관리</h2>
		<form class="uk-child-width-auto " uk-grid>
			<div class="uk-align-center">
				<div class="uk-align-center">
					<div class="uk-inline">
						<input class="uk-input uk-width-medium date" id="form-s-date" name="date1" type="date" placeholder="1970-01-01">
					</div>
					<span>~</span>
					<div class="uk-inline">
						<input class="uk-input uk-width-medium date" id="form-s-date" name="date2" type="date" placeholder="1970-01-01">
					</div>
				</div>
				<div class="uk-inline">
					<select class="uk-select uk-width-medium" id="seachCondition" name="searchCondition">
						<option value="" disabled selected>검색조건을 선택하세요</option>
						<option value="requestProduct">제품명</option>
						<option value="manufacturer">제조사</option>
					</select>
				</div>
				<div class="uk-inline">
					<a class="uk-form-icon uk-form-icon-flip" href="#" uk-icon="icon: search"></a>
					<input class="uk-input uk-width-medium" id="seachValue" type="search" placeholder="검색어 입력">
				</div>
				<div class="uk-inline">
					<button class="uk-text-bottom uk-button uk-button-primary">검색하기</button>
				</div>
			</div>
		</form>


	</div>
	<div class="uk-container uk-tile uk-tile-default uk-margin-medium">
		<ul class="uk-breadcrumb uk-align-right">
			<li>
				<a href="">상품명순</a>
			</li>
			<li>
				<a href="">재고량순</a>
			</li>
			<li>
				<a href="">게시일순</a>
			</li>
		</ul>
		<table class="table table-hover b-t">
			<thead>
				<tr>
					<th>게시글번호</th>
					<th>상품번호</th>
					<th>상품명</th>
					<th>시식시작일시</th>
					<th>시식마감일시</th>
					<th>진행상황</th>
					<th>작성자</th>
					<th>수정/삭제</th>
					<th>시식종료</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${ aList }">
					<tr>
						<td>${ p.tasteNo }</td>
						<td>${ p.productNo }</td>
						<td>${ p.productName }</td>
						<td>${ p.startDate }</td>
						<td>${ p.endDate }</td>
						<c:if test="${ p.tasteIng == 1 }">
							<td>진행중</td>
						</c:if>
						<c:if test="${ p.tasteIng == 2 }">
							<td>종료됨</td>
						</c:if>
						<td>${ p.adminName }</td>
						<td>
							<a class="uk-margin-small-right" href="" uk-icon="pencil" data-toggle="modal" data-target="#m-a-a_${ p.tasteNo }" ui-toggle-class="fade-down" ui-target="#animate"></a>
							<input type="hidden" name="pno" value="${ p.tasteNo }">
							<%-- 										<button class="btn btn-sm white tasteBtn" data-toggle="modal" data-target="#m-a-a_${ p.productNo }" ui-toggle-class="fade-down" ui-target="#animate">등록</button> --%>
							<!-- .modal -->
							<div id="m-a-a_${ p.tasteNo }" class="modal fade animate" data-backdrop="true">
								<div class="modal-dialog" id="animate">
									<div class="modal-content">
										<div class="modal-header">
											<span class="label label-lg">${ p.productName }</span>
											<h6 class="modal-title uk-text-bold">시식게시판 수정</h6>
										</div>
										<form action="updateTaste.ad" method="post">
											<div class="modal-body text-center p-lg">

												<input type="hidden" name="tasteNo" value="${ p.tasteNo }">
												<div class="uk-margin">
													<label class="uk-align-left label warning m-b-sm" for="form-s-date">신청 종료일</label>
													<input class="uk-input" id="form-s-date_" name="endDate" type="date" placeholder="1970-01-01">
												</div>
												<div class="uk-margin">
													<div class="label warning m-b-sm uk-align-left inline">진행상황</div>
													<div class="uk-margin">
														<select name="tasteIng" class="uk-select">
															<option value="" disabled selected>진행상황을 선택하세요</option>
															<option value="1">진행중</option>
															<option value="2">종료됨</option>
														</select>
													</div>

												</div>


											</div>
											<div class="modal-footer">
												<button type="button" class="btn dark-white p-x-md" data-dismiss="modal">No</button>
												<button type="submit" class="btn danger p-x-md">Yes</button>
											</div>
										</form>
									</div>
									<!-- /.modal-content -->
								</div>
							</div>
							<!-- / .modal -->



							<a href="" uk-icon="trash"></a>
						</td>
						<td>
							<c:if test="${ p.tasteIng == 1 }">
								<button class="btn btn-sm white endTaste">종료</button>
							</c:if>
							<c:if test="${ p.tasteIng == 2 }">
								<button class="btn btn-sm white endTaste" disabled>종료됨</button>
							</c:if>

						</td>

					</tr>

				</c:forEach>
			</tbody>
		</table>

		<script>
			var $endTaste = $('.endTaste');
			$endTaste.each(function(index, element) {
				$(this).on(
						'click',
						function() {
							var $thisBtn = $(this);
							var tasteNo = $(this).parent().parent().children()
									.eq(0).text();
							var $tasteIng = $(this).parent().parent()
									.children().eq(5);
							console.log(tasteNo);
							$.ajax({
								url : 'endApplyTaste.ad',
								type : 'post',
								data : {
									tasteNo : tasteNo
								},
								success : function(data) {
									console.log(data);
									if (parseInt(data) > 0) {
										$thisBtn.attr('disabled', true);
										$thisBtn.text("종료됨");
										$tasteIng.text("종료됨");
									}
								},
								error : function(data) {
									console.log(data);
								}
							});
						});
			});
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
				<c:url var="before" value="productList.ad">
					<c:param name="page" value="${ pi.currentPage -1 }" />
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
					<c:url var="pagination" value="productList.ad">
						<c:param name="page" value="${ p }" />
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
				<c:url var="after" value="product;ist.ad">
					<c:param name="page" value="${ pi.currentPage + 1 }" />
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
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-screenfull.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-scroll-to.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-toggle-class.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/app.js"></script>

	<!-- ajax -->
	<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/jquery-pjax/jquery.pjax.js"></script> --%>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ajax.js"></script>
	<!-- endbuild -->
</body>
</html>