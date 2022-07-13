<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>

<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

    <!-- CSS보다 상위에 둬야함 -->
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/board/reset.css">
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/footer.css">


</head>
<body>
    
    <br>

<div class="footerMain">
    <!-- footerTop  -->
    <div class="footerTop">
        <div class="footerLeft">
            <h2>고객행복센터</h2>
            <div class="callCenter">
                <div>
                    <span>1644-1107</span></div>

                <div class="uk-margin-left">
                    <p class="footerLeftP">365고객센터</p>
                    <p class="footerLeftP">오전7시-오후7시</p>
                </div>
            </div>
            <div class="kakaotalkQuestion">
                <div>
                    <button>카카오톡 문의</button>
                </div>

                <div class="uk-margin-left">
                    <p class="footerLeftP">365고객센터</p>
                    <p class="footerLeftP">오전7시-오후7시</p>
                </div>    
            </div>
            <div class="personalQuestion">
                <div>
                    <button> 1:1 문의</button>
                </div>

                <div class="uk-margin-left">
                    <p class="footerLeftP">24시간 접수 가능</p>
                    <p class="footerLeftP">고객센터 운영시간에 순차적으로 답변해드립니다.</p>
                </div>   
            </div>
            <div class="bigOrderQuestion">
                <div>
                    <button>대량주문 문의</button></div>

                <div class="uk-margin-left">
                    <p class="footerLeftP"> </p>
                    <p class="footerLeftP">비회원의 경우 메일로 문의바랍니다</p>
                </div>    
            </div>
              
            
        </div>
        <div class="footerRight">
            <div class="footerRightTop"> 
                <ul>
                    <li style="width: 140px;">TREND_EATER소개</li>
                    <li>인재채용</li>
                    <li>이용약관</li>
                    <li style="width: 140px;">개인정보처리방침</li>
                    <li>이용안내</li>
                </ul> <br>
            </div>
            <div class="footerRightMiddle">   
                <span>법인명 (상호) : 주식회사 TREND_EATER <span class="bar">I</span> 사업자등록번호 : 261-81-23567</span> <br>
                <span>통신판매업 : 제 2018-서울강남-01646 호 <span class="bar">I</span> 개인정보보호책임자 : 이용준</span><br>
                <span>주소 : 서울특별시 강남구 테헤란로 133, 18층(역삼동) <span class="bar">I</span> 대표이사 : 박춘희</span><br>
                시식문의 : <a href="https://docs.google.com/forms/d/e/1FAIpQLScLB7YkGJwNRzpGpp0gbR1i4C1_uvTEFj43SFfJ_XEadTn3gQ/viewform?usp=sf_link" target="_blank" class="link">시식 문의하기</a> <span class="bar">I</span> 마케팅제휴 : <a href="mailto:business@TRENDEATERcorp.com" class="link">business@TRENDEATERcorp.com</a><br>
                팩스: 070 - 7500 - 6098 <span class="bar">I</span> 이메일 : <a href="mailto:help@TRENDEATERcorp.com" class="link">help@TRENDEATERcorp.com</a><br>
                대량주문 문의 : <a href="mailto:TRENDEATERgift@TRENDEATERcorp.com" class="link">TRENDEATERgift@TRENDEATERcorp.com</a><br>
            </div>      

            <div class="footerRightSNS uk-inline">
                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/ico_sns1_instagram.webp">
                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/ico_sns2_facebook.webp">
                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/ico_sns3_naverBlog.webp">
                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/ico_sns4_naver.webp">
                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/ico_sns5_youtube.webp">
            </div>
        </div>
    </div>


    <!-- footerMiddle -->
    <div class="footerMiddle">

        <div class="authentication1 m-r-lg">
            <div>
                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/icons_imsm.webp" alt="isms 로고" >
            </div>  
            <p>

                [인증범위] TREND EATER 서비스 개발·운영<br>

                (심사받지 않은 물리적 인프라 제외)<br>
                [유효기간] 2022.01.19 ~ 2025.01.18
            </p>
        </div>

        <div class="authentication2 m-l-lg">
            <div>
                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/icons_eprivacy.webp" alt="eprivacy plus 로고" class="logo">
            </div>
            <p>
            개인정보보호 우수 웹사이트 ·<br>
            개인정보처리시스템 인증 (ePRIVACY PLUS)
            </p>  
        </div>

        <div class="authentication3 m-l-lg">
            <div class="iconPayments">
                <img src="${ pageContext.servletContext.contextPath }/resources/img/icons/icons_payments.webp" alt="payments 로고" style="width:fit-content">
            </div>
            <p>
            고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한
            토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수 있습니다.
            </p>
        </div>

    </div>
    <!-- footerBottom -->
    <div class="footerBottom">
        <p>TREND EATER에서 판매되는 상품 중에는 TREND EATER에 시식 요청받은 제품의 문제는 해당 제조에게 있습니다.</p>
        <p>시식 상품의 경우 TREND EATER는 통신판매중개자로서 통신판매의 당사자가 아닙니다. TREND EATER는 해당 상품의 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.</p><br>
        <em>©TREND EATER CORP. ALL RIGHTS RESERVED</em>
    </div>   
</div>



</body>
</html>