<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="adminMenubar.jsp" />
	 <div class="uk-container">   
        <div class="page_section section_offer">
            <div class="head_aticle">
            <h2 class="tit">이벤트 등록</h2>
            </div>
           
            <div class="xans-board-write">
            <form name="fm" id="fm" method="post" action="einsert.ad" enctype="multipart/form-data" onsubmit="return chkForm(this)" style="height: 100%;">
            <input type="hidden" name="mode" value="add_offer">
            <input type="hidden" name="itemcd" value="">
            <input type="hidden" name="sno" value="undefined">
            <table id="table_after" class="boardWrite2" width="100%">
            <colgroup><col width="14%" align="right">
            </colgroup><tbody><tr>
            <th class="input_txt">제목</th>
            <td><select name="category" required="" fld_esssential="" label="이벤트유형" class="select">
            <option value="">선택해주세요.</option>
            <option value="1">일반이벤트</option>
            <option value="2">투표이벤트</option>
            </select><br> <input type="text" name="boardTitle" style="width:100%" required="" fld_esssential="" label="제목" value="">
            </td>
            </tr>
            <tr>
            <th class="input_txt">내용</th>
            <td>
            <textarea name="boardContent" style="width: 777px; height: 245px;" required="" fld_esssential="" label="내용"></textarea>
            </td>
            </tr>
            <tr>
            <th class="input_txt">이미지</th>
            <td>
            <table width="95%" id="table" cellpadding="0" cellspacing="0" border="0" style="border:solid 1px #f4f4f4; border-collapse:collapse;">
            <tbody><tr id="tr_0">
            <td width="20" nowrap="" align="center">1</td>
            <td width="100%">
            <input type="file" name="file[]" style="width:50%" class="linebg">
            <a href="javascript:add()"><img src="https://www.kurly.com/shop/data/skin/designgj/img/common/btn_upload_plus.gif" align="absmiddle"></a>
            </td>
            </tr>
            <tr id="tr_1"><td style="text-align: center;">2</td><td><input type="file" name="file[]" style="width:50%" class="line"> <a href="javascript:del('tr_1')"><img src="https://www.kurly.com/shop/data/skin/designgj/img/common/btn_upload_minus.gif" align="absmiddle"></a></td></tr>
<!--             <tr id="tr_2"><td style="text-align: center;">3</td><td><input type="file" name="file[]" style="width:50%" class="line"> <a href="javascript:del('tr_2')"><img src="https://www.kurly.com/shop/data/skin/designgj/img/common/btn_upload_minus.gif" align="absmiddle"></a></td></tr> -->
<!--             <tr id="tr_3"><td style="text-align: center;">4</td><td><input type="file" name="file[]" style="width:50%" class="line"> <a href="javascript:del('tr_3')"><img src="https://www.kurly.com/shop/data/skin/designgj/img/common/btn_upload_minus.gif" align="absmiddle"></a></td></tr> -->
<!--             <tr id="tr_4"><td style="text-align: center;">5</td><td><input type="file" name="file[]" style="width:50%" class="line"> <a href="javascript:del('tr_4')"><img src="https://www.kurly.com/shop/data/skin/designgj/img/common/btn_upload_minus.gif" align="absmiddle"></a></td></tr></tbody></table> -->
            <div width="100%" style="padding:5px;" class="stxt">
            - 파일은 최대 5개까지 업로드가 지원됩니다.<br>
            </div>
            </td>
            </tr>
            </tbody></table>            
            <table width="100%">
            <tbody><tr>
            <td align="right" style="padding-top:5px; border:none;" id="avoidDbl" class="btn_save">
            <input type="submit" class="bhs_button yb" value="등록" style="float:none;">
            </td>
            </tr>
            </tbody></table>
            </form>
            </div>
            
        </div>
    </div> 
    
   
</body>
</html>