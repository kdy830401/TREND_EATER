<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ page import="com.fpj.trendeater.board.model.vo.BoardQnA" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> TREND_EATER QnA </title>



<!-- UIkit CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>


<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script> 

<!-- font awesome -->
<script src="https://kit.fontawesome.com/76295929c4.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/board/boardQna.css">
  


</head>
    
<body>

	<c:import url="../common/menubar.jsp" />
	

<div class="container">
<!-- 헤더푸터는 클래스명 신경써야함
다른 페이지 임포트 되는거에는 css 선택자 적용안됨
메인 : 페이지가 달라지는거니 상관없다 -->

    <div class="main">
        <div class="infoContainer">
            <div class="titleArea">
                <h3 > 1:1 문의 </h3>
            </div>
            <div class="tableArea">
                <table>
                    <thead>
                        <tr>
                            <th width="65">번호</th>
                            <th >제목</th>
                            <th width="100">작성일</th>
                            <th width="70">답변상태</th>
                        </tr>
                    </thead>
                </table>
                <br>
            </div>
        <form action="boardQnaUpdateView.bo" method="post" id="boardQnaUpdateViewForm">
            <c:forEach var="b" items="${ list }" varStatus="vs">
	            <details>
	                <summary> 
                        <div>
                            <table>
                                <tr class="tbodyContent">
                                    <td class="tbodyTd1" width="65">${ b.qnaNo }</td>
                                    <td class="tbodyTd2" style="text-align:left">${ b.qnaTitle }</td>
                                    <td class="tbodyTd4" width="100">${ b.qnaCreateDate }</td>
                                    <td class="tbodyTd5" width="70"> 
                                   		<c:choose>
                                   			<c:when test="${ b.qnaAnsStatus eq 'Y' }"><span>답변 완료</span></c:when>
                                   			<c:when test="${ b.qnaAnsStatus eq 'N' }"><span>답변 대기중</span></c:when>
                                   		</c:choose>
                                    </td>
                                </tr>   
                            </table>
                        </div>
	                </summary>
	                <div class="QnaToggleOpen">
	                    <ul>
	                        <div class="QnaToggleContent">
		                        <li>
		                            <div>
		                                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/icons_board_qna_q-solid.svg" style="width: 15px;">

	                                   <c:set var="newLineChar" value="㉾"/>	 
	                                  	 ${fn:replace(b.qnaContent, newLineChar, "<br>") }
	                                   <input type="hidden" name="qnaContent" value="${b.qnaContent}">
		                            </div><br>
		                                   
										<%-- <p>${ b.qnaContent }</p> --%>
	                                  <%--  <c:set var="newLineChar" value="1"/> --%>	 <%-- <c:out  value="${b.qnaContent}"></c:out> --%>
	                                   <%-- ${fn:contains(b.qnaContent, "\\r\\n")} --%> <!-- b.qnaContent 안에 내용 중에 개행문자가 포함되어있는지 확인 디버깅용 -->
		                                   <%-- <input type="hidden" name="qnaContent" value="${b.qnaContent}">${b.qnaContent} --%>
		                                   <!--타이틀도. 전체를 폼으로 감싸야함. href를 안주고 액션에 주소값 주는 것. 버튼을 누르면 폼에 감싸져있음. 서브밋 필요없이 버튼 누르면 제출됨. vo에 세터값이랑이랑 일치하니   -->
		                            <c:if test="${b.qnaAnsStatus eq 'Y'}">
			                            <div>
			                                <!-- 답변 상태 b.QnAAnsStatus가 Y이면 A아이콘이 나타나는 c:if 사용 -->
			                                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/icons_board_qna_a-solid.svg" style="width: 15px;">
			                                	답변 내용 - 관리자 댓글에서 끌어와야함
			                            </div>
		                            </c:if>
		                        </li>
	                        </div>  
	                    </ul>
	                    <div class="QnaToggleOpen_Button">
	                        <button type="button" name="page" id="updateBtn${ vs.index }" class="updateBtn">수정</button> <!-- { vs.index } == 위의 varStatus -->
	                        <button type="button" name="page" id="deleteBtn${ vs.index }" class="deleteBtn">삭제</button>

	                        		
