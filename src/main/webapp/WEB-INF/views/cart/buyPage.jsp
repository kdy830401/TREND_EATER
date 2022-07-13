<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TREND EATER</title>
<!-- CSS Link  -->
<link href="buyPage.css" rel="stylesheet">
<!-- JQuery 최신버젼 CDN 링크  -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
    <div class="tit_page">
        <h2 class="tit">주문서</h2>
    </div>

    <div id="main">
        <div id="content">
        
        <div class="user_form">
        <script id="delivery"></script>
        
       
       <hr>
       <div>
       	CART NOs :
       	${ cartList}
		
		<button type="button" onclick="'paymentNoti.jsp'">결제 다 되면</button>
       </div>
       <hr>
        
        <!-- 결제 목록 -->
        <h2 class="tit_section fst">주문상품</h2>
        <div id="itemList" class="page_aticle order_goodslist"><div class="info_product"><a class="btn" href="#none"><span class="screen_out">펼침 / 닫힘</span></a>
          <div class="short_info">[닥터아토] 알로에베라 수딩젤 150ml외 <span class="num">3개</span>상품을 주문합니다.</div></div>
          <ul class="list_product">
          
          	<c:forEach var='i' items='${carts}'>
	            <li>
	            
	              <div class="thumb">
 	              	<c:forEach var='a' items='${images}'>
	              		<c:if test="${i.productNo == a.productNo }">
	              			<img src="resources/product_upload_images/${a.changeName}" width="200px" height="150px" alt="상품이미지">
	              		</c:if>
	              	</c:forEach> 
	              </div>
	              <div class="name">
	                <div class="inner_name">${i.productName}</div>
	              </div>
	              <div class="ea">${i.productAmount }개</div>
	              <div class="info_price">
	                <span class="num">
	                  <span class="price">${i.productAmount * i.productPrice }원</span>
	                  <!-- <span class="cost"></span> -->
	                </span>
	              </div>
	            </li>
            </c:forEach>
            
            	<li>
            		<div>
            			<c:set var="total" value="0"/>
            			총 가격 :
            			<c:forEach var='i' items='${carts}'>
            				<c:set var="total" value="${total + (i.productAmount * i.productPrice) }"/>            				
            			</c:forEach>
            			<c:out value="${total}"/>
            		</div>
            	</li>
       
            
          </ul><input type="hidden" id="isPickupType" value="false"></div>        
  
    
        
        <!-- 할인가격이 없으므로 class = price하나만 사용  -->
 <!--        <h2 class="tit_section fst">주문상품</h2>
        <div id="itemList" class="page_aticle order_goodslist"><div class="info_product"><a class="btn" href="#none"><span class="screen_out">펼침 / 닫힘</span></a>
          <div class="short_info">[닥터아토] 알로에베라 수딩젤 150ml외 <span class="num">3개</span>상품을 주문합니다.</div></div>
          <ul class="list_product">
            <li>
              <div class="thumb"><img src="https://img-cf.kurly.com/shop/data/goods/1655467708190i0.jpeg" alt="상품이미지"></div>
              <div class="name">
                <div class="inner_name">[닥터아토] 알로에베라 수딩젤 150ml</div>
              </div>
              <div class="ea">1개</div>
              <div class="info_price">
                <span class="num">
                  <span class="price">20,000원</span>
                  <span class="cost"></span>
                </span>
              </div>
            </li>
            <li>
              <div class="thumb"><img src="https://img-cf.kurly.com/shop/data/goods/1618292108416i0.jpg" alt="상품이미지"></div>
              <div class="name">
                <div class="inner_name">[블랙모어스] 멀티비타민 포 맨 (30일분)</div>
              </div>
              <div class="ea">1개</div>
              <div class="info_price">
                <span class="num">
                  <span class="price">10,000원</span>
                  <span class="cost"></span>
                </span>
              </div>
            </li>
            <li>
              <div class="thumb"><img src="https://img-cf.kurly.com/shop/data/goods/1643004934256i0.jpg" alt="상품이미지"></div>
              <div class="name">
                <div class="inner_name">[메이준뉴트리 X 이승남원장] 더블액션 프리바이오틱스 플러스 (30일분)</div>
              </div>
              <div class="ea">2개</div>
              <div class="info_price">
                <span class="num">
                  <span class="price">20,000원</span>
                  <span class="cost"></span>
                </span>
              </div>
            </li>
            <li>
              <div class="thumb"><img src="https://img-cf.kurly.com/shop/data/goods/1644297329226i0.jpg" alt="상품이미지"></div>
              <div class="name">
                <div class="inner_name">[VIETPURE] NFC 비엣퓨어 100% 노니주스 1L</div>
              </div>
              <div class="ea">1개</div>
              <div class="info_price">
                <span class="num">
                  <span class="price">80,000원</span>
                  <span class="cost"></span>
                </span>
              </div>
            </li>
          </ul><input type="hidden" id="isPickupType" value="false"></div>
           -->
          
        <!--  -->
        
          <form id="form" name="frmOrder" action="#" method="post" onsubmit="return validateOrderForm(this)" class="order_view" novalidate="">
        
        <input type="hidden" name="platform" value="desktop">
        <input type="hidden" id="order_method" name="order_method" value="cart">
        <input type="hidden" name="fallback_on_delivery_fail_method" value="2">
        <input type="hidden" name="settlement_price" value="0">
        <input type="hidden" name="settlekind_option" value="">
        <input type="hidden" id="package_benefit_apply" name="package_benefit_apply" value="false">
        <input type="hidden" id="package_type" name="package_type" value="DEFAULT">
        <div id="apply_coupon"></div>
        <input type="hidden" name="apr_coupon_data" value="">
        
        <h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
        <div class="order_section data_orderer">
        <table class="goodsinfo_table ">
        <tbody><tr class="fst">
        <th>보내는 분</th>
        <td>
        소울이터
        <input type="hidden" name="orderer_name" value="소울이터">
        </td>
        </tr>
        <tr>
        <th>휴대폰</th>
        <td>
        01012345678
        <input type="hidden" name="orderer_phone" value="01012345678">
        </td>
        </tr>
        <tr>
        <th>이메일</th>
        <td>
        <input type="hidden" id="email" name="orderer_email" value="soulEater@soul.com" option="regEmail">
        soulEater@soul.com
        <p class="txt_guide">
        <span class="txt txt_case1">이메일을 통해 주문처리과정을 보내드립니다.</span>
        <span class="txt txt_case2">정보 변경은 <span class="txt_desc">마이페이지 &gt; 개인정보 수정</span> 메뉴에서 가능합니다.</span>
        </p>
        </td>
        </tr>
        </tbody></table>
        </div>
        
        <div id="deliveryInformation" class="off">
        
        <input type="hidden" name="zonecode" id="zonecode" value="08797">
        <input type="hidden" name="zipcode[]" id="zipcode0" value="">
        <input type="hidden" name="zipcode[]" id="zipcode1" value="">
        <input type="hidden" name="address" id="address" value="고민시 손석구 강호동 181-6">
        <input type="hidden" name="road_address" id="road_address" value="고민시 손석구 강호동 래미안 3차">
        <input type="hidden" name="address_sub" id="address_sub" value="1102동 607호">
        
        <input type="hidden" name="deliPoli" id="deliPoli" value="0">
        <input type="hidden" name="deliveryType" id="deliveryType" value="direct">
        
        <input type="hidden" id="means_inp" name="means" value="">
        
        
        
        <input type="hidden" id="addressBookNo" name="addressbook_no" value="15915419">
        <h2 class="tit_section" id="divAddressWrapper">배송 정보</h2>
        
        <div class="address_info">
        <a href="#none" id="btnLayerInfo" class="desc">배송지 변경 안내</a>
        <div class="layer_info" id="layerInfo">
        <strong class="emph">장바구니, 홈</strong>에서
        <br>
        배송지를 변경할 수 있어요.
        </div>
        </div>
        
        <div class="order_section order_address" id="dataDelivery">
        <h3 href="#none" class="section_crux">
        배송지
        </h3>
        <div class="section_full">
        <span class="address" id="divDestination">
        <span class="default on" id="addrDefault" data-text="기본배송지">기본배송지</span>
        <span class="addr" id="addrInfo">고민시 손석구 강호동 래미안 3차 1102동 607호</span>
        <span class="tag" id="addrTags">
        <span class="badge star" id="addrBadge"></span>
        <span class="information" id="courierInformation"></span>
        </span>
        </span>
        </div>
        </div>
        
        <div class="order_section order_reception" id="divReception">
        <h3 class="section_crux">
        상세 정보
        </h3>
        <div class="section_full">
        
        <div class="receiving off" id="receiverInfo">받으실 분 정보를 입력해 주세요</div>
        <div class="way" id="wayPlace" style="display: none;">
        <span class="place" id="areaInfo" style="display: none;"></span>
        
        <span class="txt off" id="meanType">받으실 장소를 입력해 주세요</span>
        
        
        
        <div class="message" id="deliveryMessage" style="display: none;">
        <span class="place" id="deliveryMessageTitle">배송완료 메시지</span>
        <span class="txt" id="deliveryMessageDetail">배송 직후</span>
        </div>
        </div>
        <button type="button" id="btnUpdateSubAddress" data-address-no="" class="btn active">입력</button>
        
        </div>
        </div>
        
        <div id="package-method" class="order_section reusable_packaging"></div>
        <div id="bnrOrder" class="bnr_order" style="display: block;">
              <img src="https://res.kurly.com/kurly/img/2021/banner-order-paper_1050_107%402x.jpg" alt="All Paper Challenge">
              
        </div>
        
        
        </div>
        <div id="pickupInformation"></div>
        
        <!-- 계산서 시작 -->
        <!-- 할인이없으므로 상품금액과 할인금액부분 쿠폰부분 없애기 -->
        <div class="tax_absolute">
        <div class="inner_sticky" id="sticky" style="top: 0px;">
        <h2 class="tit_section">결제금액</h2>
        <div id="orderitem_money_info">
        <dl class="amount fst">
        <dt class="tit">주문금액</dt>
        <dd class="price"><span id="productsTotalPrice">130,000</span> 원</dd>
        </dl>
        <!-- 할인률부분 -->
        <dl class="amount sub">
        <dt class="tit"></dt>
        <dd class="price"><span id="paper_goodsprice"></span> </dd>
        </dl>
        <dl class="amount sub">
        <dt class="tit"></dt>
        <dd class="price sales_area">
        <span class="pm_sign normal" style="display: inline;"></span>
        <span id="special_discount_amount" class="normal"></span>
        
        </dd>
        <dd id="paper_sale" class="screen_out"></dd>
        </dl>
        <dl class="amount">
        <dt class="tit">배송비</dt>
        <dd class="price delivery_area">
        <div id="paper_delivery_msg1" style="display: none;">
        <span class="pm_sign" style="display: none;">+</span>
        <span id="paper_delivery" class="">0</span>
        <span id="paper_delivery2" style="display:none">0</span>
        원
        </div>
        <div id="paper_delivery_msg2" style="display: block;">0 원</div>
        <div id="paper_delivery_msg_extra" class="small" style="display:none;"></div>
        <span id="free_delivery_coupon_msg" class="screen_out">미적용</span>
        <input type="hidden" name="free_delivery" value="0">
        </dd>
        </dl>
        <!-- 쿠폰사용 부분 -->
        <dl class="amount">
        <dt class="tit"></dt>
        <dd class="price coupon_area">
        <span class="pm_sign" style="display: none;">-</span>
        <span id="apr_coupon_data"></span>
        
        <input type="hidden" name="coupon" size="12" value="0" readonly="">
        </dd>
        </dl>

        <!-- 포인트 부분 -->
        <dl class="amount">
        <dt class="tit">적립금사용</dt>
        <dd class="price">
        <span class="num pay_sum" id="paper_reserves">0 원</span>
        <input type="hidden" name="coupon_emoney" size="12" value="0" readonly="">
        </dd>
        </dl>
        <dl class="amount lst">
        <dt class="tit">최종결제금액</dt>
        <dd class="price">
        <span id="paper_settlement">130,000</span>
        <span class="won">원</span>
        </dd>
        </dl>
        <p class="reserve" style="display: block;">
        <span class="ico">적립</span> 구매 시 <span class="emph"><span id="expectAmount">1,300</span> 원 (<span class="ratio">1</span>%) 적립</span>
        </p>
        </div>
        <div id="order_notice_section">
        <span class="order_until_at"></span>까지 주문하면&nbsp;
        <span class="emph delivery_done_at"></span>
        에 도착해요.
        <span class="courier_notice"></span>
        </div>
        </div>
        </div>
        
        <div class="data_payment">
        <div class="tbl_left">
        <h2 class="tit_section">쿠폰 / 적립금</h2>
        
        <table class="goodsinfo_table">
        <tbody><tr>
        <th>쿠폰 적용</th>
        <td>
        <div class="view_popselbox">
        <div id="popselboxView" class="select_box off">
        사용 가능 쿠폰 <span id="useCoupon">0</span>개 / 전체 <span id="haveCoupon">0</span>개
        </div>
        <div id="popSelbox" class="layer_selectbox">
        <ul id="addpopSelList" class="list">
        <li class="fst checked ">
        <div class="inner_item">
        <span class="txt_tit default">쿠폰 적용 안 함</span>
        </div>
        </li>
        </ul>
        <div class="coupon_list_default" style="display: none;">
        <li class="fst checked ">
        <div class="inner_item">
        <span class="txt_tit default">쿠폰 적용 안 함</span>
        </div>
        </li>
        </div>
        <div id="listItem" style="display:none">
        <div class="inner_item">
        <div class="item_row">
        <div class="item_td left">
        <span class="txt_apr"></span>
        </div>
        <div class="item_td">
        <span class="txt_tit"></span>
        <span class="txt_desc"></span>
        <span class="txt_expire"></span>
        <div id="apply_delivery_coupon" class="is_delivery_coupon" style="display: none;"></div> 
        <div class="txt_apply_coupon" style="display: none;"></div> 
        <ul id="payment_gateways" style="display: none;"></ul>
        <div id="point_allowed" style="display: none;"></div>
        <span class="credit_card_id" style="display: none;"></span>
        </div>
        </div>
        </div>
        </div>
        <button id="popSelboxCancel" type="button" class="btn btn_cancel screen_out">취소</button>
        <button id="popSelboxSelect" type="button" class="btn btn_conf screen_out">확인</button>
        <button id="popSelboxClose" type="button" class="btn_close screen_out">닫기</button>
        </div>
        </div>
        <div id="notavailableMsg" class="txt_notavailable" style="display: none;"></div>
        <p class="txt_inquiry">
        <a href="#none" class="link" id="happyTalk">쿠폰사용문의(카카오톡)</a>
        </p>
        </td>
        </tr>
        <tr class="emoney_use ">
        <th class="no_emoney">
        적립금 적용
        <input type="hidden" value="0" name="checkEmoney">
        </th>
        <td>
        사용 가능한 적립금이 없습니다. <input type="hidden" name="using_point" id="emoney" value="0">
        </td>
        </tr>
        </tbody></table>
        </div>
        </div>
        
        
        <div class="data_method">
        <h2 class="tit_section" id="titFocusMethod">결제 수단</h2>
        
        <input type="hidden" name="escrow" value="N">
        <div class="type_form" style="display: block;">
        <input type="hidden" name="save_payment_method" value="true">
        <label>
        <input type="checkbox" name="check_save_payment_method" checked="checked">
        <span class="ico"></span>
        선택한 결제 수단을 다음에도 사용
        </label>
        </div>
        <table class="goodsinfo_table tbl_left">
        <tbody><tr>
        <th>결제수단 선택</th>
        <td>
        
        <div class="payment_first on">
        <label id="kakaopayPayment" class="kakaopay" data-payment="kakao">
        <input type="radio" name="settlekind" value="kakao-pay" onclick="input_escrow(this,'N')" checked="checked">
        <img src="https://res.kurly.com/mobile/service/order/2109/ico_kakao-pay.png" alt="카카오페이" class="logo_kakao">
        <span id="paymentBenefitKakao" class="icon_benefit" style="display: inline;">혜택</span>
        </label>
        <div id="only_kakao" class="credit_montly_wrap">
        <p class="title">
        카카오페이 <span class="kakaopay_benefit_icon" style="display: inline;">혜택</span>
        </p>
        <p class="guide">카카오페이 전용 쿠폰 사용 시, 카카오페이 결제만 가능합니다.</p>
        </div>
        </div>
        
        <ul class="menu_payment">
        <li class="card">
        <label class="checked" id="settlekindCard" onclick="option_pay_standard('');" data-payment="card">
        <input type="radio" name="settlekind" value="c" onclick="input_escrow(this,'N');">
        신용카드
        <span id="paymentBenefitCard" class="icon_benefit">혜택</span>
        </label>
        </li>
        <li class="simple">
        <label for="paymentChai" data-payment="simple">
        간편결제
        <span id="paymentBenefitSimple" class="icon_benefit" style="display: inline;">혜택</span>
        </label>
        </li>
        <li class="phone">
        <label data-payment="mobilians">
        <input type="radio" data-phone="mobilians" name="settlekind" value="h" onclick="input_escrow(this,'N')">
        휴대폰
        </label>
        </li>
        </ul>
        
        <div class="card_detail" style="display: none;">
        <div id="cardSelect"><div><div class="card_select"><div class="select_box"><strong class="tit">카드를 선택해주세요</strong> <input type="hidden" name="lguplus_card_code"> <ul class="list off"><li><a class="">현대 (무이자)</a></li><li><a class="">신한 (무이자)</a></li><li><a class="">비씨(페이북) (무이자)</a></li><li><a class="">KB국민 (무이자)</a></li><li><a class="">삼성 (무이자)</a></li><li><a class="">롯데 (무이자)</a></li><li><a class="">하나(외환) (무이자)</a></li><li><a class="">NH채움 (무이자)</a></li><li><a class="">우리 (무이자)</a></li><li><a class="">수협</a></li><li><a class="">씨티</a></li><li><a class="">광주 (무이자)</a></li><li><a class="">전북 (무이자)</a></li><li><a class="">제주</a></li><li><a class="">신협체크</a></li><li><a class="">MG새마을체크</a></li><li><a class="">저축은행체크</a></li><li><a class="">우체국카드</a></li><li><a class="">KDB산업은행</a></li><li><a class="">카카오뱅크</a></li></ul></div> <div class="select_box"><strong class="tit off">할부기간을 선택해주세요</strong> <input type="hidden" name="lguplus_card_installment_month"> <ul class="list off"><li><a class="">일시불</a></li> </ul></div></div> <!----> <!----> <!----></div></div>
        </div>
        
        <ul id="simplePayments" class="payments" style="display: none;">
        <li class="chai">
        <label class="label_radio" for="paymentChai">
        <input type="radio" name="settlekind" value="chai" onclick="input_escrow(this,'N')" id="paymentChai">
        차이
        <span class="txt_benefit" style="display: inline;">혜택</span>
        </label>
        </li>
        <li class="toss">
        <label class="label_radio">
        <input type="radio" name="settlekind" value="toss" onclick="input_escrow(this,'N')">
        토스
        <span class="txt_benefit" style="display: inline;">혜택</span>
        </label>
        </li>
        <li class="npay naver-pay">
        <label class="label_radio">
        <input type="radio" name="settlekind" value="n" onclick="input_escrow(this,'N');">
        네이버페이
        <span class="txt_benefit" style="display: inline;">혜택</span>
        </label>
        </li>
        <li class="payco">
        <label class="label_radio">
        <input type="radio" name="settlekind" value="t" onclick="input_escrow(this,'N');check_naverNcashUseAble();">
        페이코
        <span class="txt_benefit" style="display: inline;">혜택</span>
        </label>
        </li>
        <li class="spay smile-pay">
        <label class="label_radio">
        <input type="radio" name="settlekind" value="s" onclick="input_escrow(this,'N')">
        스마일페이
        <span class="txt_benefit" style="display: inline;">혜택</span>
        </label>
        </li>
        
        </ul>
        
        <div class="benefit_event">
        <div id="cardBenefit-kakao-pay" class="benefit kakao"><strong class="tit_benefit">카카오페이</strong><p class="sub_benefit">카카오페이 내 삼성카드로 결제 시 최대 5천원 즉시할인</p><p class="info_benefit"><span class="info">· 5만원 이상 결제 시 3천원 즉시할인<br>· 7만원 이상 결제 시 5천원 즉시할인<br>· 3천원 / 5천원 할인 중 최초 1회 사용 시만 혜택 적용<br>· 6/20 00시 ~ 6/30 24시, 기간 내 ID당 1회 선착순</span></p></div>
        
        <div id="cardBenefitSimple" class="benefit on" style="display: none;">
        <div id="cardBenefit-chai" class="simple"><strong class="tit_benefit">차이</strong><p class="sub_benefit">2만원 이상 생애 첫 결제 시 3천원 즉시 할인</p><p class="info_benefit"><span class="info">· 5/2 11시 ~ 6/30 24시, 기간 내 차이 ID당 1회, 선착순</span></p></div>
        <div id="cardBenefit-toss" class="simple"><strong class="tit_benefit">토스</strong><p class="sub_benefit">토스로 5만원 이상 결제 시 5천원 즉시할인 &amp; 생애 첫 결제 3천원 캐시백</p><p class="info_benefit"><span class="info">· 즉시할인 : 토스페이 내 삼성카드, 신한카드로 5만원 이상 결제 시 5천원 즉시할인<br>· 캐시백 : 토스페이로 1만원 이상 생애 첫 결제 시 3천원 캐시백<br>· ~6/30 24시, 토스 ID당 1회 선착순</span></p></div>
        <div id="cardBenefit-naver-pay" class="simple"><strong class="tit_benefit">네이버페이</strong><p class="sub_benefit">5만원 이상 결제 시 2천원 네이버페이 포인트 적립</p><p class="info_benefit"><span class="info">· 6/20 11시 ~ 6/26 24시<br>· 네이버페이 ID당 1회(실명인증 기준) 선착순<br>· 7월 7일까지 취소되지 않은 내역에 대해 7월 8일 일괄 적립</span></p></div>
        <div id="cardBenefit-payco" class="simple"><strong class="tit_benefit">페이코</strong><p class="sub_benefit">페이코 최대 5% 적립 + 1천원 할인쿠폰</p><p class="info_benefit"><span class="info">· 포인트 적립 : 페이코 충전포인트로 결제할 때마다 5% 적립(건당 최대 1,000P)<br>· 할인 쿠폰 : 페이코 앱 내 쿠폰영역에서 트렌드이터 쿠폰 다운로드(기간 내 ID당 3회)<br>· 6/2 11시 ~ 6/30 24시</span></p></div>
        <div id="cardBenefit-smile-pay" class="simple"><strong class="tit_benefit">스마일페이</strong><p class="sub_benefit">2만원 이상 첫 결제 시, 결제금액의 10% 즉시 할인</p><p class="info_benefit"><span class="info">· 5/2 11시 ~ 6/30 24시, 스마일페이 ID당 1회 (실명인증 기준) 선착순<br>· 스마일페이로 첫 결제 시 결제금액의 10%(최대 3천원) 즉시 할인</span></p></div>
        </div>
        </div>
        
        </td>
        </tr>
        <tr>
        <td class="txt_notice" colspan="2">
        <ul>
        <li>※ 카카오페이, 차이, 토스, 네이버페이, 페이코 결제 시, 결제하신 수단으로만 환불되는 점 양해부탁드립니다.</li>
        <li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의 구매안전(에스크로) 서비스를 이용하실 수 있습니다.</li>
        
        <li id="coupon_typinfo" style="display:none">※ 무통장입금에서만 사용가능한 쿠폰을 선택하였습니다. 다른 결제 수단을 선택하시려면 쿠폰을 제거 하여 주십시오.</li>
        </ul>
        </td>
        </tr>
        </tbody></table>
        <input type="hidden" name="undeliver_way" value="2">
        
        <div id="cash" style="display:none;">
        <h2 class="tit_section">현금영수증발급</h2>
        <table class="goodsinfo_table">
        <tbody>
        <tr>
        <th>현금영수증</th>
        <td>
        <label class="label_radio">
        <input type="radio" name="cashreceipt" value="Y" onclick="cash_required()">
        신청
        </label>
        <label class="label_radio checked">
        <input type="radio" name="cashreceipt" value="N" onclick="cash_required()" checked="">
        신청안함
        </label>
        </td>
        </tr>
        <tr>
        <th>발행용도</th>
        <td>
        <label class="label_radio checked">
        <input type="radio" name="cashuseopt" value="0" onclick="setUseopt()" checked="">
        소득공제용
        </label>
        <label class="label_radio">
        <input type="radio" name="cashuseopt" value="1" onclick="setUseopt()">
        지출증빙용
        </label>
        </td>
        </tr>
        <tr>
        <th>
        <span id="cert_0" style="display:block;">휴대폰번호</span>
        <span id="cert_1" style="display:none;">사업자번호</span>
        </th>
        <td style="padding-top:14px;">
        <input type="text" name="cashcertno" value="" option="regNum" class="line" placeholder="- 생략">
        </td>
        </tr>
        </tbody>
        </table>
        </div>
        <script>
        function cash_required()
        {
            var display = 'block';
            if (_ID('cash') == null) return;
        
            var obj = document.getElementsByName('settlekind');
            for (var i = 0; i < obj.length; i++){
                if (obj[i].checked != true) continue;
                var settlekind = obj[i];
                break;
            }
            if (settlekind == null) display = 'none';
            else if (settlekind.value != 'a') display = 'none';
        
            if (_ID('cash').style.display == display && display =='none') return;
            _ID('cash').style.display = display;
        
            items = new Array();
            items.push( {name : "cashreceipt", label : "현금영수증 신청여부", msgR : ""} );
            items.push( {name : "cashuseopt", label : "현금영수증 발행용도", msgR : "현금영수증 발행용도를 선택해야 합니다."} );
            items.push( {name : "cashcertno", label : "휴대폰번호", msgR : ""} );
        
            for (var i = 0; i < items.length; i++){
                var obj = document.getElementsByName(items[i].name);
                if (display == 'block' && items[i].name != 'cashreceipt' && typeof(document.getElementsByName('cashreceipt')[0]) != "undefined")
                    state = (document.getElementsByName('cashreceipt')[0].checked ? 'block' : 'none');
                else state = display;
                for (var j = 0; j < obj.length; j++){
                    if (state == 'block'){
                        obj[j].setAttribute('required', '');
                        obj[j].setAttribute('label', items[i].label);
                        obj[j].setAttribute('msgR', items[i].msgR);
                        obj[j].disabled = false;
        
                        if (items[i].name == 'cashcertno') setUseopt();
                    }
                    else {
                        obj[j].removeAttribute('required');
                        obj[j].removeAttribute('label');
                        obj[j].removeAttribute('msgR');
                        obj[j].disabled = true;
                    }
                }
            }
        }
        
        function setUseopt()
        {
            var useopt = document.getElementsByName('cashuseopt');
            if (useopt[0].checked)
            {
                _ID('cert_0').style.display = "block";
                _ID('cert_1').style.display = "none";
                useopt[0].form.cashcertno.setAttribute('label', '휴대폰번호');
                useopt[0].form.cashcertno.setAttribute('msgR', '휴대폰번호를 정확히 입력하세요.');
            }
            else if (useopt[1].checked)
            {
                _ID('cert_0').style.display = "none";
                _ID('cert_1').style.display = "block";
                useopt[1].form.cashcertno.setAttribute('label', '사업자번호');
                useopt[1].form.cashcertno.setAttribute('msgR', '사업자번호를 정확히 입력하세요.');
            }
        }
        </script>
        </div>
        <div style="clear:both;"></div>
        <h2 class="tit_section" id="titFocusAgree">개인정보 수집/제공</h2>
        <table class="goodsinfo_table">
        <tbody>
        <tr>
        <td class="reg_agree">
        <div class="bg_dim"></div>
        <div class="check type_form">
        <label class="agree_check">
        <input type="checkbox" name="ordAgree" value="y" required="" fld_esssential="" label="결제 진행 필수 동의" msgr="결제 진행 필수 동의 내용에 동의하셔야 결제가 가능합니다.">
        <span class="ico"></span>
        결제 진행 필수 동의
        </label>
        <ul class="list_agree">
        <li>
        <span class="subject">개인정보 수집 · 이용 및 처리 동의 <span class="emph">(필수)</span></span>
        <a href="#terms" class="link_terms">보기</a>
        </li>
        <li id="pgTerms" style="display: none;">
        <span class="subject">결제대행 서비스 약관 동의 <span class="emph">(필수)</span></span>
        <a href="#pgTerms" class="link_terms">보기</a>
        </li>
        <li id="kurlyTerms">
        <span class="subject">전자지급 결제대행 서비스 이용약관 동의 <span class="emph">(필수)</span></span>
        <a href="#kurlyTerms" class="link_terms">보기</a>
        </li>
        </ul>
        
        
        </div>
        </td>
        </tr>
        </tbody>
        </table>
        <div class="indemnification_clause">
        <p class="txt">
        트렌드이터에서 판매되는 상품 중에는 트렌드이터에 입점한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.<br>
        마켓플레이스(오픈마켓) 상품의 경우 트렌드이터는 통신판매중개자로서 통신판매의 당사자가 아닙니다. 트렌드이터는 해당 상품의 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.
        </p>
        </div>
        
        <div id="paymentMethodResult">
        <input type="hidden" name="payment_method" value="">
        </div>
        <input type="submit" value="51,615원 결제하기" class="btn_payment">
        </form>
        <ul class="notice_order">
        <li>[배송준비중] 이전까지 주문 취소 가능합니다.</li>
        <li>미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.</li>
        <li>상품 미배송 시, 결제수단으로 환불됩니다.</li>
        <li>카카오페이, 차이, 토스, 네이버페이, 페이코 결제 시, 결제하신 수단으로만 환불됩니다.</li>
        </ul>
        <div id="dynamic"></div>
        
        <script>
          //Sticky
          $(document).ready(function() {
            var $obj_sticky = $('#sticky');
            $(window).on('load scroll', function(){
              if ($('.data_method').hasClass('off')) {
                $obj_sticky.css({top:0});
                return;
              }
              var $scrollTop = parseInt($(this).scrollTop());
              var $checkTop = parseInt($('.data_payment').offset().top);
              var $stickyLimit = parseInt($('.data_method').height()+$('.data_payment').height() - $obj_sticky.height());
              if($checkTop < $scrollTop){
                $obj_sticky.css({top:$scrollTop - $checkTop});
                if($stickyLimit < parseInt($obj_sticky.css('top'))){
                  $obj_sticky.css({top:$stickyLimit});
                }
              }else if($scrollTop < $checkTop){
                $obj_sticky.css({top:0});
              }
            });
          });
        </script>
        <script>
          // 결제 수단 영역
        
          // 신용카드 select box 열렸을 때 body를 클릭해도 닫히게 하기.
          $('body').on('click', function(e){
            if( $('#cardSelect .list').hasClass('on') && (cardSelect.isCardShow ||  cardSelect.isInstallShow) ) {
              cardSelect.isCardShow = false;
              cardSelect.isInstallShow = false;
            }
          });
        
          // 선택한 결제 수단 다음에도 사용 체크박스
          $(".data_method label input[name=check_save_payment_method]").on('click', function(){
            if($(this).is(':checked')) {
              $(this).parents('.type_form').find('input[name=save_payment_method]').val('true');
            } else {
              $(this).parents('.type_form').find('input[name=save_payment_method]').val('false');
            }
          });
        
          var isMethodCheck = false;
          $(".data_method label").on('click', function(){
            if($(this).parent().hasClass('on')
              || isMethodCheck
              || typeof $(this).data('payment') === 'undefined'
            ) {
              return;
            }
            isMethodCheck = true;
        
            selectPayment(this);
        
            setTimeout(function(){
              isMethodCheck = false;
            });
          });
        
          // 간편결제에서 선택하는 경우 이벤트 처리됨 - 체크박스 이미지처리
          $(".label_radio").on("click", function() {
            if($(this).find('input').attr('name') === 'settlekind') {
              $(this).parents('table').find(".label_radio").removeClass('checked');
              $(this).find('[name=settlekind]').prop('checked','checked');
            } else {
              $(this).parent().find(".label_radio").removeClass('checked');
            }
            $(this).addClass('checked');
          });
        
        
          // 이전 결제수단이 저장되어 있는 경우 주문서 진입 시 결제수단을 선택한다.
          function previousPaymentSelect(payment) {
            switch (payment){
              case 'toss-payments': // 신용카드
                selectPayment($('#settlekindCard').get(0));
              break;
              case 'mobilians': // 휴대폰-모빌리언스
                selectPayment($('.menu_payment .phone [data-payment=mobilians]').get(0));
                break;
              case 'kakao-pay': // 카카오페이
                selectPayment($('#kakaopayPayment').get(0));
                break;
              default: // 간편결제
                selectPayment($('.menu_payment .simple label').get(0));
                if($('#simplePayments li.' + payment).length > 0 ){
                  addCheckedAttributes($('#simplePayments li.' + payment + ' label').get(0), payment);
                }
                break;
            }
            // 선택한 결제 수단을 다음에도 사용
            $('input[name=check_save_payment_method]').attr('checked', 'checked');
            $('input[name=save_payment_method]').val('true');
          }
        
          function selectPayment(element) {
            var payment = $(element).data('payment');
        
            addCheckedAttributes(element, payment);
            addOnClassPaymentMethod(element);
            changePaymentAreaSelected(payment);
          }
        
          function addCheckedAttributes(element, payment) {
            if($(element).find('[name=settlekind]').length > 0) {
              $(element).find('[name=settlekind]').prop('checked','checked');
            }
        
            if(payment === 'simple') {
              $('#simplePayments .chai').find('[name=settlekind]').prop('checked','checked');
            }
          }
        
          function addOnClassPaymentMethod(element) {
            // 메뉴에 on 넣고 빼기
            $(".menu_payment li").removeClass('on');
            $(".data_method .payment_first").removeClass('on');
            $(element).parent().addClass('on');
          }
        
          function changePaymentAreaSelected(payment) {
            var $paymentCard = $('.card_detail');
            var $paymentSimple = $('#simplePayments');
            var $benefitKakaopay = $('#cardBenefit-kakao-pay');
            var $benefitSimple = $('#cardBenefitSimple');
        
            switch(payment){
              case 'kakao':
                $paymentCard.hide();
                $paymentSimple.hide();
                $benefitSimple.hide();
                $benefitKakaopay.show();
                break;
              case 'card':
                $paymentCard.show();
                $paymentSimple.hide();
                $benefitSimple.hide();
                $benefitKakaopay.hide();
                break;
              case 'simple':
              case 'smile-pay':
              case 'chai':
              case 'toss':
              case 'payco':
              case 'naver-pay':
                $paymentCard.hide();
                $paymentSimple.show();
                $benefitSimple.show();
                $benefitKakaopay.hide();
                break;
              case 'mobilians':
                $paymentCard.hide();
                $paymentSimple.hide();
                $benefitSimple.hide();
                $benefitKakaopay.hide();
                break;
              default:
                break;
            }
          }
        
          function clickPaymentAction() {
            var obj = document.getElementsByName('settlekind');
            for (var i = 0; i < obj.length; i++){
              if (obj[i].checked === false) continue;
              obj[i].click();
              var idx = i;
              break;
            }
        
            if (obj[0] && idx === null){
              obj[0].checked = true;
              obj[0].click();
            }
          }
        </script>
        </div>
        <div class="bg_loading" id="bgLoading" style="display: none;">
        <div class="loading_show"></div>
        </div>
        
     
        </div>
        </div>
</body>
</html>