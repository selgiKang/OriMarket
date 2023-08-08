<%@ page import="com.choongang.OriMarket.user.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ori_UserInfo</title>
    <link rel="stylesheet" href="../../css/user/user_infolist.css">
    <link rel="stylesheet" href="../../css/manager/manager_info_list.css">


</head>
<body>
<div class="infolist_wrap"
     style="width:375px; height:812px; background-color: #46A973; margin:0 auto; display: flex; justify-content: center; align-items: center;">
    <input type="hidden" name="userPassword" value="${userPassword}">
    <div id="infolist_main">
        <div class="top_title_wrap">
            <!-- 뒤로가기 -->
            <button class="backbtn" onclick="window.history.go(-1)">&lt;</button>
            <h2>${managerInfoResult.managerName}님 회원 정보</h2>
        </div>
        <div class="infolist_content_wrap">
            <table id="infolist_table_1" style="margin-bottom:20px;">
                <tr>
                    <td class="infolist_table_td_1">소속 시장</td>
                    <td class="infolist_table_td_2">${managerInfoResult.market.marketName}</td>
                </tr>
                <tr>
                    <td class="infolist_table_td_1">아 이 디</td>
                    <td class="infolist_table_td_2">${managerInfoResult.managerId}</td>
                </tr>
                <tr>
                    <td class="infolist_table_td_1">이 름</td>
                    <td class="infolist_table_td_2">${managerInfoResult.managerName}</td>
                </tr>
                <tr>
                    <td class="infolist_table_td_1">휴 대 폰</td>
                    <td class="infolist_table_td_2">${managerInfoResult.managerPhone}</td>
                </tr>
                <tr>
                    <td class="infolist_table_td_1">이 메 일</td>
                    <td class="infolist_table_td_2">${managerInfoResult.managerEmail}</td>
                </tr>
            </table>
            <table id="infolist_table_2">
                <td class="infolist_btn_edit"
                    style="width:50%; height:40px; background-color:#ffbf41; border-radius: 25px;"><a
                        id="infolist_btn_edit" href="/managerUpdate">회원 정보 수정</a></td>
                <td style="width:50%; height:40px; background-color:#e9e9e9; border-radius: 25px;">
                    <a id="infolist_btn_delete" href="/manager_logout">로그아웃</a></td>
                </input>
            </table>
        </div>
    </div>
</div>
</body>
</html>