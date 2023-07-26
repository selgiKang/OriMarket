<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
    <style>
        @font-face {
            font-family: 'omyu_pretty';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        body{margin:0 auto; font-size:16px; font-family: 'omyu_pretty';}
        .header_wrap{width:375px; height:100px; margin:0 auto; background-color:#46a973; box-sizing:border-box; border-bottom-left-radius: 25px; border-bottom-right-radius: 25px; box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.2);}
        .nav{display: flex; justify-content:space-between; align-items:center; padding: 7px 15px; margin-top:0px;}
        .nav>span{float:left; margin:5px;}
        .nav>span>a{text-decoration:none; color:#eee;}
        .header_i{color:#ffbf41; font-size:22px; margin:3px;}

        .h_search_wrap{
            padding: 5px 14px 5px 10px;
            width: 34%;
            height: 30px;
            border-radius: 25px;
/*            background-color:#eee;*/
            display: flex;
            justify-content: flex-end;
            align-items: center;
            opacity: 0.8;
            z-index:99;
            margin: auto;
        }
        .h_searchbar{
            width: 48px;
            border: none;
            background-color:#eee;
            -webkit-appearance: none;
            text-align: center;
            margin-left: -25px;
            padding: 0 12px 0 30px;
            overflow: auto;
            font-size: 12px;
            cursor: pointer;
            height: 26px;
            border-radius: 25px;
            transition: all 0.3s ease-in-out;
        }
        .h_searchbar:focus {
            outline: none;
            width: 300px;
            text-align: left;
/*!*            transition-duration: 0.4s;*!
            transition-timing-function: ease-in;*/
            animation: 0.5s identifier ease-in;
        }

        .search_i {
            font-size: 16px;
            z-index: 999;
            color: #666;
        }
        a.address{margin-top: -5px;font-weight: 500; font-size: 25px;}
        small.d_addess{width: 58%; height:40px; overflow:hidden; padding: 0 12px 0 20px;color: #e9e9e9;z-index: 1;letter-spacing: -0.5px;font-size: 17px;}

    </style>
</head>
<body>

<div class="header_wrap">

    <div class="nav">
        <a href="/"style="font-size:32px;"><i class="fa-solid fa-house" style="padding-left: 6px;font-size: 23px;color: #ffbf41;"></i></a>
        <span>
            <a href="#" class="address">
                <i class="fa-solid fa-location-dot header_i" style="font-size: 15px;color: #ffbf41;"></i>
                (ㅁㅁㅁ시장)
            </a>
        </span>
        <div>
            <a href="#"><i class="fa-solid fa-bell header_i"></i></a>
            <a href="/mypage"><i class="fa-solid fa-circle-user header_i"></i></a>
        </div>
    </div>

<%--    <form action="/header_search1" method="GET" class="h_search_wrap">
        <input type="text" id="searchWord" class="h_searchbar" name="searchKeyword" placeholder=" 상품검색"
               maxlength="50" size="60">
        <button class="searchButton" class="h_searchbtn" type="submit">
            <i class="fas fa-search searchButtonImg h_searchbtn_i"></i>
        </button>
    </form>--%>
    <div style="display: flex; justify-content: space-around; align-items: center;">
        <small class="d_addess">
            배달주소 : (가져오기)(가져오기)(가져오기)(가져오기)(가져오기)
        </small>
        <form action="/header_search1" method="GET" class="h_search_wrap">
            <i class="fas fa-solid fa-magnifying-glass search_i"></i>
            <input type="text" id="searchWord" class="h_searchbar" name="searchKeyword" placeholder="상품검색" maxlength="50" size="60">
        </form>
    </div>
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