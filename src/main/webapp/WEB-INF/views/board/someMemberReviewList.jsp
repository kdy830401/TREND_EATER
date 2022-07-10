<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- UIkit CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />
<!-- UIkit JS -->
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<!-- 차트 -->
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/9b412a72a4.js"
	crossorigin="anonymous"></script>


<!-- css -->
<link href="/assets/css/star.css" rel="stylesheet" />

<!-- 차트 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->

<style>
body {
	background: #F3F5F7;
	font-family: noto sans;
}

.uk-container {
	margin-top: 120px;
	background: white;
}

#review-header {
	margin-top: 30px;
	padding: 15px 15px;
	/*  상자내부 간격 : 위아래 5px, 오른쪽왼쪽 15px  */
	font-size: 30px;
	font-weight: 500;
}

#review-count {
	font-size: 15px;
	color: rgba(255, 99, 132, 0.6);
}

#total-arrange {
	margin-left: 65%;
}

.arrange {
	font-size: 8px;
}

.uk-text-light {
	margin-top: 50px;
	margin-bottom: 50px;
	font-size: 25px;
	padding: 30px;
}

.uk-comment {
	/* 	margin-top: 100px; */
	
}

.uk-child-width-expand {
	font-size: 30px;
}

.star {
	color: rgb(255, 99, 132);
	font-size: 23px;
}

#thumb {
	margin: 0 7px 0 30px;
	font-size: 20px;
	color: black;
}

.thumb-like {
	font-size: 12px;
}

#chart-button {
	margin-left: 700px;
	/* 	color: rgb(255,99,132); */
	border-radius: 35%;
	border-radius: 15px;
	border: none;
	background: none;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
	text-decoration: none;
}

.siren {
	height: 32px;
	weight: 32px;
	margin: 0 0 5px 20px;
}
.first-hr{
margin-bottom: 50px;

}
.comment-hr{
margin: 50px 0 50px 0; 
}

.uk-pagination{
margin-top: 150px;
}

#tothetop{
/* background-color: rgba(255, 99, 132, 0.3); */
position: fixed; 
bottom: 1rem; 
right: 1rem; 
cursor: pointer; 
padding-bottom: 10px;
width: 50px;
height: 50px;
box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
}

