<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/common.css">
    <style type="text/css">

        #goods_list {
            font-size: 15px;
            margin: 1px;
        }

        /* 230723 승원 */
        #goods_list table {
            border-radius: 5px;
            background-color: #fff;
            width: 1920px;
        }

        .goods_listTitle td {
            padding: 12px;
        }

        /* 230723 승원 */
        #goods_title > a > input {
            background-color: #ffbf41;
            color: #333;
            font-weight: 600;
            padding: 8px 8px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #goods_title > a > input:hover {
            background-color: #333;
            color: #fff;
        }

        .goods_listTitle {
            color: #46A973;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<% if (request.getAttribute("deleteMessage") != null) { %>
window.onload = function() {
alert("<%= request.getAttribute("deleteMessage") %>");
};
<% } %>
<div id="goods_container">
    <div id="goods_store">
        <div class="snun_wrap">
            <h1>사업자등록현황</h1>
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
            <a href="/a_buser"><input type="button" class="show_all_btn" value="전체회원 보기"></a>
            <br>
            <form action="/searchBuser" method="get">
                <select name="selectType" id="searchType">
                    <option value="buUserName">사업자명</option>
                    <option value="buUserNumber">사업자번호</option>
                </select>
                <input type="text" name="keyword" id="searchValue">
                <input type="submit" value="검색">
            </form>
        </div>
        <br>
        <div id="goods_list">
            <form action="" method="">
                <table id="b_table">
                    <tr class="goods_listTitle">
                        <td>시장</td>
                        <td>사업자번호</td>
                        <td>가게상호명</td>
                        <td>사업자명</td>
                        <td>주소</td>
                        <td>아이디</td>
                        <td>연락처</td>
                        <td>이메일</td>
                        <td>관리</td>
                    </tr>
                    <%--반복문시작--%>
                    <c:forEach var="buser" items="${busers}">
                        <tr>
                            <td>${buser.market.marketName}</td>
                            <td><a href="/storeInfo?buUserNumber=${buser.buUserNumber}">${buser.buUserNumber}</a></td>
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

