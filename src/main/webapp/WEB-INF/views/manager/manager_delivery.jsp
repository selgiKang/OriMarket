<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<div id="orderDelivery_btn_cancel"><a href="/managerMain"><i class="fas fa-regular fa-xmark"></i></a></div>
		<div id="orderDelivery_orderInfo">
			<h3>${marketName}</h3>
			<table id="orderDelivery_table_1">
				<tr class="orderDelivery_table_tr_1"><td>${orderDelivery.orderNumber}</td></tr>
				<tr class="orderDelivery_table_tr_2">
					<td>
						${fn:substring(orderDelivery.orderDate, 0, 4)}년
						${fn:substring(orderDelivery.orderDate, 4, 6)}월
						${fn:substring(orderDelivery.orderDate, 6, 8)}일
						${fn:substring(orderDelivery.orderDate, 8, 10)}시
						${fn:substring(orderDelivery.orderDate, 10, 12)}분
					</td>
				</tr>
				<tr class="orderDelivery_table_tr_1"><td>배달 주소</td></tr>
				<tr class="orderDelivery_table_tr_2"><td>${orderDelivery.orderAddressNumber}</td></tr>
			</table>
			<hr>
			<table id="orderDelivery_table_2">
				<tr class="orderDelivery_table_tr_1"><td colspan="2">주문 내역</td></tr>
				<!-- 2023_07_04 입력 받아서 출력할 때 format 이용해서 3번째마다 ,들어가게 출력 -->
				<c:set var="orderGoodsNumArray" value="${fn:split(orderDelivery.orderGoodsNum, ',')}" />
				<tr class="orderDelivery_table_tr_2">
					<td>${orderDelivery.orderGoodsName}</td>
					<tr>
						<c:forEach items="${orderGoodsNumArray}" var="goodNum">
							<td>${goodNum}개</td>
						</c:forEach>
					</tr>
				<c:set var="orderGoodsPrice" value="${fn:split(orderDelivery.orderGoodsPrice, ',')}" />
					<tr>
						<c:if test="${!empty orderGoodsNumArray}">
							${orderGoodsPrice[0]}원 <small style="color: #818083;">x${orderGoodsNumArray[0]}</small>
							${orderGoodsPrice[1]}원 <small style="color: #818083;">x${orderGoodsNumArray[1]}</small>
						</c:if>
						<c:forEach items="${orderGoodsPrice}" var="goodPrice">
							<c:forEach items="${orderGoodsNumArray}" var="goodNum">
								<td>${goodPrice}원&nbsp;&nbsp;<small style="color: #818083;">X ${goodNum}</small></td>
							</c:forEach>
						</c:forEach>
					</tr>
				</tr>
			</table>
			<hr>
			<table id="orderDelivery_table_3">
				<tr><td class="orderDelivery_table3_td_1">요청사항</td><td class="orderDelivery_table3_td_1">${orderDelivery.orderRequests}</td>
				<tr><td class="orderDelivery_table3_td_1">배달 기사님께</td><td class="orderDelivery_table3_td_1">${orderDelivery.forRider}</td></tr>
				<tr><td id="orderDelivery_table3_total_td_1">총 금액</td><td id="orderDelivery_table3_total_td_2">${orderDelivery.orderGoodsTotalPrice}원</td></tr>
			</table>
			
		</div>
	</main>
</body>
</html>
