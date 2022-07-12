<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> TREND_EATER </title>

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/adminNoticeDetail.css" type="text/css">

</head>
<body>


	<c:import url="adminMenubar.jsp" />
	

    <div class="title">
        <h2>공지사항</h2>   
    </div>    
<form id="form" name="form" method="post">
    <table class="tableWhole">
            <thead>
                <tr>
                    <th>제목</th>
                        <td style="width: 1050px;">${ board.boardTitle } </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${board.adminId}</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${board.boardCreateDate}</td>
                    <th>조회수</th>
                    <td style="width:100px" align="center">${board.boardCount}</td>
                </tr>
            </thead>
    </table>
    

    <div class="content"> 
    	<%-- ${board.boardContent} --%>
    	<%-- ${fn:contains(board.boardContent, "\\r\\n")} --%>
        <p> 
        	<c:set var="newLineChar" value="\r\n" />
        		${fn:replace(board.boardContent, newLineChar, "<br>") }
       	</p>
        <input type="hidden" name="boardContent" value="${board.boardContent}">
    </div>
    
    
    
	<input type="hidden" id="boardId" name="boardId" value="${board.boardId }" > <!-- qnaNo를 컨트롤러로 보내서 어느 게시물이 수정되는지 알려 줘야함  -->
    
    
    
    <div class="listButton">
    	<c:url var="blist" value="adminNoticeList.ad">
			<c:param name="page" value="${ page }"/>
		</c:url>
        <button type="submit" onclick="javascript:form.action='adminNoticeUpdateForm.ad'">수정</button> 
        <button type="button" onclick="ConfirmDelete()">삭제</button> 
        <button type="submit" onclick="javascript:form.action='adminNoticeList.ad'">목록</button> 
    </div>
 </form> 
    
<script>
/* 	$('.updateBtn').click(function() {
		location.href='adminNoticeUpdateForm.ad'
		/* location.href = 'bdetail.bo?bId=' + bId + "&page=" + ${pi.currentPage};
	});	 */
	
	function ConfirmDelete(){
		/* var ask = confirm("정말로 삭제하시겠습니까?"); */
		/* if(confirm("정말로 삭제하시겠습니까?")){ */
		var ask = confirm("정말로 삭제하시겠습니까?");
		if(ask){
			var boardId = $('#boardId').val();
			/* location.href='adminNoticeDelete.ad?boardId='+boardId; */
			/* $('#ConfirmDelete').val(); */
			/* document.getElementsByName("form") */
/* 			var x = $('input[name=form]').val(); */
			/* var x = $('input[name=form]').onclick="javascript:form.action='adminNoticeDelete.ad'"; */
			/* onclick="javascript:form.action='adminNoticeDelete.ad'" */
			document.getElementById('form').submit();
			location.href='adminNoticeDelete.ad?boardId='+boardId;
		}
	};

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

