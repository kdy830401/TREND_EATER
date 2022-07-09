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
        <p>
        	${board.boardContent}
        </p>
    </div>
		<input type="hidden" id="boardId" name="boardId" value="${board.boardId }" > <!-- qnaNo를 컨트롤러로 보내서 어느 게시물이 수정되는지 알려 줘야함  -->
    <div class="listButton">
    	<c:url var="blist" value="adminNoticeList.ad">
			<c:param name="page" value="${ page }"/>
		</c:url>
        <button type="submit" onclick="javascript:form.action='adminNoticeUpdateForm.ad'">수정</button> 
        <!-- <button type="submit" onclick="javascript:form.action='adminNoticeDelete.ad'">삭제</button> -->
        <button type="button" onclick="ConfirmDelete()">삭제</button> 
        <button type="submit" onclick="javascript:form.action='adminNoticeList.ad'">목록</button> 
        <!-- <button class="updateBtn">수정</button> --> 
        <!-- <button onclick="location.href='adminNoticeUpdateForm.ad'">수정</button> -->
        <%-- <button type="submit" onclick="location.href='${ blist }'">삭제</button> --%>
        <%-- <button onclick="location.href='${ blist }'">목록</button>  --%>
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

    

</body>
</html>

