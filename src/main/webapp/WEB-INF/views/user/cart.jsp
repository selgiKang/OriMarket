<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/1d53132cda.js" crossorigin="anonymous"></script>
<script src="../../js/common/jquery-3.6.4.js"></script>
<script src="../../js/user/cart.js"></script>
<link rel="stylesheet" href="../../css/user/cart.css">

	<title>cart</title>
</head>
<body>
	<div id="cart_container">
		 <div id="cart_title">
		 	<a href="#"><i class="fas fa-regular fa-xmark"></i></a>
		 	<p style="display: inline-block; margin-left: 130px;">장바구니</p>
		 </div>
		 <div id="cart_location">
		 	<form action="">
			 	<i class="far fa-solid fa-location-dot"></i>
			 	<p>서울 마포구 신촌로 176</p>
			 	<small id="cart_marketName">_시장이름</small>
			 	<input type="submit" value="변경">	 		
		 	</form>
		 </div>
		 <div id="cart_marketName">
		 	<!-- 받아와야하는 시장이름값 -->
		 </div>
		 <div>	 	
		 	<input type="checkbox" checked="checked" value="">
		 	전체선택
		 	<!--장바구니에 들어온 수량, 체크할때마다 카운트되는 수량..? -->
		 </div>
		 <div id="cart_itemList">
		 	<!-- 가게리스트 (그속에 해당 가게의 물품 리스트가 있어야 한다.)
		 		가게리스트 반복문 속에 상품리스트 반복문 구현..??
		 	 -->
		 	<ul>
		 		<li>
		 			<article>
		 				<h1>가게이름1</h1>
		 				<!-- 같은 가게 안에서 상품리스트(where='가게이름'아니면'가게식별번호')쿼리 -->
		 				<ul>
		 					<li>	
	 							<div>		 								
 									<input type="checkbox">
 									<!-- 상품이미지나 상품타이틀을 클릭하면 상세페이지로 넘어간다(a태그) -->
 									<a href="상품상세페이지">
 										<div class="cart_itemImg">
 											<img src="../../img/user/cart_fish.png">
 										</div>
 										<div class="cart_itemTitle">
 											<p>제주산 손질갈치(특) 300g</p>
 										</div>
 									</a>
 									<button class="cart_xmark"><i class="fas fa-regular fa-xmark"></i></button>
 									
 									<!-- 수량선택(-,+),가격표시 -->
 									
 									<div class="cart_itemDescription">
 										<div class="cart_itemOption">
 											<button><i class="fas fa-solid fa-circle-minus"></i></button>
 											<div id="cart_countResult">1</div>
 											<button><i class="fas fa-solid fa-circle-plus"></i></button>
 										</div>
 										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 										<div class="cart_itemPrice">
 											<span>
 												9,690
 												원
 												&nbsp;&nbsp;
 											</span>
 										</div>
 									</div>		 											 								
	 							</div>		 						
		 					</li>
		 				</ul>
		 			</article>
		 		</li>
		 		<br>
		 		<!-- 두번째 가게(일단, 그냥 적어놨지만 반복문으로 담은 가게만큼 리스트가 생성되게 구현해야한다.구현예시..반복문 구현시 빼버리면 됨) -->
		 		<li>
		 			<article>
		 				<h1>가게이름2</h1>
		 				<ul>
		 					<li class="cart_items">	
	 							<div>		 								
 									<input type="checkbox">
 									<!-- 상품이미지,이름 클릭하면 상세페이지로 넘어간다 -->
 									<a href="상품상세페이지">
 										<div class="cart_itemImg">
 											<img src="../../img/user/cart_mini_tomato.png">
 										</div>
 										<div class="cart_itemTitle">
 											<p>대추방울토마토 750g</p>
 										</div>
 									</a>
 									<button class="cart_xmark"><i class="fas fa-regular fa-xmark"></i></button>
 									
 									<!-- 수량선택(-,+),가격표시 -->
 									
 									<div class="cart_itemDescription">
 										<div class="cart_itemOption">
 											<button><i class="fas fa-solid fa-circle-minus"></i></button>
 											<div id="cart_countResult">1</div>
 											<button><i class="fas fa-solid fa-circle-plus"></i></button>
 										</div>
 										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 										<div class="cart_itemPrice">
 											<span>
 												8,800
 												원
 												&nbsp;&nbsp;
 											</span>
 										</div>
 									</div>		 											 								
	 							</div>		 						
		 					</li>
		 					<br>
		 					<li>	
	 							<div>		 								
 									<input type="checkbox">
 									<!-- 상품이미지,이름 클릭하면 상세페이지로 넘어간다 -->
 									<a href="상품상세페이지">
 										<div class="cart_itemImg">
 											<img src="../../img/user/cart_fish.png">
 										</div>
 										<div class="cart_itemTitle">
 											<p>제주산 손질갈치(특) 300g</p>
 										</div>
 									</a>
 									<button class="cart_xmark"><i class="fas fa-regular fa-xmark"></i></button>
 									
 									<!-- 수량선택(-,+),가격표시 -->
 									
 									<div class="cart_itemDescription">
 										<div class="cart_itemOption">
 											<button><i class="fas fa-solid fa-circle-minus"></i></button>
 											<div id="cart_countResult">1</div>
 											<button><i class="fas fa-solid fa-circle-plus"></i></button>
 										</div>
 										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 										<div class="cart_itemPrice">
 											<span>
 												9,690
 												원
 												&nbsp;&nbsp;
 											</span>
 										</div>
 									</div>		 											 								
	 							</div>		 						
		 					</li>
		 				</ul>
		 			</article>
		 		</li>		 				 		
		 	</ul>
		 </div>
		 <div id="cart_moreBtn">
		 	<input type="button" value="+상품 더 담기">
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
					<tr><td>상품금액</td><td class="cart_cost">받아오는값</td></tr>
					<tr><td>배달비</td><td class="cart_cost">받아오는값</td></tr>
					<tr><td>총 주문금액</td><td class="cart_cost">받아오는값</td></tr>
					<tr id="cart_totalPrice"><td>결제예정금액</td><td class="cart_cost">받아오는값</td></tr>
					</tbody>
				</table>
			</form>
		</div>
		<div id="cart_pickTotal" class="cart_section" style="display: none;">
			 <!--위 리스트에 따라 달라지는 값들..포장 선택시 보여지는 div-->
			 <form action="">
				 <table class="cart_costTable">
					 <tbody>
					 <tr><td>상품금액</td><td class="cart_cost">받아오는값</td></tr>
					 <tr><td>총 주문금액</td><td class="cart_cost">받아오는값</td></tr>
					 <tr><td>결제예정금액</td><td class="cart_cost">받아오는값</td></tr>
					 </tbody>
				 </table>
			 </form>
		 </div>
		<br>
		<div id="cart_footer">
			<input type="submit" value="주문하기">
		</div>
	</div>

</body>
</html>