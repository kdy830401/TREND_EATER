<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<style>
.font-red {
color: red;
}

.background_r {
width: 100%;
height: 100%;
position: absolute;
background-color: #000000;
opacity:0.3;
z-index: 300;
}

.ctts_r {
display: inline-block;
width: 800px;
height: 714px;
position: absolute;
top: 50%;
left: 50%;
margin-top: -350px;
    margin-left: -420px;
background-color: #FFFFFF;
border: 1px solid #999999;
border-radius: 5px;
z-index: 400;
border-radius: 16px;
font-size: 16px;
}

.top_ctt>* {
margin-left: 20px
}

.top_ctt1 {
display: block;
position: absolute;
height: 50px;
width: 760px;
background-color: black;
text-align: left;
color: white;
margin-top: 20px;
top: 0px;
}

.top_ctt1>div {
display: inline-block;
margin: 14px;
font-size: 18px;
}

.top_ctt2 {
display: block;
position: absolute;
height: 24px;
    width: 746px;
background-color: #f7f7f7;
text-align: left;
top: 70px;
padding-left: 14px;
line-height: 30px;
}

.top_ctt3 {
display: block;
position: absolute;
height: 40px;
width: 746px;
background-color: #f7f7f7;
text-align: left;
top: 94px;
padding-left: 14px;
line-height: 40px;
}

.top_ctt4 {
display: block;
position: absolute;
height: 190px;
width: 758px;
border: 1px solid #cccccc;
text-align: left;
top: 134px;
}

.top_ctt4-1 {
display: inline-block;
position: absolute;
top: 0px;
width: 190px;
text-align: center;
height: 192px;
background-color: white;
margin-left: 3px;
line-height: 184px;
}

.checkbox_div {
display: inline-block;
position: absolute;
top: 0px;
right: 0px;
width: 602px;
text-align: center;
height: 192px;
background-color: white;
overflow: auto;
}

.checkbox_div>div:nth-child(n) {
display: inline-block;
position: relative;
margin: auto;
width: 180px;
height: 22px;
float: left;
text-align: left;
margin-top: 14px;
margin-left: 60px
}

.checkbox_div>div:nth-child(2n) {
display: inline-block;
position: relative;
margin: auto;
width: 300px;
height: 22px;
float: left;
text-align: left;
margin-top: 14px;
margin-left: 30px;
}

.report_content textarea {
border-style: none;
}

.report_content textarea:focus {
outline: none;
}

#cttCnt {
display: inline-block;
width: 100px;
    height: 50px;
    position: absolute;
    bottom: 87px;
    left: 46px;
}

.r_content_div {
display: block;
position: absolute;
height: 158px;
width: 758px;
border: 1px solid #cccccc;
text-align: left;
bottom: 228px;
line-height: 48px;
}

.r_content-1 {
display: inline-block;
position: absolute;
top: 0px;
width: 190px;
text-align: center;
height: 100%;
background-color: white;
margin-left: 3px;
line-height: 156px;
}

.report_content {
display: inline-block;
position: absolute;
top: 0px;
right: 0px;
width: 570px;
text-align: center;
height: 100%;
background-color: white;
overflow: auto;
border: 1px solid #cccccc;
}

.btm-ctt {
display: block;
position: absolute;
height: 200px;
width: 800px;
text-align: left;
bottom: 28px;
}

.btm-ctt1{
display: block;
position: absolute;
width: 800px;
text-align: left;
margin-top: 20px;
margin-left: 10px;
bottom: 60px;
}

.btm-ctt2{
position: absolute;
text-align: center;
bottom: 0px;
margin-left: 330px;
}

.btm-ctt3{
display: inline-block;
}

.btn_rot {
display: inline-block;
    background-color: #f7f7f7;
    color: black;
    width: 76px;
    height: 32px;
    padding-top: 10px;
    text-align: center;
    cursor: pointer;
    bottom: -8px;
    border-radius: 6px;
}

.btn_rot:hover {
color: #fff;
background-color: #EF6C33;
}

