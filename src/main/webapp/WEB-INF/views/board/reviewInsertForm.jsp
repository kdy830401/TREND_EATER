<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
body {
	text-align: left;
	background: #F3F5F7;
	font-family: noto sans;
}

.review-care{
  padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
	list-style-type: none;
    font-size: 12px;
}
#review-form-header {
	margin-top: 30px;
	padding: 15px 15px;
	/*  상자내부 간격 : 위아래 5px, 오른쪽왼쪽 15px  */
	font-size: 30px;
	font-weight: 900;
}

#review-container {
	margin-top: 120px;
	background: white;
	padding: 40px 70px 70px 70px;
}

.review-title{
 	margin-top: 50px;
	font-size: 20px;
	font-weight: bold;
}


	/* 별점  */

#myform{
	text-align: center;
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    border: 0; /* 필드셋 테두리 제거 */
    direction: rtl; /* 이모지 순서 반전 */
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 2.2em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0 0 0 rgb(255,99,132);; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgb(255,99,132);; /* 마우스 호버 뒤에오는 이모지들 */
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgb(255,99,132);; /* 마우스 클릭 체크 */
}

/* 추천의사 */
.recommend {
    padding: 15px 10px;
}
.recommend input[type=radio]{
    display: none;
}
.recommend input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.recommend input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.recommend input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}
/* 재구매의사 */
.repurcharse {
    padding: 15px 10px;
}
.repurcharse input[type=radio]{
    display: none;
}
.repurcharse input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.repurcharse input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.repurcharse input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}

#taste-comment{
font-size: 12px;
color: rgba(255,99,132,0.7);
}

.spicy-title{
	margin-right: 10px;
}
.taste-title{
	margin-right: 25px;
}

/* 매운맛*/
.spicy {
    padding: 15px 10px;
}
.spicy input[type=radio]{
    display: none;
}
.spicy input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 24px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.spicy input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.spicy input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}
/* 단 맛*/
.sweet {
    padding: 15px 10px;
}
.sweet input[type=radio]{
    display: none;
}
.sweet input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 24px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.sweet input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.sweet input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}
/* 쓴 맛 */
.bitter {
    padding: 15px 10px;
}
.bitter input[type=radio]{
    display: none;
}
.bitter input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 24px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.bitter input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.bitter input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}
/* 짠 맛 */
.salty {
    padding: 15px 10px;
}
.salty input[type=radio]{
    display: none;
}
.salty input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 24px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.salty input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.salty input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}
/* 신 맛 */
.sour {
    padding: 15px 10px;
}
.sour input[type=radio]{
    display: none;
}
.sour input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 24px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.sour input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.sour input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}

.uk-textarea{
 resize: none;
}

#all-button{
text-align: right;
margin-top: 30px;
}

#cancel-button{
border-radius:10px

}
#write-button{
background: rgba(255,99,132, 0.8);
color: white;
border-radius:10px;
}

#att_zone {
  min-height: 150px;
  padding: 10px;
  border: 0.1px dotted;
}

#att_zone:empty:before {
  content: attr(data-placeholder);
  color: #999;
  font-size: .9em;
}

#btnAtt {
display:none;
}

#image-button{
background: rgba(255,99,132, 0.8);
color: white;
border-radius:10px 10px 0 0;
}
}

</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>	
	
	<div class="uk-container uk-container-small" id="review-container">
	
		
		<form action="rinsert.bo" method="post" enctype="Multipart/form-data">
    <fieldset class="uk-fieldset">
		<input type="hidden" name="productNo" value="${ productNo }">
        <legend class="uk-legend" id="review-form-header">리뷰 작성</legend>
        <hr>
        <ul class="review-care">
        	<li>- 작성하신 후기는 다른 회원들에게 공개됩니다.</li>
			<li>- 후기 작성 시 200포인트를 평일 기준 2일 전후로 지급합니다.</li>
			<li>- 베스트 후기 선정 시 10,000포인트를 지급합니다.</li>
			<li>- 아래에 해당할 경우 적립금 지급이 보류되며, 이미 지급받으셨더라도 2차 검수를 통해 적립금을 회수할 수 있습니다.
			<ul>
				<li>상품과 관련없거나 문자 및 기호의 단순 나열, 반복된 내용의 후기</li>
				<li>개인정보 및 광고, 비속어가 포함된 내용의 후기 (비노출 대상)</li>
				<li>상품 상세 페이지 등의 판매 이미지 사용, 관련없는 상품의 사진, 타인의 사진을 도용한 후기</li>
			</ul></li>
			<li>- 특히 후기 도용 시 적립금 2배 회수, 1년간 커뮤니티 이용 제한, 3개월간 후기 적립금 지급이 중단됩니다.</li>
        </ul>
        <hr>
		<input type="hidden" class="review" name="emailId" value="${ loginUser.email }">
