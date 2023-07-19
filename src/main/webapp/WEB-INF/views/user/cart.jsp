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
		<form action="/search">
			<i class="far fa-solid fa-location-dot"></i>
			<p>${userAddress1}</p>
			<small id="cart_marketName">_시장이름</small>
			<input type="submit" value="변경">
		</form>
	</div>
	<form action="/paymentPage/${userId}" method="get">
		<div>
			<input type="checkbox" id="cboxAll" name="cboxAll" checked="checked" onclick="checkAll()">
			전체선택
		</div>
		<div id="cart_itemList">
			<ul>
				<%--반복문시작--%>
				<%--<c:forEach var="items" items="cartItemList">--%>
				<article>
					<h1>가게1</h1>
					<!-- 같은 가게 안에서 상품리스트(where='가게이름'아니면'가게식별번호')쿼리 -->
					<ul>
						<c:forEach var="items" items="${cartItemList}" varStatus="status">
							<li>
								<div class="cart_info">
									<input type="checkbox" name="cbox"  class="individual_checkbox" checked="checked">
										<input type="hidden" class="individual_totalCount" value="${items.count}">
										<input type="hidden" class="individual_itemPrice" value="${items.itemPrice}">
										<input type="hidden" class="individual_totalPrice" value="${items.count*items.itemPrice}">
									<!-- 상품이미지나 상품타이틀을 클릭하면 상세페이지로 넘어간다(a태그) -->
									<a href="상품상세페이지">
										<div class="cart_itemImg">
											<img src="../../img/user/cart_fish.png">
										</div>
										<div class="cart_itemTitle">
											<p>${items.item.getItemName()}</p>
										</div>
									</a>
										<input type="hidden" id="userId" value="${sessionScope.userId}">
										<input type="hidden" id="cartItemId" value="${items.cartItemId}">
										<button class="cart_xmark" onclick="deleteBtn(${items.cartItemId})"><i class="fas fa-regular fa-xmark"></i></button>

									<!-- 수량선택(-,+),가격표시 -->
									<div class="cart_itemDescription">
										<div class="cart_itemOption">
												<%--onclick="dec(currentCnt${status.index})"--%>
											<button onclick="minusBtn('${items.cartItemId}')"><i class="fas fa-solid fa-circle-minus"></i></button>
											<input type="text" size="1" name="currentCnt" id="currentCnt${status.index}" value="${items.count}">
											<button onclick="plusBtn('${items.cartItemId}')"><i class="fas fa-solid fa-circle-plus"></i></button>
										</div>
										<div class="cart_itemPrice">
											<input id="sellPrice_${status.index}" type="hidden" value="${items.itemPrice}">
											<span id="totalPriceCalSpan_${status.index}">
													${items.itemPrice * items.count}원
											</span>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</article>
				</li>
				<br>
				<%--</c:forEach>--%>
			</ul>
		</div>
		<div id="cart_moreBtn">
			<a href="store/detailmenu"><input type="button" value="+상품 더 담기"></a>
		</div>


		<!-- 포장/배달 선택하는 체크리스트 -->
		<div id="cart_checkDelivery">
			<ul>
				<li id="cart_chkDel"><a href="#cart_deliveryTotal">배달</a></li>
				<li id="cart_chkPick"><a href="#cart_pickTotal">포장</a></li>
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
				<tr><td>총 주문금액</td><td class="cart_cost_finalTotalPrice"></td></tr>
				<tr class="cart_totalPrice"><td>결제예정금액</td><td class="cart_cost_finalTotalPrice"></td></tr>
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

</script>


</body>
</html>