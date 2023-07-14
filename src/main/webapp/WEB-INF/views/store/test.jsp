<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>
<form action="/storenotice" method="post">
    <input type="text" name="storeName" placeholder="가게이름">
    <input type="text" name="storePnumber" placeholder="가게번호">
    <input type="text" name="storeCategory" placeholder="가게카테고리">
    <input type="text" name="storeAddress" placeholder="가게주소">
    <button type="submit" value="전송">
</form>
</body>
</html>