#write-review{
background-color: rgba(255, 99, 132, 0.3);
icon-color: red;
position: fixed; 
bottom: 5rem; 
right: 1rem; 
cursor: pointer; 
padding-bottom: 10px;
width: 50px;
height: 50px;
box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
}
}
</style>
</head>
<body>
	<!-- nav-bar 임시 -->
	<nav class="uk-navbar-container uk-margin" uk-navbar uk-sticky>
		<div class="uk-navbar-left">

			<a class="uk-navbar-item uk-logo" href="#"><img
				src="resources/images/Logo.png" width="140" height="140"></a>

			<ul class="uk-navbar-nav">
				<li><a href="#"> <span
						class="uk-icon uk-margin-small-right" uk-icon="icon: star"></span>
						Features
				</a></li>
			</ul>

			<div class="uk-navbar-item">
				<div>
					Some <a href="#">Link</a>
				</div>
			</div>

			<div class="uk-navbar-item">
				<form action="javascript:void(0)">
					<input class="uk-input uk-form-width-small" type="text"
						placeholder="Input">
					<button class="uk-button uk-button-default">Button</button>
				</form>
			</div>

		</div>
	</nav>

	<div class="uk-container uk-container-midium" id="container">

		<h1  id="review-header">
			(닉네임)님의 리뷰 목록<span id="review-count"> (234)</span>
		</h1>
		<ul
			class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top"
			id="total-arrange">
			<li class="arrange"><a href="">최신순</a></li>
			<li class="arrange"><a href="">추천순</a></li>
			<li class="arrange"><a href="">높은 평점순</a></li>
			<li class="arrange"><a href="">낮은 평점순</a></li>
		</ul>
			<hr class="first-hr">

		<!-- 내용 -->
		<article class="uk-comment">
			<header class="uk-comment-header">
				<div class="uk-grid-medium uk-flex-top" uk-grid>
					<div>
						<a href=""><img class="uk-border-circle" width="40" height="40" src="resources/images/hapu.jpg" alt=""></a>
					</div>
					<div class="uk-width-expand">
						<span class="uk-comment-title uk-margin-remove"><a
							class="uk-link-reset" href="#">치킨주세요</a></span> <a><i class="fa-regular fa-thumbs-up" id="thumb"></i></a>
							<span class="thumb-like">0명이 좋아합니다.</span>
						<div class="uk-inline">
							<button class="uk-button uk-button-default uk-button-small"
								type="button" id="chart-button">맛 평가</button>
							<div uk-drop="pos: right-bottom">
								<div class="uk-card uk-card-body uk-card-default">
									추천의사
									<div class="star">★★★★★</div>
									<br> 재구매의사
									<div class="star">★★★★★</div>
									<br>
									<div>
										<canvas id="radar-chart" width="250" height="250"></canvas>
									</div>
								</div>
							</div>
						</div>
						<a><span><img class="siren"
								src="resources/images/siren.png"></span></a>
						<ul
							class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
							<li>단맛 / 짠맛 / 매운맛</li>
						</ul>
						<ul
							class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
							<li>황금올리브 닭다리 반반</li>
							<li>2022.06.15</li>
						</ul>
						<span class="star">★★★★★</span>
					</div>
				</div>
			</header>
			<!-- 슬라이더 -->
			<div class="uk-position-relative uk-visible-toggle uk-light"
				tabindex="-1" uk-slider>

				<ul
					class="uk-slider-items uk-child-width-1-2 uk-child-width-1-6@m uk-grid">
					<li>
						<div class="uk-panel">
							<img src="resources/images/chicken.jpg" width="400" height="600"
								alt="">
						</div>
					</li>
					<li>
						<div class="uk-panel">
							<img src="resources/images/chicken.jpg" width="400" height="600"
								alt="">
						</div>
					</li>
				</ul>
				<a class="uk-position-center-left uk-position-small uk-hidden-hover"
					href="#" uk-slidenav-previous uk-slider-item="previous"></a> <a
					class="uk-position-center-right uk-position-small uk-hidden-hover"
					href="#" uk-slidenav-next uk-slider-item="next"></a>

			</div>
			<!-- 슬라이더 끝 -->
			<div class="uk-comment-body">
				<br>

				<ul uk-accordion > 
					<li><a
						class="uk-accordion-title" href="#" style="font-size: 15px;">치킨
							먹고싶다아악 후라이드 치킨은 너무 맛있어요 양념치킨은 양념이 너</a>
						<div class="uk-accordion-content" style="font-size: 15px">
							<p>어무 달아요</p>

						</div></li>
				</ul>
			</div>
			<hr class="comment-hr">
		</article>
		<!-- 코맨트 끝 -->
		<!-- 내용 -->
		<article class="uk-comment">
			<header class="uk-comment-header">
				<div class="uk-grid-medium uk-flex-top" uk-grid>
					<div>
						<a href=""><img class="uk-border-circle" width="40"
							height="40" src="resources/images/hapu.jpg" alt=""></a>
					</div>
					<div class="uk-width-expand">
						<span class="uk-comment-title uk-margin-remove"><a
							class="uk-link-reset" href="#">치킨주세요</a></span> <a><i
							class="fa-regular fa-thumbs-up" id="thumb"></i></a><span
							class="thumb-like">0명이 좋아합니다.</span>
						<div class="uk-inline">
							<button class="uk-button uk-button-default uk-button-small"
								type="button" id="chart-button">맛 평가</button>
							<div uk-drop="pos: right-bottom">
								<div class="uk-card uk-card-body uk-card-default">
									추천의사
									<div class="star">★★★★★</div>
									<br> 재구매의사
									<div class="star">★★★★★</div>
									<br>
									<div>
