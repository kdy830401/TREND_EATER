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
</style>
</head>
<body>

	<c:import url="adminMenubar.jsp" />
	<!-- 하단 끝 -->

	<!-- ############ PAGE START 여기에 내용 넣어주세요 -->
	<div class="uk-container uk-tile uk-tile-default uk-padding-small">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-large">시식신청리스트</h2>
		<form class="uk-child-width-auto " uk-grid>
			<div class="uk-align-center">
				<div class="uk-inline">
					<select class="uk-select" id="seachCondition" name="searchCondition">
						<option value="" disabled selected>검색조건을 선택하세요</option>
						<option value="productName">제품명</option>
						<option value="userName">이름</option>
						<option value="userId">아이디</option>
					</select>
				</div>
				<div class="uk-inline">
					<a class="uk-form-icon uk-form-icon-flip" href="#" uk-icon="icon: search"></a>
					<input class="uk-input" id="seachValue" type="search" placeholder="검색어 입력">
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
				<a href="applyPersonList.ad?value=applyNo">신청번호순</a>
			</li>
			<li>
				<a href="applyPersonList.ad?value=applyDate">신청일순</a>
			</li>
			<li>
				<a href="applyPersonList.ad?value=productName">제품명순</a>
			</li>
		</ul>
		<table class="table table-hover b-t">
			<thead>
				<tr>
					<th>신청번호</th>
					<th>제품명</th>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>배송지정보</th>
					<th>신청일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="apply" items="${ list }">
					<tr>
						<td>${ apply.applyNo }</td>
						<td>${ apply.productName }</td>
						<td>${ apply.emailId }</td>
						<td>${ apply.name}</td>
						<td>${ apply.phone }</td>
						<td>${ apply.address }</td>
						<td>${ apply.applyDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>



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
	</div>
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
