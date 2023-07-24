<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="../../css/user/mypage.css" rel="stylesheet" media="all">
    <style>
        /* 230724 로그인 모달창 추가 */
        .modal {position: absolute; width: 375px; height: 913px; top:-20px; z-index: 999999; display: none; background-color: rgba(0, 0, 0, 0.6);}
        .modal.show {display: block;}

        .modal_body {
            position: absolute; top: 42%; left: 50%;
            width: 300px; height: 350px;  border-radius: 30px; padding:20px; text-align: center;
            background-color:#fff; border-radius: 10px; box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
            transform: translateX(-50%) translateY(-50%);
        }

        div#login_box{margin:30px 0}
        h1.login_modal_title{margin-top:20px; color: #333; letter-spacing: 5px;}
        div.login_box_wrap{margin-bottom:20px;}
        div.login_box_wrap p {margin-bottom:10px;}

        input[type=text] {width: 65%; height: 30px; font-size: 15px; border: 0; border-radius: 15px; outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);}
        input[type=password] {width: 65%; height: 30px; font-size: 15px; border: 0; border-radius: 15px; outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);}

        input.login_btn { width:70%; height:40px; background-color:#46A973; border:none; border-radius: 25px; color:#fff; font-weight: 700; font-size: 16px;}
        input.login_btn:hover{ background-color:#333; color:#ffbf41;}

        div.join_btn_wrap{width:100%;}
        a.join_btn{width:70%; height:40px; padding: 4% 32%; background-color:#ffbf41; border:none; border-radius: 25px; color:#333; font-weight: 700; font-size: 16px;}

    </style>
</head>
<body style=" font-family: 'omyu_pretty';">

<!-- 마이페이지 시작 -->
<div class="mypage_wrap">
    <div id="mypage">
        <jsp:include page="../header/header_index.jsp" />

<!-- 로그인 모달창 추가 - 230724 승원  -->
<div class="modal">
    <div class="modal_body">
        <h1 class="login_modal_title">로그인</h1>
        <div id="container">
            <form action="/login" method="post" onsubmit="return validateLoginForm();">
                <div id="login_box">
                    <div class="login_box_wrap">
                        <p>아이디 <input type="text" size="20" placeholder=" 아이디를 입력해주세요.." name="userId" id="userId" required></p>
                        <p>비밀번호 <input type="password" size="20" placeholder=" *********" name="userPassword" id="userPassword" required></p>
                    </div>
                    <p style="margin-bottom:10px;"><input type="checkbox" name="login" value=""> 로그인 상태 유지</p>
                    <p align="center"><input class="login_btn" type="submit" value="로그인" style="width:80%;"></p>
                </div>
            </form>
            <div id="list" style="margin-top:25px;">
                <div style="margin-bottom:20px;">
                    <a href="#">아이디 찾기</a> / <span><a href="#">비밀번호 찾기</a></span>
                </div>
                <div class="join_btn_wrap"><a href="/join" class="join_btn">회원가입</a></div>
            </div>
        </div>
    </div>
</div>
        <div id="mypage_content">
            <c:if test="${empty userId}">
                <div class="login_modal btn-open-popup" onclick="modal" style="cursor: pointer;"><h2 class="mypage1_h2">로그인하러가기</h2></div><img class="img1" src="" width="30px" height="30px">
                <small id="mypage_content_small">&lt;회원등급&gt;</small>
            </c:if>
            <c:if test="${not empty userId}">
                <a href="/infolist"><h2 class="mypage1_h2">${userNickname} 님, 어서오리</h2><img class="img1" src="" width="30px" height="30px"></a>
                <small id="mypage_content_small">&lt;회원등급&gt;</small>
            </c:if>

            <hr>
            <div id="main_box">
                <div id="mypage_favStore" onclick="location.href='/favList'">
                    <div class="main_box_icon">
                        <img src="../../img/user/shop.png" style="width:50px; height: 50px;">
                    </div>
                    <div class="contents1_bold">
                        단골가게
                    </div>
                </div>
                <span class="separator"></span> <!-- Separator -->
                <div id="order_pastorder" onclick="location.href='order_pastorder'">
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
                        <a href="/review">리뷰관리</a>
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
        <jsp:include page="../footer/footer.jsp" />
    </div>
</div>
</body>
<script src="../../js/user/mypage.js"></script>
<script>
    /* 로그인 모달 */
    const body = document.querySelector('#mypage_content');
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
        }
    });

    modal.addEventListener('click', (event) => {
        if (event.target === modal) {
            modal.classList.toggle('show');

            if (!modal.classList.contains('show')) {
                body.style.overflow = 'auto';
            }
        }
    });

</script>
</html>
