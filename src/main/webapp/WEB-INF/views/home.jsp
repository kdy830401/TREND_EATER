<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />
<script src="${ contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<style>
.uk-container img{
  
  width: 100%;
  height: 100%;
  
}

* {
	 font-family: "Noto Sans KR", sans-serif !important;
	 word-break: keep-all;
}
.banner{
	max-width:100%;
	 height: 100%;
/*  	object-fit: cover; */
}
.uk-overlay-primary{
	background:rgba(34,34,34,.3) !important;
}

.product{
	width:270px;
	height:348px !important;
}

</style> 
<html>
<head>
	<title>Home</title>
</head>
<body>
	<c:import url="common/menubar.jsp"/>
	<div class="uk-container">
		<div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" uk-slideshow="min-height: 300; max-height: 300; animation: push">

		    <ul class="uk-slideshow-items">
		    	  <c:forEach var="list" items="${eIList}">
		    	   <li>
                	<c:url var="edetail" value="edetail.bo">
                		<c:param name="eNo" value="${list.identifyNo}"/>
                	</c:url>
                	<div class="uk-position-cover uk-slideshow-parallax="scale: 1.2,1.2,1">
		                <img class="banner" src="${ contextPath }/resources/buploadFiles/${list.changeName}" alt="" onclick="location.href='${edetail}'" uk-cover>
		            </div>
                    
                </li>
                </c:forEach>
            </ul>
            <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
            <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
        </div>

        <br><br><br><br><br>
        
        <h3 class="uk-heading-bullet uk-h3 uk-text-center uk-text-bold">new 신상품 새로나왔어요</h3>	

        <br><br>
        <div uk-slider>

            <div class="uk-position-relative">
        
                <div class="uk-slider-container uk-light ">
                	
                    <ul class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m uk-grid">
                        <c:forEach var="pIList" items="${pIList}" varStatus="status">
                         <c:url var="prdetail" value="prbdetail.bo">
                		<c:param name="pno" value="${pList[status.index].productNo}"/>
                		</c:url> 
                        <li class="uk-transition-toggle" tabindex="0">
                        <div class="uk-inline">
                            <img class="product" src="${ contextPath }/resources/productImgUploadFiles/${pIList.changeName}" width="400" height="600" alt="" onclick="location.href='${prdetail}'">
                            <div class="uk-overlay-primary uk-position-cover"></div>
                            <div class="uk-overlay uk-position-bottom uk-light"><h1>${pList[status.index].productName}</h1></div>
                        </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
        
                <div class="uk-hidden@s uk-light">
                    <a class="uk-position-center-left uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                    <a class="uk-position-center-right uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
                </div>
        
                <div class="uk-visible@s">
                    <a class="uk-position-center-left-out uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                    <a class="uk-position-center-right-out uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
                </div>
        
            </div>
        
            <!-- <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul> -->
        
        </div>
        <br><br><br><br><br><br>
        <h3 class="uk-heading-bullet uk-h3 uk-text-center uk-text-bold">HOT 평점이 가장 높은 상품 </h3>	
        <br><br>
        <div uk-slider>

            <div class="uk-position-relative">
        
                <div class="uk-slider-container uk-light ">
                    <ul class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m uk-grid">
                        <c:forEach var="bList" items="${bList}" varStatus="status">
                        <li>
                         <c:url var="prdetail2" value="prbdetail.bo">
                		<c:param name="pno" value="${bProducts[status.index].productNo}"/>
                		</c:url> 
                		<div class="uk-inline">
                            <img class="product" src="${ contextPath }/resources/productImgUploadFiles/${bList.changeName}" alt="" onclick="location.href='${prdetail2}'">
                            <div class="uk-overlay-primary uk-position-cover"></div>
                            <div class="uk-overlay uk-position-bottom uk-light"><h1>${bProducts[status.index].productName}</h1></div>
                         </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
        
                <div class="uk-hidden@s uk-light">
                    <a class="uk-position-center-left uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                    <a class="uk-position-center-right uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
                </div>
        
                <div class="uk-visible@s">
                    <a class="uk-position-center-left-out uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                    <a class="uk-position-center-right-out uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
                </div>
        
            </div>
        
            <!-- <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul> -->
        
        </div>
        <br><br><br><br><br><br>
         <h3 class="uk-heading-bullet uk-h3 uk-text-center uk-text-bold">Eater's Pick Best Review </h3>	
        <br><br>
        <div uk-slider>

            <div class="uk-position-relative">
        
                <div class="uk-slider-container uk-light ">
                    <ul class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m uk-grid">
                        <li>
                            <img src="https://img-cf.kurly.com/shop/data/goods/1619661214577l0.jpg" width="400" height="600" alt="">
                            <div class="uk-position-center uk-panel"><h1>1</h1></div>
                        </li>
                        <li>
                            <img src="https://img-cf.kurly.com/shop/data/goods/163944357879l0.jpg" width="400" height="600" alt="">
                            <div class="uk-position-center uk-panel"><h1>2</h1></div>
                        </li>
                        <li>
                            <img src="https://img-cf.kurly.com/shop/data/goods/1637923254757l0.jpg" width="400" height="600" alt="">
                            <div class="uk-position-center uk-panel"><h1>3</h1></div>
                        </li>
                        <li>
                            <img src="https://img-cf.kurly.com/shop/data/goods/1465441159271l0.jpg" width="400" height="600" alt="">
                            <div class="uk-position-center uk-panel"><h1>4</h1></div>
                        </li>
                        <li>
                            <img src="https://img-cf.kurly.com/shop/data/goods/16393772232l0.jpg" width="400" height="600" alt="">
                            <div class="uk-position-center uk-panel"><h1>5</h1></div>
                        </li>
                        <li>
                            <img src="https://img-cf.kurly.com/shop/data/goods/1616051159263l0.jpg" width="400" height="600" alt="">
                            <div class="uk-position-center uk-panel"><h1>6</h1></div>
                        </li>
                        <li>
                            <img src="https://img-cf.kurly.com/shop/data/goods/1622450417295l0.jpg" width="400" height="600" alt="">
                            <div class="uk-position-center uk-panel"><h1>7</h1></div>
                        </li>
                        <li>
                            <img src="https://img-cf.kurly.com/shop/data/goods/big/201508/417_shop1_389287.jpg" width="400" height="600" alt="">
                            <div class="uk-position-center uk-panel"><h1>8</h1></div>
                        </li>
                        <li>
                            <img src="https://img-cf.kurly.com/shop/data/goods/big/201512/706_shop1_196633.jpg" width="400" height="600" alt="">
                            <div class="uk-position-center uk-panel"><h1>9</h1></div>
                        </li>
                        <li>
                            <img src="https://img-cf.kurly.com/shop/data/goods/1491195959158l0.jpg" width="400" height="600" alt="">
                            <div class="uk-position-center uk-panel"><h1>10</h1></div>
                        </li>
                    </ul>
                </div>
        
                <div class="uk-hidden@s uk-light">
                    <a class="uk-position-center-left uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                    <a class="uk-position-center-right uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
                </div>
        
                <div class="uk-visible@s">
                    <a class="uk-position-center-left-out uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                    <a class="uk-position-center-right-out uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
                </div>
        
            </div>
        
            <!-- <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul> -->
        
        </div>
        <br><br><br><br><br><br>

    </div>
	
	<c:import url="common/footer.jsp" />	
</body>
</html>
