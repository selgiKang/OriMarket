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
    <script>
        window.onload = function() {
            var userId = "<%= request.getAttribute("userId") %>"; // 모델에 담긴 닉네임 값을 가져옴
            alert(userId + "님 환영합니다!");
        }
    </script>
</body>
</html>