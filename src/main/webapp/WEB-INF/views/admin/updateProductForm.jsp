<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>

</head>
<style>
.originImg {
	width: 540px;
	height: 450px !important;
}
</style>
<body>
	<c:import url="adminMenubar.jsp" />
	<!-- ############ PAGE START 여기에 내용 넣어주세요 -->
	<div class="uk-container uk-tile uk-tile-muted uk-margin-medium">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-large">상품수정</h2>
	</div>
	<div class="uk-container uk-tile uk-tile-muted uk-margin-medium">
		<form action="updateProduct.ad" class="uk-grid uk-child-width-1-1" method="post" encType="multipart/form-data" uk-grid>
			<input type="hidden" name="productNo" value="${ p.productNo }">
			<div class="col-sm-4">
				<div class="form-group">
					<label class="form-control-label">
						<span class="label primary">상품 판매 여부</span>
					</label>
					<select class="form-control c-select " name="productType" required>
						<option value="" disabled selected>판매 여부를 선택하세요</option>
						<c:choose>
							<c:when test="${ p.productType == 1 }">
								<option value="1" selected="selected">판매</option>
							</c:when>
							<c:when test="${ p.productType == 2 }">
								<option value="2" selected="selected">미판매</option>
							</c:when>
						</c:choose>
					</select>
				</div>
			</div>
			<div class="uk-inline">
				<div class="md-form-group float-label">
					<input type="text" id="productNo" value="${ p.productName }" name="productName" class="md-input red-600" required>
					<label for="productNo">상품명</label>
				</div>
			</div>
			<div class="uk-inline">
				<div class="md-form-group float-label">
					<input type="text" id="productPrice" value="${ p.productPrice }" name="productPrice" class="md-input" required>
					<label for="productPrice">상품가격</label>
				</div>
			</div>
			<div class="uk-inline">
				<div class="md-form-group float-label">
					<input type="text" id="productStock" value="${ p.productStock}" name="productStock" class="md-input">
					<label for="productStock">재고수량</label>
				</div>
			</div>

			<div class="uk-inline">
				<div class="md-form-group float-label">
					<input type="text" id="productStock" value="${ p.productOneLine }" name="productOneLine" class="md-input" required>
					<label for="productStock">한줄평</label>
				</div>
			</div>
			<div class="uk-inline">
				<div class="md-form-group float-label">
					<textarea name="boardContent" id="icon_prefix2" class="md-input" style="resize: none;">${ p.boardContent }</textarea>
					<label for="icon_prefix2">제품소개글</label>
				</div>
			</div>

			<div class="uk-margin">
				<div class="uk-child-width-1-2 uk-grid"uk-grid">
					<div id="productImgArea">
						<div id="productImgLayout" class="uk-background-image@m uk-background-default uk-height-large uk-panel uk-flex uk-flex-center uk-flex-middle">
							<c:forEach var="img" items="${ imgList }">
								<c:if test="${ img.fileType == 1 }">
									<img class="originImg" src="${ contextPath }/resources/productImgUploadFiles/${ img.changeName }">
								</c:if>
							</c:forEach>
						</div>
					</div>

					<c:forEach var="img" items="${ imgList }">
						<c:if test="${ img.fileType == 1 }">
							<input type="hidden" name="delProductImgNo" value="${ img.imageNo }">
							<input type="hidden" name="delProductImgName" value="${ img.changeName }">
						</c:if>
						<c:if test="${ img.fileType == 2 }">
							<input type="hidden" name="delNutInfoImgNo" value="${ img.imageNo }">
							<input type="hidden" name="delNutInfoImgName" value="${ img.changeName }">
						</c:if>
					</c:forEach>
					<div id="fileArea1">
						<input type="file" id="productImg" name="productImg">
					</div>
					<script>
						$(function() {
							$('#fileArea1').hide();
							$('#productImgArea').click(function() {
								$('#productImg').click();
								$('#productImgLayout').empty();
							});
						});

						$(document).ready(
								function() {
									$('#productImg').on('change',
											handleImgsFileSelect1);
								});

						function handleImgsFileSelect1(e) {
							var files = e.target.files;
							var filesArr = Array.prototype.slice.call(files);

							filesArr.forEach(function(f) {
								if (!f.type.match("image.*")) {
									alert("확장자는 이미지 확장자만 가능합니다.");
									return;
								}
								var reader = new FileReader();
								reader.onload = function(e) {
									var imgTag = $("<img>");
									imgTag.attr("uk-cover");
									imgTag.css({
										"width" : "540px",
										"height" : "450px"
									})
									imgTag.attr("src", e.target.result);
									$("#productImgLayout").append(imgTag);
								}
								reader.readAsDataURL(f);
							});
						}
					</script>

					<div id="nutInfoImgArea">
						<div id="nutInfoImgLayout" class="uk-background-image@m uk-background-default uk-height-large uk-panel uk-flex uk-flex-center uk-flex-middle">
							<c:forEach var="img" items="${ imgList }">
								<c:if test="${ img.fileType == 2 }">
									<img class="originImg" src="${ contextPath }/resources/productImgUploadFiles/${ img.changeName}">

								</c:if>
							</c:forEach>
						</div>
					</div>

					<div id="fileArea2">
						<input type="file" id="nutInfoImg" name="nutInfoImg">
					</div>
					<script>
						$(function() {
							$('#fileArea2').hide();
							$('#nutInfoImgArea').click(function() {
								$('#nutInfoImg').click();
								$('#nutInfoImgLayout').empty();
							});
						});

						$(document).ready(
								function() {
									$('#nutInfoImg').on('change',
											handleImgsFileSelect2);
								});

						function handleImgsFileSelect2(e) {
							var files = e.target.files;
							var filesArr = Array.prototype.slice.call(files);

							filesArr.forEach(function(f) {
								if (!f.type.match("image.*")) {
									alert("확장자는 이미지 확장자만 가능합니다.");
									return;
								}
								var reader = new FileReader();
								reader.onload = function(e) {
									var imgTag = $("<img>");
									imgTag.attr("uk-cover");
									imgTag.css({
										"width" : "540px",
										"height" : "450px"
									})
									imgTag.attr("src", e.target.result);
									$("#nutInfoImgLayout").append(imgTag);
								}
								reader.readAsDataURL(f);
							});
						}
					</script>


				</div>





			</div>
			<div class="uk-text-center submit uk-margin-large">
				<input class="btn btn-outline b-primary text-primary" type="submit" value="수정">
				<input type="button" class="btn btn-outline b-warning text-warning" value="취소" onclick="location.href='javascript:history.go(-1);'" onsubmit="dosubmit();">
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
