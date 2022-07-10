<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> TREND_EATER </title>

<!-- UIkit CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>


<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/adminNoticeUpdateForm.css" type="text/css">

</head>
<body>


	<c:import url="adminMenubar.jsp" />
	

    <div class="title">
        <h2>공지사항</h2>   
    </div>    
 <form name="form" method="post">
    <table class="tableWhole">
            <thead>
                <tr>
                    <th>제목</th>
                        <td style="width: 1050px;">
                            <input name="boardTitle" value="${ b.boardTitle }"> 
                        </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${b.adminId}
                    </td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${b.boardCreateDate}</td>
                    <th>조회수</th>
                    <td style="width:100px" align="center">${b.boardCount}</td>
                </tr>
            </thead>
    </table>

    
	<div class="main">
        <div class="QuesTitle">
        
        </div>
        <div class="QuesContent">
            <textarea class="uk-textarea" name="boardContent" value="${ b.boardContent }"
             style="resize: none">${b.boardContent}</textarea>
           
        </div>
	
	    <div class="listButton">
	    	<input type="hidden" name="boardId" value="${b.boardId }" > <!-- qnaNo를 컨트롤러로 보내서 어느 게시물이 수정되는지 알려 줘야함  -->
	    	<c:url var="blist" value="adminNoticeList.ad">
				<c:param name="page" value="${ page }"/>
			</c:url>
	        <button onclick="javascript:form.action='adminNoticeUpdate.ad'">수정 완료</button> 
	        <button onclick="javascript:form.action='${ blist }'">목 록</button> 
	    </div>
	</div>
</form> 



<%--        <div class="QnaToggleOpen_Button">
             <button type="button" name="page" id="updateBtn${ vs.index }" class="updateBtn">수정</button> <!-- { vs.index } == 위의 varStatus -->
             <button type="button" name="page" id="deleteBtn${ vs.index }" class="deleteBtn">삭제</button>
             		
<button type="submit" name="page" value="${pi.currentPage}" id="boardQnaDelete"
	    onclick="boardQnaDelete()">삭제</button>
<button type="submit" name="page" value="${pi.currentPage}" onclick="location.href='boardQnaDeleteForm.bo'">삭제</button> 

      </div><br>	--%>


<!-- 
    <script>
		$('.listButton').mouseenter(function() {
			$(this).parent().css({'background':'#FCD2D1', 'color': 'white', 'cursor': 'pointer' });
		}).mouseout(function(){
			$(this).parent().css({'background':'#FF5C58', "color":"white"});
		}).click(function() {
			location.href = 'notice.bo?' + page + "page";
			location.href = 'bdetail.bo?bId=' + bId + "&page=" + ${pi.currentPage};
		});	
	</script> 
 -->

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


