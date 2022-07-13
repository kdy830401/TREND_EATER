<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />


<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<style>
    body {
  background: none;
  color: #424242;
  font-size: 14px;
  font-family: 'Roboto', sans-serif;
}

h3,
h4,
p {
  margin: 0;
}

.center {
  text-align: center;
}
/* button { */
/*   cursor: pointer; */
/*   border: none; */
/*   background: #fff; */
/*   box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); */
/*   padding: 15px 30px; */
/*   position: absolute;  */
/*   bottom: 80%; */
/*   left: 0; */
/* } */
.app {
  display: flex;
  flex-flow: column;
  margin: 50px auto 0;
  width: 300px;
  opacity: 0;
  transform: scale(0);
  transform-origin: top center;
  transition: all 0.8s cubic-bezier(.71, 0, .61, 1.36) 1.8s;
}

.app > * {
  /* don't use universal selectors at real world project. its known to be slow */
  background: #fff;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

header {
  border-radius: 4px 4px 0 0;
}

.cust-num {
  color: #757575;
  display: inline-flex;
  font-size: 12px;
  font-weight: 500;
  line-height: 1.7;
  padding: 15px 30px;
}

.cust-num svg {
  margin-right: 15px;
}

.cust-info {
  margin: 15px 0;
  padding: 0 30px;
  position: relative;
  opacity: 0;
  transform: translateY(20px);
  transition: all 0.5s ease 2s;
  overflow: hidden;
}

.cust-info h3 {
  font-weight: 400;
}

.cust-info p {
  color: #757575;
  font-size: 12px;
  padding: 10px 0 0;
}

.cust-info:before {
  content: '';
  position: absolute;
  height: 100%;
  width: 6px;
  background: rgb(0, 157, 223);
  left: -20px;
  transition: all 0.5s ease 2s;
}

ul {
  margin: 0;
  padding-left: 0;
}

li {
  color: #757575;
  font-size: 12px;
  list-style: none;
  padding: 15px 0;
  opacity: 0;
  transform: translateX(-20px);
  transition: all 0.8s ease;
}

li:nth-child(1) {
  transition-delay: 0.6s;
}

li:nth-child(2) {
  transition-delay: 0.4s;
}

li:nth-child(3) {
  transition-delay: 0.2s;
}

li:not(:last-child) {
  border-bottom: 1px dashed #ccc;
  margin-bottom: 5px;
}

li i {
  margin-right: 15px;
  font-style: normal;
}

li span {
  color: #424242;
  float: right;
  font-weight: 500;
}

.total {
  border-top: 2px solid #FFC107;
  padding-top: 15px;
  margin: 0 0 15px;
  font-size: 14px;
  text-transform: uppercase;
  font-weight: 700;
  position: relative;
  left: -50px;
  opacity: 0;
  transform: translateY(10px);
  transition: left 0.8s ease, opacity 0.5s ease, transform 0s ease 1.5s;
}
.total p {
	opacity: 0;
	transform: translateY(10px);
	transition: all 0s ease 1.5s;
}
.total span {
  float: right;
}

main {
  border-bottom: 2px dotted #F06292;
  border-radius: 0 0 4px 4px;
  padding: 0 30px;
  position: relative;
  transform: perspective(1000px) rotateX(-90deg);
  transform-origin: top;
  transition: all 0.5s ease 1.7s;
}

main h3 {
  font-size: 18px;
  font-weight: 500;
  opacity: 0;
  margin: 15px 0;
  transform: translateY(10px);
  transition: all 0.5s ease 0.8s;
}

main:before {
  content: '';
  position: absolute;
  top: -2px;
  width: 100%;
  height: 2px;
  left: 0;
  background: #fff;
}

footer {
  border-radius: 4px;
  padding: 15px 30px;
  transform: perspective(1000px) rotateX(-90deg);
  transform-origin: top;
  transition: all 0.5s cubic-bezier(.42, -1.04, .79, 1) 1.1s;
}

footer svg {
  fill: #757575;
}

.active {
  opacity: 1;
  transform: scale(1);
  transition: all 0.8s ease;
}

.active .cust-info {
  opacity: 1;
  transform: translateY(0);
  transition: all 1s ease 0.5s;
}

.active .cust-info:before {
  left: 0;
  transition: all 1s ease 0.7s;
}

.active main {
  transform: perspective(1000px) rotateX(0deg);
  transition: all 0.5s ease 0.5s;
}

.active main h3 {
  opacity: 1;
  transform: translateY(0);
  transition: all 0.8s ease 0.8s;
}

.active li {
  opacity: 1;
  transform: translateX(0px);
  transition: all 0.5s ease;
}

.active li:nth-child(1) {
  transition-delay: 1s;
}

.active li:nth-child(2) {
  transition-delay: 1.4s;
}

.active li:nth-child(3) {
  transition-delay: 1.8s;
}

.active .total {
  opacity: 1;
  transform: translateY(0);
  left: 0;
  transition: transform 0.8s ease 2s, opacity 0.8s ease 2s;
}
.active .total p {
	opacity: 1;
	transform: translateY(0);
	transition: all 0.8s ease 2.3s;
}
.active footer {
  transform: perspective(1000px) rotateX(0deg);
  transition: all 0.5s ease 0.9s;
}
</style>   
</head>
<body>
<c:import url="../common/menubar.jsp"/>	
<div class="uk-container">  
<div class="app active">
  <header>
    <div class="cust-num">
      <svg height="42" width="42" viewBox="0 0 64 64">
<path class="path1" fill="rgb(0, 157, 223)" d="M58.125 19.288c-2.987 13.262-12.212 20.262-26.75 20.262h-4.837l-3.363 21.35h-4.050l-0.212 1.375c-0.137 0.913 0.563 1.725 1.475 1.725h10.35c1.225 0 2.263-0.888 2.462-2.1l0.1-0.525 1.95-12.362 0.125-0.675c0.188-1.212 1.237-2.1 2.462-2.1h1.538c10.025 0 17.875-4.075 20.175-15.85 0.862-4.475 0.538-8.275-1.425-11.1z"></path>
<path fill="rgb(0, 46, 135)" class="path2" d="M51.938 4.825c-2.962-3.375-8.325-4.825-15.175-4.825h-19.887c-1.4 0-2.6 1.012-2.813 2.4l-8.287 52.525c-0.162 1.038 0.638 1.975 1.688 1.975h12.287l3.087-19.563-0.1 0.612c0.212-1.388 1.4-2.4 2.8-2.4h5.837c11.462 0 20.438-4.65 23.063-18.125 0.075-0.4 0.15-0.788 0.2-1.163 0.775-4.975 0-8.375-2.7-11.438z"></path>
</svg>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${ now }" pattern="yyyyMMdd" var="now2" />
      <p>${ now } <br>of-116</p>
    </div>

    <div class="cust-info">
    <c:set var="total" value="0"/>
         <c:forEach var='i' items='${carts}'>
            <c:set var="total" value="${total + (i.productAmount * i.productPrice) }"/>            				
     </c:forEach>
      <h3>고객님</h3>
      <p> 총 ${fn:length(carts)} 개의 품목을 결제하셨습니다</p>
    </div>

  </header>

  <main>
    <h3 class="center">Cart :</h3>
    <ul>
      <c:forEach var="c" items="${ carts }" varStatus="status">
      <li><i>item</i> ${ c.productName } * ${c.productAmount } <span>₩ ${(c.productPrice) * (c.productAmount)} </span></li>
      </c:forEach>
    </ul>
    <div class="total">
      <p>Total <span>₩ ${ total }</span></p>
    </div>
  </main>
 
  <footer>

    <svg x="0px" y="0px" viewBox="0 0 1001.8 261" xml:space="preserve">
<rect x="0.2" y="1" class="st0" width="30.8" height="216.7"/>
<rect x="93.8" y="1" class="st0" width="31.3" height="216.7"/>
<rect x="156.3" y="1" class="st0" width="31.3" height="216.7"/>
<rect x="250" y="1" class="st0" width="31.3" height="216.7"/>
<rect x="375" y="1" class="st0" width="31.3" height="216.7"/>
<rect x="468.8" y="1" class="st0" width="31.3" height="216.7"/>
<rect x="312.5" y="1" class="st0" width="15.6" height="216.7"/>
<rect x="218.8" y="1" class="st0" width="15.6" height="216.7"/>
<rect x="421.9" y="1" class="st0" width="15.6" height="216.7"/>
<rect y="239.3" class="st0" width="31.3" height="21.7"/>
<rect x="93.8" y="239.3" class="st0" width="31.3" height="21.7"/>
<rect x="156.3" y="239.3" class="st0" width="31.3" height="21.7"/>
<rect x="312.5" y="239.3" class="st0" width="31.3" height="21.7"/>
<rect x="468.8" y="239.3" class="st0" width="31.3" height="21.7"/>
<rect x="375" y="239.3" class="st0" width="62.5" height="21.7"/>
<rect x="218.8" y="239.3" class="st0" width="62.5" height="21.7"/>
<path class="st0" d="M524.1,0h40.1v217.5h-40.1V0z M595.5,0h31.3v217.5h-31.3V0z M658,0h31.3v217.5H658V0z M751.8,0H783v217.5h-31.3
	V0z M876.8,0H908v217.5h-31.3V0z M970.5,0h31.3v217.5h-31.3V0z M814.3,0h15.6v217.5h-15.6V0z M720.5,0h15.6v217.5h-15.6V0z M923.6,0
	h15.6v217.5h-15.6V0z M529.8,239.3H561V261h-31.3V239.3z M595.5,239.3h31.3V261h-31.3V239.3z M658,239.3h31.3V261H658V239.3z
	 M814.3,239.3h31.3V261h-31.3V239.3z M970.5,239.3h31.3V261h-31.3V239.3z M876.8,239.3h62.5V261h-62.5V239.3z M720.5,239.3H783V261
	h-62.5V239.3z"/>
<rect x="33.9" y="0.4" class="st0" width="8.8" height="216.7"/>
<rect x="74.3" y="2" class="st0" width="14.4" height="216.7"/>
<rect x="47" y="1.4" class="st0" width="10.3" height="216.7"/>
</svg>

  </footer>
</div>  
<div class="uk-margin uk-text-center">
	<a class="uk-button uk-button-default" href="home.do">	메인으로 </a>
	<button class="uk-button uk-button-default">CLOSE</button>
</div>
<script>
    var app = document.querySelector('.app');
var button = document.querySelector('button');
button.addEventListener('click', function(e) {
  e.preventDefault();
  app.classList.toggle('active');
  app.classList.contains('active') ? this.innerHTML = "CLOSE" : this.innerHTML = "OPEN";
})
</script>
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
<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-screenfull.js"></script> --%>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-scroll-to.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ui-toggle-class.js"></script>

	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/app.js"></script>

	<!-- ajax -->
<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/libs/jquery/jquery-pjax/jquery.pjax.js"></script> --%>
	<script src="${ pageContext.servletContext.contextPath }/resources/scripts/ajax.js"></script>
	<!-- endbuild -->		
	
</body>
</html>