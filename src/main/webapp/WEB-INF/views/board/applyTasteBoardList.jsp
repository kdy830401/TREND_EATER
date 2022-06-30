<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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



<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<style>
.uk-breadcrumb>:nth-child(n+2):not(.uk-first-column)::before {
	margin: 0 5px 0 calc(5px - 4px)
}

.uk-overlay-primary {
	background: rgba(34, 34, 34, 0.5);
}

.uk-icon-link svg:hover path {
	fill: white;
	transition: all ease 0.5s;
}

.fa-regular {
	font-size: 20px;
}

.countdown {
	color: black;
	font-size: 30px;
	font-weight: 500;
}

li {
	display: inline-block;
	font-size: 1.5em;
	list-style-type: none;
	padding: 1em;
	text-transform: uppercase;
}

li span {
	display: block;
}

.labelName {
	color: #FF5C58;
	background: #FFEDD3;
}

.productName {
	border-bottom: thin solid #dee2e6;
	padding-bottom: 10px !important;
}

@media all and (max-width: 768px) {
	h1 {
		font-size: calc(1.5rem * var(- -smaller));
	}
	li {
		font-size: calc(1.125rem * var(- -smaller));
	}
	li span {
		font-size: calc(3.375rem * var(- -smaller));
	}
}

.end {
	display: none;
}

.material-symbols-outlined {
	font-size: 30px;
	font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 0, 'opsz' 30
}

.btn {
	background: #FF5C58;
}
</style>


