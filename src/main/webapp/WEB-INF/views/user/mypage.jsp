<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="../../css/user/mypage.css" rel="stylesheet" media="all">
</head>
<body style=" font-family: 'omyu_pretty';">
<div id="mypage">
    <header>&lt; 헤더 &gt;</header>
    <div id="mypqge1">
        <c:if test="${empty userId}">
         <a href="/login"><h2 id="mypage1_h2">로그인을 해주세요...</h2><img id="img1" src="" width="30px" height="30px"></a>
        </c:if>
        <c:if test="${not empty userId}">
            <a href="/infolist">${userNickname}</a>
            <small id="mypage1_small">&lt;회원등급&gt;</small>
        </c:if>
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
            <div id="order_pastorder" onclick="location.href='/order_pastorder'">
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
            <span class="separator1"></span> <!-- Separator -->
            <div id="point">포인트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0장<a href="#">></a></div>
        </div>
    </div>

    <section id="slider1" class="slider">
        <div id="" class="box" style="background-color: #000;">배너 1</div>
        <div  class="box" style="background-color: #000;">배너 2</div>
        <div  class="box" style="background-color: #000;">배너 3</div>
        <div  class="box" style="background-color: #000;">배너 4</div>
        <div  class="box" style="background-color: #000;">배너 5</div>

    </section>

    <button id="prevBtn">&lt;</button>
    <button id="nextBtn">&gt;</button>

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
<script src="../../js/user/mypage.js"></script>
</html>
