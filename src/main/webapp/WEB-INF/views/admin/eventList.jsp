<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<!-- UIkit CSS -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />
<!-- UIkit JS -->
<script
   src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

  <!-- for ios 7 style, multi-resolution icon of 152x152 -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-barstyle" content="black-translucent">
  <link rel="apple-touch-icon" href="../assets/images/logo.png">
  <meta name="apple-mobile-web-app-title" content="Flatkit">
  <!-- for Chrome on Android, multi-resolution icon of 196x196 -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="shortcut icon" sizes="196x196" href="../assets/images/logo.png">
  
  <!-- style -->
  <link rel="stylesheet" href="../assets/animate.css/animate.min.css" type="text/css" />
  <link rel="stylesheet" href="../assets/glyphicons/glyphicons.css" type="text/css" />
  <link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="../assets/material-design-icons/material-design-icons.css" type="text/css" />

  <link rel="stylesheet" href="../assets/bootstrap/dist/css/bootstrap.min.css" type="text/css" />
  <!-- build:css ../assets/styles/app.min.css -->
  <link rel="stylesheet" href="../assets/styles/app.css" type="text/css" />
  <!-- endbuild -->
  <link rel="stylesheet" href="../assets/styles/font.css" type="text/css" />
 <style>
body {
   background: #F3F5F7;
   font-family: noto sans;
}

.uk-container {
   margin-top: 120px;
   background: white;
   padding: 80px;
}

#review-header {
   margin-bottom: 30px;
   padding: 15px 15px;
   /*  상자내부 간격 : 위아래 5px, 오른쪽왼쪽 15px  */
   font-size: 20px;
   font-weight:bold;
}

#review-count {
   font-size: 15px;
   color: rgba(255, 99, 132, 0.6);
}

/* 셀렉트 박스 */
.bo_w_select {
    width: 120px; /* 가로 사이즈 */
    padding: 9px 10px 10px; /* 내부여백 */
    border: 1px solid #ddd;
    background-size: 30px; /* 화살표 크기 */
    box-sizing: border-box;
    font-size: 12px;
    color: #000;
    outline:none;
}
.bo_w_select:hover {border: 1px solid #aaa;} /* 마우스오버 */

#table-title{
background:#F3F5F7;
margin: 10px;
}
 </style>
</head>
<body>

<c:import url="adminMenubar.jsp" />
<!-- ############ PAGE START 여기에 내용 넣어주세요 -->
   <div class="uk-container uk-container-midium" id="container">
   <h1 id="review-header">
      전체 이벤트 목록<span id="review-count"> (${ pi.listCount })</span>
   </h1>
   
   <select class="bo_w_select">
    <option value="">전체</option>
    <option value="">이벤트</option>
    <option value="">투표</option>
</select>
   <span class="uk-margin">
       <form class="uk-search uk-search-default">
           <a href="" class="uk-search-icon-flip" uk-search-icon></a>
           <input class="uk-search-input" type="search" placeholder="검색">
       </form>
   </span>
   
   <table class="uk-table uk-table-justify uk-table-divider">
    <thead>
        <tr id="table-title">
           <th></th>
            <th class="uk-width-small">게시물 번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>이벤트 타입</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="b" items="${ list }">
            <tr>
            <td></td>
                <td>${ b.boardNo }</td>
                <td>${ b.boardTitle }</td>
                <td>${ b.adminId }</td>
                <td>${ b.createDate }</td>
                <td>어떻게불러와 ㅅㅂ</td>
                <td><button class="uk-button-small uk-button-default" type="button">수정</button></td>
                <td><button class="uk-button-small uk-button-default" type="button">삭제</button></td>
            </tr>
        </c:forEach>
    </tbody>
    <tfoot>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>    
            <td><button class="uk-button-small uk-button-default" type="button" onclick="location.href='einsertView.bo'">글작성</button></td>>
        </tr>>
    </tfoot>
</table>

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
  <!-- / -->

  <!-- theme switcher -->

<!-- ############ LAYOUT END-->

  </div>
<!-- build:js scripts/app.html.js -->
<!-- jQuery -->
  <script src="../libs/jquery/jquery/dist/jquery.js"></script>
<!-- Bootstrap -->
  <script src="../libs/jquery/tether/dist/js/tether.min.js"></script>
  <script src="../libs/jquery/bootstrap/dist/js/bootstrap.js"></script>
<!-- core -->
  <script src="../libs/jquery/underscore/underscore-min.js"></script>
  <script src="../libs/jquery/jQuery-Storage-API/jquery.storageapi.min.js"></script>
  <script src="../libs/jquery/PACE/pace.min.js"></script>

  <script src="scripts/config.lazyload.js"></script>

  <script src="scripts/palette.js"></script>
  <script src="scripts/ui-load.js"></script>
  <script src="scripts/ui-jp.js"></script>
  <script src="scripts/ui-include.js"></script>
  <script src="scripts/ui-device.js"></script>
  <script src="scripts/ui-form.js"></script>
  <script src="scripts/ui-nav.js"></script>
  <script src="scripts/ui-screenfull.js"></script>
  <script src="scripts/ui-scroll-to.js"></script>
  <script src="scripts/ui-toggle-class.js"></script>

  <script src="scripts/app.js"></script>

  <!-- ajax -->
  <script src="../libs/jquery/jquery-pjax/jquery.pjax.js"></script>
  <script src="scripts/ajax.js"></script>
<!-- endbuild -->
</body>
</html>