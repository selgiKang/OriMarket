<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">

        *{
            margin: 0;
            padding: 0;
        }
        @font-face {
            font-family: 'omyu_pretty';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }


        header{
            width: 315px;
            background-color: green;
            text-align: center;
            height: 40px;
        }

        #mypage{
            width: 315px;
            height: 812px;
            position: relative;
            border: 1px solid black;
        }

        footer{
            width: 315px;
            background-color: red;
            position: absolute;
            bottom: 0;
            text-align: center;
            height: 40px;

        }

        #main{
            width: 100%;
            height: 601px;
            background: #f1f2f3;
            margin-top: -132px;
        }

        #main_box{
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 5px 25px 5px;
        }

        li{
            list-style: none;
            display: flex;
            align-items: center;
            margin: 10px 0;
        }

        .main_box_icon {
            margin-right: 10px;
            margin-left:  10px;
        }

        .contents1_bold {
            font-weight: bold;
            margin-left: 10px;
        }

        #coupon_points_container {
            display: flex;
            justify-content: space-between;
            background-color: whitesmoke;
            align-items: center;
            border: 1px solid gray;
            border-radius: 30px;
            padding: 10px;
            width: 250px;
            position: relative;
            margin: 10px auto;

            /* Add styles for the dividing line */
        }
        이마트 + 노브랜드
        #coupon_points_container div {
            width: 50%;
            position: relative; /* Add relative positioning */
        }



        #coupon_points_container div a {
            margin-left: 5px;
        }

        #event_banner {
            margin-top: 10px;
        }

        #service_links,
        #customer_links {
            margin-top: 10px;
        }
        a{
            text-decoration: none;
            color: blue;
        }
        #point{
            font-weight: bolder;
            padding-left: 7px;
        }
        #cupon{
            font-weight: bolder;
            padding-right: 5px;
        }
        hr {
            width: 90%; /* 원하는 길이로 조정합니다. */
            margin: 0 auto;
            margin-top: 15px;
        }

        #mypage1_h2{
            margin-bottom: -4px;
            margin-left: 10px;
        }
        #mypqge1{
            background-color: rgba(0, 128, 0, 0.3);
            height: 250px;
            padding-top: 5px;


        }
        #event_banner {
            background-color: rgba(128, 128, 128, 0.7);
            margin-top: 0;
            height: 120px;
            display: flex;
            justify-content: center; /* Horizontally center the content */
            align-items: center; /* Vertically center the content */
            text-align: center;
        }
        #hr{
            width: 100%;
        }

        ul{
            color: gray;
            margin-left: 5px;
        }
        li{
            font-weight: bolder;
            color: black;
            margin-left: 20px;
        }
        #img1{
            position: absolute;
            right: 10px;
            top: 52px;
        }
        #mypage1_small{
            color: gray;
            margin-left: 20px;
        }
        .separator {
            width: 2px;
            height: 40px;
            background-color: gray;
            margin-top: -15px;
        }

    </style>
</head>
<body style=" font-family: 'omyu_pretty';">
<div id="mypage">
    <header>&lt; 헤더 &gt;</header>
    <div id="mypqge1">
        <h2 id="mypage1_h2">로그인을 해주세요...</h2><img id="img1" src="" width="30px" height="30px">
        <small id="mypage1_small">&lt;회원등급&gt;</small>
        <hr>
        <div id="main_box">
            <div>
                <div class="main_box_icon">
                    <img src="" width="50px" height="50px">
                </div>
                <div class="contents1_bold">
                    단골가게
                </div>
            </div>
            <span class="separator"></span> <!-- Separator -->
            <div>
                <div class="main_box_icon">
                    <img src="" width="50px" height="50px">
                </div>
                <div class="contents1_bold">
                    주문내역
                </div>
            </div>
            <span class="separator"></span> <!-- Separator -->
            <div>
                <div class="main_box_icon">
                    <img src="" width="50px" height="50px">
                </div>
                <div class="contents1_bold">
                    리뷰관리
                </div>
            </div>
        </div>
        <div id="coupon_points_container">
            <div id="cupon">쿠폰함 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0장<a href="#">></a></div>
            <span class="separator"></span> <!-- Separator -->
            <div id="point">포인트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0장<a href="#">></a></div>
        </div>
    </div>
    <div id="event_banner">
        <h1>이벤트 배너</h1>
    </div>
    <div id="service_links">

        <ul>오리시장 서비스
            <li>간편결제관리</li>
            <li>공지사항</li>
            <li>이벤트</li>
        </ul>
    </div>
    <hr id="hr">
    <div id="customer_links">
        <ul>고객센터
            <li>자주 묻는 질문</li>
            <li>1:1문의</li>
            <li>약관</li>
        </ul>
    </div>
    <footer>&lt; 푸터 &gt;</footer>
</div>
</body>
</html>