<body>
	<c:import url="../common/menubar.jsp" />

	<div class="uk-container m-a-lg">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-large">시식신청 게시판</h2>
	</div>

	<div class="uk-container m-a-lg">
		<div class="uk-child-width-1-3@m" uk-grid uk-height-match="target: > div > .uk-card">
			<c:if test="${ empty aList}">
				<div class="uk-align-center">
					<div class="uk-placeholder uk-text-center">시식신청 준비중입니다.</div>
				</div>
			</c:if>
			<c:if test="${ !empty aList }">
				<c:forEach var="a" items="${ aList }">

					<div>
						<div class="uk-card uk-card-default">
							<div class="uk-card-body">
								<p class="uk-text-large uk-text-bold uk-text-secondary productName">
									${ a.productName }
									<span class="uk-badge">100명 신청 중</span>
								</p>

								<!-- 					</div> -->
								<div class="uk-card-media">
									<div class="uk-transition-toggle" tabindex="0">
										<c:forEach var="img" items="${ imgList }">
											<c:if test="${ a.productNo == img.identifyNo && img.fileType == 1}">
												<img class="uk-transition-scale-up uk-transition-opaque" src="${ contextPath }/resources/productImgUploadFiles/${ img.changeName }" width="800" height="600" alt="상품사진">
											</c:if>
										</c:forEach>
									</div>
								</div>
								<span class="uk-label uk-text-bold labelName">마감</span>
								<span class="uk-label uk-text-bold">${ a.endDate } 10:00</span>
								<hr class="uk-margin-remove-bottom">
								<!-- 						<div class="uk-card-body uk-padding-small"> -->
								<input type="hidden" value="${ a.tasteIng }" name="tasteIng">
								<input type="hidden" value="${ a.endDate }" name="dDay">
								<div class="countdown">
									<ul class="uk-padding-remove uk-text-center">
										<li class="uk-text-small uk-text-light uk-text-muted uk-margin-remove uk-padding-remove">
											days
											<span class="days uk-text-large uk-text-bold uk-text-secondary uk-text-center"></span>
										</li>
										<li class="uk-margin-remove uk-padding-remove">
											<span class="uk-text-large uk-text-bold uk-text-secondary uk-text-center">:</span>
										</li>
										<li class="uk-text-small uk-text-muted uk-text-light uk-margin-remove uk-padding-remove">
											Hours
											<span class="hours uk-text-large uk-text-bold uk-text-secondary uk-text-center"></span>
										</li>
										<li class="uk-margin-remove uk-padding-remove">
											<span class="uk-text-large uk-text-bold uk-text-secondary uk-text-center">:</span>
										</li>
										<li class="uk-text-small uk-text-muted uk-text-light uk-margin-remove uk-padding-remove">
											Minutes
											<span class="minutes uk-text-large uk-text-bold uk-text-secondary uk-text-center"></span>
										</li>
										<li class="uk-margin-remove uk-padding-remove">
											<span class="uk-text-large uk-text-bold uk-text-secondary uk-text-center">:</span>
										</li>
										<li class="uk-text-small uk-text-muted uk-text-light uk-margin-remove uk-padding-remove">
											Seconds
											<span class="seconds uk-text-large uk-text-bold uk-text-secondary uk-text-center"></span>
										</li>
									</ul>
								</div>
								<div>
									<a class="uk-button uk-button-small uk-button-default waves-effect waves-red" href="#modal-overflow_${ a.tasteNo }" uk-toggle>신청하기</a>
									<a class="uk-button uk-button-small uk-button-default waves-effect waves-red" href='prbdetail.bo?pno=${ a.productNo }'>제품보기</a>
									<div id="modal-overflow__${ a.tasteNo }" uk-modal>
										<div class="uk-modal-dialog">

											<button class="uk-modal-close-default" type="button" uk-close></button>

											<div class="uk-modal-header">
												<h2 class="uk-modal-title">시식신청</h2>
											</div>

											<form action="" class="uk-form-horizontal" class="col s12">
												<div class="uk-modal-body" uk-overflow-auto>
													<input type="hidden" value="boardNo">
													<div class="row">
														<div class="input-field col s6">
															<input id="boardNo_name" type="text" class="md-input uk-margin-medium-bottom">
															<label for="boardNo_name">이름</label>
														</div>
														<div class="input-field col s6">
															<input id="boardNo_phone" type="text" class="md-input phone uk-margin-medium-bottom">
															<label for="boardNo_phone">연락처</label>
														</div>
														<div class="input-field col s6">
															<input id="boardNo_address" type="text" name="address1" class="md-input address1 uk-margin-medium-bottom">
															<label for="boardNo_address">주소</label>
															<button class="uk-button uk-button-primary address uk-margin-medium-bottom" type="button" onclick="sample6_execDaumPostcode()">
																<b>주소검색</b>
															</button>
														</div>
														<div class="input-field col s12">
															<input id="boardNo_addressDetail" type="text" name="address2" class="md-input addressDetail">
															<label for="boardNo_addressDetail">상세주소</label>
														</div>
													</div>
												</div>

												<div class="uk-modal-footer uk-text-right">
													<a class="btn-flat waves-effect waves-red uk-modal-close" type="button">취소</a>
													<a class="btn waves-effect waves-light" type="submit">신청</a>
												</div>
											</form>

										</div>
									</div>




								</div>
								<!-- 						  </div> -->
								<div class="uk-overlay-primary uk-position-cover end"></div>
								<div class="uk-overlay uk-position-center uk-background-secondary uk-light end">
									<p class="uk-text-large uk-text-bold end">신청이 종료되었습니다.</p>
								</div>

							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>


		</div>
	</div>


			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 휴대전화 하이픈
	$(".phone").on("keyup", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	});

		// 			 카카오 주소 api
		$(".address1").on("click", function() { //주소입력칸을 클릭하면
			//카카오 지도 발생
			new daum.Postcode({
				oncomplete : function(data) { //선택시 입력값 세팅
					$(this).val() = data.address; // 주소 넣기
					$(".addressDetail").focus(); //상세입력 포커싱
				}
			}).open();
		});
	</script>
	<script>
		function sample6_execDaumPostcode() { //주소입력칸을 클릭하면
			/* $(".address2").append('<input type="text" id="sample6_address" placeholder="주소"><br><input type="text" id="sample6_detailAddress" placeholder="상세주소">'); */
			//카카오 지도 발생
			new daum.Postcode(
					{
						oncomplete : function(data) { //선택시 입력값 세팅
							document.getElementById("sample6_address").value = data.address; // 주소 넣기
							document.getElementById("sample6_detailAddress")
									.focus(); //상세입력 포커싱
						}
					}).open();
		};
	</script>



	<script type="text/javascript">
		(function() {
			const second = 1000, minute = second * 60, hour = minute * 60, day = hour * 24;
	
			$('.countdown').each(function(index, item) {
	
				var countdown = $(this);
	
// 				console.log($(this).prev().val());
				var date = $(this).prev().val() + "T10:00:00+0900";
				var tasteIng = $(this).prev().prev().val();
				let setDate = new Date(date), setDateYear = setDate.getFullYear(), setDateMonth = setDate.getMonth() + 1, setDateDay = setDate.getDate(), setDateHour = setDate.getHours(), setDateMinutes = setDate.getMinutes();
	
				var dDay = setDate.getTime();
				setInterval(time, 1000);
	
				function time() {
	
					var now = new Date().getTime();
					var distance = dDay - now;
	
					countdown.children().children().eq(0).children().eq(0).text(Math.floor(distance / (day)));
					countdown.children().children().eq(2).children().eq(0).text(Math.floor((distance % (day)) / (hour)));
					countdown.children().children().eq(4).children().eq(0).text(Math.floor((distance % (hour)) / (minute))); 
					countdown.children().children().eq(6).children().eq(0).text(Math.floor((distance % (minute)) / second));
	
// 					console.log(distance);
					//do something later when date is reached
					if (distance < 1 || tasteIng == 2) {
						clearInterval();
						countdown.hide();
						countdown.parent().parent().find('.end').show()
	
	
					}
	
				}
	
				//seconds
			});
		}());
	</script>

</body>
</html>



