<%@ page import="com.choongang.OriMarket.user.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset= "UTF-8">
    <title>Ori_UserInfo</title>
    <link rel="stylesheet" href="../../css/user/user_infolist.css">
    <link rel="stylesheet" href="../../css/user/user_infolist_edit.css">
</head>
<body>
<div class="infolist_wrap" style="width:375px; height:812px; background-color: #46A973; margin:0 auto; display: flex; justify-content: center; align-items: center;">
    <div class="top_title_wrap">
        <form action="/update" method="post">
            <input type="hidden" name="userPassword" value="${userPassword}" >
            <div id="infolist_main2">
                <!-- 뒤로가기 -->
                <button class="backbtn" onclick="window.history.go(-1)">&lt;</button>
                <h2>${userNickname}님 회원 정보</h2>
                <div class="infolist_content_wrap">
                    <table id="infolist_table_1">
                        <input type="hidden" name="userSeq" value="${userSeq}">
                        <tr>
                            <td class="infolist_table_td_1">아 이 디</td>
                            <td class="infolist_table_td_2"><input type="text" name="userId" value="${userId}" readonly></td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">이 름</td>
                            <td class="infolist_table_td_2"><input type="text" name="userName" value="${userName}" readonly></td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">닉 네 임</td>
                            <td class="infolist_table_td_2"><input type="text" name="userNickname" value="${userNickname}"></td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">휴 대 폰</td>
                            <td class="infolist_table_td_2"><input type="text" name="userPhone" value="${userPhone}"></td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">이 메 일</td>
                            <td class="infolist_table_td_2"><input type="text" name="userEmail" value="${userEmail}"></td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">주 소</td>
                            <td class="infolist_table_td_2">
                                <input type="text" name="userAddress" value="${userAddress}" style="width:50%; margin-bottom:5px;"><button type="button" class="btn_round" onclick="searchAddress()"
                                                                                                     style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
                            </button>
                                <input type="text" name="userAddressDetail" value="${userAddressDetail}" placeholder="상세주소를입력해주세요...">

                            </td>
                        </tr>
                    </table>
                    <table id="infolist_table_2" style="margin:20px 0;">
                        <td><button id="infolist_btn_edit" style="width:120px;">회원 정보 수정</button></td>
                        <td><button id="infolist_btn_delete" style="width:120px;"><a href="/delete?userSeq=${userSeq}" style="text-decoration:none; color:#333;">회원 탈퇴</a></button></td>
                    </table>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>