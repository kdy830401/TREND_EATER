<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>TREND EATER</title>
<!-- CSS Link  -->
<link href="${ pageContext.servletContext.contextPath }/resources/css/pay/order.css" rel="stylesheet"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/uikit/uikit.min.css" />

<!-- JQuery 최신버젼 CDN 링크  -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>




<style type="text/css">
/* common style */
 #main {
    border-bottom: 1px solid #f7f7f7;
}
.user_form * {
font-family: 'Noto Sans';
font-weight: 400;
letter-spacing: -0.3px;
}
.page_aticle button, .page_aticle input, .page_aticle select, .page_aticle * {
  font-family: noto sans;
  font-weight: 400;
  letter-spacing: 0;
}
div, th, td, li, dt, dd, p {
  word-break: break-all;
}
*, *:after, *:before {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

li {
  display: list-item;
  text-align: -webkit-match-parent;
}
ol, ul {
  list-style-type: none !important;
  padding: 0;

}

ul {
  list-style-type: disc;
}
.user_form {
  width: 1050px;
  margin: 0 auto;
  font-family: noto sans;
  font-weight: 400;
}
body, input, select, textarea, button {
  font-family: noto sans,malgun gothic,AppleGothic,dotum;
  line-height: 1;
  letter-spacing: -.05em;
  color: #4c4c4c;
  font-size: 12px;
  max-width: 100%;
}
html {
  font-family: sans-serif;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
}
*, *:after, *:before {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
*, *:after, *:before {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
img, video, canvas {
max-width: 100%;
}
/* 주문서 */
.tit_page h2.tit {
font-weight: 700;
font-size: 28px;
color: #333;
line-height: 35px;
text-align: center;
letter-spacing: -1px;
}

/* 주문상품 요약 */
.order_goodslist .info_product {
position: relative;
}
.order_goodslist .info_product .short_info {
height: 80px;
padding-top: 29px;
border-bottom: 1px solid #f4f4f4;
font-weight: 700;
font-size: 16px;
color: #333;
line-height: 24px;
letter-spacing: -.35px;
text-align: center;
}
.order_goodslist .info_product .short_info .num {
font-weight: 700;
color: #FF5C58;
}
/*주문상품 리스트  */
.order_goodslist li {
overflow: hidden;
height: 128px;
border-bottom: 1px solid #f4f4f4;
}

.order_goodslist .thumb {
overflow: hidden;
float: left;
width: 60px;
height: 78px;
margin: 25px 20px 0 0;
background-color: #f4f4f4;
background-repeat: no-repeat;
background-position: 50% 50%;
background-size: cover;
}
.order_goodslist .thumb img {
width: 60px;
height: 78px;
}
.order_goodslist .name {
display: table;
float: left;
width: 739px;
height: 100%;
padding-right: 20px;
}
.order_goodslist .name .inner_name {
display: table-cell;
font-weight: 700;
font-size: 16px;
color: #000;
line-height: 24px;
vertical-align: middle;
}
.order_goodslist .ea {
float: left;
width: 100px;
height: 100%;
padding-top: 52px;
font-size: 14px;
color: #333;
line-height: 24px;
text-align: center;
letter-spacing: -.22px;
}
.order_goodslist .info_price {
display: table;
float: right;
width: 120px;
height: 100%;
padding-right: 4px;
}
.order_goodslist .info_price .num {
display: table-cell;
vertical-align: middle;
text-align: right;
}
.order_goodslist .info_price .price {
display: block;
font-weight: 700;
font-size: 16px;
color: #000;
line-height: 24px;
white-space: nowrap;
}
.order_goodslist .info_price .cost {
display: block;
padding-top: 1px;
font-size: 14px;
color: #999;
line-height: 24px;
text-decoration: line-through;
white-space: nowrap;
}
/* 주문서 전용 딤드처리 */
.bg_order{display:block !important}
.hide{display:none}
/* 주문서_공통 */
#gnb.gnb_stop{position:static}
.user_form *{font-family: 'Noto Sans';font-weight:400;letter-spacing:-0.3px}
.user_form input[type="text"]{width:332px;height:44px;padding:12px 16px;border:1px solid #ddd;border-radius:3px;background-color:#fff;font-size:14px;color:#333;letter-spacing:-0.5px;outline:none}
.user_form input[type="text"]:focus{border:1px solid #333}
.user_form input[type="radio"]{position:relative;z-index:-1;vertical-align:0}
.user_form .bar{display:inline-block;position:relative;width:13px;height:33px;vertical-align:top}
.user_form .bar span{position:absolute;left:3px;top:17px;width:8px;height:1px;background-color:#d8d8d8}
.user_form .txt_guide .txt{display:block;font-size:12px;line-height:21px;color:#666}
/* 공통_라디오버튼 */
.user_form .label_radio{display:inline-block;padding:0 18px 0 9px;background:#fff url(https://res.kurly.com/pc/service/order/1908/ico_radio_off_x2.png) no-repeat 0 2px;background-size:16px 17px;font-size:14px;color:#333;line-height:22px;cursor:pointer;white-space:nowrap}
.user_form .label_radio.checked{background:#fff url(https://res.kurly.com/pc/service/order/1908/ico_radio_on_x2.png) no-repeat 0 2px;background-size:16px 17px}
.user_form .label_radio.disabled{background:#fff url(https://res.kurly.com/pc/service/order/1908/ico_radio_disabled_x2.png) no-repeat 0 2px;background-size:16px 17px}
.user_form .label_radio .info{display:none;width:543px;margin:11px 0 0 -7px;color:#666;font-size:12px;line-height:18px;white-space:normal}
.user_form .label_radio .bubble{margin-left:7px}
.user_form .label_radio.checked .info{ display: block;}
    
/* 공통_테이블 */
.goodsinfo_table{border-top:1px solid #333;border-bottom:none; width: 100%;}
.goodsinfo_table th{width:190px;padding:8px 0 0;font-weight:bold;font-size:14px;color:#333;line-height:24px;letter-spacing:-0.32px;vertical-align:top; text-align: left;}
.goodsinfo_table td{position:relative;padding:8px 0;font-size:14px;color:#333;line-height:24px;vertical-align:top}
.tbl_left{float:left;width:742px}
    
/* 공통적용 */
.tit_section{padding:74px 0 16px;font-weight:bold;font-size:20px;color:#333;line-height:29px;clear:both}
.tit_section.fst{padding-top:14px}
.tit_section .desc{padding-left:13px;font-size:14px;color:#666;vertical-align:3px}
.order_section{overflow:hidden;letter-spacing:-0.3px}
.order_section .btn{overflow:hidden;height:30px;padding-bottom:3px;border:1px solid #FF5C58;border-radius:3px;background-color:#fff;font-weight:bold;font-size:12px;color:#FF5C58;line-height:18px;text-align:center}
.order_section .btn.normal{border:1px solid #999}
.order_section .btn.default{border:1px solid #ddd;color:#333}
.order_section .address .default{display:none;width:74px;height:22px;margin:1px 0 7px;border-radius:11px;background-color:#f4f4f4;font-weight:700;font-size:12px;color:#666;line-height:20px;text-align:center;}
.order_section .address .default.on{display:block}
.order_section .badge{display:inline-block;font-size:14px;line-height:24px}
.order_section .information{font-size:12px;padding-left:6px;color: #666}
.order_section .badge.default{display:none}
.order_section .badge.star{color:#FF5C58}
.order_section .badge.regular{color:#999}
.order_section .badge.none{color:#f03f40}
.order_section .section_crux{float:left;width:190px;padding-top:19px;font-weight:bold;font-size:14px;color:#333;line-height:24px;letter-spacing:-0.32px}
.order_section .section_full{overflow:hidden;padding:19px 20px 20px 0}
/* 레이어타입_리스트타입 */
.layer_selectbox{display:none;position:absolute;z-index:1;left:0;top:63px;width:100%;background-color:#fff;border:1px solid #999}
.layer_selectbox .open {display: block;}
.layer_selectbox li{padding:13px 30px 14px 37px;border-top:1px solid #999;font-size:12px;line-height:18px;letter-spacing:-0.2px}
.layer_selectbox li.fst{border-top:0 none}
.layer_selectbox li.checked{background:url(https://res.kurly.com/pc/service/order/1908/ico_check_32x20.png) no-repeat 10px 18px;background-size:16px 10px}
.layer_selectbox li:hover{background-color:#f7f7f7;cursor:pointer}
/* 공통 셀렉박스 레이어 타입 */
.select_box{position:relative;height:44px;padding:0 54px 0 15px;border:1px solid #ddd;background-color:#fff;font-size:14px;color:#333;line-height:40px;letter-spacing:-0.5px;vertical-align:top}
.select_box:after{content:"";position:absolute;right:16px;top:50%;width:12px;height:8px;margin-top: -4px;background:url(https://res.kurly.com/pc/ico/2011/ico_selectbox_arrow.svg) no-repeat 50% 50%;background-size:12px 8px}
.select_box.off{background-color:#fafafa;color:#ccc}
.select_box.off:after{background:#fafafa url(https://res.kurly.com/pc/ico/2011/ico_selectbox_arrow_off.svg) no-repeat 50% 50%;background-size:12px 8px}
    
/* 주문자정보 */
.data_orderer .goodsinfo_table .fst th{padding-top:19px; text-align: left;}
.data_orderer .goodsinfo_table .fst td{padding-top:19px}
.data_orderer .txt_guide{padding:16px 0 8px}
.data_orderer .no_orderer{margin-bottom:10px}
.data_orderer .no_orderer th{padding-top:18px}
.data_orderer .no_orderer .fst th{padding-top:28px}
.data_orderer .no_orderer td{padding:10px 0}
.data_orderer .no_orderer .fst td{padding-top:20px}
    
/* 배송정보_배송정보안내레이어 */
.address_info{position:relative;}
.address_info .desc{position:absolute;right:0;top:-42px;font-weight:700;font-size:14px;color:#999;line-height:24px;text-align:right;}
.address_info .desc:after{content:"";display:inline-block;width:24px;height:24px;background:url(https://res.kurly.com/pc/service/order/2011/ico_question.svg?v=1) no-repeat 50% 50%;background-size:24px 24px;vertical-align:top}
.address_info .layer_info{position:absolute;right:0;top:-7px;width:188px;height:60px;padding:14px 36px 14px 14px;border-radius:6px;background-color:#b277fe;font-size:12px;color:#fff;line-height: 17px;opacity:0;
transition: opacity 0.3s;
-webkit-transition: opacity 0.3s;
-moz-transition: opacity 0.3s;
-ms-transition: opacity 0.3s;
-o-transition: opacity 0.3s;
}
.address_info .layer_info.on{opacity:1}
.address_info .layer_info:before {content:"";position:absolute;right:54px;top:-9px;width:18px;height:16px;background:url(https://res.kurly.com/pc/service/order/2011/ico_location_picker.svg) no-repeat 100% 50%;background-size:18px 16px}
.address_info .layer_info:after {content:"";position:absolute;right:14px;top:13px;width:16px;height:17px;background:url(https://res.kurly.com/pc/service/order/2011/ico_tooltip_close.svg) no-repeat 100% 50%;background-size:16px 17px}
.address_info .layer_info .emph{font-weight:700;color:#fff}
/* 배송정보_배송지 */
.order_address{border-top:1px solid #333;border-bottom:1px solid #f4f4f4}
.order_address .address.off{display:block;padding-top:1px;font-size:14px;color:#ccc;line-height:20px}
.order_address.invalid .address.off{color:#f03f40}
.order_address .addr{display:block;font-size:14px;color:#333;line-height:24px}
.order_address .num{white-space:nowrap}
.order_address .receiving{display:block;padding-top:6px;font-size:14px;color:#666;line-height:20px}
.order_address .btn{display:block;width:60px;margin-top:13px}
/* 배송정보_수령장소 */
.order_reception .receiving{font-size:14px;color:#333;line-height:24px}
.order_reception .receiving.off{color:#ccc}
.order_reception .way{padding-top:9px}
.order_reception .way .place{font-size:14px;color:#666;line-height:24px}
.order_reception .way .txt{font-size:14px;color:#666;line-height:24px}
.order_reception .way .txt:before{content:"";display:inline-block;width:1px;height:14px;margin:0 6px 0 9px;background-color:#ddd;vertical-align:-3px}
.order_reception .way .txt.off:before{display:none}
.order_reception .way .no_before:before{display:none}
.order_reception .way .off{color:#ccc}
/* .order_reception .way .should_update_details{color:#f03f40} */
.order_reception .btn{display:block;width:60px;margin-top:20px}
.order_reception.invalid .receiving.off,
.order_reception.invalid .way .off{color:#f03f40}

    
/* 쿠폰 / 적립금 */
.data_payment{float:left}
.data_payment .goodsinfo_table{border-bottom:0 none}
.data_payment th{padding-top:29px}
.data_payment th.no_emoney{padding-top:20px}
.data_payment td{padding:20px 0}
/* 쿠폰적용 */
.data_payment .txt_couponinfo{padding:4px 0 0 1px;color:#f00}
.data_payment .txt_inquiry{padding-top:17px}
.data_payment .txt_inquiry .link{padding-right:11px;background:url(https://res.kurly.com/pc/ico/2011/ico_outlink.svg) no-repeat 100% 50%;background-size:6px 9px;font-size:12px;color:#FF5C58;line-height:22px;}
#addpopSelList .txt_apr,#addpopSelList .txt_is_dc{display:inline-block;font-weight:700;font-size:14px;line-height:1.43px;color:#333}
#addpopSelList .txt_apr.coupon_na,#addpopSelList .txt_is_dc.coupon_na,#addpopSelList .txt_tit.coupon_na,#addpopSelList .txt_desc.coupon_na,#addpopSelList .txt_expire.coupon_na{color:#777}
#addpopSelList .inner_item{display:table;font-size:14px}
#addpopSelList .item_row{display:table-row}
#addpopSelList .item_td.left{display:table-cell;width:110px}
#addpopSelList .item_td{display:table-cell}
#addpopSelList .txt_tit{padding-bottom:6px;font-weight:700}
#addpopSelList .txt_desc,#addpopSelList .txt_expire{font-size:12px}
#addpopSelList span{display:block}
#addpopSelList .inner_item.disabled{color:#777}
/* 적립금적용 */
.data_payment .emoney_use{border-top: 1px solid #f4f4f4}
.data_payment .emoney_use .emoney_reg{overflow:hidden}
.data_payment .emoney_use input[name="using_point"]{float:left;width:168px;margin-right:8px}
.data_payment .emoney_use input[type="checkbox"]{position:absolute;opacity:0}
.data_payment .emoney_use .emoney_chkbox{float:left;width:100px;height:44px;padding:10px 0 0;border:1px solid #ddd;border-radius:3px;background:#fff;font-weight:bold;font-size:14px;color:#333;line-height:20px;text-align:center;letter-spacing:0;cursor:pointer}
.data_payment .emoney_use .possess{padding-top:10px;font-size:14px;color:#666;line-height:20px}
.data_payment .emoney_use .possess .emph{font-weight:bold;color:#333}
.data_payment .emoney_use .list_notice{padding-top:16px}
.data_payment .emoney_use .list_notice li{padding-top:4px;font-size:12px;color:#666;line-height:18px;letter-spacing:-0.2px}
    
/* 결제금액_sticky */
.tax_absolute{position:relative;float:right;width:284px;height:0}
.tax_absolute .inner_sticky{position:absolute;right:0;top:0;width:100%}
#orderitem_money_info{width:100%;padding:17px 16px 18px 18px;background:#fafafa;border:1px solid #f2f2f2}
#orderitem_money_info .amount{overflow:hidden;padding-top:12px;letter-spacing:-0.5px}
#orderitem_money_info .fst{padding-top:0;padding-bottom:4px}
#orderitem_money_info .lst{margin:17px 0 0 0;padding-top:15px;border-top:1px solid #eee}
#orderitem_money_info .lst .tit{padding-top:2px}
#orderitem_money_info .tit,
#orderitem_money_info .lst .price .won,
#orderitem_money_info .price{font:normal 16px/24px 'Noto Sans';vertical-align:top}
#orderitem_money_info .lst .price .won{vertical-align:2px}
#orderitem_money_info .tit{float:left;width:96px}
#orderitem_money_info .price{float:right;width:144px;text-align:right}
#orderitem_money_info .price .emph{color:#FF5C58}
#orderitem_money_info .price .small{font-size:12px}
#orderitem_money_info .sub{padding-top:8px}
#orderitem_money_info .sub .tit,
#orderitem_money_info .price .normal,
#orderitem_money_info .sub .price{font-weight:normal;font-size:14px;color:#999;line-height:20px}
#orderitem_money_info .sub .tit{padding-left:16px;background:url(https://res.kurly.com/pc/service/order/2011/ico_sub_price_dot.svg) no-repeat 0 0;background-size:16px 20px}
#orderitem_money_info .lst .price{font-weight:bold;font-size:22px;line-height:28px}
#order_notice_section{
        display: none;
        width: 284px;
        padding: 22px 0;
        text-align: center;
        border: solid 1px #f2f2f2;
        border-top: none;
        background-color: #fff;
        color: #333;
        letter-spacing: -0.5px;
}
#order_notice_section .emph{
        font-weight: 600;
        color: #f03f40;
        letter-spacing: -0.5px;
}
#order_notice_section .courier_notice{
        display: block;
        margin-top: 2px;
        font-size: 12px;
        line-height: 18px;
        letter-spacing: -0.5px;
        color: #999;
}
.tax_absolute .reserve{display:none;padding:16px 3px 0 0;font-size:12px;color:#666;line-height:16px;letter-spacing:0;text-align:right}
.tax_absolute .reserve .ico{display:inline-block;width:30px;height:18px;margin-right:5px;border:1px solid #ffbf01;border-radius:9px;background-color:#ffbf00;font-size:10px;color:#fff;line-height:15px;text-align:center;vertical-align:top}
.tax_absolute .reserve .emph,
.tax_absolute .reserve .emph span{font-weight:700;color:#666}
.pm_sign{display:none;margin-right:4px}
    
/* 포장방법 */
.reusable_packaging .tit_section{border-bottom: 1px solid #333}
.reusable_packaging .label_radio{display:block;}
.reusable_packaging .label_radio + .label_radio{margin-top:20px}
    
/* 결제수단 */
.data_method{float:left}
.data_method .goodsinfo_table th{padding:29px 0 10px}
.data_method .goodsinfo_table td{padding:20px 0 0}
.data_method .goodsinfo_table .txt_notice{padding:26px 0 0}
.data_method .goodsinfo_table .txt_notice ul{margin-bottom:-2px}
.data_method .goodsinfo_table .txt_notice li{font-size:12px;color:#666;line-height:22px;letter-spacing:-0.2px}
.data_method .goodsinfo_table .txt_notice li a{padding-right:11px;background:url(https://res.kurly.com/pc/ico/2011/ico_outlink.svg) no-repeat 100% 50%;background-size:6px 9px;color:#FF5C58}
.data_method .goodsinfo_table .credit_montly_wrap {padding-top: 9px;}
.data_method .goodsinfo_table .credit_montly_wrap .title {font-size: 14px; font-weight: 500;font-stretch: normal;}
.data_method .goodsinfo_table .credit_montly_wrap .guide {margin-top: 8px;font-size: 13px;color:#808080;}
.data_method .goodsinfo_table #only_kakao {display: none;}
.data_method .goodsinfo_table #only_kakao .kakaopay_benefit_icon {display: none;margin-left: 4px;font-size: 13px;font-weight: 600;color: #fa622f;}
/* 결제수단저장 */
.data_method .type_form{display:none;position:relative}
.data_method .type_form label{position:absolute;right:1px;top:-41px;color:#333;}
.data_method .type_form input[type="checkbox"] + .ico{margin-right:5px}
/* 결제메뉴선택-카카오페이,정기결제 */
.data_method .payment_first label,
.data_method .menu_payment label{position:relative;cursor:pointer}
.data_method .payment_first input[type="radio"],
.data_method .menu_payment input[type="radio"]{position:absolute;opacity:0}
.data_method .icon_benefit{display:none;position:absolute;left:10px;top:-8px;padding:0 6px 1px 6px;border-radius:9px;border:1px solid #fa622f;background-color:#fff;font-weight:bold;font-size:10px;color:#fa622f;line-height:14px}
.data_method .payment_first .icon_benefit{top:-9px}
.data_method .on .icon_benefit{left:12px;top:-7px}
.data_method .simple.on .icon_benefit{left:11px}
.data_method .payment_first.on .icon_benefit{left:11px;top:-8px}
.data_method .logo_kakao{display:block;width:50px;margin:0 auto 0;}
.data_method .payment_first .card,
.data_method .payment_first .kakaopay{display:block;width:414px;height:48px;padding-top:13px;border-radius:3px;border:1px solid #ddd}
.data_method .payment_first.on .kakaopay{padding-top:14px;border:none;background-color:#f6e500;}
.data_method .payment_first.on .card{padding-top:15px;border:none;background-color:#FF5C58;font-size:14px;color:#fff;line-height:18px;letter-spacing:0;text-align:center;}
.data_method .payment_first .notice_card{padding-top:13px;font-size:13px;color:#FF5C58;line-height:16px;letter-spacing:-0.32px}
.data_method .payment_first .notice_card.kakao{display:none}
/* 결제메뉴 */
.data_method .menu_payment {height:48px;margin-top:12px}
.data_method .menu_payment:after{content:"";display:block;overflow:hidden;width:100%;height:0;clear:both}
.data_method .menu_payment li{position:relative;float:left;width:138px;height:48px;border: 1px solid #ddd}
.data_method .menu_payment .card{border-radius:3px 0 0 3px}
.data_method .menu_payment .card label{border-radius:3px 0 0 3px}
.data_method .menu_payment .simple{border-left: none;border-radius:0 0 0 0}
.data_method .menu_payment .phone{border-left: none;border-radius:0 3px 3px 0}
.data_method .menu_payment .phone label{border-radius:0 3px 3px 0}
.data_method .menu_payment label{position:absolute;left:-1px;top:-1px;width:100%;height:48px;padding:11px 0 0;text-align:center}
.data_method .menu_payment .on{padding:0;}
.data_method .menu_payment .on label{width:139px;margin-left:-1px;background-color:#FF5C58;color:#fff}
.data_method .menu_payment .card.on label{width:139px;margin-right:-1px}
.data_method input[type="checkbox"] {opacity: 0}
/* 카드혜택 */
.data_method .benefit_event .benefit.on{position:relative;padding-bottom:14px}
.data_method .benefit_event .benefit.on:after{content:"";position:absolute;right:0;bottom:-10px;width:742px;height:1px;background-color:#f4f4f4}
.data_method .benefit_event .tit_benefit{display:block;padding-top:18px}
.data_method .benefit_event .tit_benefit span,
.data_method .benefit_event .tit_benefit{font-weight:700;font-size:12px;color:#333;line-height:17px;letter-spacing:-0.26px}
.data_method .benefit_event .sub_benefit{margin-bottom:-2px;padding-top:4px;font-weight:700;font-size:12px;color:#4c4c4c;line-height:18px;letter-spacing:-0.3px}
.data_method .benefit_event .info_benefit{padding-top:3px}
.data_method .benefit_event .info_benefit .info{display:block;font-size:12px;color:#666;line-height:20px;letter-spacing:-0.3px;word-break: break-all}
.data_method .benefit_event .kakao .tit_benefit{padding-top:23px}
.data_method .benefit_event .kakao .info_benefit{padding-top:1px}
/* 신용카드카드선택 */
#cardSelect{padding-top:14px}
#cardSelect .card_select:after{content:"";display:block;overflow:hidden;height:0;clear:both}
#cardSelect .select_box{height: auto;padding: 0;border: none;margin-top:10px;}
#cardSelect .select_box:after {display: none;}
#cardSelect .select_box .tit{display:block;overflow:hidden;width:276px;height:44px;padding:0 30px 0 15px;border:1px solid #ddd;background:#fff  url(https://res.kurly.com/pc/ico/2011/ico_selectbox_arrow.svg) no-repeat 248px 50%;background-size:12px 8px;font-weight:400;font-size:14px;color:#333;line-height:40px;letter-spacing:-0.5px}
#cardSelect .select_box .tit.off{border:1px solid #ddd;background:#fff  url(https://res.kurly.com/pc/ico/2011/ico_selectbox_arrow_off.svg) no-repeat 248px 50%;background-size:12px 8px;color:#999}
#cardSelect .select_box .list{display:none;position:absolute;left:0;top:43px;width:276px;padding:12px 0;border:1px solid #999;background-color:#fff;}
#cardSelect .select_box .list.on{display:block;z-index:1}
#cardSelect .select_box .list.off{display:none}
#cardSelect .select_box a{display:block;padding:2px 0 2px 15px;font-size:13px;color:#808080;line-height:20px;letter-spacing:-0.19px;cursor:pointer}
#cardSelect .select_box a.on{font-weight:700;color:#570080}
#cardSelect .select_box a:hover{background-color:#f5f5f5;font-weight:700;color:#570080}
#cardSelect .card_point{padding-top:12px}
#cardSelect .card_noti{padding:4px 0 3px;font-size:12px;color:#808080;line-height:22px;letter-spacing:-0.23px}
/* 간편결제 */
.data_method .payments{display:flex;flex-wrap:wrap;padding:9px 0 10px}
.data_method .payments li{width:280px;padding-top:20px}
.data_method .payments li:nth-child(even){width:268px}
.data_method .payments .txt_benefit{display:none;padding-left:2px;font-size:13px;color:#fa622f;line-height:20px;letter-spacing:0;vertical-align:1px}
    
/* 개인정보수집및제공 */
.reg_agree .desc{overflow:auto;height:110px;padding:20px;margin-bottom:10px;background-color:#fff;border:1px solid #bfbfbf;line-height:20px}
/* 개인정보처리방침 */
.user_form .txt_guide .txt .txt_desc{font-weight:500}
.user_form .btn_payment{display:block;width:240px;height:56px;margin:40px auto 0;padding-bottom:2px;border:0 none;border-radius:3px;background-color:#FF5C58;font-weight:700;font-size:16px;color:#fff}
.user_form .reg_agree{position:static}
.user_form .goodsinfo_table .reg_agree{padding:19px 0 18px;border-bottom:1px solid #f4f4f4}
.user_form .goodsinfo_table .agree_check{font-weight:700;font-size:18px;color:#333;line-height:24px}
.user_form .goodsinfo_table .agree_check .ico{margin-right:9px;vertical-align:-6px}
.user_form .goodsinfo_table .list_agree{overflow:hidden;width:100%;padding-top:5px;clear:both}
.user_form .goodsinfo_table .list_agree li{padding-top:4px}
.user_form .goodsinfo_table .list_agree .subject{display:inline-block;width:310px;padding-left:36px;font-size:13px;color:#333;line-height:20px;letter-spacing:-0.4px;vertical-align:0}
.user_form .goodsinfo_table .list_agree .subject .emph{color:#999}
.user_form .goodsinfo_table .list_agree .link_terms{padding-right:11px;background:url(https://res.kurly.com/pc/ico/2011/ico_outlink.svg) no-repeat 100% 50%;background-size:6px 9px;color:#FF5C58}
/* 팝업 */
.user_form .goodsinfo_table .inner_layer .tit_layer,
.user_form .goodsinfo_table .inner_layer button{display:none}
.user_form .goodsinfo_table .layer{position: relative;z-index: 9999}
.user_form .goodsinfo_table .layer .choice_agree{position: fixed;left: 50%;top: 50%;width: 440px;height:600px;margin:-300px 0 0 -220px;border-radius: 6px;background-color: #fff}
.user_form .goodsinfo_table .layer .view_terms .box_tbl{height:388px;padding-bottom:10px}
.user_form .goodsinfo_table .layer .view_pg .box_tbl{height:388px}
.user_form .goodsinfo_table .layer .tit_layer{display:block;height:132px;font-size:30px;font-weight: 700;padding:30px 50px 0 30px;line-height:40px;color:#333}
.user_form .goodsinfo_table .layer .tit_layer .emph{color:#999}
.user_form .goodsinfo_table .layer .box_tbl{overflow:hidden;overflow-y:auto;padding: 0 30px;color:#333}
.user_form .goodsinfo_table .layer .btn_ok{margin-top:0;font-weight:bold}
.user_form .goodsinfo_table .layer .box_tbl th{padding:5px;background-color: #f7f5f8;border:1px solid #dddfe1;text-align: center}
.user_form .goodsinfo_table .layer .box_tbl th.emph{text-decoration:underline}
.user_form .goodsinfo_table .layer .box_tbl thead th{border-bottom:0 none;vertical-align:middle}
.user_form .goodsinfo_table .layer .box_tbl td{padding:5px}
.user_form .goodsinfo_table .layer .box_tbl .less_emph{color:#666;}
.user_form .goodsinfo_table .layer .tbl_desc{color:#999}
.user_form .goodsinfo_table .layer .box_tbl .narrow_emph{line-height:16px; margin-top:8px; font-weight:700;}
.user_form .goodsinfo_table .layer .txt_service{padding:0;color:#999}
.user_form .goodsinfo_table .layer .btn_close{position: absolute;right:26px;top:36px;width: 32px;height: 32px;border: 0 none;background: url(https://res.kurly.com/pc/ico/1908/ico_layer_close.png) no-repeat 0 0}
.user_form .goodsinfo_table .terms_view{margin-top:20px;font-size:14px;color:#514859;line-height:20px}
.user_form .goodsinfo_table .terms_view .tit_main{font-weight:700;font-size:18px}
.user_form .goodsinfo_table .terms_view .tit_sub{display:block;padding:20px 0 10px}
.user_form .goodsinfo_table .terms_view .normal{font-weight:normal}
.user_form .goodsinfo_table .terms_view:last-child .tit_sub{font-weight:normal}
.user_form .goodsinfo_table .terms_view:last-child .tit_sub.emph{font-weight:bold}
    
/* 주문서 - 확인사항 */
.notice_order{padding-top:30px;}
.notice_order li{font-size:14px;color:#666;line-height:20px;text-align:center}
.notice_order li.emph{color:#333}
.notice_order .emph{font-weight:700}

/* 주문서 히든영역 */
.screen_out {
    display: block;
    overflow: hidden;
    position: absolute;
    left: -9999px;
    width: 1px;
    height: 1px;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
}
</style>
</head>
<body>
<c:import url="../common/menubar.jsp"/>	

<!-- 받아오는목록 start -->
<!-- 결제 목록 -->
<form id="form" name="frmOrder" action="dOrderEnd.or" method="post" class="order_view">
       
          <input type="hidden" value="${cart.cartNo}" name="cartNo">
          <input type="hidden" value="${ cart.productName }" name="productName">
          <input type="hidden" value="${ cart.productPrice }" name="productPrice">
          <input type="hidden" value="${ cart.productAmount }" name="productAmount">
          <input type="hidden" value="${ cart.emailId }" name="emailId">
          <input type="hidden" value="${ cart.productNo}" name="productNo">
       
       
            	
       <div>
         <c:set var="total" value="0"/>
         
           <c:set var="total" value="${total + (cart.productAmount * cart.productPrice) }"/>            				
      </div>
      
            
          

<!-- 받아오는 목록 ends -->
    <div class="tit_page">
        <h2 class="tit">주문서</h2>
    </div>

    <div id="main">
        <div id="content">
        
        <div class="user_form">
        <script id="delivery"></script>
        
        
        <!-- 할인가격이 없으므로 class = price하나만 사용  -->
        
        <h2 class="tit_section fst">주문상품</h2>
        <div id="itemList" class="page_aticle order_goodslist"><div class="info_product"><a class="btn" href="#none"><span class="screen_out">펼침 / 닫힘</span></a>
          <div class="short_info">${cart.productName}     <span class="num">${cart.productAmount}개</span>상품을 주문합니다.</div></div>
          <ul class="list_product">
            
            
            <c:set var="eaCost" value="${( cart.productAmount) * (cart.productPrice) }"/>
            <li>
              <div class="thumb"><img src="${ contextPath }/resources/productImgUploadFiles/${ image.changeName }" alt="상품이미지"></div>
              <div class="name">
                <div class="inner_name">${ c.productName }</div>
              </div>
              <div class="ea">${ cart.productAmount }개</div>
              <div class="info_price">
                <span class="num">
                  <span class="price"><fmt:formatNumber value="${eaCost}" pattern="#,###" /></span>
                  <!-- <span class="cost"></span> -->
                </span>
              </div>
            </li>
           
          </ul>
         </div>
        
          
        
       
        <div id="apply_coupon"></div>
        <input type="hidden" name="apr_coupon_data" value="">
        
        <h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
        <div class="order_section data_orderer">
        <table class="goodsinfo_table ">
        <tbody><tr class="fst">
        <th>보내는 분</th>
        <td>
        ${loginUser.name}
        <input type="hidden" name="orderer_name" value="${loginUser.name}">
        </td>
        </tr>
        <tr>
        <th>휴대폰</th>
        <td>
        ${loginUser.phone}
        <input type="hidden" name="orderer_phone" value="${loginUser.phone}">
        </td>
        </tr>
        <tr>
        <th>이메일</th>
        <td>
        <input type="hidden" id="email" name="email" value="${loginUser.email}" option="regEmail">
        ${loginUser.email}
        <p class="txt_guide">
        <span class="txt txt_case1">이메일을 통해 주문처리과정을 보내드립니다.</span>
        <span class="txt txt_case2">정보 변경은 <span class="txt_desc">마이페이지 &gt; 개인정보 수정</span> 메뉴에서 가능합니다.</span>
        </p>
        </td>
        </tr>
        </tbody></table>
        </div>
        
        <div id="deliveryInformation" class="off">
        
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
        <span class="addr" id="addrInfo">${loginUser.address}</span>
        <input type="hidden" value="${loginUser.address}" name="address">
        <span class="tag" id="addrTags">
        <span class="badge star" id="addrBadge"></span>
        <span class="information" id="courierInformation"></span>
        </span>
        </span>
        </div>
        </div>
        
        <div class="order_section order_reception" id="divReception">
        <h3 class="section_crux">
         요청사항
        </h3>
        <div class="section_full">
        
        <div class="receiving off" id="receiverInfo"><input type="text" placeholder="요청사항을 입력해 주세요" name="orderRequest" required="required"></div>
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
        <dd class="price"><span id="productsTotalPrice"><fmt:formatNumber value="${total}" pattern="#,###" /></span> 원</dd>
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
        
        <input type="hidden" name="coupon" size="12" value="0" readonly>
        </dd>
        </dl>

        <!-- 포인트 부분 -->
        <dl class="amount">
        <c:set var="pointUse" value="0"/>
        <input type="hidden" value="${pointUse}" name="pointUse">
        <dt class="tit">적립금사용</dt>
        <dd class="price">
        <span class="num pay_sum" id="paper_reserves"><fmt:formatNumber value="${pointUse}" pattern="#,###" /> 원</span>
        <input type="hidden" name="coupon_emoney" size="12" value="0" readonly>
        </dd>
        </dl>
        <dl class="amount lst">
        <dt class="tit">최종결제금액</dt>
        <dd class="price">
        <span id="paper_settlement"><fmt:formatNumber value="${(total)-(pointUse)}" pattern="#,###" /></span>
        <input type="hidden" value="${(total)-(pointUse)}" name="totalPrice">
        <span class="won">원</span>
        </dd>
        </dl>
         <c:set var="pointPlus1" value="${((total)-(pointUse)) / 100 }"/>
		<fmt:formatNumber var="pointPlus2" value="${pointPlus1}"  maxFractionDigits="0" type="number"/>
		<input type="hidden" value="${pointPlus2}" name="pointPlus2">
        <p class="reserve" style="display: block;">
        <span class="ico">적립</span> 구매 시 <span class="emph"><span id="expectAmount"><fmt:formatNumber value="${pointPlus2}" pattern="#,###" /></span> 원 (<span class="ratio">1</span>%) 적립</span>
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
        <input type="button" value="<fmt:formatNumber value="${(total)-(pointUse)}" pattern="#,###" />원 결제하기" class="btn_payment" onclick="requestPay()">
        </form>
 <!--버튼클릭시 펑숀 시작 -->
 
 <!--값받아오는것 체크  -->
 <script>
 
 function varCheckForm() {
	var email = $('input[name=email]').val();
	console.log(email)
	if(email == "king"){
		return true;
	} else{
		return false;
	}
}
 </script>
 
 <!--	결제 script start	 -->
 <script>
 function requestPay(){
		//가맹점 식별코드
		IMP.init('imp43161622');
		var name = $('input[name=orderer_name]').val();
		var email = $('input[name=email]').val();
		var amount = $('input[name=totalPrice]').val();
		var tel = $('input[name=orderer_phone]').val();
		var address =$('input[name=address]').val();
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '상품1' , //결제창에서 보여질 이름
		    amount : amount, //실제 결제되는 가격
		    buyer_email : email,
		    buyer_name : name,
		    buyer_tel : tel,
		    buyer_addr : address,
		    buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '결제 금액 : ' + rsp.paid_amount;
		    	
		        $('form[name=frmOrder]').submit();
			   
		       
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		         return false;
		    }
		    alert(msg);
		});
	}
  </script>
 <!--	결제 script ends  -->
        
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