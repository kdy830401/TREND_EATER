<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.fpj.trendeater.board.model.vo.Board" %>    
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
<%-- <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/board/boardNoticeList.css"> --%>
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

table{
    width: 100%;
    height: 2rem;
        min-height: 20px;
        max-height: 50px;
    border-top: 2px solid rgb(254, 143, 143)  ;
    border-bottom: 2px solid #FE8F8F  ;
}

table{
	font-size: 16px;
}
</style>	  

</head>
<body>


	<c:import url="../common/menubar.jsp" />


	<div class="uk-container uk-margin-large">
		<h2 class="uk-heading-bullet uk-h2 uk-text-center uk-text-bold">이벤트</h2>
		<div class="uk-heading-bullet uk-text-muted uk-text-center ">트렌드이터의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</div>
	</div>
	

    <div class="uk-container">

        <div class="main">
            <div class="infoContainer">
                <div>
                    <table class="table">
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
                                    <td>${b.boardNo}</td>        
                                    <td style="text-align:left">
                                    <c:url var="edetail" value="edetail.bo">
									<c:param name="eNo" value="${ b.boardNo }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									<a href="${ edetail }">${ b.boardTitle }</a>
                                    </td>
                                    <td> ${ b.adminId } </td>
                                    <td>${ b.createDate }</td>
                                    <td>${ b.boardCount }</td>
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
    </div>
    </div>
    </div>
 
		
</body>
</html>