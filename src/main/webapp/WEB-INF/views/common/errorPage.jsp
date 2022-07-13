<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<head>


<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Arvo'>

</head>

<style>
.page_404 {
	padding: 40px 0;
	background: #fff;
/* 	font-family: 'Arvo', serif; */
font-family: 'Noto Sans KR', sans-serif
}

.page_404  img {
	width: 100%;
}

.four_zero_four_bg {
	background-image:
		url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
	height: 400px;
	background-position: center;
}

.four_zero_four_bg h1 {
	font-size: 80px;
	font-weight: bold;
	color :#FF5C58;
}

.four_zero_four_bg h3 {
	font-size: 80px;
}

.link_404 {
	color: #fff !important;
	padding: 10px 20px;
	background: #FF5C58;
	margin: 20px 0;
	display: inline-block;
}

.contant_box_404 {
	margin-top: -50px;
}

.exception{
	color : #d50000;
}

.msg{
	color : #ffab91;
}

</style>
<body>

	<section class="page_404">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 ">
					<div class="col-sm-10 col-sm-offset-1  text-center">
						<div class="four_zero_four_bg">
							<h1 class="text-center ">Oops!</h1>


						</div>

						<div class="contant_box_404">
							<h3 class="h2">Look like you're lost</h3>

							<p>the page you are looking for not avaible!</p>
							
							<p class="msg">${ msg }</p>
							
							<p class="exception">${requestScope['javax.servlet.error.message'] }</p>

							<a href="${ pageContext.servletContext.contextPath }/home.do" class="link_404">Go to Home</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


</body>
</html>