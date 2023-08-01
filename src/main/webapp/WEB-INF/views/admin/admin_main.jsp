<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>라이더 목록</title>
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
            text-align: center; width: 1920px; }

        /* #rider_container{width: 375px; height:812px; margin: 0 auto;}*/


        #rider_store{
            height:100px;
            background-color:#46A973;
            color:#fff;
            text-align: right;
            display: flex;
            justify-content: end;
            align-items: center;}

        .snun_wrap{width: 1920px; text-align: center;}


        .rider_store_wrap{background-color:#eee; width: 100%;}
        .top_title_wrap h1{text-align:center; margin:15px 18%;}

        #rider_title{padding:20px 0 0;}
        #rider_title a{color:#333; margin:10px 5px; margin-right: 0;}
        .top_title_wrap{ display: flex; align-items: center;}
        button.backbtn { display: flex; align-items: center; font-size: 20px; color: #999; margin: 0 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
        button.backbtn:hover {background-color:#333; color:#fff;}

        /* ------------------------------------------ 공통적용css---------------------------------------------- */

        #rider_list{font-size: 14px; margin: 1px;}

        #rider_list table{ border-radius: 5px; background-color:#fff; width: 1920px;}

        .rider_listTitle td{
            padding: 12px;
        }


        #rider_title > a > input{
            background-color: #ffbf41;
            color: #333;
            font-weight:600;
            padding: 8px 8px;
            border:none;
            border-radius:5px;
            cursor:pointer;}

        #rider_title > a > input:hover {background-color:#333; color:#fff;}

        .rider_listTitle{color: #46A973; margin-bottom:15px;}
    </style>
    <script src="../../js/common/jquery-3.6.4.js"></script>
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
            <div class="top_title_wrap">
                <!-- 뒤로가기 -->
                <button class="backbtn" onclick="window.location.replace('/ridernotice1')">&lt;</button>
            </div>
            <form action="/admin_logout" method="get">
                <input type="button" class="delete_btn" value="로그아웃">
            </form>
        </div>
        <br>
        <div id="rider_list">
            <table>
                <tr class="rider_listTitle"><td><a href="">일반 회원 페이지</a></td></tr>
                <tr class="rider_listTitle"><td><a href="/a_buser">사업자 페이지</a></td></tr>
                <tr class="rider_listTitle"><td><a href="/managercrud">매니저 페이지</a></td></tr>
                <tr class="rider_listTitle"><td><a href="/rider_list">라이더 페이지</a></td></tr>
                <tr class="rider_listTitle"><td><a href="/admin_order">주문 페이지</a></td></tr>
            </table>
        </div>
    </div>
</div>
</body>