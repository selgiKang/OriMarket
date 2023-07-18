<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>현 재고 리스트</title>
    <style type="text/css">
        /* 전체적용 */
        @font-face {
            font-family: 'omyu_pretty';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        /* 전체 크기 */
        body{margin: 0; padding: 0; font-family:'LINESeedKR-Bd'; font-size: 16px; text-align: center;}
        #goods_container{width: 375px; border: 1px solid black;}

        /* 가게상호명,업주 */
        #goods_store{text-align: right;}

        /* ------------------------------------------ 공통적용css---------------------------------------------- */

        #goods_list{font-size: 14px;}

        #goods_title a{margin-right: 0;}


        #goods_listTitle{color: #46A973;}
    </style>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div>가게이름나오게</div>
        <small>대표:가게주인나오게</small>
    </div>
    <div id="goods_title">
        <h1>현 재고 목록</h1>
        <a href="#"><input type="button"  value="선택품목 삭제"></a>
        <a href="./GoodsManage_register.jsp"><input type="button"  value="신규품목 등록"></a>
    </div>
    <br>
    <div id="goods_list">
        <table>
            <tr id="goods_listTitle">
                <td></td>
                <td>상품번호</td>
                <td>상품명</td>
                <td>상품수량</td>
                <td>원가</td>
                <td>판매가</td>
                <td>무게</td>
                <td>원산지</td>
                <td>입고일</td>
                <td>상세정보</td>
            </tr>
            <c:forEach var="it" items="${items}">
            <tr>
                <td><input type="checkbox" value="Goods"></td>
                <td><a href="./GoodsManage_details.jsp">${it.itemId}</a></td>
                <td>${it.itemName}</td>
                <td>${it.itemCnt}</td>
                <td>${it.itemCost}</td>
                <td>${it.itemPrice}</td>
                <td>${it.itemG}</td>
                <td>${it.itemFrom}</td>
                <td>${it.itemRegDate}</td>
                <td>${it.itemInfo}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>