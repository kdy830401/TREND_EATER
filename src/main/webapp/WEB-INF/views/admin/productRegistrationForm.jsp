<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<<<<<<< HEAD
=======
<meta name="description" content="Admin, Dashboard, Bootstrap, Bootstrap 4, Angular, AngularJS" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- for ios 7 style, multi-resolution icon of 152x152 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-barstyle" content="black-translucent">
<link rel="apple-touch-icon" href="${ pageContext.servletContext.contextPath }/resources/assets/images/logo.png">
<meta name="apple-mobile-web-app-title" content="Flatkit">
<!-- for Chrome on Android, multi-resolution icon of 196x196 -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="shortcut icon" sizes="196x196" href="${ pageContext.servletContext.contextPath }/resources/assets/images/logo.png">

<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<!-- style -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/animate.css/animate.min.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/glyphicons/glyphicons.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/font-awesome/css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/material-design-icons/material-design-icons.css" type="text/css" />

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/bootstrap/dist/css/bootstrap.min.css" type="text/css" />
<!-- build:css ../assets/styles/app.min.css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/styles/app.css" type="text/css" />
<!-- endbuild -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/styles/font.css" type="text/css" />

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>

>>>>>>> refs/remotes/origin/develop


<style>
p {
	font-weight: 600;
	font-size: 10px;
}

.insertArea, form {
	margin-top: 50px;
	width: 100%;
}

#contentImgArea0:hover, #contentImgArea1:hover {
	cursor: pointer;
	background: rgba(0, 0, 0, 0.8);
	color: #fff;
	transition-duration: 0.5s;
}

