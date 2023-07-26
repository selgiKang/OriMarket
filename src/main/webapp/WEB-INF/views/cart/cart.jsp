<%@ page import="com.choongang.OriMarket.user.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.choongang.OriMarket.store.Item" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/1d53132cda.js" crossorigin="anonymous"></script>
<script src="../../js/common/jquery-3.6.4.js"></script>
<script src="../../js/user/cart.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/cart.css">

	<title>cart</title>
</head>
<body>
<div id="cart_container">
	<div id="cart_title">
		<button onclick="history.go(-1)"><i class="fas fa-regular fa-xmark"></i></button>
		<p style="display: inline-block; margin-left: 130px;">장바구니</p>
	</div>
	<div id="cart_location">
		<form action="/">
			<i class="far fa-solid fa-location-dot"></i>
			<p>${userAddress1}</p>
			<small id="cart_marketName">${marketName}</small>
			<input type="submit" value="변경">
		</form>
	</div>
	<form action="/paymentPage/${userId}" method="Post">
		<div>
			<input type="checkbox" id="cboxAll" name="cboxAll" checked="checked" onclick="checkAll()">
			전체선택
		</div>
		<div id="cart_itemList">
			<ul>
				<%--반복문시작--%>
				<c:set var="prevBuStoreName" value="" />
				<c:forEach var="orderList" items="${userOrderList}" varStatus="status">
					<c:if test="${!orderList.businessStore.buStoreName.equals(prevBuStoreName)}">
					<c:set var="prevBuStoreName" value="${orderList.businessStore.buStoreName}" />
					<div id="itemList">
						<h3>${orderList.businessStore.buStoreName}</h3>
					</c:if>
					<ul>
						<c:if test="${orderList.item.businessStore eq orderList.businessStore}">
						<c:forEach var="item" items="${orderList.businessStore.items}">
							<c:if test="${orderList.item eq item}">
								<li>
										<div class="cart_info">
											<input type="checkbox" name="cbox"  class="individual_checkbox" checked="checked">
											<input type="hidden" class="individual_totalCount" value="${orderList.count}">
											<input type="hidden" class="individual_itemPrice" value="${orderList.itemPrice}">
											<input type="hidden" class="individual_totalPrice" value="${orderList.count*orderList.itemPrice}">
											<!-- 상품이미지나 상품타이틀을 클릭하면 상세페이지로 넘어간다(a태그) -->
											<a href="상품상세페이지">
												<div class="cart_itemImg">
													<img src="../../img/store/item/${orderList.item.itemImageUrl}">
												</div>
												<div class="cart_itemTitle">
													<p>${orderList.item.itemName}</p>
												</div>
											</a>
											<input type="hidden" id="userId" value="${sessionScope.userId}">
											<input type="hidden" id="cartItemId" value="${orderList.cartItemId}">
											<button class="cart_xmark" onclick="deleteBtn(${orderList.cartItemId})"><i class="fas fa-regular fa-xmark"></i></button>

											<!-- 수량선택(-,+),가격표시 -->
											<div class="cart_itemDescription">
												<div class="cart_itemOption">
													<button type="button" onclick="minusBtn('${orderList.cartItemId}',${status.index})"><i class="fas fa-solid fa-circle-minus"></i></button>
													<input type="text" size="1" name="currentCnt" id="currentCnt${status.index}" value="${orderList.count}">
													<input type="hidden" name="itemCnt" id="itemCnt${status.index}" value="${orderList.item.itemCnt}">
													<button type="button" onclick="plusBtn('${orderList.cartItemId}',${status.index})"><i class="fas fa-solid fa-circle-plus"></i></button>
												</div>
												<div class="cart_itemPrice">
													<input id="sellPrice_${status.index}" type="hidden" value="${orderList.itemPrice}">
													<span id="totalPriceCalSpan_${status.index}">
													${orderList.itemPrice * orderList.count}원
													</span>
													<script>
														var user = (session.getAttribute("userId")).toString();
														//장바구니 수량
														var currentCnt = parseInt(document.getElementById("currentCnt${status.index}").value);
														//재고 수량
														var itemCnt = parseInt(document.getElementById("itemCnt${status.index}").value);

														if(itemCnt<currentCnt){
															alert("재고보다 수량이 많습니다.")
															document.getElementById("currentCnt${status.index}").value = itemCnt;
															window.location.href="/"+user+"/cart";
														}
													</script>
												</div>
											</div>
										</div>
									</li>
								</c:if>
							</c:forEach>
							</c:if>
					</ul>
					<c:if test="${!orderList.businessStore.buStoreName.equals(prevBuStoreName)}">
					</div>
					<br>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<div id="cart_moreBtn">
			<a href="/shinwon_marketmap"><input type="button" value="+상품 더 담기"></a>
		</div>


		<!-- 포장/배달 선택하는 체크리스트 -->
		<div id="cart_checkDelivery">
			<ul>
				<li id="cart_chkDel"><a href="#cart_deliveryTotal"><label for="deliverType1"><input type="radio" id="deliverType1" name="deliveryType" value="배달" checked>배달</label></a></li>
				<li id="cart_chkPick"><a href="#cart_pickTotal"><label for="deliverType2"><input type="radio" id="deliverType2" name="deliveryType" value="포장">포장</label></a></li>
			</ul>
		</div>
		<div id="cart_deliveryTotal" class="cart_section" style="display: none;">
			<!--배달 선택시 보여지는 div-->
			<table class="cart_costTable">
				<tbody>
				<tr><td>상품금액</td><td class="cart_cost_totalPrice"></td></tr>
				<tr><td>배달비</td><td class="cart_cost_deliveryPrice"></td></tr>
				<tr><td>총 주문금액</td><td class="cart_cost_finalTotalPrice"></td></tr>
				<tr class="cart_totalPrice"><td>결제예정금액</td><td class="cart_cost_finalTotalPrice"></td></tr>
				</tbody>
			</table>
		</div>
		<div id="cart_pickTotal" class="cart_section" style="display: none;">
			<!--포장 선택시 보여지는 div-->
			<table class="cart_costTable">
				<tbody>
				<tr><td>상품금액</td><td class="cart_cost_totalPrice"></td></tr>
				<tr><td>총 주문금액</td><td class="cart_cost_totalPrice"></td></tr>
				<tr class="cart_totalPrice"><td>결제예정금액</td><td class="cart_cost_totalPrice"></td></tr>
				</tbody>
			</table>
		</div>
		<br>
		<div id="cart_footer">
			<input type="submit" value="주문하기" onclick="goOrder()"></a>
		</div>
	</form>
