<%@ page import="com.choongang.OriMarket.user.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보수정</title>
  <link rel="stylesheet" href="../../css/user/user_infolist.css">
</head>
<body>
<form action="/update" method="post">
  <input type="hidden" name="userId" value="${user.userId}" >
  <input type="hidden" name="userPassword" value="${user.userPassword}" >
  <div id="infolist_main">
    <h2>${user.userNickname}님 회원 정보</h2>
    <table id="infolist_table_1">
      <tr>
        <td class="infolist_table_td_1">아 이 디</td>
        <td class="infolist_table_td_2">${user.userId}</td>
      </tr>
      <tr>
        <td class="infolist_table_td_1">이 름</td>
        <td class="infolist_table_td_2">${user.userName}</td>
      </tr>
      <tr>
        <td class="infolist_table_td_1">닉 네 임</td>
        <td class="infolist_table_td_2">${user.userNickname}</td>
      </tr>
      <tr>
        <td class="infolist_table_td_1">휴 대 폰</td>
        <td class="infolist_table_td_2">${user.userPhone}</td>
      </tr>
      <tr>
        <td class="infolist_table_td_1">이 메 일</td>
        <td class="infolist_table_td_2">${user.userEmail}</td>
      </tr>
      <tr>
        <td class="infolist_table_td_1">주 소</td>
        <td class="infolist_table_td_2">${user.userAddress}</td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="회원 정보 수정">
        </td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>
