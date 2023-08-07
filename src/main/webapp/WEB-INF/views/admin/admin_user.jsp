<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>현 재고 리스트</title>
    <link rel="stylesheet" href="../../css/admin/user.css">
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div class="snun_wrap">
            <h1>일반사용자 관리</h1>
        </div>
    </div>
    <div class="goods_store_wrap">
        <div id="goods_title">
            <div class="top_title_wrap">
                <!-- 뒤로가기 -->
                <a href="/adminMain">
                    <button class="backbtn">&lt;</button>
                </a>
            </div>
            <a><input type="button" class="delete_btn" value="선택회원 삭제"></a>
            <a href="/a_user"><input type="button" class="show_all_btn" value="전체회원 보기"></a>
            <br>
            <form action="/searchUser" method="get" id="searchForm">
                <select id="searchType" name="selectType">
                    <option value="userId">아이디</option>
                    <option value="userName">이름</option>
                    <option value="userEmail">이메일</option>
                    <option value="userNickname">닉네임</option>
                </select>
                <input type="text" id="searchValue" name="keyword">
                <input type="submit" value="검색">
            </form>
        </div>
        <br>
        <div id="goods_list">
            <table>
                <tr class="goods_listTitle">
                    <td></td>
                    <td>아이디</td>
                    <td>이름</td>
                    <td>닉네임</td>
                    <td>휴대폰</td>
                    <td>이메일</td>
                    <td>주소</td>
                    <td>상세주소</td>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td><input type="checkbox" value="${user.userId}"></td>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.userNickname}</td>
                        <td>${user.userPhone}</td>
                        <td>${user.userEmail}</td>
                        <td>${user.userAddress}</td>
                        <td>${user.userAddressDetail}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>

