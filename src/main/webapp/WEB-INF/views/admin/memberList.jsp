<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>TREND EATER</title>

<!-- 검색 아이콘 불러오기-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />










<style>
th {
	background-color: white !important;
}

td {
	font-weight: bold !important;
	background-color: white !important;
}

button:hover {
	background: #FF5C58 !important;
}

label {
	cursor: pointer;
}
/*검색 아이콘 css*/
.material-symbols-outlined {
	font-size: 23px;
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48
}
</style>
</head>
<body>
	<c:import url="adminMenubar.jsp" />

	<!-- ############ PAGE START 여기에 내용 넣어주세요 -->


	<!-- ###테이블 div -->
	<div class="uk-container uk-tile uk-tile-default uk-margin-medium uk-padding-small">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-medium">회원 관리</h2>
		<div class="uk-margin">
			<form action="searchmember.ad" class="uk-align-right">
				<div class="uk-inline">
					<input class="uk-input uk-box-shadow-small" name="search" style="background-color: white; border: none; height: 38px; width: 200px;" type="search" placeholder="이메일 또는 이름으로 검색">
				</div>
				<div class="uk-inline">
					<button class="uk-button uk-button-primary uk-box-shadow-small" style="height: 38px; width: 38px; padding: 0;">
						<span class="material-symbols-outlined uk-text-middle">search</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<div class="uk-container">
		<div class="uk-align-center">

			<table class=" table table-bordered m-a-0 uk-box-shadow-small">
				<thead>
					<tr class="contentTr">
						<th colspan="9" style="color: black; font-weight: bold;">
							전체 사용자
							<span style="color: #FF5C58;"> ${result}</span>
							명
						</th>
					</tr>
					<tr>
						<th>이메일</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>휴대폰</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>가입일</th>
						<th>주소</th>
						<th>상태 변경</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="m" items="${member}" varStatus="mv">
						<tr class="contentTr">
							<td class="email">${m.email}</td>
							<td>${m.name}</td>
							<td>${m.nickName}</td>
							<td>${m.phone}</td>
							<td>${m.birthday}</td>
							<td>${m.gender}</td>
							<td>${m.createDate}</td>
							<td>${m.address}</td>
							<input class="status" id="status${mv.index}" type="hidden" value="${m.status}">
							<td>
								<label for="ch${mv.index}" class="check${mv.index} ui-switch warning m-t-xs m-r">
									<input type="checkbox" class="has-value input" id="ch${mv.index}" name="inputch">
									<i></i>
								</label>
							</td>
						</tr>
					</c:forEach>




				</tbody>
			</table>
		</div>
	</div>
	<!-- 테이블 div -->
	<script>
		$(function() {
			var userStatus = $('.status');

			var status = $('.input').parent().parent().parent().children(
					'input').eq(0).val();

			userStatus.each(function(index, item) {
				var statusVal = $(this).val();

				var checkbox = $(this).next().children().children('input')
						.eq(0);

				if (statusVal == 'Y') {

					checkbox.prop("checked", true);
				}

			});

		});

		$('.input').on(
				'click',
				function() {
					var checked = $(this).is(":checked");

					console.log(this);
					console.log("checked : " + checked);

					var email = $(this).parent().parent().parent().children(
							'td').eq(0).text();
					console.log("email : " + email);
					$.ajax({
						type : 'POST',
						url : 'memberstatus.ad',
						data : {
							email : email,
							checked : checked
						},
						success : function(data) {
							console.log("data:" + data);

						},
						error : function(data) {
							console.log("data:" + data);

						}

					});

				});

		/* 	$('.contentTr').find("td").mouseenter(function(){
		 $(this).parents("tr").css({'background':'rgba(0, 100, 0, 0.5)', 'color':'white', 'cursor':'pointer'});
		 }).mouseout(function(){
		 $(this).parents('tr').css({'background':'none', "color":"black"});
		 }); */
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
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/jquery/dist/jquery.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/tether/dist/js/tether.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/bootstrap/dist/js/bootstrap.js"></script>
	<!-- core -->
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/underscore/underscore-min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/jQuery-Storage-API/jquery.storageapi.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/PACE/pace.min.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/config.lazyload.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/palette.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-load.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-jp.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-include.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-device.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-form.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-nav.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-screenfull.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-scroll-to.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ui-toggle-class.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/app.js"></script>

	<!-- ajax -->
	<%-- <script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/jquery-pjax/jquery.pjax.js"></script> --%>
	<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ajax.js"></script>
	<!-- endbuild -->
</body>
</html>
