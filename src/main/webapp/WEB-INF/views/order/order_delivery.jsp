<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ori_Delivery</title>
<script src="https://kit.fontawesome.com/59f45736e5.js" crossorigin="anonymous"></script>
<link rel= "stylesheet" href= "../../css/order/order_delivery.css">
</head>
<body>
	<main id="orderDelivery_main">
		<div id="orderDelivery_btn_cancel"><a href="#"><i class="fas fa-regular fa-xmark"></i></a></div>
		<h2>실시간 주문 내역</h2>
		<ul id="orderDelivery_ing">
			<!-- 배달표시 circle 아이콘 -->
			<!-- 2023-07-04 스크립트로 값 들어오면 아이콘 변경되게 추후 적용 -->
			<!-- 2023-07-07 if문으로 색상 변경: -->
			<!-- 상품 준비중 -->
			<c:if test="${sessionScope.rts_order_ing eq 0 }">
				<li><i class="fa-sharp fa-regular fa-circle" style="color: #b8b8b8;"></i></li>
				<li class="orderDelivery_li_1">상품 준비중</li>
			</c:if>
			<c:if test="${sessionScope.rts_order_ing eq 1 }">
				<li><i class="fa-sharp fa-regular fa-circle" style="color: #b8b8b8;"></i></li>
				<li class="orderDelivery_li_1">상품 준비중</li>
			</c:if>
			<!-- 픽업중 -->
			<li><i class="fa-sharp fa-regular fa-circle" style="color: #b8b8b8;"></i></li>
			<li class="orderDelivery_li_1">픽업중</li>
			<!-- 배달중 -->
			<li><i class="fa-sharp fa-regular fa-circle" style="color: #b8b8b8;"></i></li>
			<li class="orderDelivery_li_1">배달중</li>
			<!-- 배달완료 -->
			<li><i class="fa-sharp fa-regular fa-circle" style="color: #b8b8b8;"></i></li>
			<li>배달 완료</li>
		</ul>
		<div id="orderDelivery_orderInfo">
			<h3>오리 시장</h3>
			<table id="orderDelivery_table_1">
				<tr class="orderDelivery_table_tr_1"><td>주문 번호</td></tr>
				<tr class="orderDelivery_table_tr_2"><td>202307040001</td></tr>
				<tr class="orderDelivery_table_tr_1"><td>배달 주소</td></tr>
				<tr class="orderDelivery_table_tr_2"><td>서울 특별시</td></tr>
			</table>
			<hr>
			<table id="orderDelivery_table_2">
				<tr class="orderDelivery_table_tr_1"><td colspan="2">주문 내역</td></tr>
				<!-- 2023_07_04 입력 받아서 출력할 때 format 이용해서 3번째마다 ,들어가게 출력 -->
				<tr class="orderDelivery_table_tr_2"><td>대파</td><td class="orderDelivery_table2_td_2">3,000원</td></tr>
				<tr class="orderDelivery_table_tr_2"><td>양파</td><td class="orderDelivery_table2_td_2">1,500원</td></tr>
			</table>
			<hr>
			<table id="orderDelivery_table_3">
				<tr><td class="orderDelivery_table3_td_1">요청사항</td><td class="orderDelivery_table3_td_1">아보카도는 숙성이 많이 된 걸로 주세요</td>
				<tr><td class="orderDelivery_table3_td_1">배달 기사님께</td><td class="orderDelivery_table3_td_1">집 앞에서 연락주세요.</td></tr>
				<tr><td id="orderDelivery_table3_total_td_1">총 금액</td><td id="orderDelivery_table3_total_td_2">23,000원</td></tr>
			</table>
			
		</div>
	</main>
</body>