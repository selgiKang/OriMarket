<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../../css/header/header_search.css">
    <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
</head>
<body>

<div class="header_boxbgc">
    <div class="header_wrap">

        <div class="nav">
            <a href="/" style="font-size:32px;"><i class="fa-solid fa-house"
                                                   style="padding-left: 6px;font-size: 23px;color: #ffbf41;"></i></a>
            <span>
                <a href="${marketUrl}?marketName=${marketName}&latitude=${latitude}&longitude=${longitude}"
                   class="address">
                    <i class="fa-solid fa-location-dot header_i" style="font-size: 15px;color: #ffbf41;"></i>
                    ${marketName}
                </a>
            </span>
            <div>
                <a href="#"><i class="fa-solid fa-bell header_i"></i></a>
                <a href="/mypage"><i class="fa-solid fa-circle-user header_i"></i></a>
            </div>
        </div>
        <div style="display: flex; justify-content: space-around; align-items: center;">
            <small class="d_addess">
                배달주소 : ${userAddress1} ${userAddressDetail1}
            </small>
            <form action="/header_search1" method="GET" class="h_search_wrap">
                <i class="fas fa-solid fa-magnifying-glass search_i"></i>
                <input type="text" id="searchWord" class="h_searchbar" name="searchKeyword" placeholder="상품검색"
                       maxlength="50" size="60">
            </form>
        </div>
    </div>

    <script>
        var searchWord = document.getElementById('searchWord');
        var sarchButton = document.getElementsByClassName('searchButton');
        searchWord.addEventListener('keyup', function (event) {

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