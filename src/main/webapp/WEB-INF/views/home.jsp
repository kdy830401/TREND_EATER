<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<!-- UIkit CSS -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />


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

<style>
.uk-container img {
	width: 100%;
	height: 100%;
}

* {
	font-family: "Noto Sans KR", sans-serif !important;
	word-break: keep-all;
}

.banner {
	max-width: 100%;
	height: 100%;
	/*  	object-fit: cover; */
}

.product {
	width: 250px;
	height: 320px !important;
}

.uk-card-body {
	height: 90px;
}

.productContent:hover {
	cursor: pointer;
}
</style>
<body>
	<c:import url="common/menubar.jsp" />
	<div class="uk-container">
		<div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" uk-slideshow="min-height: 300; max-height: 300; animation: push">
			<ul class="uk-slideshow-items">
				<c:forEach var="list" items="${eIList}">
					<li>
						<c:url var="edetail" value="edetail.bo">
							<c:param name="eNo" value="${list.identifyNo}" />
						</c:url>
						<div class="uk-position-cover uk-slideshow-parallax="scale: 1.2,1.2,1">
							<img class="banner" src="${ contextPath }/resources/buploadFiles/${list.changeName}" alt="" onclick="location.href='${edetail}'" uk-cover>
						</div>

					</li>
				</c:forEach>
			</ul>
			<a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
			<a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
		</div>
	</div>

	<div class="uk-container uk-margin-large">
		<h3 class="uk-heading-bullet uk-h3 uk-text-center uk-text-bold">new 신상품 새로나왔어요</h3>
	</div>

	<div class="uk-container uk-margin-large">
		<div class="uk-slider-container-offset" uk-slider>
			<div class="uk-position-relative uk-visible-toggle" tabindex="-1">
				<ul class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m uk-grid" uk-grid uk-height-match="target: > div > .uk-card">
					<c:forEach var="pIList" items="${pIList}" varStatus="status">
						<li class="productContent">
							<c:url var="prdetail" value="prbdetail.bo">
								<c:param name="pno" value="${pList[status.index].productNo}" />
							</c:url>
							<div class="uk-card uk-card-default">
								<div class="uk-card-media-top uk-padding-small">
									<div class="uk-transition-toggle" tabindex="0">
										<img class=" uk-transition-scale-up uk-transition-opaque product" src="${ contextPath }/resources/productImgUploadFiles/${pIList.changeName}" width="400" height="600" alt="" onclick="location.href='${prdetail}'">
										<div class="label label-sm red-A200 uk-align-left uk-inline uk-margin-remove uk-padding-small">N</div>
									</div>
								</div>
								<hr class="uk-margin-remove-bottom">
								<div class="uk-card-body uk-padding-small">
									<p class="uk-text-muted m-b-sm">
										<fmt:formatNumber value="${pList[status.index].productPrice}" pattern="#,###" />
										원
									</p>
									<h4 class="uk-h5 uk-text-bold uk-margin-remove-top">${pList[status.index].productName}</h4>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
				<a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
				<a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>
			</div>
		</div>
	</div>


	<div class="uk-container uk-margin-large">
		<h3 class="uk-heading-bullet uk-h3 uk-text-center uk-text-bold">HOT 평점이 가장 높은 상품</h3>
	</div>
	<div class="uk-container uk-margin-large">
		<div class="uk-container uk-margin-large">
			<div class="uk-slider-container-offset" uk-slider>
				<div class="uk-position-relative uk-visible-toggle" tabindex="-1">
					<ul class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m uk-grid" uk-grid uk-height-match="target: > div > .uk-card">
						<c:forEach var="bList" items="${bList}" varStatus="status">
							<li>
								<c:url var="prdetail2" value="prbdetail.bo">
									<c:param name="pno" value="${bProducts[status.index].productNo}" />
								</c:url>
								<div class="uk-card uk-card-default">
									<div class="uk-card-media-top uk-padding-small">
										<div class="uk-transition-toggle" tabindex="0">
											<img class=" uk-transition-scale-up uk-transition-opaque product" src="${ contextPath }/resources/productImgUploadFiles/${bList.changeName}" onclick="location.href='${prdetail2}'" width="400" height="600" alt="상품사진">
											<div class="label label-sm red-A700 uk-align-left uk-inline uk-margin-remove uk-padding-small">H</div>
										</div>
									</div>
									<hr class="uk-margin-remove-bottom">
									<div class="uk-card-body uk-padding-small">
										<p class="uk-text-muted m-b-sm">
											<fmt:formatNumber value="${bProducts[status.index].productPrice}" pattern="#,###" />
											원
										</p>
										<h4 class="uk-h5 uk-text-bold uk-margin-remove">${bProducts[status.index].productName}</h4>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
					<a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>
				</div>
			</div>
		</div>
	</div>

	<div class="uk-container uk-margin-large">
		<h3 class="uk-heading-bullet uk-h3 uk-text-center uk-text-bold">Eater's Pick Best Review</h3>
	</div>

	<div class="uk-container uk-margin-large">
		<div uk-slider>

			<div class="uk-position-relative">

				<div class="uk-slider-container uk-light ">
					<ul class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m uk-grid">
						<li>
							<img src="https://img-cf.kurly.com/shop/data/goods/1619661214577l0.jpg" width="400" height="600" alt="">
							<div class="uk-position-center uk-panel">
								<h1>1</h1>
							</div>
						</li>
						<li>
							<img src="https://img-cf.kurly.com/shop/data/goods/163944357879l0.jpg" width="400" height="600" alt="">
							<div class="uk-position-center uk-panel">
								<h1>2</h1>
							</div>
						</li>
						<li>
							<img src="https://img-cf.kurly.com/shop/data/goods/1637923254757l0.jpg" width="400" height="600" alt="">
							<div class="uk-position-center uk-panel">
								<h1>3</h1>
							</div>
						</li>
						<li>
							<img src="https://img-cf.kurly.com/shop/data/goods/1465441159271l0.jpg" width="400" height="600" alt="">
							<div class="uk-position-center uk-panel">
								<h1>4</h1>
							</div>
						</li>
						<li>
							<img src="https://img-cf.kurly.com/shop/data/goods/16393772232l0.jpg" width="400" height="600" alt="">
							<div class="uk-position-center uk-panel">
								<h1>5</h1>
							</div>
						</li>
						<li>
							<img src="https://img-cf.kurly.com/shop/data/goods/1616051159263l0.jpg" width="400" height="600" alt="">
							<div class="uk-position-center uk-panel">
								<h1>6</h1>
							</div>
						</li>
						<li>
							<img src="https://img-cf.kurly.com/shop/data/goods/1622450417295l0.jpg" width="400" height="600" alt="">
							<div class="uk-position-center uk-panel">
								<h1>7</h1>
							</div>
						</li>
						<li>
							<img src="https://img-cf.kurly.com/shop/data/goods/big/201508/417_shop1_389287.jpg" width="400" height="600" alt="">
							<div class="uk-position-center uk-panel">
								<h1>8</h1>
							</div>
						</li>
						<li>
							<img src="https://img-cf.kurly.com/shop/data/goods/big/201512/706_shop1_196633.jpg" width="400" height="600" alt="">
							<div class="uk-position-center uk-panel">
								<h1>9</h1>
							</div>
						</li>
						<li>
							<img src="https://img-cf.kurly.com/shop/data/goods/1491195959158l0.jpg" width="400" height="600" alt="">
							<div class="uk-position-center uk-panel">
								<h1>10</h1>
							</div>
						</li>
					</ul>
				</div>

				<div class="uk-hidden@s uk-light">
					<a class="uk-position-center-left uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
					<a class="uk-position-center-right uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
				</div>

				<div class="uk-visible@s">
					<a class="uk-position-center-left-out uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
					<a class="uk-position-center-right-out uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
				</div>

			</div>

			<!-- <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul> -->

		</div>

	</div>

	<c:import url="common/footer.jsp" />


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
