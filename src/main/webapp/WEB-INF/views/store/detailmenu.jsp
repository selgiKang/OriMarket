<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/store/menuclick_style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/paper/bootstrap.min.css" rel="stylesheet"/>

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
	
</style>

<body>
	<div class="selected_menu">
	   <div class="mainfood">
	   	<img alt="mainfoodpic" src="../../img/store/kal.jpg">
	   	<p>위 사진은 연출된 사진으로 실제와 다를 수 있습니다.</p>
	      </div>
	
	<div class="main_menu_name">
		<h1>칼국수</h1>
		<h5>인공 조미료를 쓰지 않고 순수 천연재료로 만들어 시원한 바다맛을 느낄 수 있는 착한 생 칼국수 대표 칼국수!</h5>
	</div>    
	
	<div class="mymenu_container">
		<div class="mymenu">
			<h4>가격</h4>
			<div class="radio">
  				<label><input type="radio" value="radio1" name="grp1" checked  />칼국수&nbsp;</label>
  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3,800원
			</div>
		</div>
	</div>	
		
	<div class="mymenuoption_container">
		<div class="mymenuoption">
			<h4>옵션</h4>
			<div class="radio">
  				<label><input type="radio" value="radio1" name="grp1" checked  />곱빼기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1,000원</label>
  				<label><input type="radio" value="radio2" name="grp1" />당근&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1,000원</label>
  				<label><input type="radio" value="radio3" name="grp1" />공기밥&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1,000원</label>
  				<label><input type="radio" value="radio4" name="grp1" />육수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1,000원</label>
			</div>
		</div>	
	
	</div>
	
	</div>
	

</body>
</html>

 