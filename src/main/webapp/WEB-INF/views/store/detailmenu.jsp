
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
	<link rel="stylesheet" type="text/css" href="../../css/store/menuclick_style.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/paper/bootstrap.min.css" rel="stylesheet"/>
	<script type="text/javascript" src="../../js/common/jquery-3.6.4.js"></script>
	<script src="https://kit.fontawesome.com/1d53132cda.js" crossorigin="anonymous"></script>
	<script src="../../js/store/detailmenu.js"></script>
</head>
<style>
	body{
		width:375px; height: 712px; box-sizing: border-box; margin:0 auto;
		background-color: #eef;
	}

	/* 230723 승원 */
	#detailmenu_wrap{width:375px; height:712px; position:relative; box-sizing: border-box; margin:0 auto; display: flex; justify-content: center; align-items: center;}

	.selected_menu {
		width: 375px;
		height: 712px;
		background-color: white;
		text-align: center;
		position: static;
		overflow-y: scroll; /* 세로 스크롤바 활성화 */
		-ms-overflow-style: none; /* 인터넷 익스플로러 및 엣지에서 스크롤바 숨기기 */
		scrollbar-width: none; /* 파이어폭스에서 스크롤바 숨기기 */
	}

	.selected_menu::-webkit-scrollbar {
		/* 크롬 및 사파리에서 스크롤바 숨기기 */
		display: none;
	}

	.mainfood img{
		width: 100%;
		height: 100%;
	}

	.mainfood p{
		font-size: 11px;
		background-color: #eee;
		padding: 5px;
	}

	.main_menu_name {

		text-align: left; /* 왼쪽 정렬 */
		margin: 15px;
	}

	.main_menu_name h1{
		font-size: 30px;

	}

	.main_menu_name h5{
		font-size: 12px;
		margin-top: -7px;
	}


	.mymenu_container{
		background-color: white;
		width: 90%;
		height: auto;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5); /* 그림자 설정 */
		border-radius: 15px;
		margin: 15px;
		flex-wrap: nowrap; /* 줄바꿈 방지 */
	}

	.mymenu{
		text-align: left; /* 왼쪽 정렬 */
		padding: 15px;
	}

	.mymenuoption_container{
		background-color: white;
		width: 285px;
		height: auto;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5); /* 그림자 설정 */
		border-radius: 15px;
		margin: 15px;

	}

	.mymenuoption{
		text-align: left; /* 왼쪽 정렬 */
		padding: 10px;
	}
	.mymenuoption .radio {
		display: flex;
		flex-direction: column; /* 라디오 버튼과 레이블을 세로로 나열 */
		align-items: flex-start; /* 좌측 정렬 */
		margin-top: 10px; /* 항목 사이의 간격 조정 */
	}
	.radio{margin-bottom:10px;}

	.mymenuoption .radio label {
		margin-bottom: 5px; /* 라디오 버튼과 레이블 사이의 간격 조정 */
	}
	button{border-style: none; background: none; display: inline-block;}

	/* 230723 승원 */
	.mainfood{width:375px; height:375px;}
	.mainfood > img{position:relative;}
	button.backbtn { position:absolute; top:1%; left:1%; z-index:99; display: flex; align-items: center; font-size: 25px; color: #999; margin: 0 0 0 10px; width: 35px; height: 35px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
	button.backbtn:hover {background-color:#333; color:#fff;}
	.main_menu_wrap{width:100%; padding:25px 10px 20px;}
	button.dm_cart{width:90%; height:40px; border-radius: 25px; background-color:#ffbf41; color:#333; font-size: 16px; font-weight: 600;}
	button.dm_cart:hover {background-color:#333; color:#fff;}

</style>

<body>
<div id="detailmenu_wrap">
	<div class="selected_menu">
		<div class="mainfood">
			<!-- 뒤로가기 -->
			<button class="backbtn" onclick="window.history.go(-1)">&lt;</button>
			<img alt="mainfoodpic" src="../../img/store/kal.jpg">
			<p>위 사진은 연출된 사진으로 실제와 다를 수 있습니다.</p>
		</div>
		<div class="main_menu_wrap">
			<div class="main_menu_name">
				<h1>${item.itemName}</h1>
				<h5>${item.itemInfo}</h5>
			</div>
			<form action="/${userId}/cart/" method="post" id="cartForm">
				<input type="hidden" value="${item.businessStore}" name="businessStore">
				<div class="mymenu_container">
					<div class="mymenu">
						<div class="radio">
							<h5>가격</h5>
							<label><input type="radio" value="${item.itemName}" name="itemName" checked/>${item.itemName}</label>
									<input type="hidden" value="${item.itemId}" name="itemId" id="itemId">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${item.itemPrice}" name="itemPrice" style="outline: none;border: none;" />
						</div>
						<table style="margin-left:20px;">
							<tr>
								<td style="margin-right:15px;">개수</td>
								<%-- js 적용됨 class 이름 바꿀 때 js 파일도 참조--%>
								<%-- 이 값은 따로 param으로 가져가서 set, save하기 --%>
								<td><button type="button" class="menu_btn_minus" onclick="minusBtn()" style="margin-left:20px;"><i class="fas fa-solid fa-square-minus" style="color: #46a973; font-size: 24px;"></i></button></td>
								<td class="detailmenu_count"><input type="text" id="countInput" name="count" value="1" size="1"></td>
								<td><button type="button" class="menu_btn_plus" onclick="plusBtn()"><i class="fas fa-solid fa-square-plus" style="color: #46a973; font-size: 24px;"></i></button></td>
							</tr>
						</table>
					</div>
				</div>
				<div>
					<button type="button" class="dm_cart" onclick="submitForm()">장바구니 담기</button>
					<%--올 때 재고 확인해서 hidden으로 넣기--%>
					<input type="hidden" id="itemCnt" value="${item.itemCnt}">
					<input type="hidden" id="cartCnt" value="${cartItem.count}">
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	function submitForm() {
		//재고
		var itemCnt = parseInt(document.getElementById("itemCnt").value, 10);
		//선택 수
		var countInput = parseInt(document.getElementById("countInput").value, 10);
		//장바구니 수량
		var cartCnt = parseInt(document.getElementById("cartCnt").value, 10);

		const itemId = document.getElementById("itemId").value;

		//아이디
		const userId = '<%= session.getAttribute("userId") %>';

		console.log("userId:", userId); // userId의 값을 콘솔에 출력해보세요.
		if (userId === null || userId === "null") {
			alert("장바구니를 이용하시려면 로그인이 필요합니다.");
			window.location.href = "/mypage";
		}else {
			console.log("장바구니 수량"+cartCnt);
			console.log("전체 수량"+countInput+cartCnt);
			//if문 추가해서 재고 보다 많이 담으면 재고 알림?
			if(itemCnt<countInput+cartCnt){
				alert("재고 수량보다 많습니다.")
				window.location.href="/detailmenu/"+itemId;
			}else{
				const confirmed = confirm("장바구니에 담으시겠습니까?");
				if (confirmed) {
					// 아이템을 장바구니에 추가하는 동작을 여기에 구현합니다.
					// 예를 들어, JavaScript를 사용하여 폼을 제출할 수 있습니다.
					document.getElementById("cartForm").submit();
				} else {
					// 사용자가 "취소"를 클릭한 경우 추가적인 동작을 여기에 추가할 수 있습니다.
				}
			}
		}
	}

	function viewCart() {
		window.location.href = "/user/cart";
	}
</script>
<jsp:include page="../footer/nav_footer.jsp" />
</body>
</html>

 