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
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/admin/adminQnaList.css">

</head>
<body>
	<c:import url="adminMenubar.jsp" />
	<div class="container">
	<!-- 헤더푸터는 클래스명 신경써야함
		다른 페이지 임포트 되는거에는 css 선택자 적용안됨
		메인 : 페이지가 달라지는거니 상관없다 -->

    	<div class="main">
        	<div class="infoContainer">
            	<div class="titleArea"><h3> 1:1 문의 </h3></div>
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
        		<form action="adminQnaAnsWrite.ad" method="post" id="adminQnaAnsWrite">
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
		                                		<%-- <p>${ b.qnaContent }</p> --%>
			                                    <c:set var="newLineChar" value="ᚘ"/>	 
			                                    <%-- <c:out  value="${b.qnaContent}"></c:out> --%>
			                                    ${fn:replace(b.qnaContent, newLineChar, "<br>") }
			                                    <input type="hidden" name="qnaContent" value="${b.qnaContent}">
		                                   
	                                  		    <%--<c:set var="newLineChar" value="1"/> --%>	 <%-- <c:out  value="${b.qnaContent}"></c:out> --%>
	                                  		    <%-- ${fn:contains(b.qnaContent, "\\r\\n")} --%> <!-- b.qnaContent 안에 내용 중에 개행문자가 포함되어있는지 확인 디버깅용 -->
			                                    <%-- <input type="hidden" name="qnaContent" value="${b.qnaContent}">${b.qnaContent} --%>
			                                   <!--타이틀도. 전체를 폼으로 감싸야함. href를 안주고 액션에 주소값 주는 것. 버튼을 누르면 폼에 감싸져있음. 서브밋 필요없이 버튼 누르면 제출됨. vo에 세터값이랑이랑 일치하니   -->
		                            		</div>
		                            		<br>
		               						<div>
				                                <!-- 답변 상태 b.QnAAnsStatus가 Y이면 A아이콘이 나타나는 c:if 사용 -->
				                                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/icons_board_qna_a-solid.svg" style="width: 15px;">
	                                			<div id="dis${ vs.index }" style="display:none;" >
                                			 		<c:forEach var="reply" items="${replyList}">
			                                 			<!-- 글번호 맞는거만 불러오게 반복문 사용 -->
				                                		<c:if test="${reply.refQnaNo eq b.qnaNo }"> <!-- 현재보고 있는 글번호랑  ref로해서 가져온 글번호랑 같아야함 -->
					                                		<p>
					                                			${reply.replyContent}
						                                		<c:if test="${reply.replyContent ne null }">
							                                	 	<div class="replyButton">
							                                	 		<input type="hidden" id="replyNo" name="replyNo" value="${reply.replyNo }">
							                                	 		<!-- <button type="button" class="btnUpdate" >수정</button> -->
							                                	 		<button type="button" class="btnDelete" >삭제</button>
																		<%--<button type="button" class="btnDelete" name="replyNo" value="${reply.replyNo}">삭제</button> --%>
							                                	 	</div>
						                                		</c:if>
					                                		</p>
				                               	 		</c:if>
		                         		      		</c:forEach>
				                         		    <div class="replyTable">
														<textarea name="replyContent" cols="100" rows="5" id="replyContent${ vs.index }" style="resize:none"></textarea>
														<div>
															<button class="rSubmit" type="button">등록하기</button>
														</div>
													</div>
											
													<%-- <table class="replyTable" id="rtb${ vs.index }">
														<thead>	
															<tr>
																<td colspan="2"><b id="rCount${ vs.index }"></b></td>
															</tr>
														</thead>
														<tbody></tbody>
													</table> --%>
	                                			</div>
	                            			</div>
		                        		</li>
	                        		</div>  
	                    		</ul>
	                    		<div class="QnaToggleOpen_Button">
	                        		<button type="button" name="page" id="btnReply${ vs.index }" class="btnReply">답변하기</button> 
	                        		<!-- { vs.index } == 위의 varStatus -->
	                       			<%--  <button type="button" name="page" id="ReplyBtn${ vs.index }" class="btnReplyUpdate">수정</button> <!-- { vs.index } == 위의 varStatus -->
	                        		<button type="button" name="page" id="deleteBtn${ vs.index }" class="btnReplydelete">삭제</button>
		                    		<button type="submit" name="page" value="${pi.currentPage}" onclick="location.href='boardQnaDeleteForm.bo'">삭제</button> --%>
	                    		</div>
	                    		<br>																
	                		</div>
	            		</details>  
            			<input type="hidden" id="refQnaNo" name="refQnaNo" value="${ b.qnaNo }">
            			
            			<c:if test="${ vs.last }">
            				<input type="hidden" id="lastFor" value="${ vs.index }" name="lastFor">
            			</c:if>
            	</c:forEach>
            	<!-- <input type="hidden" name="qnaNo" id="qnaNo"> -->
       		</form>
      		<br>     


		<!--UI kit pagination -->
	        <ul class="uk-pagination uk-flex-center" uk-margin>
	           <!-- [이전] -->
	           <c:if test="${ pi.currentPage <= 1 }">
	              <li><a href="#"><span uk-pagination-previous></span></a></li> &nbsp;
	           </c:if>
	           <c:if test="${ pi.currentPage > 1 }">
	              <c:url var="before" value="adminQnaList.ad">
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
	                 <c:url var="pagination" value="adminQnaList.ad">
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
	              <c:url var="after" value="adminQnaList.ad">
	                 <c:param name="page" value="${ pi.currentPage + 1 }"/>
	              </c:url> 
	              <li><a href="${ after }"><span uk-pagination-next></span></a></li>
	           </c:if>
	    	 </ul>
 
 
 
            <br>

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
	$('.btnReply').on('click',function(){
		var dis = $(this).parent().prev().children().children().children().eq(2).children().eq(1);
			/* $(this).parent().parent().children().eq(0).children().children().children().eq(1).children().eq(1); */
		console.log(dis);
		dis.show();	// 숨기고 싶은 부분의 태그에 style="display:none으로 미리 숨김
	});
	
	$('.rSubmit').on('click',function(){
/* 		console.log('#replyContent${ vs.index }''); */
// 		console.log('#replyContent');
// 		console.log($(this).next().val());
// 		console.log($('#lastFor').val());
		
		$('#adminQnaAnsWrite').submit();
	});
