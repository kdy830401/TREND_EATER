<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>event</title>
<!-- UIkit CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>    
<style>
    * {
        font-family: noto sans;
    } 
    
    .tit_page {
        overflow: hidden;
        width: 1050px;
        margin: 0 auto;
        padding: 50px 0 51px;
    }
    
    .tit_page h2.tit{
        font-weight: 700;
        font-size: 28px;
        color: #333;
        line-height: 35px;
        text-align: center;
        letter-spacing: -1px;

    }
    
    .tit_page .sub {
    font-family: noto sans;
    font-size: 14px;
    color: #999;
    line-height: 20px;
    letter-spacing: -.3px;
    text-align: center;
    }
    
    .boardView{
        font-size: 14px;
        table-layout: fixed;
        border-top: 2px solid #333;
        border-bottom: 1px solid #f4f4f4;
        color: #333;
        line-height: 180%;
        margin-top: 20px;
    }
    
    tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
    }
    
    .boardView th{
        width: 130px;
        padding: 13px 0 13px 20px;
        background-color: #f7f5f8;
        border-top: 1px solid #f4f4f4;
        text-align: left;
    }
    
    .boardView td{
        width: auto;
        padding: 13px 0 13px 23px;
        border-top: 1px solid #f4f4f4;
    }
   
    .page_eventview {
        text-align: center;
    }
    
    #listBtn{
        background-color: #795b8f;
        color: #fff;
        width: 150px;
        display: inline-block;
        line-height: 40px;
        text-align: center;
        font-size: 13px;
    }
/* 이전 이후 리스트 이동 버튼 */
    .event-board-movement {
        border-top: 2px solid #333;
        border-bottom: 2px solid #333;
        margin: 20px 0;
        font-size: 12px;
        text-decoration: none;
    }

    .event-board-movement li {
        overflow: hidden;
        padding: 0 20px;
        border-bottom: 1px solid #f4f4f4;
        line-height: 140%;
        color: #333;
    }
   
    .event-board-movement li strong {
        float: left;
        padding: 10px;
    }
    
    .event-board-movement li strong {
        width: 6%;
        padding-left: 15px;
        border-right: 1px solid #f4f4f4;
        font-weight: 400;
        background: url(https://res.kurly.com/pc/etc/old/images/board/ico_move_prev.gif) no-repeat 0 15px;
    }
    .event-board-movement li.next strong {
        background: url(https://res.kurly.com/pc/etc/old/images/board/ico_move_next.gif) no-repeat 0 15px;
    }
    div, th, td, li, dt, dd, p {
        word-break: break-all;
    
    }
    .event-board-movement li a, .event-board-movement li strong {
        float: left;
        padding: 10px;
    }
    a {
        background-color: transparent;
        text-decoration: none;
        color: inherit;
    }
    a:hover{
        color: #333;
        text-decoration: none;

    }
</style>    
</head>
<body>
<c:import url="../common/menubar.jsp"/>
<!-- ############ PAGE START 여기에 내용 넣어주세요 -->
    <div class="uk-container">
        <div class="tit_page">
            <h2 class="tit">이벤트</h2>
            <p class="sub">트렌드이터의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
        </div>
        <table class="boardView" width="100%">
            <tbody>
                <tr>
                    <th>제목
                    <input type="hidden" value="${board.boardNo}" name="boardNo">
					<input type="hidden" value="${page}" name="page">
                    </th>
                    <td>${ board.boardTitle }
                    <input type="hidden" value="${ board.boardTitle }" name="boardTitle">
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ board.adminId }
                    <input type="hidden" value="${ board.adminId }" name="adminId">
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${ board.createDate }
                    <input type="hidden" value="${ board.createDate }" name="createDate">
                    </td>
                    <td style="width: 130px; padding: 13px 0 13px 20px;
                    background-color: #f7f5f8;
                    border-top: 1px solid #f4f4f4;
                    text-align: left;
                    font-weight: bold;
                    ">조회수</td>
                    <td>${ board.boardCount }
                    <input type="hidden" value="${ board.boardCount }" name="boardCount">
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <% pageContext.setAttribute("newLineChar", "\r\n"); %>
        <div class="page_eventview">
            <c:forEach var="list" items="${ imageList }">
            <img src="${ contextPath }/resources/buploadFiles/${list.changeName}" alt=""
            width="100%">
            <input type="hidden" value="${ list.originName }" name="originName">
           	<input type="hidden" value="${ list.changeName }" name="changeName">
            </c:forEach>
           <p>${fn:replace(board.boardContent, newLineChar, "<br>") }</p>
           <input type="hidden" value="${ board.boardContent }" name="boardContent">
           
        </div>
        <br>

        <table width="100%" style="table-layout:fixed" cellpadding="0" cellspacing="0">
            <tbody><tr>
            <td align="center" style="padding-top:10px;">
            <table width="100%">
            <tbody><tr>
            <td align="right">
            <c:url var="elist" value="elist.bo">
			<c:param name="page" value="${ page }"/>
			</c:url>
            <a href="${ elist }"><button class="uk-button uk-button-default" id="listBtn">목록</button></a>
            </td>
            </tr>
            </tbody></table>
            </td>
            </tr>
            </tbody>
        </table>
<!-- 
        <div class="xans-element- event-board event-board-movement-1002 event-board-movement event-board-1002 "><ul>
            <li class="prev ">
            <strong>이전글</strong><a href="/board/free/read.html?no=27121&amp;board_no=1&amp;page="></a><a href="view.php?id=notice&amp;no=55">포켓몬빵을 잡아라 어쩌구저쩌구 구구절절</a>
            </li>
            <li class="next ">
            <strong>다음글</strong><a href="/board/free/read.html?no=22443&amp;board_no=1&amp;page="></a><a href="view.php?id=notice&amp;no=67">로제떡볶이 최강브랜드는 어디? 어쩌구저쩌구 구구절절</a>
            </li>
            </ul>
        </div> -->
    </div>
        
        
        
</body>
</html>