<%-- 		<input type="hidden" class="review" name="reviewNo" value="${ rev.reviewNo }"> --%>
		<input type="hidden" class="review" name="nickName" value="${ loginUser.nickName }">
        <div class="review-title">별점을 매겨주세요</div>
		<div name="reviewRating" id="myform" method="post" action="./save" name="reviewRating">
        <input type="radio" name="reviewRating" value="5" id="rate1" ><label for="rate1">⭐</label>
        <input type="radio" name="reviewRating" value="4" id="rate2"><label for="rate2">⭐</label>
        <input type="radio" name="reviewRating" value="3" id="rate3"><label for="rate3">⭐</label>
        <input type="radio" name="reviewRating" value="2" id="rate4"><label for="rate4">⭐</label>
        <input type="radio" name="reviewRating" value="1" id="rate5"><label for="rate5">⭐</label>
		</div>
		
		<div class="review-title">추천 의사</div>
		<div class="recommend" name="recommend">
     <input type="radio" id="recommend1" name="recommend" value="1"><label for="recommend1">매우 비추</label>
     <input type="radio" id="recommend2" name="recommend" value="2"><label for="recommend2">비추</label>
     <input type="radio" id="recommend3" name="recommend" value="3"><label for="recommend3">보통</label>
     <input type="radio" id="recommend4" name="recommend" value="4"><label for="recommend4">추천</label>
     <input type="radio" id="recommend5" name="recommend" value="5"><label for="recommend5">매우 추천</label>
		</div>
		<div class="review-title">재구매 의사</div>
		 <div class="repurcharse" name="repurcharse">
     <input type="radio" id="repurcharse1" name="repurcharse" value="1"><label for="repurcharse1">절대 안삼</label>
     <input type="radio" id="repurcharse2" name="repurcharse" value="2"><label for="repurcharse2">안삼</label>
     <input type="radio" id="repurcharse3" name="repurcharse" value="3"><label for="repurcharse3">보통</label>
     <input type="radio" id="repurcharse4" name="repurcharse" value="4"><label for="repurcharse4">먹을래요</label>
     <input type="radio" id="repurcharse5" name="repurcharse" value="5"><label for="repurcharse5">꼭 무조건</label>
		</div>
		<div class="review-title">맛</div>
		<span id="taste-comment">맛의 강도를 숫자로 표현해주세요!</span>
            <div class="spicy" name="spicy">
            <span class="spicy-title">매운 맛</span>
            <input class="uk-radio" type="radio" name="spicy" id="spicy1" value="1"><label for="spicy1">1</label>
            <input class="uk-radio" type="radio" name="spicy" id="spicy2" value="2"><label for="spicy2">2</label>
            <input class="uk-radio" type="radio" name="spicy" id="spicy3" value="3"><label for="spicy3">3</label>
            <input class="uk-radio" type="radio" name="spicy" id="spicy4" value="4"><label for="spicy4">4</label>
            <input class="uk-radio" type="radio" name="spicy" id="spicy5" value="5"><label for="spicy5">5</label>
            </div>
            <div class="sweet" name="sweet">
            <span class="taste-title">단 맛</span>
            <input class="uk-radio" type="radio" name="sweet" id="sweet1" value="1"><label for="sweet1">1</label>
            <input class="uk-radio" type="radio" name="sweet" id="sweet2" value="2"><label for="sweet2">2</label>
            <input class="uk-radio" type="radio" name="sweet" id="sweet3" value="3"><label for="sweet3">3</label>
            <input class="uk-radio" type="radio" name="sweet" id="sweet4" value="4"><label for="sweet4">4</label>
            <input class="uk-radio" type="radio" name="sweet" id="sweet5" value="5"><label for="sweet5">5</label>
            </div>
            <div class="bitter" name="bitter">
            <span class="taste-title">쓴 맛</span>
            <input class="uk-radio" type="radio" name="bitter" id="bitter1" value="1"><label for="bitter1">1</label>
            <input class="uk-radio" type="radio" name="bitter" id="bitter2" value="2"><label for="bitter2">2</label>
            <input class="uk-radio" type="radio" name="bitter" id="bitter3" value="3"><label for="bitter3">3</label>
            <input class="uk-radio" type="radio" name="bitter" id="bitter4" value="4"><label for="bitter4">4</label>
            <input class="uk-radio" type="radio" name="bitter" id="bitter5" value="5"><label for="bitter5">5</label>
            </div>
            <div class="salty" name="salty">
            <span class="taste-title">짠 맛</span>
            <input class="uk-radio" type="radio" name="salty" id="salty1" value="1"><label for="salty1">1</label>
            <input class="uk-radio" type="radio" name="salty" id="salty2" value="2"><label for="salty2">2</label>
            <input class="uk-radio" type="radio" name="salty" id="salty3" value="3"><label for="salty3">3</label>
            <input class="uk-radio" type="radio" name="salty" id="salty4" value="4"><label for="salty4">4</label>
            <input class="uk-radio" type="radio" name="salty" id="salty5" value="5"><label for="salty5">5</label>
            </div>
            <div class="sour" name="sour">
            <span class="taste-title">신 맛</span>
            <input class="uk-radio" type="radio" name="sour" id="sour1" value="1"><label for="sour1">1</label>
            <input class="uk-radio" type="radio" name="sour" id="sour2" value="2"><label for="sour2">2</label>
            <input class="uk-radio" type="radio" name="sour" id="sour3" value="3"><label for="sour3">3</label>
            <input class="uk-radio" type="radio" name="sour" id="sour4" value="4"><label for="sour4">4</label>
            <input class="uk-radio" type="radio" name="sour" id="sour5" value="5"><label for="sour5">5</label>
            </div>
        
        
		<div class="review-title">좋은 점</div>
        <div class="uk-margin">
            <textarea class="uk-textarea" rows="10" name="good" placeholder="최소 20자 이상 입력해주세요."></textarea>
        </div>
        <div class="review-title">아쉬운 점</div>
        <div class="uk-margin">
            <textarea class="uk-textarea" rows="10" name="bad" placeholder="최소 20자 이상 입력해주세요."></textarea>
        </div>
        