/* 	$('.btnUpdate').on('click',function(){
		var replyNo = $(this).siblings('#replyNo').val();
		$('#replyNo').val(replyNo);
		console.log(replyNo);
		location.href="adminQnaAnsUpdateView.ad?replyNo="+replyNo;
	}); */
	$('.btnUpdate').on('click',function(){
		var replyNo = $(this).siblings('#replyNo').val();
		$('#replyNo').val(replyNo);
		console.log(replyNo);
		/* location.href="adminQnaAnsUpdateView.ad?replyNo="+replyNo; */
		
	});
	$('.btnDelete').on('click',function(){
		var replyNo = $(this).siblings('#replyNo').val();
		$('#replyNo').val(replyNo);
		console.log(replyNo);
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="adminQnaAnsDelete.ad?replyNo="+replyNo;
		}
	});
	

/* 	$('.btnReplydelete').on('click',function(){
		var qnaNo = $(this).parent().parent().prev().children().children().children().children().children().eq(0).text();
		$('#qnaNo').val(qnaNo);
		console.log(qnaNo);
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="boardQnaDeleteForm.bo"
		}
	});
	


/* 	$('.btnReplydelete').on('click',function(){
		var qnaNo = $(this).parent().parent().prev().children().children().children().children().children().eq(0).text();
		$('#qnaNo').val(qnaNo); // value(qnaNo)의 값을 id="qnaNo"에 넣겠다는 의미
		console.log(qnaNo);
		if(confirm("정말로 삭제하시겠습니까?")){
//			location.href="adminQnaAnsDeleteForm.ad"; // 단순 url 변경이라 데이터 변경이 안됐던 것. 폼태그 안에 있는 데이터 내용을 같이 보내줘야하는데 url 변경만 해서 작동을 안한 것
			location.href="adminQnaAnsDeleteForm.ad?qnaNo="+qnaNo; 
		}
	});	 */

