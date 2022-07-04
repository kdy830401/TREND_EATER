<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Admin, Dashboard, Bootstrap, Bootstrap 4, Angular, AngularJS" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="shortcut icon" sizes="196x196" href="${ pageContext.servletContext.contextPath }/resources/assets/images/logo.png">

<!-- 제이쿼리 -->
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
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<style>
.uk-breadcrumb>:nth-child(n+2):not(.uk-first-column)::before {
	margin: 0 5px 0 calc(5px - 4px);
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

.li {
	display: inline-block;
	font-size: 0.5em;
	list-style-type: none;
	padding: 1em;
	text-transform: uppercase;
}

.li span {
	display: block;
}

.labelName {
	color: #FF5C58 !important;
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

/* .btn { */
/* 	background: #FF5C58; */
/* } */
</style>


<body>
	<c:import url="../common/menubar.jsp" />

	<div class="uk-container uk-margin-large">
		<h2 class="uk-h2 uk-text-bolder uk-heading-bullet uk-text-center uk-margin-large">시식신청 게시판</h2>
	</div>
	
	<c:if test="${ empty aList}">
		<div class="uk-align-center">
			<div class="uk-placeholder uk-text-center">시식신청 준비중입니다.</div>
		</div>
	</c:if>
	
	<c:if test="${ !empty aList }">
	<div class="uk-container uk-margin-large">
		<div class="uk-child-width-1-3@m" uk-grid uk-height-match="target: > div > .uk-card">
			
				<c:forEach var="a" items="${ aList }">
				<c:if test="${ a.tasteIng == 1 }">
					<div>
						<div class="uk-card uk-card-default">
							<div class="uk-card-body">
								<div class="uk-text-right">
									<span class="uk-badge uk-text-bold">${ a.applyCount }명 신청</span>
								</div>
								<p class="uk-text-large uk-text-bold uk-text-secondary productName">${ a.productName }</p>

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
										<li class="li uk-text-small uk-text-light uk-text-muted uk-margin-remove uk-padding-remove">
											days
											<span class="days uk-text-large uk-text-bold uk-text-secondary uk-text-center"></span>
										</li>
										<li class="li uk-margin-remove uk-padding-remove">
											<span class="uk-text-large uk-text-bold uk-text-secondary uk-text-center">:</span>
										</li>
										<li class="li uk-text-small uk-text-muted uk-text-light uk-margin-remove uk-padding-remove">
											Hours
											<span class="hours uk-text-large uk-text-bold uk-text-secondary uk-text-center"></span>
										</li>
										<li class="li uk-margin-remove uk-padding-remove">
											<span class="uk-text-large uk-text-bold uk-text-secondary uk-text-center">:</span>
										</li>
										<li class="li uk-text-small uk-text-muted uk-text-light uk-margin-remove uk-padding-remove">
											Minutes
											<span class="minutes uk-text-large uk-text-bold uk-text-secondary uk-text-center"></span>
										</li>
										<li class="li uk-margin-remove uk-padding-remove">
											<span class="uk-text-large uk-text-bold uk-text-secondary uk-text-center">:</span>
										</li>
										<li class="li uk-text-small uk-text-muted uk-text-light uk-margin-remove uk-padding-remove">
											Seconds
											<span class="seconds uk-text-large uk-text-bold uk-text-secondary uk-text-center"></span>
										</li>
									</ul>
								</div>
								<div>
									<a class="uk-button uk-button-small uk-button-default" href='prbdetail.bo?pno=${ a.productNo }'>제품보기</a>
									<button class="uk-button uk-button-small uk-button-default" data-toggle="modal" data-target="#m-a-a_${ a.tasteNo }" ui-toggle-class="fade-down" ui-target="#animate">신청하기</button>
									<!-- .modal -->
									<div id="m-a-a_${ a.tasteNo }" class=" modal fade animate${ a.tasteNo }" data-backdrop="true">
										<div class="modal-dialog" id="animate${ a.tasteNo }">
											<div class="modal-content">
												<div class="modal-header">
													<span class="label label-lg">${ a.productName }</span>
													<h6 class="modal-title uk-text-bold">시식신청</h6>
												</div>
												<form action="applyTastePerson.bo" method="post">
													<div class="modal-body text-center p-lg">

														<input type="hidden" name="tasteNo" value="${ a.tasteNo }">
														<div class="md-form-group float-label col-sm-12">
															<input id="${ a.tasteNo }_name" type="text" name="name" class="md-input">
															<label for="${ a.tasteNo }_name">이름</label>
														</div>
														<div class="md-form-group float-label col-sm-12">
															<input id="${ a.tasteNo }_phone" type="text" name="phone" class="md-input phone">
															<label for="${ a.tasteNo }_phone">연락처</label>
														</div>
														<div class="md-form-group col-sm-12">
															<input id="${ a.tasteNo }_address" type="text" name="address1" class="md-input address1">
															<label for="${ a.tasteNo }_address">주소</label>
															<!-- 															<button class="uk-button uk-button-primary address uk-margin-medium-bottom" type="button" onclick="sample6_execDaumPostcode()"> -->
															<!-- 																<b>주소검색</b> -->
															<!-- 															</button> -->
														</div>
														<div class="md-form-group float-label col-sm-12">
															<input id="${ a.tasteNo }_addressDetail" type="text" name="address2" class="md-input addressDetail">
															<label for="${ a.tasteNo }_addressDetail">상세주소</label>
														</div>

													</div>
													<div class="modal-footer">
														<button type="button" class="btn dark-white p-x-md" data-dismiss="modal">취소</button>
														<button type="submit" class="btn danger p-x-md">신청</button>
													</div>
												</form>
											</div>
											<!-- /.modal-content -->

										</div>
									</div>
								</div>
								<div class="uk-overlay-primary uk-position-cover end"></div>
								<div class="uk-overlay uk-position-center uk-background-secondary uk-light end">
									<p class="uk-text-large uk-text-bold end">신청이 종료되었습니다.</p>
								</div>

							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>

				<!-- 페이징 처리 -->
		</div>
		<!-- 페이징 처리 -->
		<ul class="uk-pagination uk-flex-center uk-margin-medium-top" uk-margin>
			<c:if test="${ pi.currentPage <= 1 }">
				<li>
					<a href="#">
						<span uk-pagination-previous></span>
					</a>
				</li>
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="prBoardList.bo">
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
					<c:url var="pagination" value="prBoardList.bo">
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
				<c:url var="after" value="prBoardList.bo">
					<c:param name="page" value="${ pi.currentPage + 1 }" />
				</c:url>
				<li>
					<a href="#">
						<span uk-pagination-next></span>
					</a>
				</li>
			</c:if>
		</ul>
		<!-- 페이징 처리 끝  -->
	</div>

	</c:if>


	</div>
	</div>


	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
        // 휴대전화 하이픈
        $(".phone").on("keyup", function() {
            $(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3").replace("--", "-"));
        });

        // 			 카카오 주소 api
        $(".address1").on("click", function() { //주소입력칸을 클릭하면
            //카카오 지도 발생

            console.log(this);
            var $this = $(this);
            new daum.Postcode({
                oncomplete : function(data) { //선택시 입력값 세팅

                    $this.val(data.address); // 주소 넣기
                    $(".addressDetail").focus(); //상세입력 포커싱
                }
            }).open();
        });
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
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-jp.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-include.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-device.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-form.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-nav.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-load.js"></script>
	<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-screenfull.js"></script> --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/screenfull.js/5.1.0/screenfull.js" integrity="sha512-Dv9aNdD27P2hvSJag3mpFwumC/UVIpWaVE6I4c8Nmx1pJiPd6DMdWGZZ5SFiys/M8oOSD1zVGgp1IxTJeWBg5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-scroll-to.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-toggle-class.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/app.js"></script>

	<!-- ajax -->
	<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/jquery-pjax/jquery.pjax.js"></script> --%>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ajax.js"></script>
	<!-- endbuild -->

</body>
</html>



