<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html style="width: 375px; margin: 0 auto;">
<head>
<meta charset= "UTF-8">
<title>Ori_Payment</title>
<script src="../../js/common/jquery-3.6.4.js"></script>
<script src="../../js/order/paymentPage.js"></script>
<script src="https://kit.fontawesome.com/59f45736e5.js" crossorigin="anonymous"></script>
<link rel= "stylesheet" href= "../../css/order/order_paymentpage.css">
</head>
<body>
	<%--현재 날짜 출력--%>
	<%
		Date date = new Date();
		SimpleDateFormat date1 = new SimpleDateFormat("yyyyMMddhhmmss");
		String today = date1.format(date);
	%>
	<div id= "paymentpage_main">
		<form action="/order_paymentPage/${userId}" method="post">
			<input type="hidden" name="orderNumber" value="<%=today%>${userId}">
			<input type="hidden" name="orderUserId" value="${userId}">
			<input type="hidden" name="orderDate" value="<%=today%>">
			<div id="paymentpage_title">
				<%-- 전 페이지 돌아가기, (넘어올때 담겼던 orderItem은 여기서 삭제)--%>
				<a href="/cart/order_renew/${userId}"><i class="fas fa-solid fa-arrow-left" style="color: #46a973;"></i></a>
				<div id="paymentpage_title_inner">주문하기</div>
			</div>
			<div id= "paymentpage_section_1">
				<div id= "paymentpage_address">
					<input type="hidden" name="orderAddressNumber" value="${userAddress1}">
					${userAddress1}
				</div>
				<%--<div id= "paymentpage_btn_address_edit"><a>수정</a></div>--%>
			</div>
			<hr>
			<div style="text-align: right;"><a class="order_paymentPage_btn_filter1"><i class="fa-solid fa-caret-up" style="color: #ee9820;"></i></a></div>
			<div id= "paymentpage_section_2">
				<table id= "paymentpage_table_1">
					<tr class= "paymentpage_tr_1">
						<th colspan= "3">
							<c:forEach var="cartItems" items="${cartItemList}" varStatus="status">
							<c:if test="${status.index eq 1}">
							<input type="hidden" name = "orderMarketName" value="${cartItems.businessStore.market.marketName}" readonly>
							${cartItems.businessStore.market.marketName}
							</c:if>
						</th>
					</tr>

					<!-- 2023_07_02 같은 가게 물건이면?? 반복문 출력 고민 -->
					<!-- 반복문 출력 위치 -->
					<tr class= "paymentpage_tr_1">
						<th colspan= "3">
							<input type="hidden" name = "orderStoreName" value="${cartItems.businessStore.buStoreName}" readonly>
							${cartItems.businessStore.buStoreName}
						</th>
					</tr>

						<input type="hidden" name="businessUser" value="${cartItems.item.businessStore.businessUser.buUserNumber}">
						<input type="hidden" name="itemId" id="itemId" value="${cartItems.item.itemId}">
					<tr class= "paymentpage_tr_2">
						<td colspan="3" class= "paymentpage_td_1">
							<input type="hidden" name="orderGoodsName" value="${cartItems.item.itemName}" readonly>
								${cartItems.item.itemName}
						</td>
					</tr>
					<tr>
						<td colspan= "3" style= "text-align: center;">
							<input type="hidden" name="orderGoodsPrice" value="${cartItems.itemPrice}" readonly>
								${cartItems.itemPrice}
						</td>
					</tr>
					<tr>
						<td colspan= "3" style= "text-align: right;">
							<input type="hidden" name="orderGoodsNum" value="${cartItems.count}" readonly>
							${cartItems.count}개
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td style="color: #EE9820;">${cartItems.cart.deliveryType}</td>
					</tr>
					<!-- 반복문 출력 끝 -->
					<tr align="center">
						<td colspan="3" class= "paymentpage_td_2">
							<a href="/"><img id="paymentpage_img_plus" src="../../img/order/paymentpage_img_plus_1.png"></a>
						</td>
					</tr>
				</table>
				<table id= "paymentpage_table_2">
					<tr>
						<td>
							<input style="outline: none;border: none;" type="text" name="deliveryType" value="${cart.deliveryType}" readonly>
							${cart.deliveryType}
						</td>
					</tr>
					<tr class= "paymentpage_tr_3">
						<th colspan= "2">물건 금액</th>
						<td class= "paymentpage_td_3">
							<input type="hidden" name="orderGoodsTotalPrice" value="${cart.cartTotalPrice}" readonly>
							${cart.cartTotalPrice}원
						</td>
					</tr>
					<tr class= "paymentpage_tr_3" >
						<th colspan= "2">배달비</th>
						<td class= "paymentpage_td_3">
							<input type="hidden" name="orderDeliveryPrice" value="${cart.cartDeliveryPrice}" readonly>
							${cart.cartDeliveryPrice}원
						</td>
					</tr>
				</table>
				<table id= "paymentpage_table_3">
					<tr class= "paymentpage_tr_4">
						<th colspan= "2">총 결제 금액</th>
						<td class= "paymentpage_td_4">
							<input type="hidden" name="orderTotalPrice" value="${cart.cartTotalPrice+cart.cartDeliveryPrice}" readonly>
							${cart.cartTotalPrice+cart.cartDeliveryPrice}원
						</td>
					</tr>
				</table>
			</div>
			<hr>
			<!-- 2023_07_02 나중에 스크립트로 slide-up, down 적용하고 화살표 변경되도록 적용 -->
			<%-- 적용 완료 --%>
			<div id="paymentpage_btn_section_3"><a class="order_paymentPage_btn_filter2"><i class="fa-solid fa-caret-up" style="color: #ee9820;"></i></a></div>
			<div id="paymentpage_section_4">
				<p>요청사항</p>
				<div><input class="payment_section_4_input" name="orderRequests" type="text" placeholder="요청 사항을 입력해주세요."></div>
				<p>배달 기사님께</p>
				<div><input class="payment_section_4_input" name="forRider" type="text" placeholder="배달 기사님께 전달할 메세지를 입력해주세요."></div>
			</div>
			<hr>
			<div style="text-align: right;"><a class="order_paymentPage_btn_filter3"><i class="fa-solid fa-caret-up" style="color: #ee9820;"></i></a></div>
			<div id="paymentpage_div_section_5">
				<h2 style="color:#46a973;">결제수단</h2>
				<!-- 2023_07_02 버튼 클릭 시 css변경 및  정보 전달 방법 구상 -->
				<table id="paymentpage_section_5">
					<tr>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_1" class="paymentpage_btn_section_5" type="radio" name="orderType" value="creditcard" checked>
							<label for="paymentpage_radio_1">신용카드</label>
						</td>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_2" class="paymentpage_btn_section_5" type="radio" name="orderType" value="naverpay">
							<label for="paymentpage_radio_2">네이버페이 결제</label>
						</td>
					</tr>
					<tr>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_3" class="paymentpage_btn_section_5" type="radio" name="orderType" value="zeropay">
							<label for="paymentpage_radio_3">지역화폐</label>
						</td>
						<td style="height: 40px;width: 50%">
							<input id="paymentpage_radio_4" class="paymentpage_btn_section_5" type="radio" name="orderType" value="kakaopay">
							<label for="paymentpage_radio_4">카카오페이 결제</label>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<p>구매조건 확인 및 결제대행 서비스 동의</p>
				<div class="paymentpage_section_6_inner">
					오리 시장은 통신판매중개자로서 통신판매의 당사자가 아니며, 판매자가 등록한 상품 정보,
					상품의 품질 및 거래에 대해서 일체의 책임을 지지 않습니다. 회원은 주문 내용을 확인하였고,
					결제에 동의합니다.
				</div>
				<p>품질 취소 시 환불 안내</p>
				<div class="paymentpage_section_6_inner">
					주문하신 상품이 부득이하게 품절된 경우 결품 안내 드리고 있으며 결품 안내 후 답변 여부에 따라
					배송이 진행됩니다.
				</div>
			</div>
			<button id="paymentpage_btn_pay" type="submit">총 ${cart.cartTotalPrice+cart.cartDeliveryPrice}원 결제하기</button>
		</form>
	</div>
</body>
</html>