#contentImgArea0, #contentImgArea1 {
	width: 90px;
	height: 90px;
	display: flex;
	flex-direction: column;
	border: 2px solid darkgray;
	text-align: center;
	margin: auto;
	margin-top: 70px;
	margin-bottom: 70px;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48;
	font-size: 20px;
	text-align: center;
}
</style>
<body>
	<c:import url="adminMenubar.jsp" />
	<!-- ############ PAGE START 여기에 내용 넣어주세요 -->
	<div class="uk-container uk-tile uk-tile-muted uk-margin-medium">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-large">상품등록</h2>
	</div>
	<div class="uk-container uk-tile uk-tile-muted uk-margin-medium">
		<form action="registerProduct.ad" class="uk-grid uk-child-width-1-1" method="post" encType="multipart/form-data" uk-grid>
			<div class="col-sm-4">
				<div class="form-group">
					<label class="form-control-label">
						<span class="label primary">상품 판매 여부</span>
					</label>
					<select class="form-control c-select " name="productType" required>
						<option value="" disabled selected>판매 여부를 선택하세요</option>
						<option value="1">판매</option>
						<option value="2">미판매</option>
					</select>
				</div>
			</div>
			<div class="uk-inline">
				<div class="md-form-group float-label">
					<input type="text" id="productNo" name="productName" class="md-input red-600" required>
					<label for="productNo">상품명</label>
				</div>
			</div>
			<div class="uk-inline">
				<div class="md-form-group float-label">
					<input type="text" id="productPrice" name="productPrice" class="md-input" required>
					<label for="productPrice">상품가격</label>
				</div>
			</div>
			<div class="uk-inline">
				<div class="md-form-group float-label">
					<input type="text" id="productStock" name="productStock" class="md-input">
					<label for="productStock">재고수량</label>
				</div>
			</div>

			<div class="uk-inline">
				<div class="md-form-group float-label">
					<input type="text" id="productStock" name="productOneLine" class="md-input" required>
					<label for="productStock">한줄평</label>
				</div>
			</div>
			<div class="uk-inline">
				<div class="md-form-group float-label">
					<textarea name="boardContent" id="icon_prefix2" class="md-input" style="resize: none;"></textarea>
					<label for="icon_prefix2">제품소개글</label>
				</div>
			</div>


			<div class="uk-inline">
				<div class="insertArea">
					<div id="contentImgArea0">
						<br>
						<span>
							<i id="contentImg0" class="material-icons">add_a_photo</i>
							<p class="m-a">상품사진</p>
						</span>
					</div>

					<!-- 파일 업로드 하는 부분 -->
					<div id="fileArea0">
						<input type="file" id="productImg" name="productImg">
					</div>
					<div class="col 12" uk-grid>
						<div class="col s6 uk-align-center" id="productImgLayout"></div>
					</div>
					<script>
						// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
						$(function() {
							// 해당영역 숨김
							$("#fileArea0").hide();

							$("#contentImgArea0").click(function() {
								$("#productImg").click();
								$('#productImgLayout').empty();
							});

						});

						// 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
						var sel_files = [];

						$(document).ready(
								function() {
									// 선택자의 값이 변경되면 handleImgsFilesSelect 함수가 실행
									$('#productImg').on('change',
											handleImgsFilesSelect0);
								});

						function handleImgsFilesSelect0(e) {
							var files = e.target.files; // file의 정보를 저장, files는 선택한 파일의 FileList 객체(배열형태)
							var filesArr = Array.prototype.slice.call(files); // 해당 객체를 배열로 잘라서 저장

							filesArr.forEach(function(f) {
								if (!f.type.match("image.*")) {
									alert("확장자는 이미지 확장자만 가능합니다.");
									return;
								}

								sel_files.push(f); // 이미지 확장자 파일을 배열에 넣는다

								var reader = new FileReader();
								reader.onload = function(e) { // reader의 읽기에 성공하면 함수 실행 onload는 파일 읽기에 성공하면 실행되는 이벤트 핸들러
									var divTag = $("<div></div>");
									divTag.attr("class", "uk-text-center");

									var imgTag = $("<img>");
									imgTag.attr("src", e.target.result);

									divTag.append(imgTag);

									$("#productImgLayout").append(divTag);
								}
								reader.readAsDataURL(f); // DataURL 형식으로 파일을 읽어온다
							});
						}
					</script>

					<div id="contentImgArea1">
						<br>
						<span>
							<i id="contentImg0" class="material-icons">add_a_photo</i>
							<p class="m-a">상세정보</p>
						</span>
					</div>

					<!-- 파일 업로드 하는 부분 -->
					<div id="fileArea1">
						<input type="file" id="nutInfoImg" multiple name="nutInfoImg">
					</div>
					<div class="col 12" uk-grid>
						<div class="col s6 uk-align-center" id="detailImgLayout"></div>
					</div>
					<script>
						// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
						$(function() {
							$("#fileArea1").hide();

							$("#contentImgArea1").click(function() {
								$("#nutInfoImg").click();
								$('#detailImgLayout').children().remove();
							});

						});

						// 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
						var sel_files = [];

						$(document).ready(
								function() {
									$('#nutInfoImg').on('change',
											handleImgsFilesSelect1);
								});

						function handleImgsFilesSelect1(e) {
							var files = e.target.files;
							var filesArr = Array.prototype.slice.call(files);

							filesArr.forEach(function(f) {
								if (!f.type.match("image.*")) {
									alert("확장자는 이미지 확장자만 가능합니다.");
									return;
								}

								sel_files.push(f);

								var reader = new FileReader();
								reader.onload = function(e) {
									var divTag = $("<div></div>");
									divTag.attr("class", "uk-text-center");

									var imgTag = $("<img>");
									imgTag.attr("src", e.target.result);

									divTag.append(imgTag);

									$("#detailImgLayout").append(divTag);
								}
								reader.readAsDataURL(f);
							});
						}
					</script>
				</div>
			</div>
			<div class="uk-text-center submit">
				<button class="btn btn-outline b-warning text-warning">취소</button>
				<button class="btn btn-outline b-primary text-primary">등록</button>
			</div>
		</form>
	</div>


	<!-- ############ PAGE END 끝~ -->

	</div>
	</div>
	<!-- / -->

	<!-- theme switcher -->

	<!-- ############ LAYOUT END-->

	</div>
	<!-- textarea태그 자동 줄생성 스크립트 -->
	<script>
		/* textarea 태그를 선택하여 keydown keyup 이벤트 발생시키고
			해당 선택요소의 높이를 1늘리고 
			해당 요소에 scrolHeight속성을 넣어 스크롤 높이 만큼 textarea높이를 높이게함
		 */
		$("textarea").on('keydown keyup', function() {
			$(this).height(1).height($(this).prop('scrollHeight'));
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
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-screenfull.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-scroll-to.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-toggle-class.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/app.js"></script>

	<!-- ajax -->
	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/jquery-pjax/jquery.pjax.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ajax.js"></script>
	<!-- endbuild -->
</body>
</html>
