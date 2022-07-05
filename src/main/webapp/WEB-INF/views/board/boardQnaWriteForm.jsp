<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> TREND_EATER 문의하기 </title>

<!-- UIkit CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>

<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/board/boardQnaWriteForm.css">

</head>
<body>

<div class="head">
    <h2>1:1 문의</h2>
</div>

<div class="main">
    <form action="boardQnaWriteForm.bo" method="post">
	    <div class="QuesType">
	        <div class="uk-form-select innerQuesType" data-uk-form-select>
	            <div class="innerQuesTypeLeft">
	                <span>유형</span>
	            </div>
	            <div class="innerQuesTypeRight">
	                <select>
	                    <option value="1" name="1">주문/결제/반품/교환문의</option>
	                    <option value="2" name="2">이벤트/쿠폰/적립금문의</option>
	                    <option value="3">상품문의</option>
	                    <option value="4">배송문의</option>
	                    <option value="5">상품 누락 문의</option>
	                    <option value="6" name="6">기타문의</option>
	                </select>
	                <c:if test="${ name eq 1 }">
	                    <select>
	                        <option value="">주문취소 해주세요</option>
	                        <option value="">상품 반품을 원해요</option>
	                        <option value="">상품 교환을 원해요</option>
	                        <option value="">주문/결제는 어떻게 하나요?</option>
	                        <option value="">오류로 주문/결제가 안 돼요</option>
	                        <option value="">기타</option>
	                    </select>
	                </c:if>
	            </div>             
	        </div>
	    </div>
	    <div class="QuesProduct">
				<!-- 제품문의 선택 시 생기는 제품 카테고리 -->
	    </div>
	    <div class="QuesTitle">
	        <span>제목</span>
	        <input class="uk-input" name="qnaTitle">
	    </div>
	    <div class="QuesContent">
	        <span>내용</span>
	        <textarea class="uk-textarea" name="qnaContent" style="resize: none;"
	            placeholder=
	            "  1:1 문의 작성 전 확인해주세요
  
  반품 / 환불
  제품 하자 혹은 이상으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.

  주문취소
  [배송준비중] 이전까지 주문 취소 가능합니다.
  [마이페이지]에서 직접 취소하실 수 있습니다.
  생산이 시작된 [상품준비중] 이후에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.
  [배송준비중] 이후에는 취소가 불가하니, 반품으로 진행해주세요.(상품에 따라 반품 불가할 수 있음)
  주문마감 시간에 임박할수록 취소 가능 시간이 짧아질 수 있습니다.
  일부 예약상품은 배송3-4일 전에만 취소 가능합니다.

  ※주문 상품의 부분 취소는 불가능합니다. 전체 주문취소 후 다시 구매해주세요

  배송
  주문 완료 후 배송 방법은 변경 불가능합니다
  배송일 배송시간 지정은 불가능합니다.
  ※ 전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가 문의 내용에 저장되지 않도록 주의바랍니다.

"></textarea>

        
	    </div>
	
	    <div class="submitButton">
	        <button type="submit">등록</button>
	        <!-- <button type="submit" onclick="location.href='boardQnaWriteForm.bo'">등록</button> -->
	    </div>
	</form>
	
	
	<script>
	
	
	</script>

</div>


</body>
</html>