<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="../../css/user/mypage.css" rel="stylesheet" media="all">
    <style>
    </style>
    <script>
        // 서버에서 에러 메시지를 전달할 경우 알림 팝업 띄우기
        window.onload = function() {
            /* 'loginError'가 null이 아닌 경우에만 팝업창을 띄우기 */
            <% if (request.getAttribute("loginError") != null) { %>
            alert("<%= request.getAttribute("loginError") %>");
            <% } %>
        };
        // 이미 모달창이 열려있을 때도 팝업창이 뜨도록 수정
        function validateLoginForm() {
            const userId = document.getElementById("userId").value;
            const userPassword = document.getElementById("userPassword").value;

            // 서버로 로그인 정보 전달 (AJAX 요청)
            fetch("/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ userId, userPassword })
            })
                .then(response => response.text())
                .then(data => {
                    if (data === "로그인 성공") {
                        // 로그인 성공
                        window.location.replace('/')
                    } else {
                        // 로그인 실패
                        const errorMessage = "아이디 또는 비밀번호가 틀립니다.";
                        alert(errorMessage);
                        document.querySelector('.modal').classList.add('show');
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                });

            // 폼 전송을 막음 (기본 동작 취소)
            return false;
        }
    </script>
    <script src="../../../../resources/static/js/user/login_ajax.js"></script>
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
                        <p>아이디 &nbsp;<input type="text" size="20" placeholder=" 아이디를 입력해주세요.." name="userId" id="userId" required></p>
                        <p>비밀번호 <input type="password" size="20" placeholder=" *********" name="userPassword" id="userPassword" required></p>
                    </div>
                    <p style="margin-bottom:10px;"><input type="checkbox" name="login" value=""> 로그인 상태 유지</p>
                    <p align="center"><input class="login_btn" type="submit" value="로그인"></p>
                </div>
            </form>
            <div id="list" style="margin-top:15px;">
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
                        <img src="../../img/order/orderRecipt.png" width="50px" height="50px">
                    </div>
                    <div class="contents1_bold">
                        주문내역
                    </div>
                </div>
                <span class="separator"></span> <!-- Separator -->
                <div id="review" onclick="location.href='/review'">
                    <div class="main_box_icon">
                        <img src="../../img/user/star.png" width="50px" height="50px">
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
