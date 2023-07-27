<%@ page import="com.choongang.OriMarket.user.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset= "UTF-8">
    <title>Ori_BusinessUserInfo</title>
    <link rel="stylesheet" href="../../css/user/user_infolist.css">
    <style>
        #infolist_main{width: 80%; height:512px; position:relative; border-radius: 25px; border-radius: 25px; background-color:#fff; padding:20px; margin: 0 auto; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.5);}

        .top_title_wrap{ display: flex; align-items: center;}
        .top_title_wrap h2{text-align:center; margin:15px 10%;}

        button.backbtn { display: flex; align-items: center; font-size: 20px; color: #999; margin: 0 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
        button.backbtn:hover {background-color:#333; color:#fff;}

        .infolist_content_wrap{width:90%; margin: 20px auto;}
    </style>
</head>
<body>
    <div class="infolist_wrap" style="width:375px; height:812px; background-color: #46A973; margin:0 auto; display: flex; justify-content: center; align-items: center;">
        <input type="hidden" name="userPassword" value="${buUserResult.buUserPassWord}" >
        <div id="infolist_main">
            <div class="top_title_wrap">
                <!-- 뒤로가기 -->
                <button class="backbtn" onclick="window.location.replace('/storenotice1')">&lt;</button>
                <h2>${buUserResult.buUserName}님 회원 정보</h2>
            </div>
            <div class="infolist_content_wrap">
                <table id="infolist_table_1" style="margin-bottom:20px;">
                    <tr>
                        <td class="infolist_table_td_1">사업자<br>번호</td>
                        <td class="infolist_table_td_2">${buUserResult.buUserNumber}</td>
                    </tr>
                    <tr>
                        <td class="infolist_table_td_1">소속 시장</td>
                        <td class="infolist_table_td_2">${buUserResult.market.marketName}</td>
                    </tr>
                    <tr>
                        <td class="infolist_table_td_1">아 이 디</td>
                        <td class="infolist_table_td_2">${buUserResult.buUserId}</td>
                    </tr>
                    <tr>
                        <td class="infolist_table_td_1">이 름</td>
                        <td class="infolist_table_td_2">${buUserResult.buUserName}</td>
                    </tr>
                    <tr>
                        <td class="infolist_table_td_1">휴 대 폰</td>
                        <td class="infolist_table_td_2">${buUserResult.buUserPhone}</td>
                    </tr>
                    <tr>
                        <td class="infolist_table_td_1">이 메 일</td>
                        <td class="infolist_table_td_2">${buUserResult.buUserEmail}</td>
                    </tr>
                    <tr>
                        <td class="infolist_table_td_1">주 소</td>
                        <td class="infolist_table_td_2">${buUserResult.buUserAddress} ${buUserResult.buUserAddressDetail}</td>
                    </tr>
                </table>
                <table id="infolist_table_2">
                    <td class="infolist_btn_edit" style="width:50%; height:40px; background-color:#ffbf41; border-radius: 25px;"><a id="infolist_btn_edit" href="/buUserUpdate">회원 정보 수정</a></td>
                    <td style="width:50%; height:40px; background-color:#e9e9e9; border-radius: 25px;">
                        <a id="infolist_btn_delete" href="/buUserLogout">로그아웃</a>
                    </td></input>

                </table>
            </div>
        </div>
    </div>
</body>
</html>