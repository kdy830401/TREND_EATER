<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<!-- UIkit CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />
<!-- UIkit JS -->
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
<script src="resources/js/jquery-3.6.0.min.js"></script>	

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

.uk-container {
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
.select-rec {
    padding: 15px 10px;
}
.select-rec input[type=radio]{
    display: none;
}
.select-rec input[type=radio]+label{
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
.select-rec input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select-rec input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}
/* 재구매의사 */
.select-buy {
    padding: 15px 10px;
}
.select-buy input[type=radio]{
    display: none;
}
.select-buy input[type=radio]+label{
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
.select-buy input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select-buy input[type=radio]:checked+label{
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
.select-spicy {
    padding: 15px 10px;
}
.select-spicy input[type=radio]{
    display: none;
}
.select-spicy input[type=radio]+label{
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
.select-spicy input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select-spicy input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}
/* 단 맛*/
.select-sweet {
    padding: 15px 10px;
}
.select-sweet input[type=radio]{
    display: none;
}
.select-sweet input[type=radio]+label{
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
.select-sweet input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select-sweet input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}
/* 쓴 맛 */
.select-bitter {
    padding: 15px 10px;
}
.select-bitter input[type=radio]{
    display: none;
}
.select-bitter input[type=radio]+label{
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
.select-bitter input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select-bitter input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}
/* 짠 맛 */
.select-salty {
    padding: 15px 10px;
}
.select-salty input[type=radio]{
    display: none;
}
.select-salty input[type=radio]+label{
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
.select-salty input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select-salty input[type=radio]:checked+label{
    background-color: rgb(255,99,132);
    border: rgb(255,99,132);
    color: #fff;
}
/* 신 맛 */
.select-sour {
    padding: 15px 10px;
}
.select-sour input[type=radio]{
    display: none;
}
.select-sour input[type=radio]+label{
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
.select-sour input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select-sour input[type=radio]:checked+label{
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
	
	
	<div class="uk-container uk-container-small" id="container">
	
		
		<form>
    <fieldset class="uk-fieldset">

        <legend class="uk-legend" id="review-form-header">리뷰 수정</legend>
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
		
        <div class="review-title">별점을 매겨주세요</div>
		<div name="myform" id="myform" method="post" action="./save">
        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
		</div>
		
		<div class="review-title">추천 의사</div>
		<div class="select-rec">
     <input type="radio" id="select-rec1" name="recommend"><label for="select-rec1">매우 추천</label>
     <input type="radio" id="select-rec2" name="recommend"><label for="select-rec2">추천</label>
     <input type="radio" id="select-rec3" name="recommend"><label for="select-rec3">보통</label>
     <input type="radio" id="select-rec4" name="recommend"><label for="select-rec4">비추</label>
     <input type="radio" id="select-rec5" name="recommend"><label for="select-rec5">매우 비추</label>
		</div>
		<div class="review-title">재구매 의사</div>
		 <div class="select-buy">
     <input type="radio" id="select-buy1" name="buy"><label for="select-buy1">꼭 무조건</label>
     <input type="radio" id="select-buy2" name="buy"><label for="select-buy2">먹을래요</label>
     <input type="radio" id="select-buy3" name="buy"><label for="select-buy3">보통</label>
     <input type="radio" id="select-buy4" name="buy"><label for="select-buy4">안삼</label>
     <input type="radio" id="select-buy5" name="buy"><label for="select-buy5">절대 안삼</label>
		</div>
		<div class="review-title">맛</div>
		<span id="taste-comment">맛의 강도를 숫자로 표현해주세요!</span>
            <div class="select-spicy">
            <span class="spicy-title">매운 맛</span>
            <input class="uk-radio" type="radio" name="spicy" id="select-spicy1"><label for="select-spicy1">1</label>
            <input class="uk-radio" type="radio" name="spicy" id="select-spicy2"><label for="select-spicy2">2</label>
            <input class="uk-radio" type="radio" name="spicy" id="select-spicy3"><label for="select-spicy3">3</label>
            <input class="uk-radio" type="radio" name="spicy" id="select-spicy4"><label for="select-spicy4">4</label>
            <input class="uk-radio" type="radio" name="spicy" id="select-spicy5"><label for="select-spicy5">5</label>
            </div>
            <div class="select-spicy">
            <span class="taste-title">단 맛</span>
            <input class="uk-radio" type="radio" name="sweet" id="select-sweet1"><label for="select-sweet1">1</label>
            <input class="uk-radio" type="radio" name="sweet" id="select-sweet2"><label for="select-sweet2">2</label>
            <input class="uk-radio" type="radio" name="sweet" id="select-sweet3"><label for="select-sweet3">3</label>
            <input class="uk-radio" type="radio" name="sweet" id="select-sweet4"><label for="select-sweet4">4</label>
            <input class="uk-radio" type="radio" name="sweet" id="select-sweet5"><label for="select-sweet5">5</label>
            </div>
            <div class="select-spicy">
            <span class="taste-title">쓴 맛</span>
            <input class="uk-radio" type="radio" name="bitter" id="select-bitter1"><label for="select-bitter1">1</label>
            <input class="uk-radio" type="radio" name="bitter" id="select-bitter2"><label for="select-bitter2">2</label>
            <input class="uk-radio" type="radio" name="bitter" id="select-bitter3"><label for="select-bitter3">3</label>
            <input class="uk-radio" type="radio" name="bitter" id="select-bitter4"><label for="select-bitter4">4</label>
            <input class="uk-radio" type="radio" name="bitter" id="select-bitter5"><label for="select-bitter5">5</label>
            </div>
            <div class="select-spicy">
            <span class="taste-title">짠 맛</span>
            <input class="uk-radio" type="radio" name="salty" id="select-salty1"><label for="select-salty1">1</label>
            <input class="uk-radio" type="radio" name="salty" id="select-salty2"><label for="select-salty2">2</label>
            <input class="uk-radio" type="radio" name="salty" id="select-salty3"><label for="select-salty3">3</label>
            <input class="uk-radio" type="radio" name="salty" id="select-salty4"><label for="select-salty4">4</label>
            <input class="uk-radio" type="radio" name="salty" id="select-salty5"><label for="select-salty5">5</label>
            </div>
            <div class="select-spicy">
            <span class="taste-title">신 맛</span>
            <input class="uk-radio" type="radio" name="sour" id="select-sour1"><label for="select-sour1">1</label>
            <input class="uk-radio" type="radio" name="sour" id="select-sour2"><label for="select-sour2">2</label>
            <input class="uk-radio" type="radio" name="sour" id="select-sour3"><label for="select-sour3">3</label>
            <input class="uk-radio" type="radio" name="sour" id="select-sour4"><label for="select-sour4">4</label>
            <input class="uk-radio" type="radio" name="sour" id="select-sour5"><label for="select-sour5">5</label>
            </div>
        
        
		<div class="review-title">좋은 점</div>
        <div class="uk-margin">
            <textarea class="uk-textarea" rows="10" placeholder="최소 20자 이상 입력해주세요."></textarea>
        </div>
        <div class="review-title">아쉬운 점</div>
        <div class="uk-margin">
            <textarea class="uk-textarea" rows="10" placeholder="최소 20자 이상 입력해주세요."></textarea>
        </div>
        
<!--         사진 업로드 -->
        <div id='image_preview'>
		    <div class="review-title">사진 첨부</div>
		    <div id="taste-comment">1개 이상의 사진을 넣어주세요!</div>
		    <br>	
		    <label class="uk-button uk-button-default uk-button-medium" id="image-button" for="btnAtt">사진 첨부</label>
		    <input type='file' id='btnAtt' multiple='multiple' accept='image/*' />
		    <div id='att_zone' data-placeholder='사진 첨부 버튼을 클릭하거나 사진을 드래그 해주세요.'></div>
	  </div>

		<div id="all-button">
		<button class="uk-button uk-button-default uk-button-medium" type="button" id="cancel-button" onclick="location.href = '#'">취소</button>
		<button class="uk-button uk-button-default uk-button-medium" id="write-button">수정</button>
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