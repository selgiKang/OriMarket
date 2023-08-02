<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자_주문관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/common.css">
    <style>
        .admin_orderlist_box{width:100%; margin:auto;}
        .admin_orderlist_title, .admin_orderlist{text-align: center; margin:auto;}
        .admin_orderlist{width:60%; border:1px solid #eee;}
        .admin_orderlist > tr {background-color:#eee;}

    </style>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div class="snun_wrap">
            <h1>주문접수현황</h1>
        </div>
    </div>
    <div class="goods_store_wrap">
        <div id="goods_title">
            <div class="top_title_wrap">
                <!-- 뒤로가기 -->
                <a href="/adminMain"><button class="backbtn">&lt;</button></a>
            </div>
            <form action="/searchOrder" method="get">
                <table>
                    <tr>
                        <td>
                            <select name="selectType" id="searchType">
                                <option value="">시장</option>
                                <option value="">사업자명</option>
                                <option value="">일반회원</option>
                                <option value="">주문번호</option>
                                <option value="orderType">결제수단</option>
                            </select>
                        </td>
                        <td><input type="text" name="keyword" id="searchValue"></td>
                        <td><input type="submit" value="검색"></td>
                    </tr>
                </table>
            </form>
        </div>
        <br>
        <div id="goods_list">
            <form action="" method="">
                <table id="b_table">
                    <tr class="goods_listTitle">
                        <td>주문일자</td>
                        <td>주문번호</td>
                        <td>주문자</td>
                        <td>시장명</td>
                        <td>주문상품</td>
                        <td>금액</td>
                        <td>수량</td>
                        <td>결제수단</td>
                        <td>가게요청사항</td>
                        <td>배달요청사항</td>
                        <td>가게</td>
                    </tr>
                    <%--반복문시작--%>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.createdDate}</td>
                            <td>${order.}</a></td>
                            <td>${buser.businessStores.get(0).buStoreName}</td>
                            <td>${buser.buUserName}</td>
                            <td>${buser.buUserAddress}</td>
                            <td>${buser.buUserId}</td>
                            <td>${buser.buUserPhone}</td>
                            <td>${buser.buUserEmail}</td>
                            <td>
                                <button><a href="/delete_buser/${buser.buUserNumber}">삭제</a></button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </div>
</div>

</body>
</html>

