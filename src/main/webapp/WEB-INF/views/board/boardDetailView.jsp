<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="com.fpj.trendeater.board.model.vo.Board" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> TREND_EATER </title>

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/board/boardNoticeDetail.css" type="text/css">

</head>
<body>

    <div class="title">
        <h2>공지사항</h2>   
        <p>TRENT EATER의 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
    </div>    

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
    <div class="listButton">
    	<c:url var="blist" value="noticeList.bo">
			<c:param name="page" value="${ page }"/>
		</c:url>
        <button onclick="location.href='${ blist }'">목록</button> <!-- url 지정하기 -->
    </div>

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

