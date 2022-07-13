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
		<script src="${ contextPath }/resources/js/jquery-3.6.0.min.js"></script> 
        
        
	<style>
	
	.hr1 {
  		background-color: black;
  		height: 1px;
  		
	}
	
	.hr2 {
  		background-color: black;
  		
	}
	
	
	
   .uk-input{
		 
		 
		 border-radius: 3px !important;
		 font-size:15px;
		 
		 
	}
	
	
	
	.input:placeholder {
	
  		color:#FF5C58;
  		
	}
	.uk-input:focus{
	
	 	border:none !important; 
		outline:thin solid black !important; 
		
	}   
	
	
	
	::selection{
	
		background-color:#FF5C58;
	}
	
	.birthday{
	
		padding-top:13px;
		padding-left:16px;
		border:none;
		width:74px;
		
		
	}
	
	.birthdaydiv{
	
		border:1px solid #e5e5e5;
		border-radius: 3px;
		font-size: 15px;
		width: 285px;
		padding-left: 15px;
		height: 43px;
		
		
	}

	
	
	.birthday:focus{
	
		outline:none; 
		border:none;
		
		
	}
	

	
	/* 주소 검색 버튼*/
	.address{
		color:#FF5C58 !important;
		border:thin solid #FF5C58 !important;
		background-color:white !important;
		border-radius: 3px !important;
		height:40px !important;
		width:97px !important;	
		cursor:pointer !important;
		/* margin-top:5px; */
		padding:0px !important;
	}
	
	/*주소 입력란*/
	#sample6_address{
		border:1px solid #BDBDBD;
		 border-radius: 3px;
		 font-size:15px;
		 width:200px;
		 height:40px;
		
	}
	/*상세주소 입력란*/
	#sample6_detailAddress{
		 border:1px solid #BDBDBD;
		 border-radius: 3px;
		 font-size:15px;
		 height:40px;
		 width:300px;
		 
	}
	
	#sample6_detailAddress:focus{
	
		border:none;
		outline:thin solid black; 
		
		
	}
	
	#sample6_address:focus{
	
		border:none;
		outline:thin solid black; 
		
		
	}
	/*이메일 인증 버튼*/
	.email{
		color:#FF5C58 !important;
		border:1px solid #FF5C58 !important;
		background-color:white !important;
		border-radius: 3px !important;
		height:43px !important;
		width:130px !important;
		cursor:pointer !important;
		padding:0px !important;
		
	}
	/*이메일 인증 입력란*/
	.checkemail4{
		 border:1px solid #BDBDBD;
		 border-radius: 3px;
		 font-size:15px;
		 height:40px;
		 width:280px;
		 
		 padding-left:10px;
	}
	
	/*이메일 인증 입력란 클릭시*/
	.checkemail4:focus{
		border:none; 
		outline:1px solid black; 
	
	}
	.uk-select{
		 border:1px solid #BDBDBD;
		 border-radius: 3px;
		 font-size:15px;
		 width:80px;
	
	}
	.uk-select:focus{
		
	 	border:none; 
		outline:1px solid black; 
	}
    
   
 
    
    h5 {
    display:inline-block;
    width:150px;
    }
    
 	
 
 
 	.join{
		background-color:#FF5C58;
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

	<div class = "uk-container uk-margin-large" >
 <!-- <div class="uk-position-center">  -->
	
	

	
		
			
	<div class ="uk-grid" uk-grid>
	<div class ="uk-align-center">
		<h4 class="uk-text-bold uk-text-center">회원가입</h4>
		<hr class = "hr1">

	 	<!-- <form action="kakaojoin.me" onsubmit = "return insertValidate();" > -->
	 	<form action="kakaojoin.me"  >
	    <div class="uk-margin uk-margin-small">
	    <div class="uk-inline">
	        

	           	
		        <div class="uk-margin">
		       	 	<div class="uk-inline">
		       	 	 	<h5 class="uk-text-bold ">이메일<span class = "star" style = "color:#FF5C58;">*</span></h5>
		            	<input class="uk-input" id="email" name="email" value = "${userInfo.email}"  type="text" placeholder="이메일 형식으로 입력해주세요" style = "height:44px;width:300px;text-align:left;padding-left:10px;" readonly>
		        	</div>
			
		       		
		        </div> 
	        
	 			
	        	
	       		
	       		
	        </div>
	    </div>
	    
	      <div class="uk-margin uk-margin-small" id="emailin" class= "checkemail4">
	      	
	      </div>
	      
	   

	    <div class="uk-margin-small">
	        <div class="uk-inline">
	              <h5 class="uk-text-bold">비밀번호<span class = "star" style = "color:#FF5C58;">*</span></h5>
	              <input class ="uk-input pwd" id = "pwd" name="pwd" type="password" placeholder="비밀번호를 입력해주세요" style = "height:44px;width:300px;text-align:left;padding-left:10px;" required>
	        	  <div class = "pwd2" style = " font-size:12px; font-weight:bold;margin-left:160px;"></div>
	        	  <div class = "pwd3" style = " font-size:12px; font-weight:bold;margin-left:160px;"></div>
	        </div>
	    </div>
	    
	    <div class="uk-margin-small">
	        <div class="uk-inline"> 
	            <h5 class="uk-text-bold">비밀번호 확인<span class = "star" style = "color:#FF5C58;">*</span></h5>
	            <input class ="uk-input" id = "pwd2" name = "pwd2" type="password" placeholder="비밀번호를 한번 더  입력해주세요" style = "height:44px;width:300px;text-align:left;padding-left:10px;" required>
	        	<div class = "pwd4" style = " font-size:12px; font-weight:bold;margin-left:160px;"></div>
	        </div>
	    </div>
	    
	    
	    <div class="uk-margin-small">
	        <div class="uk-inline"> 
	            <h5 class="uk-text-bold">이름<span class = "star" style = "color:#FF5C58;">*</span></h5>
	            <input class ="uk-input name" name = "name" type= "text" placeholder="이름을 입력해주세요" style = "height:44px;width:300px;text-align:left;padding-left:10px;" required>
	        </div>
	    </div>
	    
	     
	    <div class="uk-margin-small">
	        <div class="uk-inline"> 
	             <h5 class="uk-text-bold">닉네임<span class = "star" style = "color:#FF5C58;">*</span></h5>
	             <input class ="uk-input nickname" name = "nickName"  value = "${userInfo.nickname}" type="text" placeholder="닉네임을 입력해주세요" style = "height:44px;width:300px;text-align:left;" required>
	        </div>
	    </div>
	    
	    <div class="uk-margin-small">
	        <div class="uk-inline"> 
	            <h5 class="uk-text-bold">휴대폰<span class = "star" style = "color:#FF5C58;">*</span></h5>
	            <input class ="uk-input phone" id = "phone" name  ="phone" type="text" placeholder="숫자만 입력해주세요" style = "height:44px;width:300px;text-align:left;padding-left:10px;" required>
	        </div>
	    </div>
	    
	    
	     	
	   	<!--------------------------------- 생년월일------------------------------------------------>
	    <h5 class="uk-text-bold uk-margin-small ">생년월일<span class = "star" style = "color:#FF5C58;">*</span></h5>   
	    <div class="uk-margin-small uk-inline uk-margin-small">
	       <div class="birthdaydiv">       
	             <input class =" birthday" name="year"  type="text" placeholder="YYYY"    maxlength='4'>
	             <input class =" birthday" name="month" type="text" placeholder="MM"    maxlength='2'> 
	             <input class =" birthday" name="date" type="text" placeholder="DD"    maxlength='2'>
	       </div>
	    </div>
	    
	    
	    
	    
	   	
	   	
	   	
	   	<!--------------------------------- 성별 ------------------------------------------------>
	   	  <div class="uk-margin ">
	    	<h5 class="uk-text-bold">성별<span class = "star" style = "color:#FF5C58;">*</span></h5>
	    	<div class="uk-margin uk-grid-small uk-inline" >
            <label><input class = "uk-radio gender" name="gender" value ='M' type="radio" name="radio2"checked> 남자 </label>
            <label><input class="uk-radio gender" name="gender"  value ='F' type="radio" name="radio2" > 여자</label>
            </div>
        </div>
        
        
        <!--------------------------------- 주소검색 ------------------------------------------------>
	    <div>
	   		<h5 class="uk-text-bold uk-margin-small" >주소 <span class = "star" style = "color:#FF5C58;">*</span></h5> 
	   		
	   		<input class ="uk-input" type="text" id="sample6_address" name="address1" placeholder="주소" required>	
	   		<button class="uk-inline address uk-button uk-button-primary" type = "button" onclick="sample6_execDaumPostcode()">주소검색</button>
	   		<!-- <button class="uk-inline address" type = "button" onclick="sample6_execDaumPostcode()"><b>주소검색</b></button> -->
			<br>
	   		<input class =" uk-input" type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" style ="margin-left:154px;margin-top:5px;"required>
	   	
	   	</div>
        <div class="address2"></div>
        
	   	<!--------------------------------- 선호입맛 ------------------------------------------------>
	    <div class="uk-margin">
	    	<h5 class="uk-text-bold " >선호입맛(1순위)<span class = "star" style = "color:#FF5C58;">*</span></h5>
	    
             <div class="uk-margin uk-grid-small uk-inline" >
	            <label><input class = "uk-radio eat" type="radio" name="radio3" value="단맛" checked> 단맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio3" value="짠맛"> 짠맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio3" value="신맛"> 신맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio3" value="매운맛"> 매운맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio3"value="쓴맛" >쓴맛</label>	               
        	</div>
           <br>
           
            <h5 class="uk-text-bold " >선호입맛(2순위)<span class = "star" style = "color:#FF5C58;">*</span></h5>
          	 <div class="uk-margin uk-grid-small uk-inline">
	            <label><input class = "uk-radio eat" type="radio" name="radio4"value="단맛" checked> 단맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio4" value="짠맛"> 짠맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio4" value="신맛"> 신맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio4" value="매운맛"> 매운맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio4" value="쓴맛">쓴맛</label>	               
        	</div>
    		<br>
           <h5 class="uk-text-bold " >선호입맛(3순위)<span class = "star" style = "color:#FF5C58;">*</span></h5>
             <div class="uk-margin uk-grid-small uk-inline">
	            <label><input class = "uk-radio eat" type="radio" name="radio5" value="단맛"checked> 단맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio5" value="짠맛"> 짠맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio5" value="신맛"> 신맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio5" value="매운맛" > 매운맛</label>
	            <label><input class="uk-radio eat" type="radio" name="radio5" value="쓴맛">쓴맛</label>	               
        	</div>
        	<br>
        </div>
	   		

	  
	   
	   	<hr class="hr2">
	   	
	   	<!--------------------------------- 이용약관동의 ------------------------------------------------>
	   	
	   	<div class="uk-margin">
        <div class="uk-form-controls"> 
        	<h5 class="uk-text-bold">이용약관 동의</h5>
        	<label for="agree_all">
            <input class = "uk-checkbox" name="agree_all" type="checkbox" name="radio1" > 
            	<span>전체 동의합니다.</span>
            </label><br>
       
       
       
            <label for="agree">
            <input class = "uk-checkbox agree" id="aree" name="agree" type="checkbox" name="radio1"  style="margin-left:155px;"> 
            	<span>이용약관 동의(필수)</span>
            </label>
            
	        <!-- 모달  -->
	        <a href=".modal1" uk-toggle>약관보기 </a>
	
			<div class = "modal1" id="modal-overflow" uk-modal>
		    	<div class="uk-modal-dialog">
		
		        <button class="uk-modal-close-default" type="button" uk-close></button>
		
		        <div class="uk-modal-header">
		            <h2 class="uk-modal-title">Headline</h2>
		        </div>
		
		        <div class="uk-modal-body" uk-overflow-auto>
		
		            <p>ddddddddddddddLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		        </div>
				
	        <div class="uk-modal-footer uk-text-right">
	            <button class="uk-button uk-button-default uk-modal-close" type="button">확인</button>
	        </div>
	    	</div>
		</div>
		<!------------------------ 모달의 끝 ----------------------->
		<br>
		
            <label for="agree" > 
            <input class = "uk-checkbox agree" id="aree" name="agree" type="checkbox" name="radio1" style="margin-left:155px;"> 
            	<span>개인 정보 이용 동의(필수)</span>
            </label>
			<!-- 모달  -->
	        <a href=".modal2 " uk-toggle>약관보기 </a>
	
			<div class="modal2" id="modal-overflow " uk-modal>
		    	<div class="uk-modal-dialog">
		
		        <button class="uk-modal-close-default" type="button" uk-close></button>
		
		        <div class="uk-modal-header">
		            <h2 class="uk-modal-title">개인 정보 이용 동의(필수)</h2>
		        </div>
		
		        <div class="uk-modal-body" uk-overflow-auto>
						
						제 1장 총칙
						<br>
						<br>
						<br>
						제 1 조(목적)
						<br>
						<br>
						본 약관은 트렌드잇터 웹사이트(이하 "트렌드잇터")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 회원과 트렌드잇터의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
						<br>
						제 2 조(약관의 효력과 변경)
						<br>
						<br>
						1. 트렌드잇터는 이용자가 본 약관 내용에 동의하는 경우, 트렌드잇터의 서비스 제공 행위 및 회원의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.
						<br>
						<br>
						2. 트렌드잇터는 약관을 개정할 경우, 적용일자 및 개정사유를 명시하여 현행약관과 함께 트렌드잇터의 초기화면에 그 적용일 7일 이전부터 적용 전일까지 공지합니다. 단, 회원에 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 트렌드잇터는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다.
						<br>
						<br>
						3. 변경된 약관은 트렌드잇터 홈페이지에 공지하거나 e-mail을 통해 회원에게 공지하며, 약관의 부칙에 명시된 날부터 그 효력이 발생됩니다. 회원이 변경된 약관에 동의하지 않는 경우, 회원은 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이내에 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우는 약관 변경에 대한 동의로 간주됩니다.
						<br>
						<br>
						제 3 조(약관 외 준칙)
						<br>
						<br>
						본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.
						<br>
						<br>
						제 4 조(용어의 정의)
						<br>
						<br>
						본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
						1. 이용자 : 본 약관에 따라 트렌드잇터가 제공하는 서비스를 받는 자
						<br>
						<br>
						2. 가입 : 트렌드잇터가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
						<br>
						<br>
						3. 회원 : 트렌드잇터에 개인 정보를 제공하여 회원 등록을 한 자로서 트렌드잇터가 제공하는 서비스를 이용할 수 있는 자.
						<br>
						<br>

		        </div>
				
	        <div class="uk-modal-footer uk-text-right">
	            <button class="uk-button uk-button-default uk-modal-close" type="button">확인</button>
	        </div>
	    	</div>
		</div>
		<!------------------------ 모달의 끝 ----------------------->
		<br>
             <label for="agree">
            <input class = "uk-checkbox agree" id="aree" name="agree" type="checkbox" name="radio1" style="margin-left:155px;"> 
            	<span>개인 정보 수집 동의(필수)</span>
            </label>	
            <!-- 모달  -->
	        <a href="#modal-overflow" uk-toggle>약관보기 </a>
	
			<div id="modal-overflow" uk-modal>
		    	<div class="uk-modal-dialog">
		
		        <button class="uk-modal-close-default" type="button" uk-close></button>
		
		        <div class="uk-modal-header">
		            <h2 class="uk-modal-title">Headline</h2>
		        </div>
		
		        <div class="uk-modal-body" uk-overflow-auto>
		
		            <p>ddddddddddddddddddddddddLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		
		        </div>
				
	        <div class="uk-modal-footer uk-text-right">
	            <button class="uk-button uk-button-default uk-modal-close" type="button">확인</button>
	        </div>
	    	</div>
		</div>
		<!------------------------ 모달의 끝 ----------------------->
		<br>
            
             <input class = "uk-checkbox agree" id="aree" name="agree" type="checkbox" name="radio1" style="margin-left:155px;">  
            	<span>본인은 만 14세 이상입니다.(필수)</span>
           <br>
         
        </div>
    </div>
    
    <div>
	   	<button class = "join uk-align-center" type ="submit">가입하기</button>
	</div>
  
	</form>
<!-- </div> --> 
	</div><!-- 유케이 얼라인 센터 -->
	</div> <!-- 그리드 닫기 -->
	</div>
 	
 	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	   	<script>
	   		//개인정보 동의 체크박스 전체선택 이벤트
		   	const agreeChkAll = document.querySelector('input[name=agree_all]');
		    agreeChkAll.addEventListener('change', (e) => {
		    let agreeChk = document.querySelectorAll('input[name=agree]');
		    for(let i = 0; i < agreeChk.length; i++){
		      agreeChk[i].checked = e.target.checked;
		    }
			});

	   	</script>
	   	
	   	
 	   	<script>   	
 	   	//이메일 인풋 창 클릭 시 
	 	 $(function(){
	 		$("#email").on("focus",function(){
	 			$(".checkemail").html("✓ 이메일 형식");
	 			$(".checkemail2").html("✓ 이메일 중복확인");
	 			$(".checkemail3").html("✓ 이메일 인증").css("color","red");
	 			
	 			 
	 		});
	 	});
	 	
 	   
 	   
 	   //비밀번호 인풋창 클릭시
 	   $(function(){
 		   $("#pwd").on("focus",function(){
 			   $('.pwd2').html("✓ 8자 이상/숫자/대문자/소문자/특수문자를 모두 포함");
 		   });
 	   });
 	   
 	 
		 var pwdChecked2 = false; //비밀번호 유효성 검사
 	  //비밀번호 유효성검사
	$(function(){
	 		
	 		var checkpwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	 		$('#pwd').keyup(function(){
	 			if(!checkpwd.test($('#pwd').val())){
	 				$(".pwd2").css("color",'red');
	 				pwdChecked2 = false;
	 			}else{
	 				$(".pwd2").css("color",'green');
	 				pwdChecked2 = true;
	 			}
	 		});
	 	}); 
 	  
 	  
	//비밀번호 확인 인풋 클릭시
	  $(function(){
		   $("#pwd2").on("focus",function(){
			   $('.pwd4').html("✓ 비밀번호 일치");
		   });
	   });
	  
	  var pwdChecked = false; //비밀번호 확인
	  $(function(){
		 
			
	 		$('#pwd2').keyup(function(){
	 			if($('#pwd2').val() == $('#pwd').val()){
	 				$(".pwd4").css("color",'green');
	 				 var pwdChecked = true;
	 			}else{
	 				$(".pwd4").css("color",'red');
	 				 var pwdChecked = false;
	 			}
	 		});
	 	}); 
	  
	  //휴대폰 번호 자동 하이픈
	  $(document).on("keyup", ".phone", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
	  
	  
	  //생년월일 숫자만 들어가게
	  $(document).on("keyup", ".birthday", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, ""));
		});
		
	  
	  
	 	//우편번호 까지 가지고 올 수 있음.
	   /*  function sample6_execDaumPostcode() {
	    	$(".address2").append('<input type="text" id="sample6_postcode" placeholder="우편번호"><input type="text" id="sample6_address" placeholder="주소"><br><input type="text" id="sample6_detailAddress" placeholder="상세주소"><input type="text" id="sample6_extraAddress" placeholder="참고항목">');
	    	
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	               
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	       
	    } */
	    
	    
	    //카카오 주소 api
	    function sample6_execDaumPostcode() { //주소입력칸을 클릭하면
	    	/* $(".address2").append('<input type="text" id="sample6_address" placeholder="주소"><br><input type="text" id="sample6_detailAddress" placeholder="상세주소">'); */
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("sample6_address").value = data.address; // 주소 넣기
	                document.getElementById("sample6_detailAddress").focus(); //상세입력 포커싱
	            }
	        }).open();
	    };
		console.log(pwdChecked);
	    console.log(pwdChecked2);

  		 function insertValidate(){
			 if(pwdChecked == false || pwdChecked2 == false) {
				 alert("비밀번호를 확인해 주세요.");
				 return false;			 
			 }else{		
				 alert("회원가입이 완료되었습니다.");
				 return true;
			 }
		 }
	     
	   	</script> 
	   	  
		
	
</body>
</html>