<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
		 

		 border-radius: 3px !important;
		 font-size:15px !important; 
		 
	}
	

	.uk-input:focus{
	 	border:none !important; 
		outline:1px solid black !important; 
	}
	
	
	.name{
		height:53px !important;
		width:340px !important;
		text-align:left;
		padding-left:20px;
	
	}
	.phone{
		height:53px !important;
		width:340px !important;
		text-align:left;
		padding-left:20px;
	}
	
	.findId{
		background-color:#FF5C58;
		border:none;
		border-radius:3px;
		height:50px !important;
		width:100%;
		color:white;
		font-size:18px;
	}
	
	button{
	
	cursor:pointer;
	}
</style>
</head>
<body>
<c:import url = "../common/menubar.jsp"></c:import> 

	<div class ="uk-container uk-margin-large">
		<div class ="uk-grid" uk-grid>
			<div class ="uk-align-center">
			 		
					<h3 class="uk-text-bold uk-text-center">아이디 찾기</h3>
					
				 	<form action ="findId.me">
				    <div class="uk-margin uk-margin-small ">
				    <p class ="uk-text-bold"> 이름 </p>
				        <div class="uk-inline ">
				 
				            <input  class ="uk-input name" name = "name" type="text" placeholder="이름을 입력해주세요"  >
				        </div>
				    </div>
				
				    <div class="uk-margin-small">
				    <p class ="uk-text-bold">휴대폰 </p>
				        <div class="uk-inline">
				          
				            <input class="uk-input phone" name = "phone"  placeholder="휴대폰번호를 입력해주세요" >
				        </div>
				    </div>
				   
				   
				   <br>
				   
				   	<div>
				   		<button class = "uk-margin-small findId" >확인</button>
				   	</div>
				   	</form>
				
			</div>
		</div>
	</div>
	<script>
	 $(document).on("keyup", ".phone", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
	 
	 </script>
</body>
</html>