</div>

<script src="../../js/user/cartcheck.js"></script>

<script type="text/javascript">
	// function goOrder(){
	// 	var chk = $('input[name="cbox"]');
	// 	if(chk.length==0){
	// 		return;
	// 	}
	// 		var cnt = 0;
	// 		$.each(chk,function (i,ch){
	// 			if($(ch).is(":checked")){
	// 				cnt++;
	// 				$('#currentCnt'+(i+1)).prop('disabled',false);
	// 			}else{
	// 				$('#currentCnt'+(i+1)).prop('disabled',true);
	// 			}
	// 			return "order/order_paymentPage"
	// 		});
	// 		if(cnt==0){
	// 			alert("주문할 상품을 체크하세요");
	// 			$('input[name=currentCnt]').prop('disabled',false)
	// 			return;
	// 		}
	//
	//
	// }

	//
	// function goOrder() {
	// 	var selectedItems = [];
	// 	$(".individual_checkbox").each(function (index, element) {
	// 		if ($(element).is(":checked") === true) {
	// 			// 선택된 항목의 cartItemId 값을 가져와 배열에 추가
	// 			var cartItemId = $(element).siblings('.cart_xmark').siblings('#cartItemId').val();
	// 			selectedItems.push(cartItemId);
	// 		}
	// 	});
	//
	// 	if (selectedItems.length === 0) {
	// 		alert("주문할 상품을 체크하세요");
	// 		return;
	// 	}
	//
	// 	// 서버로 AJAX 요청 보내기
	// 	$.ajax({
	// 		url: "/paymentPage/" + userId,
	// 		method: "POST",
	// 		data: JSON.stringify(selectedItems),
	// 		contentType: "application/json; charset=utf-8",
	// 		success: function (response) {
	// 			// 서버에서 받은 응답에 대한 처리 (예: 페이지 이동)
	// 			// 예시로는 주문페이지로 이동하는 코드를 작성합니다.
	// 			window.location.href = "/order/order_paymentPage";
	// 		},
	// 		error: function (xhr, status, error) {
	// 			// 오류 발생 시 처리
	// 			alert("주문하기 실패: " + error);
	// 		}
	// 	});
	// }

</script>



</body>
</html>