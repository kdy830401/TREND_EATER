<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- uikit -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit.min.css" />
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>

<meta name="description" content="Admin, Dashboard, Bootstrap, Bootstrap 4, Angular, AngularJS" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- for ios 7 style, multi-resolution icon of 152x152 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-barstyle" content="black-translucent">
<link rel="apple-touch-icon" href="${ pageContext.servletContext.contextPath }/resources/admin/assets/images/logo.png">
<meta name="apple-mobile-web-app-title" content="Flatkit">
<!-- for Chrome on Android, multi-resolution icon of 196x196 -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="shortcut icon" sizes="196x196" href="${ pageContext.servletContext.contextPath }/resources/admin/assets/images/logo.png">

<!-- style -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/admin/assets/animate.css/animate.min.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/admin/assets/glyphicons/glyphicons.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/admin/assets/font-awesome/css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/admin/assets/material-design-icons/material-design-icons.css" type="text/css" />

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/admin/assets/bootstrap/dist/css/bootstrap.min.css" type="text/css" />
<!-- build:css ../assets/styles/app.min.css -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/admin/assets/styles/app.css" type="text/css" />

<!-- endbuild -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/admin/assets/styles/font.css" type="text/css" />


<!-- 검색 아이콘 불러오기-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />



<!-- UIkit CSS -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit.css" />
<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>


<style>
</style>
</head>
<body>
	<div class="uk-container">
		<div uk-scrollspy="target: > div; cls: uk-animation-fade; delay: 500">
			<div class="uk-child-width-1-3@m " uk-scrollspy="cls: uk-animation-fade; target: .uk-card; delay: 500; repeat: true">
				<div class="uk-align-center" style="margin-top: 230px;">
					<div class="uk-card uk-card-default uk-card-body">
						<h3 class="uk-card-title">TREND EATER LOGIN</h3>
						<form action="admin/adminlogin.ad" method="POST">
							<div class="md-form-group float-label ">
								<input class="md-input" name="id" required="">
								<label>ID</label>
							</div>
							<div class="md-form-group float-label">
								<input class="md-input" name="pwd" required="">
								<label>PASSWORD</label>
							</div>
							<button class="btn  btn-block btn-fw success uk-align-center" style="cursor: pointer;">LOGIN</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

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
<script src="${ pageContext.servletContext.contextPath }/resources/admin/libs/jquery/jquery-pjax/jquery.pjax.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/admin/scripts/ajax.js"></script>
<!-- endbuild -->
</html>