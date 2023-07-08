<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시장 맵</title>
<script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
<style>
body{margin:0 auto; font-size:16px;}

.arrow_wrap{width:375px; height:712px; margin:auto; background-color:#eee; position:relative;}
i{font-size:36px; color:#000; opacity:0.3;}
i.fa-circle-chevron-left{position:absolute; top:50%; left:2%;}
i.fa-circle-chevron-right{position:absolute; top:50%; right:2%;}
i.fa-circle-chevron-up, .up{position:absolute; top:2%; left:46%;}
i.fa-circle-chevron-down, .down{position:absolute; bottom:2%; left:46%;}
input[type="button"]{width:42px; border-radius:100px; background-color:#fff; opacity:0.4; font-size:24px; font-color:#eee; color:#333; cursor:pointer;}
button{width:36px; border-radius:45px; font-size:36px; font-color:#eee; color:#333; cursor:pointer;}

.item1{margin:auto; background-color:lightgoldenrodyellow;width: 375px; height: 712px;}
.item2{margin:auto; background-color:skyblue;width: 375px; height: 712px;}

.store1, .store2, .store3{border:1px solid #333; text-decoration:none; color:#333; width:100px; background-color:#fff; position:absolute; top:24%; left:15%;}
.store1{top:12%; left:15%;}
.store2{top:38%; left:18%;}
.store3{top:66%; left:45%;}
/*모바일 앱은 클릭시 border 이벤트 발생 후 페이지 이동*/
.store1:hover, .store2:hover, .store3:hover{border:2px solid #ffbf41; box-shadow: 0 0 5px 2px #ffbf41;}
.store1>img, .store2>img, .store3>img{width:80px; height:60px; padding:10px;}
.store1>span, .store2>span, .store3>span{display:block; font-size:14px;}
</style>
</head>
<body>
<!-- 
<a href=""><i class="fas fa-thin fa-circle-chevron-left"></i></a>
<a href=""><i class="fas fa-thin fa-circle-chevron-right"></i></a>
<a href=""><i class="fas fa-thin fa-circle-chevron-up"></i></a>
<a href=""><i class="fas fa-thin fa-circle-chevron-down"></i></a> 
-->
	<div class="item1">top</div>
        
	<div class="arrow_wrap btns">
		center
		<a href="javascript:void(0)" class="btns">
			<i class="fas fa-thin fa-circle-chevron-left"></i>
		</a>
		<a href="javascript:void(0)" class="btns">
			<i class="fas fa-thin fa-circle-chevron-right"></i>
		</a>
		<a>
			<i class="fas fa-thin fa-circle-chevron-up scrollBy up" data-direction="top"></i>
		</a>
		<input type="button" value="▼" class="scrollBy down" data-direction="bottom">
		
		<a class="store1" href="#">
			<img src="../img/marketmap/singsing.png">
			<span>싱싱과일나라1</span>
		</a>
		<a class="store2" href="#">
			<img src="../img/marketmap/singsing.png">
			<span>싱싱과일나라2</span>
		</a>
		<a class="store3" href="#">
			<img src="../img/marketmap/singsing.png">
			<span>싱싱과일나라3</span>
		</a>
	</div>
	
    <div class="item2">bottom</div>
        
    <script>
        const scrollMove = (event) => {
            if (event.target.dataset.direction === 'bottom')
                window.scrollBy(0, 713);
            else if (event.target.dataset.direction === 'top')
                window.scrollBy(0, -713);
        }

        document.querySelector('.btns').addEventListener('click', scrollMove);
    </script>
   
</body>
</html>