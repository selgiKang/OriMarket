<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자_주문관리</title>
    <style>
        .admin_orderlist_box{width:100%; margin:auto;}
        .admin_orderlist_title, .admin_orderlist{text-align: center; margin:auto;}
        .admin_orderlist{width:60%; border:1px solid #eee;}
        .admin_orderlist > tr {background-color:#eee;}
    </style>
</head>
<body>

<div class="order_wrap">
    <div class="order_container">
        <div class="order_chk">
                <form action="" method="post">
                    <button class="backbtn" onclick="window.location.replace('')">&lt;</button>
                        <div class="admin_orderlist_box">
                            <h3 class="admin_orderlist_title">주문 리스트</h3>
                            <table class="admin_orderlist">
                                <tr><th>주문자</th><th>시장명</th><th>가게명</th><th>주문상품</th><th>금액</th><th>갯수</th><th>가게요청사항</th><th>배달요청사항</th></tr>
                                <tr><td>주문자</td><td>시장명</td><td>가게명</td><td>주문상품</td><td>금액</td><td>갯수</td><td>가게요청사항</td><td>배달요청사항</td></tr>
                            </table>
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>

