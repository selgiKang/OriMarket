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
	<div>
		<input type="checkbox" id="cboxAll" name="cboxAll" onclick="checkAll()">
		전체선택
		<!--장바구니에 들어온 수량, 체크할때마다 카운트되는 수량..? -->
	</div>
	<div id="cart_itemList">
		<!-- 가게리스트 (그속에 해당 가게의 물품 리스트가 있어야 한다.)
            가게리스트 반복문 속에 상품리스트 반복문 구현..??
         -->
		<ul>
			<%--반복문시작--%>
			<%--<c:forEach var="items" items="cartItemList">--%>
			<article>
				<h1>가게1</h1>
				<!-- 같은 가게 안에서 상품리스트(where='가게이름'아니면'가게식별번호')쿼리 -->
				<ul>
					<c:forEach var="items" items="${cartItemList}" varStatus="status">
						<li>
							<div>
								<input type="checkbox" name="cbox" class="checkbox">
								<!-- 상품이미지나 상품타이틀을 클릭하면 상세페이지로 넘어간다(a태그) -->
								<a href="상품상세페이지">
									<div class="cart_itemImg">
										<img src="../../img/user/cart_fish.png">
									</div>
									<div class="cart_itemTitle">
										<p>${items.item.getItemName()}</p>
									</div>
								</a>
								<%--<a href="/${sessionScope.userId}/cart/${items.cartItemId}/delete/${items.itemPrice}">--%>
									<input type="hidden" id="userId" value="${sessionScope.userId}">
									<input type="hidden" id="cartItemId" value="${items.cartItemId}">
									<button class="cart_xmark" onclick="deleteBtn(${items.cartItemId})"><i class="fas fa-regular fa-xmark"></i></button>
								<%--</a>--%>

								<!-- 수량선택(-,+),가격표시 -->

								<div class="cart_itemDescription">
									<div class="cart_itemOption">
											<%--onclick="dec(currentCnt${status.index})"--%>
										<button onclick="minusBtn('${items.cartItemId}')"><i class="fas fa-solid fa-circle-minus"></i></button>
										<input type="text" size="1" id="currentCnt${status.index}" value="${items.count}">
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
			<!-- 두번째 가게(일단, 그냥 적어놨지만 반복문으로 담은 가게만큼 리스트가 생성되게 구현해야한다.구현예시..반복문 구현시 빼버리면 됨) -->
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
		<!--위 (배달/포장)리스트에 따라 달라지는 값들..배달 선택시 보여지는 div-->
		<form action="" >
			<table class="cart_costTable">
				<tbody>
				<tr><td>상품금액</td><td class="cart_cost">${totalPrice}원</td></tr>
				<tr><td>배달비</td><td class="cart_cost">3000원</td></tr>
				<tr><td>총 주문금액</td><td class="cart_cost">${totalPrice+3000}원</td></tr>
				<tr id="cart_totalPrice"><td>결제예정금액</td><td class="cart_cost">${totalPrice+3000}원</td></tr>
				</tbody>
			</table>
		</form>
	</div>
	<div id="cart_pickTotal" class="cart_section" style="display: none;">
		<!--위 리스트에 따라 달라지는 값들..포장 선택시 보여지는 div-->
		<form action="">
			<table class="cart_costTable">
				<tbody>
				<tr><td>상품금액</td><td class="cart_cost">${totalPrice}원</td></tr>
				<tr><td>총 주문금액</td><td class="cart_cost">${totalPrice}원</td></tr>
				<tr><td>결제예정금액</td><td class="cart_cost">${totalPrice}원</td></tr>
				</tbody>
			</table>
		</form>
	</div>
	<br>
	<div id="cart_footer">
		<a href="/order_paymentPage"><input type="submit" value="주문하기"></a>
	</div>
</div>

</body>
</html>