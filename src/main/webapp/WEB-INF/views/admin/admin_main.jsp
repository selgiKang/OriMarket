<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>라이더 목록</title>
    <script src="../../js/common/jquery-3.6.4.js"></script>
    <link rel="stylesheet" href="../../css/admin/main.css">
</head>
<body>
<div id="rider_container">
    <div id="rider_store">
        <div class="snun_wrap">
            <h1>Orimarket_관리자 매니저</h1>
        </div>
    </div>
    <div class="rider_store_wrap">
        <div id="rider_title">
            <form action="/admin_logout" method="get">
                <input type="submit" class="delete_btn" value="로그아웃">
            </form>
        </div>
        <br>
        <div id="rider_list">
            <table>
                <tr class="rider_listTitle"><td><a href="/a_user">일반 회원 페이지</a></td></tr>
                <tr class="rider_listTitle"><td><a href="/a_buser">사업자 페이지</a></td></tr>
                <tr class="rider_listTitle"><td><a href="/managercrud">매니저 페이지</a></td></tr>
                <tr class="rider_listTitle"><td><a href="/rider_list">라이더 페이지</a></td></tr>
                <tr class="rider_listTitle"><td><a href="/admin_order">주문 페이지</a></td></tr>
            </table>
        </div>
    </div>
</div>
</body>