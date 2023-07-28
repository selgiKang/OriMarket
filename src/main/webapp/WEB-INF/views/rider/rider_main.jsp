<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.choongang.OriMarket.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.choongang.OriMarket.RealTimeStatus.RealTimeStatus" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orimarket_managerOrderList</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/manager/order_list.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../js/manager/manager.js"></script>
    <style>
        .order-number>a{
            color: #333333;
            text-decoration: none;
        }
        .order-number>a:hover {
            cursor: pointer;
            opacity: 0.7;
        }
    </style>
</head>
<body id="orderList_body">
<div class="order-list">
    <div class="order-history-heading">
        <span>오리마켓</span> (라이더)
    </div>
    <div class="order_list_mypage">
        <div><a href="/manager_mypage">회원 정보 확인하기</a>
            <a href="/manager_logout">로그아웃</a></div>
    </div>
    <div class="tab">
        <span class="tab-link active" data-tab="pending">배달요청 목록</span>
        <span class="tab-link active" data-tab="pending">요청수락 목록</span>
        <span class="tab-link active" data-tab="pending">배달 시작</span>
        <span class="tab-link" data-tab="processing1">배달 완료</span>
    </div>
    <%--배달 요청 목록--%>
    <div class="order-item" data-status="pending">
        <h2>아무거나</h2>
    </div>
    <%--요청 수락 목록--%>
    <div class="order-item" data-status="processing1">
        <h2>아무거나1</h2>
    </div>
    <%--배달 시작--%>
    <div class="order-item" data-status="processing2">
        <h2>아무거나2</h2>
    </div>
    <%--배달 완료--%>
    <div class="order-item" data-status="completed">
        <h2>아무거나3</h2>
    </div>
    <div class="order-item" data-status="processing" style="display: none;"></div>
    <div class="order-item" data-status="completed" style="display: none;"></div>
</div>
</body>
</html>
