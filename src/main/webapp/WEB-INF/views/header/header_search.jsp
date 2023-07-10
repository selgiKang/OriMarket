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
        .nav{text-align:right; width:330px; padding:10px 20px; box-sizing:border-box;}
        i{color:#ffbf41; font-size:22px; margin:3px;}
        .logo{width:100px; height:40px; margin:auto; background-color:#eee; text-align:center; font-size:28px;}

        .search-bar {
            margin:auto;
            width: 330px;
            height: 27px;
            border-radius: 15px;
            background-color:#eee;
            /*border: solid 1px rgba(0, 0, 0, 0.3);*/
            display: flex;
            justify-content: right;
            align-items: center;
            z-index: 1;
            opacity: 1;
        }
        .search-bar__input {
            width: 50px;
            border: none;
            -webkit-appearance: none;
            text-align: center;
            margin-left: 10px;
            overflow: auto;
            z-index: -1;
            font-size: 15px;
        }


        .search-bar__input:focus {
            outline: none;
            width: 300px;
            text-align: left;
        }
        .address{float:left; text-decoration:none; font-size:14px; letter-spacing:0.5px;}
        .address>i{font-size:16px;}
        .bell>i, .user>i{}
        .fa-search {font-size: 15px; margin-right:10px;}

    </style>
</head>
<body>

<div class="header_wrap">

    <div class="nav">
        <a href="#" class="address"><i class="fa-solid fa-location-dot"></i>서울 관악구 신원로</a>
        <!-- 안됨 -->
        <div style="text-align:right; padding-left:50px;">
            <a href="#" class="bell"><i class="fa-solid fa-bell"></i></a>
            <a href="#" class="user"><i class="fa-solid fa-circle-user"></i></a>
        </div>
    </div>
    <div class="search-bar">
        <input class="search-bar__input" type="search" placeholder="상품 검색" />
        <i class="fas fa-search"></i>
    </div>
</div>

</body>
</html>