<!--         사진 업로드 -->
        <div id='image_preview'>
		    <div class="review-title">사진 첨부</div>
		    <div id="taste-comment">1개 이상의 사진을 넣어주세요!</div>
		    <br>	
		    <label class="uk-button uk-button-default uk-button-medium" id="image-button" for="btnAtt">사진 첨부</label>
		    <input type='file' id='btnAtt' multiple='multiple' accept='image/*' name="uploadFile" />
		    <div id='att_zone' data-placeholder='사진 첨부 버튼을 클릭하거나 사진을 드래그 해주세요.'></div>
	  </div>

		<div id="all-button">
		<button class="uk-button uk-button-default uk-button-medium" type="button" id="cancel-button" onclick="location.href = 'rlist.bo'">취소</button>
		<button class="uk-button uk-button-default uk-button-medium" id="write-button">등록</button>
		</div>


    </fieldset>
</form>

	</div>
	
	<script>
	( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
			  imageView = function imageView(att_zone, btn){

			    var attZone = document.getElementById(att_zone);
			    var btnAtt = document.getElementById(btn)
			    var sel_files = [];
			    
			    // 이미지와 체크 박스를 감싸고 있는 div 속성
			    var div_style = 'display:inline-block;position:relative;'
			                  + 'width:150px;height:120px;margin:5px;border:none;z-index:1';
			    // 미리보기 이미지 속성
			    var img_style = 'width:100%;height:100%;z-index:none';
			    // 이미지안에 표시되는 체크박스의 속성
			    var chk_style = 'width:20px;height:18px;position:absolute;font-size:18px;'
			   + 'right:0px;bottom:0px;z-index:999;background-color:rgba(0,0,0,0.4);color:white; border:none; padding-bottom:22px; cursor: pointer';
			  
			    btnAtt.onchange = function(e){
			      var files = e.target.files;
			      var fileArr = Array.prototype.slice.call(files)
			      for(f of fileArr){
			        imageLoader(f);
			      }
			    }  
			    
			  
			    // 탐색기에서 드래그앤 드롭 사용
			    attZone.addEventListener('dragenter', function(e){
			      e.preventDefault();
			      e.stopPropagation();
			    }, false)
			    
			    attZone.addEventListener('dragover', function(e){
			      e.preventDefault();
			      e.stopPropagation();
			      
			    }, false)
			  
			    attZone.addEventListener('drop', function(e){
			      var files = {};
			      e.preventDefault();
			      e.stopPropagation();
			      var dt = e.dataTransfer;
			      files = dt.files;
			      for(f of files){
			        imageLoader(f);
			      }
			      
			    }, false)
			    

			    
			    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
			    imageLoader = function(file){
			      sel_files.push(file);
			      var reader = new FileReader();
			      reader.onload = function(ee){
			        let img = document.createElement('img')
			        img.setAttribute('style', img_style)
			        img.src = ee.target.result;
			        attZone.appendChild(makeDiv(img, file));
			      }
			      
			      reader.readAsDataURL(file);
			    }
			    
			    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
			    makeDiv = function(img, file){
			      var div = document.createElement('div')
			      div.setAttribute('style', div_style)
			      
			      var btn = document.createElement('input')
			      btn.setAttribute('type', 'button')
			      btn.setAttribute('value', 'x')
			      btn.setAttribute('delFile', file.name);
			      btn.setAttribute('style', chk_style);
			      btn.onclick = function(ev){
			        var ele = ev.srcElement;
			        var delFile = ele.getAttribute('delFile');
			        for(var i=0 ;i<sel_files.length; i++){
			          if(delFile== sel_files[i].name){
			            sel_files.splice(i, 1);      
			          }
			        }
			        
			        dt = new DataTransfer();
			        for(f in sel_files) {
			          var file = sel_files[f];
			          dt.items.add(file);
			        }
			        btnAtt.files = dt.files;
			        var p = ele.parentNode;
			        attZone.removeChild(p)
			      }
			      div.appendChild(img)
			      div.appendChild(btn)
			      return div
			    }
			  }
			)('att_zone', 'btnAtt')
	</script>
</body>
</html>