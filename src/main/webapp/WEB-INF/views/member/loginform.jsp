<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
       <!-- uikit -->
      <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit.min.css" />
      <script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
      <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script> 
        
<style>




   .uk-input{
       
    
       border-radius: 3px !important;
       font-size:15px;
       
   }
 
   .uk-input:focus{
      border:none !important; 
      outline:1px solid black !important; 
   }
   .findId{
      color:black;
   }
   .findPwd{
      color:black;
   }
   
   .id{
      height:53px !important;
      width:340px !important;
      text-align:left !important;
      padding-left:50px !important;
   
   }
   .pwd{
      height:53px !important;
      width:340px !important;
      text-align:left !important;
      padding-left:30px !important;
   }
   .uk-divider-vertical{
      border-right:1px solid black;
      height: 11px;
      display: inline-block;
      margin:0px;
   }
   .login{
      background-color:#FF5C58;
      border:none;
      border-radius:5px;
      height:50px;
      width:340px;
      color:white;
      font-size:18px;
      cursor:pointer;
   }   
   .kakaologin{
    border:none;
      border-radius:3px;
      height:50px;
      width:340px;
      color:white;
      font-size:18px;
   	cursor:pointer;
   
   }
   
   
   
   
</style>
</head>
<body>
<c:import url = "../common/menubar.jsp"></c:import> 

<div class ="uk-container uk-margin-large">
	<div class ="uk-grid" uk-grid >
  			<div class="uk-align-center">
    			<h4 class="uk-text-bold uk-text-center">로그인</h4>
      				<form action = "login.me">
      					<div class="uk-margin uk-margin-small">
          					<div class="uk-inline">
               				<span class="uk-form-icon" uk-icon="icon: user"></span> 
              					<input  class ="uk-input id" name ="email" type="text" placeholder="이메일 입력해주세요"  >
          					</div>
					</div>
					<div class="uk-margin-small">
						<div class="uk-inline">
							<span class="uk-form-icon uk-form-icon-flip" uk-icon="icon: lock"></span> 
							<input class="uk-input pwd" name = "pwd" type="password" placeholder="비밀번호를 입력해주세요" >
						</div>
					</div>


					<div class = "uk-align-right uk-margin-medium-bottom">
						<a class = "findId uk-text-small" href = "findIdform.me" >아이디 찾기 </a> 
					<div class = "uk-divider-vertical" ></div>
						<a class = "findPwd uk-text-small" href = "findPwdform.me"> 비밀번호 찾기</a>   
						</div>
					<div>
						<button class = "login">로그인</button>
					</div>
				</form>
				
				<img class ="uk-margin-small kakaologin" src = "${ pageContext.servletContext.contextPath }/resources/images/kakaologin.png" onclick = "location.href='https://kauth.kakao.com/oauth/authorize?client_id=b08a2f4e42a7d989e6672d42538b5200&redirect_uri=http://localhost:9280/trendeater/kakaologin.me&response_type=code'"></button>
		 </div>
	</div>
</div>


</body>
</html>