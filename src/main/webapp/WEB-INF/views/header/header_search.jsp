<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
    <style>
        body{margin:0 auto; font-size:16px;}
        .header_wrap{width:375px; height:100px; margin:0 auto; background-color:#46a973; box-sizing:border-box;}
        .nav{text-align:right; padding:5px 15px; margin-top:15px;}
        .nav>span{float:left; margin:5px;}
        .nav>span>a{text-decoration:none; color:#eee;}
        .header_i{color:#ffbf41; font-size:22px; margin:3px;}

        .h_search_wrap{padding:5px 20px;}
        .h_searchbar{width:260px; height:30px; border-style: none; border-radius: 35px; float:left;}
        .h_searchbtn{background-color:#ffbf41;}
        .h_searchbtn_i{}

    </style>
</head>
<body>

<div class="header_wrap">

    <div class="nav">
        <span>
            <a href="#" class="address">
                <i class="fa-solid fa-location-dot header_i"></i>
                서울 관악구 신원로
            </a>
        </span>
        <!-- 안됨 -->
        <div style="text-align:right; padding-left:50px;">
            <a href="#"><i class="fa-solid fa-bell header_i"></i></a>
            <a href="/mypage"><i class="fa-solid fa-circle-user header_i"></i></a>
        </div>
    </div>
<%--    <div class="search-bar">
        <input class="search-bar__input" type="search" placeholder="상품 검색" />
        <i class="fas fa-search"></i>
    </div>--%>

    <form action="" method="GET" class="h_search_wrap">
        <input type="text" id="searchWord" class="h_searchbar" name="searchWord" placeholder="상품검색"
               maxlength="50" size="60">
        <button class="searchButton" class="h_searchbtn">
            <i class="fas fa-search searchButtonImg h_searchbtn_i"></i>
        </button>
    </form>
</div>
<script>
    var searchWord = document.getElementById('searchWord');
    var sarchButton = document.getElementsByClassName('searchButton');
    searchWord.addEventListener('keyup', function(event) {

    if (event.keyCode === null) {
    event.preventDefault();
    }

    if (event.keyCode === 13) {

    window.location.href = searchButton.href;
    }
    });
</script>
</body>
</html>