<%@ page import="com.choongang.OriMarket.user.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset= "UTF-8">
    <title>Ori_UserInfo</title>
    <link rel="stylesheet" href="../../css/user/user_infolist.css">
</head>
<body>
        <input type="hidden" name="userPassword" value="${userPassword}" >
        <div id="infolist_main">
            <h2>${userNickname}님 회원 정보</h2>
            <table id="infolist_table_1">
                <tr>
                    <td class="infolist_table_td_1">아 이 디</td>
                    <td class="infolist_table_td_2">${userId}</td>
                </tr>
                <tr>
                    <td class="infolist_table_td_1">이 름</td>
                    <td class="infolist_table_td_2">${userName}</td>
                </tr>
                <tr>
                    <td class="infolist_table_td_1">닉 네 임</td>
                    <td class="infolist_table_td_2">${userNickname}</td>
                </tr>
                <tr>
                    <td class="infolist_table_td_1">휴 대 폰</td>
                    <td class="infolist_table_td_2">${userPhone}</td>
                </tr>
                <tr>
                    <td class="infolist_table_td_1">이 메 일</td>
                    <td class="infolist_table_td_2">${userEmail}</td>
                </tr>
                <tr>
                    <td class="infolist_table_td_1">주 소</td>
                    <td class="infolist_table_td_2">${userAddress} ${userAddressDetail}</td>
                </tr>
            </table>
            <table id="infolist_table_2">
                <td><a id="infolist_btn_edit" href="/update">회원 정보 수정</a></td>
                <form action="/delete" method="post">
                <input type="hidden" name="userSeq" value="${userSeq}">
                <input type="submit" value="삭제">
                </form>
                <td>
                    <a id="infolist_btn_delete">로그아웃</a></td></input>

            </table>
        </div>
</body>
</html>