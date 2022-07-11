<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>TREND EATER</title>
  <meta name="description" content="Admin, Dashboard, Bootstrap, Bootstrap 4, Angular, AngularJS" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
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
  <div class="app" id="app">

<!-- ############ LAYOUT START-->

  <!-- aside -->
  <div id="aside" class="app-aside modal nav-dropdown">
  	<!-- fluid app aside -->
    <div class="left navside dark dk" data-layout="column">
  	  <div class="navbar no-radius">
        <!-- brand -->
        <a class="navbar-brand">
        	<div ui-include="'../assets/images/logo.svg'"></div>
        	<img src="../assets/images/logo.png" alt="." class="hide">
        	<div class="clear hidden-folded p-x"><span style="text-align: center;">TREND EATER</span></div>
        </a>
        <!-- / brand -->
      </div>
      <div class="hide-scroll" data-flex>
          <nav class="scroll nav-light">
              <div class="b-t"><br>
         	<div style="text-align: center;">
        	      <img src="../assets/images/a0.jpg" alt="..." class="w-40 img-circle">
        	</div>
        <div class="nav-fold">
        	    <div class="clear hidden-folded p-x">
        	      <span class="block _500" style="text-align: center;">Jean Reyes</span>
        	      <small class="block text-muted" style="text-align: center;">관리자님 환영합니다.</small>
        	    </div>
        </div>
      </div>
              
              
              <ul class="nav" ui-nav>
                <li class="nav-header hidden-folded">
                  <small class="text-muted">Admin</small>
                </li>
                
                <li>
                  <a href="#" >
                    <span class="nav-text">관리자 등록</span>
                  </a>
                </li>
                <li>
                  <a href="#" >
                    <span class="nav-text">회원 관리</span>
                  </a>
                </li>
            
                <li>
                  <a>
                    <span class="nav-caret">
                      <i class="fa fa-caret-down"></i>
                    </span>
                    <span class="nav-text">게시판 관리</span>
                  </a>
                  <ul class="nav-sub">
                    <li>
                      <a href="#" >
                        <span class="nav-text">제품/리뷰 게시판</span>
                      </a>
                    </li>
                    <li>
                      <a href="#" >
                        <span class="nav-text">상품 등록 요청 관리</span>
                      </a>
                    </li>
                    <li>
                      <a href="#" >
                        <span class="nav-text">시식 게시판</span>
                      </a>
                    </li>
                    <li>
                      <a href="#" >
                        <span class="nav-text">시식 신청 리스트</span>
                      </a>
                    </li>
                    <li>
                      <a href="#" >
                        <span class="nav-text">이벤트 게시판</span>
                      </a>
                    </li>
                    <li>
                      <a href="#" >
                        <span class="nav-text">문의사항 게시판</span>
                      </a>
                    </li>
                  </ul>
                </li>
            
            	<li>
                  <a href="#" >
                    <span class="nav-text">주문 관리</span>
                  </a>
                </li>
                
                <li>
                  <a href="#" >
                    <span class="nav-text">반품 관리</span>
                  </a>
                </li>
                
                <li>
                  <a href="#" >
                    <span class="nav-text">상품 관리</span>
                  </a>
                </li>
                
                <li>
                  <a href="#" >
                    <span class="nav-text">신고 리뷰 현황</span>
                  </a>
                </li>
            
                
                <li class="nav-header hidden-folded">
                  <small class="text-muted">Help</small>
                </li>
                
                <li class="hidden-folded" >
                  <a href="#" >
                    <span class="nav-text">Documents</span>
                  </a>
                </li>
            
              </ul>
          </nav>
      </div>
      
    </div>
  </div>
  <!-- / -->
  
  <!-- content -->
  <!-- 상단 시작 -->
  <div id="content" class="app-content box-shadow-z0" role="main">
    <div class="app-header white box-shadow">
        <div class="navbar">
             <span style="text-align: right; margin-top: auto; margin-bottom: auto;">로그아웃</span>
        </div>
       
    </div>
  <!-- 상단 끝  -->
  <!-- 하단 시작 -->
    <div class="app-footer">
      <div class="p-2 text-xs">
        <div class="pull-right text-muted py-1">
          &copy; Copyright <strong>TREND EATER</strong> <span class="hidden-xs-down">- Built with Love v1.1.3</span>
          <a ui-scroll-to="content"><i class="fa fa-long-arrow-up p-x-sm"></i></a>
        </div>
        <div class="nav">
          <a class="nav-link" href="../">About</a>
          <a class="nav-link" href="http://themeforest.net/user/flatfull/portfolio?ref=flatfull">Get it</a>
        </div>
      </div>
    </div>
    <div ui-view class="app-body" id="view">
  <!-- 하단 끝 -->