<%-- 	                        <button type="submit" name="page" value="${pi.currentPage}" id="boardQnaDelete"
	                        		onclick="boardQnaDelete()">삭제</button>
 --%>	                        <%-- <button type="submit" name="page" value="${pi.currentPage}" onclick="location.href='boardQnaDeleteForm.bo'">삭제</button> --%>
	                    </div><br>																<!-- location.href = 'bdetail.bo?bId=' + bId + "&page=" + ${pi.currentPage}; -->
	                </div>
	            </details>  
            </c:forEach>
            <input type="hidden" name="qnaNo" id="qnaNo">
       </form>
       <br>     

		<!--UI kit pagination -->
	        <ul class="uk-pagination uk-flex-center" uk-margin>
	           <!-- [이전] -->
	           <c:if test="${ pi.currentPage <= 1 }">
	              <li><a href="#"><span uk-pagination-previous></span></a></li> &nbsp;
	           </c:if>
	           <c:if test="${ pi.currentPage > 1 }">
	              <c:url var="before" value="boardQna.bo">
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
	                 <c:url var="pagination" value="boardQna.bo">
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
	              <c:url var="after" value="boardQna.bo">
	                 <c:param name="page" value="${ pi.currentPage + 1 }"/>
	              </c:url> 
	              <li><a href="${ after }"><span uk-pagination-next></span></a></li>
	           </c:if>
	    	 </ul>
 
 
 
            <br>
            <div class="submitButton">
                <button type="submit" onclick="location.href='boardQnaWriteView.bo'">문의하기</button>
            </div>
        

            <br>
            <div class="boardSearchBox">
                <div>
                    <span>검색어</span>
                    <ul>
                        <li><label><input type="checkbox">제목</label></li>
                        <li><label><input type="checkbox">내용</label></li>
                    </ul>
                </div>
                <div class="searchBar">
                    <input type="search">
                    <input type="image" name="submit" src="${pageContext.servletContext.contextPath}/resources/img/icons/icons_Notice_search.png">
                </div>
                <br>
            </div>
        </div>
    </div>
</div>

<script>


	$('.deleteBtn').on('click',function(){
		var qnaNo = $(this).parent().parent().prev().children().children().children().children().children().eq(0).text();
		$('#qnaNo').val(qnaNo); // #qnaNo의 value="" 속성값에  var qnaNo의 값을 넣겠다는 의미
		console.log(qnaNo);
		if(confirm("정말로 삭제하시겠습니까?")){
//			location.href="boardQnaDeleteForm.bo"; // 단순 url 변경이라 데이터 변경이 안됐던 것. 폼태그 안에 있는 데이터 내용을 같이 보내줘야하는데 url 변경만 해서 작동을 안한 것
			location.href="boardQnaDeleteForm.bo?qnaNo="+qnaNo; 
		}
	});	
/* 	$('.updateBtn').on('click',function(){
		var qnaNo = $(this).parent().parent().prev().children().children().children().children().children().eq(0).text();
	
		function boardQnaDelete(){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="boardQnaDeleteForm.bo" */
			/* <c:url var="bdelete" value="bdelete.bo">
				 <c:param name="bId" value="${ board.boardId }"/>
				 <c:param name="renameFileName" value="${ board.renameFileName }"/>
			</c:url> 
		}
	}); */
	/* $('.deleteBtn').on('click',function(){
		var qnaNo = $(this).parent().parent().prev().children().children().children().children().children().eq(0).text();
		$('#qnaNo').val(qnaNo); 
		$('#boardQnaUpdateViewForm').submit();
	}); */	

	$('.updateBtn').on('click',function(){
		var qnaNo = $(this).parent().parent().prev().children().children().children().children().children().eq(0).text();
		// parent() : 상위태그로 // prev() : 동급의 이전태그(같은 띄어쓰기 단계의 바로 앞에 쓰인 태그) // children() : 하위태그로 // eq(0) : 해당 태그의 0번째있는 태그 // text() : 텍스트만 끌어오는 태그
		
//		 ▶   ${b.qnaNo }만 따로 가져와서 <input type="hidden">에 넣어주기 ◀
		// class="updateBtn"이 있는 button태그에서 .parent()는 div태그 그 위 parent는 <div class="QnaToggleOpen">태그
		// 여기서 prev()하면  summary태그로 가서 children5번하면  table아래 tr태그가 나오고 eq(0)해서 tr태그 아래 첫번째 태그인 td가 선택됨
		// 이 td태그에서 text()해서 텍스트만 가져오므로써  ${ b.qnaNo } 획득

		$('#qnaNo').val(qnaNo); //  #qnaNo의 value="" 속성값에  var qnaNo의 값을 넣겠다는 의미

		$('#boardQnaUpdateViewForm').submit(); // 맨 위 form태그의 id="boardQnaUpdateViewForm"를 submit 시키겠다는 의미
	});
</script>


<c:import url="../common/footer.jsp" />

</body>
</html>








