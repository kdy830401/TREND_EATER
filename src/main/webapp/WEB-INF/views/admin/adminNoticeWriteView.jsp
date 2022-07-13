<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/admin/adminNoticeWriteView.css">



</head>
<body>

	<c:import url="adminMenubar.jsp" />



    <div class="title">
        <h2>공지사항</h2>   
    </div>    
    
	<form action='adminNoticeWriteForm.ad' method="post" id="adminNoticeWriteForm">
	    <table class="tableWhole">
	            <thead>
	                <tr>
	                    <th>제목</th>
	                        <td style="width: 1050px;">
	                        	<input type="text" name="boardTitle" value="${board.boardTitle}" placeholder="제목을 입력하세요">
	                        </td>
	                </tr>
	                <tr>
	                    <th>작성자</th>
	                    <td>${board.adminId}</td>
	                    <input type="hidden" name="adminId" value="${board.adminId}">
	                </tr>
	                <tr>
	                    <th>작성일</th>
	                    <td>${board.boardCreateDate}</td>
	                    <th>조회수</th>
	                    <td style="width:100px" align="center">
	                    	${board.boardCount}
	                    </td>
	                </tr>
	            </thead>
	    </table>
    

	    <div class="content">
	        <textarea name="boardContent" value="${board.boardContent}" id="textarea" placeholder="   내용을 입력해주세요."></textarea>
	       
	    </div>
	    <div class="listButton">
	        <button id="send">작성완료</button>

	        <a href="adminNoticeList.ad"><button type="button">목록보기</button></a>
<!-- 	        <button type="submit" onclick="javascript:form.">작성 완료</button>  -->
<!-- 	        <button type="button" onclick="javascript:form.action='adminNoticeList.ad'">목 록</button> -->
	    </div>
	 </form> 
    
<script>
	$('#send').on('click',function(){
	    var v = document.getElementById('textarea').value
		console.log(v);
		v = v.replace('\n', 'ᚘ');
		$('#adminNoticeWriteForm').submit();
	});

</script>



<!-- ############ PAGE END 끝~ -->

<!-- / -->

<!-- theme switcher -->

<!-- ############ LAYOUT END-->

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



