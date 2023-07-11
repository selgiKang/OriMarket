<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <title>로그인</title>
</head>
<body>
    <form method="post" action="/login">
    ID :<input type="text" name="userId"><br>
    PASSWORD :<input type="text" name="userPassword"><br>
    <button type="submit">제출</button>
    <a href="/join">회원가입</a>
</form>
</body>
</html>