/* 	$('.ReplyBtn').on('click',function(){
		var qnaNo = $(this).parent().parent().prev().children().children().children().children().children().eq(0).text();
		// parent() : 상위태그로 // prev() : 동급의 이전태그(같은 띄어쓰기 단계의 바로 앞에 쓰인 태그) // children() : 하위태그로 // eq(0) : 해당 태그의 0번째있는 태그 // text() : 텍스트만 끌어오는 태그
		
//		 ▶   ${b.qnaNo }만 따로 가져와서 <input type="hidden">에 넣어주기 ◀
		// class="updateBtn"이 있는 button태그에서 .parent()는 div태그 그 위 parent는 <div class="QnaToggleOpen">태그
		// 여기서 prev()하면  summary태그로 가서 children5번하면  table아래 tr태그가 나오고 eq(0)해서 tr태그 아래 첫번째 태그인 td가 선택됨
		// 이 td태그에서 text()해서 텍스트만 가져오므로써  ${ b.qnaNo } 획득
		$('#qnaNo').val(qnaNo); // 위에서 ${ b.qnaNo }만 가져다 변수 no에 넣은 걸, id='qnaNo'에 val(no)으로 넣어준다
		
		$('#adminQnaAnsUpdateViewForm').submit(); // 맨 위 form태그의 id="boardQnaUpdateViewForm"를 submit 시키겠다는 의미
		
	}); */
	
	/* 댓글 등록 먼저 해 볼 예정 */
	/* $('#ReplyBtn').click(function(){
		var rContent = $('#replyContent').val();
		var refBId = ${board.boardId};
		
		$.ajax({
			url: 'addReply.bo',
			data: {replyContent:rContent, refBoardId:refBId},
			success: function(data) {
				console.log(data);
				if(data == 'success'){
					$('#replyContent').val(' '); // .val(' ') 넣는 이유?
				}
			},
			error: function(data) {
				console.log(data);
			}
		});
	});
	
	
	function getReplyList() {
		$.ajax({
			url: 'rList.bo',
			data: {bId:${board.boardId}},
			success: function(data) {
				console.log(data);
				
				// 계속 이어붙기 때문에 공백 넣어주기. 댓글이 이어서 나오면 뷰가..
				$tableBody = $('#rtb tbody');
				$tableBody.html('');
				
				var $tr;
				var $writer;
				var $content;
				var $date;
				$('#rCount').text('댓글(' + data.length + ')');
				
				if(data.length > 0) {
					for (var i in data) {
						$tr = $('<tr>');
						$writer = $('<td>').css('width', '100px').text(data[i].nickName);
						$content = $('<td>').text(data[i].replyContent);
						$date = $('<td width="100px">').text(data[i].replyCreateDate);
					
						$tr.append($writer);
						$tr.append($content);
						$tr.append($date);
						$tableBody.append($tr);
					}
				}else{
					$tr = $('<tr>');
					$content = $('<td colspan="3">').text('등록된 댓글이 없습니다.');  attr해서 집어넣는 것도 가능
				
					$tr.append($content);
					$tableBody.append($tr);
				}
			},
			error: function(data) {
				console.log(data);
			}
		});
	} */
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/screenfull.js/5.1.0/screenfull.js" integrity="sha512-Dv9aNdD27P2hvSJag3mpFwumC/UVIpWaVE6I4c8Nmx1pJiPd6DMdWGZZ5SFiys/M8oOSD1zVGgp1IxTJeWBg5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%-- <script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-screenfull.js"></script> --%>
<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-scroll-to.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-toggle-class.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/scripts/app.js"></script>

<!-- ajax -->
<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/jquery-pjax/jquery.pjax.js"></script> --%>
<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ajax.js"></script>
<!-- endbuild -->


</body>
</html>
