<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>



<link rel="stylesheet" href="/css/jquery.uploader.css">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="./dist/jquery.uploader.min.js"></script>
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
			<ul>
        <li>
            <i>Multiple File Upload</i>
            <input type="text" id="demo1" value="">
        </li>
        <li>
            <i>Single File Upload</i>
            <input type="text" id="demo2" value="">
        </li>
        <li>
            <i>With preselected Files</i>
            <input type="text" id="demo3" value="">
        </li>
    </ul>
			
			
			</div>
			<div class="uk-text-center submit">
				<button class="btn btn-outline b-warning text-warning" onclick="location.href='javascript:history.go(-1);'">취소</button>
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
