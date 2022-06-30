<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>


<style>

</style>
<body>
	<c:import url="adminMenubar.jsp" />
	
	
	
	<!-- ############ PAGE START 여기에 내용 넣어주세요 -->
	<div class="uk-container">
		<div uk-scrollspy="target: > div; cls: uk-animation-fade; delay: 500">
			<div class="uk-child-width-1-3@m " uk-scrollspy="cls: uk-animation-fade; target: .uk-card; delay: 500; repeat: true">
				<div class="uk-align-center" style="margin-top: 50px;">
					<div class="uk-card uk-card-default uk-card-body">
						<h3 class="uk-card-title">TREND EATER JOIN</h3>

						<div class="md-form-group float-label ">
							<input class="md-input id" name="id" required="">
							<label>ID</label>
							<div>
								<span>
							</div>
							<div class="idCheck"></div>
							<div class="md-form-group float-label">
								<input class="md-input pwd" type="password" name="pwd" required="">
								<label>PASSWORD</label>
							</div>
							<div class="md-form-group float-label ">
								<input class="md-input name" name="name" required="">
								<label>NAME</label>
							</div>
							<button class="join btn  btn-block btn-fw success uk-align-center" style="cursor: pointer;" onclick="return insertValidate();">JOIN</button>

						</div>
					</div>
				</div>
			</div>
		</div>



		<script>
			//관리자 등록 후 알림 창 뜨기
			$(".join").on("click", function() {
				$.ajax({
					url : "adminJoin.ad",
					type : 'post',
					data : {
						id : $('.id').val(),
						pwd : $('.pwd').val(),
						name : $('.name').val()
					},
					success : function(data) {
						alert('관리자가 등록되었습니다.');
						$('.id').val("");
						$('.pwd').val("");
						$('.name').val("");
					},
					error : function(data) {
						alert('관리자 로그인에 실패하였습니다.');
						alert('등록자가 supervisor인지 확인하십시오.');
						console.log(data);
					}
				});
			});

			//아이디 중복확인 문장 뜨게
			var isUsable = false;
			$(function() {
				$(".id").on("focus", function() {
					$(".idCheck").html("✓ 아이디 중복");
				});
			});

			//아이디 중복확인
			$(".id").keyup(function() {
				$.ajax({
					url : "adminIdCheck.ad",
					type : 'post',
					data : {
						id : $('.id').val()
					},
					success : function(data) {
						if (data == '1') {
							$(".idCheck").css("color", 'red');
							isUsable = false;
						} else {

							$(".idCheck").css("color", 'green');
							isUsable = true;
						}
					},
					error : function(data) {
						console.log(data);
					}
				});
			});

			function insertValidate() {
				if (!isUsable) {
					alert("아이디가 중복되었습니다.");
					return false;
				} else {
					return true;
				}
			}
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
	<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/jquery-pjax/jquery.pjax.js"></script> --%>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ajax.js"></script>
	<!-- endbuild -->
</body>
</html>