<!-- ############ PAGE START 여기에 내용 넣어주세요 -->
	<div class="uk-container uk-container-midium" id="container">
	<h1 id="review-header">
		신고된 리뷰 목록<span id="review-count"> (234)</span>
	</h1>
	
	<select class="bo_w_select">
    <option value="">전체</option>
    <option value="">리뷰 번호</option>
    <option value="">제품 명</option>
    <option value="">작성자</option>
    <option value="">신고자</option>
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
            <th class="uk-width-small">리뷰 번호</th>
            <th>제품 명</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>신고자</th>
            <th>신고일</th>
            <th>상세 보기</th>
            <th>삭제</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        	<td></td>
            <td>11</td>
            <td>BBQ 황금올리브</td>
            <td>이용준</td>
            <td>2022.06.22</td>
            <td>이하푸</td>
            <td>2022.06.24</td>
            <td><button class="uk-button-small uk-button-default" type="button">보기</button></td>
            <td><button class="uk-button-small uk-button-default" type="button">삭제</button></td>
        </tr>
        <tr>
        	<td></td>
            <td>11</td>
            <td>BBQ 황금올리브</td>
            <td>이용준</td>
            <td>2022.06.22</td>
            <td>이하푸</td>
            <td>2022.06.24</td>
            <td><button class="uk-button-small uk-button-default" type="button">보기</button></td>
            <td><button class="uk-button-small uk-button-default" type="button">삭제</button></td>
        </tr>
        <tr>
        	<td></td>
            <td>11</td>
            <td>BBQ 황금올리브</td>
            <td>이용준</td>
            <td>2022.06.22</td>
            <td>이하푸</td>
            <td>2022.06.24</td>
            <td><button class="uk-button-small uk-button-default" type="button">보기</button></td>
            <td><button class="uk-button-small uk-button-default" type="button">삭제</button></td>
        </tr>
        <tr>
        	<td></td>
            <td>11</td>
            <td>BBQ 황금올리브</td>
            <td>이용준</td>
            <td>2022.06.22</td>
            <td>이하푸</td>
            <td>2022.06.24</td>
            <td><button class="uk-button-small uk-button-default" type="button">보기</button></td>
            <td><button class="uk-button-small uk-button-default" type="button">삭제</button></td>
        </tr>
        <tr>
        	<td></td>
            <td>11</td>
            <td>BBQ 황금올리브</td>
            <td>이용준</td>
            <td>2022.06.22</td>
            <td>이하푸</td>
            <td>2022.06.24</td>
            <td><button class="uk-button-small uk-button-default" type="button">보기</button></td>
            <td><button class="uk-button-small uk-button-default" type="button">삭제</button></td>
        </tr>
    </tbody>
</table>

<!-- 페이지네이션 -->
		<ul class="uk-pagination uk-flex-center" uk-margin>
		    <li><a href="#"><span uk-pagination-previous></span></a></li>
		    <li class="uk-active"><span>1</span></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li><a href="#"><span uk-pagination-next></span></a></li>
		</ul>
	</div>
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