<!-- 										<canvas id="radar-chart" width="250" height="250"></canvas> -->
									</div>
								</div>
							</div>
						</div>
						<a><span><img class="siren"
								src="resources/images/siren.png"></span></a>
						<ul
							class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
							<li>단맛 / 짠맛 / 매운맛</li>
						</ul>
						<ul
							class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
							<li>황금올리브 닭다리 반반</li>
							<li>2022.06.15</li>
						</ul>
						<span class="star">★★★★★</span>
					</div>
				</div>
			</header>
			<!-- 슬라이더 -->
			<div class="uk-position-relative uk-visible-toggle uk-light"
				tabindex="-1" uk-slider>

				<ul
					class="uk-slider-items uk-child-width-1-2 uk-child-width-1-6@m uk-grid">
					<li>
						<div class="uk-panel">
							<img src="resources/images/chicken.jpg" width="400" height="600"
								alt="">
						</div>
					</li>
					<li>
						<div class="uk-panel">
							<img src="resources/images/chicken.jpg" width="400" height="600"
								alt="">
						</div>
					</li>
				</ul>
				<a class="uk-position-center-left uk-position-small uk-hidden-hover"
					href="#" uk-slidenav-previous uk-slider-item="previous"></a> <a
					class="uk-position-center-right uk-position-small uk-hidden-hover"
					href="#" uk-slidenav-next uk-slider-item="next"></a>

			</div>
			<!-- 슬라이더 끝 -->
			<div class="uk-comment-body">
				<br>

				<ul uk-accordion>
					<li><a
						class="uk-accordion-title" href="#" style="font-size: 15px;">치킨
							먹고싶다아악 후라이드 치킨은 너무 맛있어요 양념치킨은 양념이 너</a>
						<div class="uk-accordion-content" style="font-size: 15px">
							<p>어무 달아요</p>

						</div></li>
				</ul>
			</div>
<!-- 			<hr style="margin-top: 50px"> -->
		</article>
		<!-- 코맨트 끝 -->

		<!-- 페이지네이션 -->
		<ul class="uk-pagination uk-flex-center" uk-margin>
		    <li><a href="#"><span uk-pagination-previous></span></a></li>
		    <li class="uk-active"><span>1</span></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li><a href="#"><span uk-pagination-next></span></a></li>
		</ul>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	<!-- container -->
	
	<!-- 고정 버튼 (탑버튼, 글쓰기 버튼) -->
	<ul class="uk-iconnav uk-iconnav-vertical uk-icon-button uk-margin-small-right" id="tothetop">
    <li><a href="#" uk-icon="icon: chevron-up; ratio: 2"></a></li>
</ul>
<ul class="uk-iconnav uk-iconnav-vertical uk-icon-button uk-margin-small-right" id="write-review">
    <li><a href="write-review" uk-icon="icon: file-edit; ratio: 1.5"></a></li>
    </ul>
	<script>
		new Chart(document.getElementById("radar-chart"), {
			type : 'radar',
			data : {
				labels : [ "매운맛", "단맛", "짠맛", "신맛", "쓴맛" ],
				datasets : [ {
					backgroundColor : "rgba(255,99,132,0.4)",
					borderColor : "rgba(255, 92, 88,1)",
					borderWidth : 0.5,
					pointRadius : 0.2, //포인트 크기
					data : [ 3.4, 2.1, 1.9, 3.3, 4.8 ]

				} ]
			},
			options : {
				responsive : false, //false여야 크기 조정 가능
				title : {
					display : false,
				},
				scale : {
					gridLines : {
						color : [ "rgba(255, 92, 88,0.05)",
								"rgba(255, 92, 88,0.05)",
								"rgba(255, 92, 88,0.05)",
								"rgba(255, 92, 88,0.05)",
								"rgba(255, 92, 88,0.3)", ]
					},
					angleLines : {
						display : false
					},
					ticks : {
						display : false,
						beginAtZero : true,
						min : 0,
						max : 5.0,

					},
					pointLabels : {
						fontSize : 12,
						fontColor : "rgb(255, 92, 88)",
					}
				},
				legend : {
					display : false
				// 최상단 라벨의 카테고리 안보이기.

				}

			}
		});
		
// 		탑버튼
$( '#tothetop' ).click( function() {
    var htmloffset = $( 'html' ).offset();
    $( 'html, body' ).animate( { scrollTop : #review-header }, 400 );
});
	</script>
	
	
</body>
</html>