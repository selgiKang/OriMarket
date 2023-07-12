<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <h2>로그인성공</h2>
    <a href="/infolist">회원정보보기</a>
    <script>
        window.onload = function() {
            var userId = "<%= session.getAttribute("userName") %>"; // 모델에 담긴 닉네임 값을 가져옴
            alert(userId + "님 환영합니다!");
        }
    </script>
    <h3>${userName}님 환영합니다.</h3>
    <a href="/mypage">회원 정보</a>
    <a href="/order_paymentPage">결제하러가기</a>
    <a href="/accept">주문 수락</a>
</body>
</html>