
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
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
		background-color: #eef;
	}
	.selected_menu {
		width: 315px;
		height: 812px;
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
		width: 315px;
		height: 315px;
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
		width: 285px;
		height: auto;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5); /* 그림자 설정 */
		border-radius: 15px;
		margin: 15px;
		flex-wrap: nowrap; /* 줄바꿈 방지 */
	}

	.mymenu{
		text-align: left; /* 왼쪽 정렬 */
		padding: 10px;
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

	.mymenuoption .radio label {
		margin-bottom: 5px; /* 라디오 버튼과 레이블 사이의 간격 조정 */
	}
	button{border-style: none; background: none; display: inline-block;}

</style>

<body>
<div class="selected_menu">
	<div class="mainfood">
		<img alt="mainfoodpic" src="../../img/store/kal.jpg">
		<p>위 사진은 연출된 사진으로 실제와 다를 수 있습니다.</p>
	</div>

	<div class="main_menu_name">
		<h1>${item.itemName}</h1>
		<h5>${item.itemInfo}</h5>
	</div>
	<form action="/${userId}/cart/" method="post" id="cartForm">
		<div class="mymenu_container">
			<div class="mymenu">
				<h4>가격</h4>
				<div class="radio">

					<label><input type="radio" value="${item.itemName}" name="itemName" checked/>${item.itemName}</label>
							<input type="hidden" value="${item.itemId}" name="itemId">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${item.itemPrice}" name="itemPrice" style="outline: none;border: none;" />
				</div>
				<table>
					<tr>
						<td>개수</td>
					</tr>
					<%-- js 적용됨 class 이름 바꿀 때 js 파일도 참조--%>
					<tr>
						<%-- 이 값은 따로 param으로 가져가서 set, save하기 --%>
							<td><button type="button" class="menu_btn_minus" onclick="minusBtn()"><i class="fas fa-solid fa-square-minus" style="color: #46a973;"></i></button></td>
							<td class="detailmenu_count"><input type="text" id="countInput" name="count" value="1" size="1"></td>
							<td><button type="button" class="menu_btn_plus" onclick="plusBtn()"><i class="fas fa-solid fa-square-plus" style="color: #46a973;"></i></button></td>

					</tr>
				</table>
			</div>
		</div>
		<div>
			<button type="button" onclick="submitForm()">장바구니 담기</button>
		</div>
	</form>
</div>
<jsp:include page="../footer/nav_footer.jsp" />
</body>
</html>

 