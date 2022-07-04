
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
    <title> TREND_EATER 공지사항 </title>



<!-- UIkit CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script> 

<!-- font awesome -->
<script src="https://kit.fontawesome.com/76295929c4.js" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/board/boardNoticeList.css">
	  



</head>
<body>




    <div class="container">

<!-- 헤더푸터는 클래스명 신경써야함
다른 페이지 임포트 되는거에는 css 선택자 적용안됨
메인 : 페이지가 달라지는거니 상관없다 -->

        <div class="main">
            <div class="infoContainer">
                <div class="titleArea">
                    <h3 >공지사항</h3>
                    <span>
                        TREND_EATER의 새로운 소식과 유용한 정보를 한곳에서 확인하세요
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
                                    <td class="tbodyTd1" width="65">${ b.boardId } </td>        
                                    <td class="tbodyTd2" style="text-align:left">${ b.boardTitle }</td>
                                    <td class="tbodyTd3" width="100"> ${ b.adminId } </td>
                                    <td class="tbodyTd4" width="100">${ b.boardCreateDate }</td>
                                    <td class="tbodyTd5" width="50">${ b.boardCount }</td>
                                </tr>
                            </c:forEach>
                     

    
                        </tbody>
                            


                    </table>
                </div>
                <br>
                
       				
 
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
 
 
 
 				<br>
                <div class="boardSearchBox">
                    <div>
                        <span>검색어</span>
                        <ul>
                            <li><label><input type="checkbox">이름</label></li>
	                        <li><label><input type="checkbox">제목</label></li>
	                        <li><label><input type="checkbox">내용</label></li>
                        </ul>
                    </div>
                    <div class="searchBar">
                        <input type="search">
                        <input type="image" name="submit" src="${pageContext.servletContext.contextPath}/resources/img/icons/icons_Notice_search.png">
                    </div>
                </div>
            </div>
        </div>
        

    </div>
    

    <script>
		$('.tbodyContent').find("td").mouseenter(function() {
			$(this).parent().css({'background':'#FCD2D1', 'color': 'white', 'cursor': 'pointer' });
		}).mouseout(function(){
			$(this).parent().css({'background':'none', "color":"black"});
		}).click(function() {
			var bId = $(this).parent().children('td').eq(0).text();
			location.href = 'noticeDetail.bo?bId=' + bId + "&page=" + ${pi.currentPage};
		});	
	</script> 

    
   
</body>
</html>




