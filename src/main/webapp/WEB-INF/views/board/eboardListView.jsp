<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.fpj.trendeater.board.model.vo.Board" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- UIkit CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script> 

<!-- font awesome -->
<script src="https://kit.fontawesome.com/76295929c4.js" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/board/boardNoticeList.css">
<style>
/*a태그 스타일 없애기  */
td >a {
  text-decoration: none;
  color: black ;
 
}
td >a:hover{
	text-decoration: none;
	color:#FF5C58
}
</style>	  

</head>
<body>


	<c:import url="../common/menubar.jsp" />

    <div class="container">



        <div class="main">
            <div class="infoContainer">
                <div class="titleArea">
                    <h3 >이벤트</h3>
                    <span>
                        	트렌드이터의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.
                    </span>
                </div>
                <div>
                    <table>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="b" items="${ list }">
                                <tr class="tbodyContent">
                                    <td class="tbodyTd1" width="65">${b.boardNo}</td>        
                                    <td class="tbodyTd2" style="text-align:left">
                                    <c:url var="edetail" value="edetail.bo">
									<c:param name="eNo" value="${ b.boardNo }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									<a href="${ edetail }">${ b.boardTitle }</a>
                                    </td>
                                    <td class="tbodyTd3" width="100"> ${ b.adminId } </td>
                                    <td class="tbodyTd4" width="100">${ b.createDate }</td>
                                    <td class="tbodyTd5" width="50">${ b.boardCount }</td>
                                </tr>
                            </c:forEach>
    
                        </tbody>

                    </table>
                </div>
                <br>
      <!-- 페이지네이션 -->
    <!--UI kit pagination -->
    <ul class="uk-pagination uk-flex-center" uk-margin>
        <!-- [이전] -->
        <c:if test="${ pi.currentPage <= 1 }">
           <li><a href="#"><span uk-pagination-previous></span></a></li> &nbsp;
        </c:if>
        <c:if test="${ pi.currentPage > 1 }">
           <c:url var="before" value="noticeList.bo">
              <c:param name="page" value="${ pi.currentPage - 1 }"/>
           </c:url>
           <li><a href="${ before }"><span uk-pagination-previous></span></a></li>
        </c:if>
        
        <!-- 페이지 -->
        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
           <c:if test="${ p eq pi.currentPage }">
              <li class="uk-active"><span>[${ p }]</span></li>
           </c:if>
           
           <c:if test="${ p ne pi.currentPage }">
              <c:url var="pagination" value="noticeList.bo">
                 <c:param name="page" value="${ p }"/>
              </c:url>
               <li><a href="${ pagination }">${ p }</a></li>&nbsp;
           </c:if>
        </c:forEach>
        
        <!-- [다음] -->
        <c:if test="${ pi.currentPage >= pi.maxPage }">
           <li><a href="#"><span uk-pagination-next></span></a></li> &nbsp;
        </c:if>
        <c:if test="${ pi.currentPage < pi.maxPage }">
           <c:url var="after" value="noticeList.bo">
              <c:param name="page" value="${ pi.currentPage + 1 }"/>
           </c:url> 
           <li><a href="${ after }"><span uk-pagination-next></span></a></li>
        </c:if>
      </ul>
<!-- ############ PAGE END 끝~ -->          
       				
 
		
</body>
</html>