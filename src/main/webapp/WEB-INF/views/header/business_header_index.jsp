<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../css/header/header_index.css">
    <style>
        /* 추가한 CSS 스타일 */
        body {
            margin: 0; /* body의 기본 마진을 제거하여 헤더를 화면 맨 위에 배치합니다. */
        }

        .header_wrap {
            position: fixed; /* 헤더를 고정시킵니다. */
            top: 0;
            left: 0;
            right: 0;
            background-color: #ffffff; /* 헤더 배경색을 지정해주세요. */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 헤더에 그림자 효과를 추가할 수 있습니다. */
            z-index: 9999; /* 다른 요소들보다 위에 표시되도록 설정합니다. */
        }
    </style>
</head>
<body>
<div class="header_wrap" style="background-color: #46A973">
    <div class="logo"><a href="/bu_main" style="font-size: 32px;">오리 사장님</a></div>

    <div class="nav">
        <c:if test="${not empty buUserId}">
            <span class="addpic">${buUserId} 님, 어서오리</h2></span>
        </c:if>

        <div class="icon" style="margin-top: 5px">
        <a href=""><i class="fa-solid fa-house" style="color: #ffbf41;"></i></a>
        <a href="/login1"><i class="fa-solid fa-right-from-bracket" style="color: #ffbf41;"></i></a>
        </div>
    </div>
</div>
</body>
</html>