.btn_cancel {
display: inline-block;
    background-color: #f7f7f7;
    color: black;
    width: 76px;
    height: 32px;
    padding-top: 10px;
    text-align: center;
    cursor: pointer;
    bottom: -8px;
    border-radius: 6px;
}

.btn_cancel:hover {
color: #fff;
background-color: #EF6C33;
}
</style>
<script type="text/javascript"
src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

$("#btnDeclation2").on("click", function(){
reportPopup();
});

function reportPopup(){
var html = "";
                                                                                                                                   
html +="<div class=\"background_r\"></div>";
html +=" <div class=\"ctts_r\">";
html += " <form id=\"reportForm\">";
/*  html += " <input type=\"hidden\" name=\"\" value=\"" +  + "\" />";
html += " <input type=\"hidden\" name=\"\" value=\"" +  + "\" />"; */
html += " <input type=\"hidden\" name=\"checkArr\"  id=\"checkArr\"/>";
html +=" <div class=\"top_ctt\">";
html +=" <div class=\"top_ctt1\">";
html +=" <div>신고하기</div>";
html +=" </div>";
html +=" <div class=\"top_ctt2\">";
html +=" <b>신고합니다.</b>";
html +=" </div>";
html +=" <div class=\"top_ctt3\">";
html +=" 아래 내용을 제출합니다.";
html +=" </div>";
html +=" <div class=\"top_ctt4\">";
html +=" <div class=\"top_ctt4-1\">신고사유</div>";
html +=" <div class=\"checkbox_div\">";
html +=" <div>";
html +=" <input type=\"checkbox\" name=\"checkR\" id=\"c1\" value=\"1\" class=\"check_one\"/>";
html +=" <label for=\"c1\">홍보,영리목적</label>";
html +=" </div>";
html +=" <div>";
html +=" <input type=\"checkbox\" name=\"checkR\" id=\"c2\" value=\"2\" class=\"check_one\"/>";
html +=" <label for=\"c2\">부적절한 홍보</label>";
html +=" </div>";
html +=" <div>";
html +=" <input type=\"checkbox\" name=\"checkR\" id=\"c3\" value=\"3\" class=\"check_one\"/>";
html +=" <label for=\"c3\">불법정보</label>";
html +=" </div>";
html +=" <div>";
html +=" <input type=\"checkbox\" name=\"checkR\" id=\"c4\" value=\"4\" class=\"check_one\"/>";
html +=" <label for=\"c4\">음란 또는 청소년에게한 내용</label>";
html +=" </div>";
html +=" <div>";
html +=" <input type=\"checkbox\" name=\"checkR\" id=\"c5\" value=\"5\" class=\"check_one\"/>";
html +=" <label for=\"c5\">욕설비방차별혐</label>";
html +=" </div>";
html +=" <div>";
html +=" <input type=\"checkbox\" name=\"checkR\" id=\"c6\" value=\"6\" class=\"check_one\"/>";
html +=" <label for=\"c6\">도배 스팸</label>";
html +=" </div>";
html +=" <div>";
html +=" <input type=\"checkbox\" name=\"checkR\" id=\"c7\" value=\"7\" class=\"check_one\"/>";
html +=" <label for=\"c7\">개인정보 노출거래</label>";
html +=" </div>";
html +=" <div>";
html +=" <input type=\"checkbox\" name=\"checkR\" id=\"c8\" value=\"8\" class=\"check_one\"/>";
html +=" <label for=\"c8\">저작권 및 명예훼손</label>";
html +=" </div>";
html +=" <div>";
html +=" <input type=\"checkbox\" name=\"checkR\" id=\"c9\" value=\"9\" class=\"check_one\"/>";
html +=" <label for=\"c9\">기타</label>";
html +=" </div>";
html +=" </div>";
html +=" </div>";
html +=" <div class=\"r_content_div\">";
html +=" <div class=\"r_content-1\">내용<br/><span id=\"cttCnt\"></span></div>";
html +=" <div class=\"report_content\">";
html +=" <textarea rows=\"16\" cols=\"78\" name=\"reportCtt\" id=\"reportCtt\"></textarea></div>";
html +=" </div>";
html +=" </div><!-- --------------------------------------------top-ctt -->";
html +=" <div class=\"btm-ctt\">";
html +=" <div class=\"btm-ctt1\">";
html +=" <ul>";
html +=" <li><span class=\"font-red\">허위신고</span>일 경우 신고자에 대한 제재가 있을 수 있습니다.</li>";
html +=" <li>신고내용의 사유에 따라 사용자를 처벌하는 시간이 다소 걸릴 수 있습니다.</li>";
html +=" <li>이 글이 신고사유에 해당하는 글인지 다시 한 번 <span class=\"font-red\">확인</span>하시기 바랍니다.<br/>";
html +=" <li>신고하게 된 이유를 자세히 써주시면 운영자의 관련 결정에 도움이 됩니다.</li>";
html +=" 신고기능은 글 작성자에게 <span class=\"font-red\">피해</span>를 줄 수 있으며, <span class=\"font-red\">3회</span> 부정신고 시";
html +=" <span class=\"font-red\">영구적</span>으로 이용이 제한됩니다.</li>";
html +=" </ul>";
html +=" </div>";
html +=" <div class=\"btm-ctt2\">";
html +=" <div class=\"btm-ctt3\">";
html +=" <div class=\"btn_rot\">신고</div>";
html +=" <div class=\"btn_cancel\">취소</div>";
html +=" </div>";
html +=" </div>";
html +=" </div>";
html += " </form>";
html +=" </div>";



$("body").prepend(html);

$(".background_r").hide();
$(".ctts_r").hide();
$(".background_r").fadeIn();
$(".ctts_r").fadeIn();

//닫기
$(".btn_cancel").off("click");
$(".btn_cancel").on("click", function(){
closePopup();
});

$(".background_r").off("click");
$(".background_r").on("click", function(){
closePopup();
}); 



//신고하기 textarea 글자수 제한
$("#reportCtt").on("keyup", function(){

$("#cttCnt").html("(" + $(this).val().length + "/ 500)");

if($(this).val().length > 500){
$(this).val($(this).val().substring(0,500));
$("#cttCnt").html("(500 / 500)");
}
});

//체크박스 값 보내기
$(".btn_rot").on("click", function(){

$("#checkArr").val("");
$(".checkbox_div [type='checkbox']:checked").each(function(){
$("#checkArr").val($("#checkArr").val() + $(this).val());
});

console.log("#checkArr값: " + $("#checkArr").val());

});








//----------------------------------------------신고할 때
$("#btn_rot").off("click");
$("#btn_rot").on("click", function(){

//자기자신이 신고할 수 없도록 하는 코드




var params = $("#reportForm").serialize();

$.ajax({
type : "post",
url : "userReports",
dataType : "json",
data : params,
success : function(result) {

if(result.msg == "success"){
closePopup();

} else if(result.msg == "failed"){
alert("신고에 실패했습니다.");
} else {
console.log(result);
alert("신고 전송 중 문제가 발생했습니다.");
}

},
error: function(request, status, error){
console.log(error);

}

});//ajax
});//신고하기버튼누르면



};//popup end






//신고하기 팝업 닫기
function closePopup() {
$(".background_r").fadeOut(function(){
$(".background_r").remove();
});

$(".ctts_r").fadeOut(function(){
$(".ctts_r").remove();
});
}






});//ready
</script>
</head>
<body>
<img src="resources/images/JY/share.png" id="btnShare2" alt="공유" width="20px" height="20px">
<img src="resources/images/JY/dot1.png" id="btnDot12" alt="메뉴" width="25px" height="25px">
<img src="resources/images/JY/dot2.png" id="btnDot22" alt="메뉴" width="25px" height="25px">
<img src="resources/images/JY/declation.png" id="btnDeclation2" alt="신고" width="20px" height="20px">

</body>
</html>