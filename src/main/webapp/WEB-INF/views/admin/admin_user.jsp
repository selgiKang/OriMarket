<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        body{
            margin: 0;
            padding: 0;
            font-family:'LINESeedKR-Bd';
            font-size: 16px;
            text-align: center; width: 1920px;}


        #goods_store{
            height:100%;
            background-color:#46A973;
            color:#fff;
            text-align: right;
            display: flex;
            justify-content: end;
            align-items: center;}

        .snun_wrap{width: 1920px; text-align: center;}

        /* 230723 승원 */
        .goods_store_wrap{background-color:#eee; width: 100%;}
        .top_title_wrap h1{text-align:center; margin:15px 18%;}

        #goods_title{padding:20px 0 0;}
        #goods_title a{color:#333; margin:10px 5px; margin-right: 0;}
        .top_title_wrap{ display: flex; align-items: center;}
        button.backbtn { display: flex; align-items: center; font-size: 20px; color: #999; margin: 0 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
        button.backbtn:hover {background-color:#333; color:#fff;}

        /* ------------------------------------------ 공통적용css---------------------------------------------- */

        #goods_list{font-size: 15px; margin: 1px;}

        /* 230723 승원 */
        #goods_list table{ border-radius: 5px; background-color:#fff; width: 1920px; }

        .goods_listTitle td{
            padding: 12px;
        }

        /* 230723 승원 */
        #goods_title > a > input{
            background-color: #ffbf41;
            color: #333;
            font-weight:600;
            padding: 8px 8px;
            border:none;
            border-radius:5px;
            cursor:pointer;}

        #goods_title > a > input:hover {background-color:#333; color:#fff;}

        .goods_listTitle{color: #46A973; margin-bottom:15px;}
    </style>
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
            <a><input type="button" class="delete_btn" value="선택회원 삭제"></a>
            <a href="/a_user"><input type="button" class="show_all_btn" value="전체회원 보기"></a>
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

