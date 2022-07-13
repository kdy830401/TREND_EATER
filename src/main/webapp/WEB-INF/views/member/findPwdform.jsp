<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
		<!-- uikit -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="${ contextPath }/resources/css/uikit.min.css" />
  		<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
		<!-- 제이쿼리 -->
		<script src="${ contextPath }/resources/js/jquery-3.6.0.min.js"></script> 
        
<style>


	.uk-input{
		 
		 border:1px solid #BDBDBD;
		 border-radius: 3px !important;
		 font-size:15px;
		 
	}
	
	input::placeholder {
  		color:#D8D8D8;
  		
	}
	.uk-input:focus{
	 	border:none !important; 
		outline:1px solid black !important; 
	}
	
	
	.email{
		height:53px !important;
		width:300px !important;
		text-align:left;
		padding-left:20px;
	
	}

	
	.findPwd{
		background-color:#FF5C58;
		border:none;
		border-radius:3px;
		height:53px;
		width:302px;
		color:white;
		font-size:18px;
		cursor:pointer;
	}
	
</style>
</head>
<body>
	<c:import url = "../common/menubar.jsp"></c:import> 
	
	<div class ="uk-container uk-margin-large">
		<div class ="uk-grid" uk-grid>
		 	<div class ="uk-align-center">
				<h3 class="uk-text-bold uk-text-center">비밀번호 찾기</h3>
				
			    <div class="uk-margin ">
			    <p class ="uk-text-bold"> 이메일 <p>
			        <div class="uk-inline ">
			          	 
			            <input  class ="uk-input email" type="text" placeholder="이메일을 입력해주세요"  >
			        </div>
			       
			    </div>
		
			   <br>
			   
			   	<div>
			   		<button class = "uk-margin-small findPwd" id ="findPwd">임시 비밀번호 발급</button>
			   	</div>
			</div>
		</div>
	</div>
	
	<script>
	//비밀번호 찾기 이메일 발송
	 
 	   $("#findPwd").on("click",function(){
				var email = $('.email').val();
				 
 			$.ajax({
 				type : 'GET',
 				url:"findPwd.me?email=" + email,
 				success:function(data){
 					if(data == '1'){
 					alert("해당 이메일로 임시 비밀번호가 발급되었습니다.");
 					location.href="loginform.me";
 					} else{
 						
 						alert("이메일이 올바르지 않습니다.");
 					}
 				},
 				error:function(data){
 					console.log(data);
 					
 				}
 			
 			});
 	   });
 	   </script>
</body>
</html>