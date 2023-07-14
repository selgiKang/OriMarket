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
</head>
<body>
    <form action="/update" method="post">
        <a href="/"><h1 style="position: fixed; left: 20px; top: 0; font-size: 30px; color: red">홈으로 바로가기</h1></a>
        <input type="hidden" name="userPassword" value="${userPassword}" >
        <div id="infolist_main">
            <h2>${userNickname}님 회원 정보</h2>
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
                        <input type="text" name="userAddress" value="${userAddress}"><button type="button" class="btn_round" onclick="searchAddress()"
                                                                                             style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
                    </button>
                        <input type="text" name="userAddressDetail" value="${userAddressDetail}" placeholder="상세주소를입력해주세요...">

                    </td>
                </tr>
            </table>
            <table id="infolist_table_2">
                <td><button id="infolist_btn_edit">회원 정보 수정</button></td>
                <td><button id="infolist_btn_delete"><a href="/delete?userSeq=${userSeq}">회원 탈퇴</a></button></td>
            </table>
        </div>
    </form>
</body>
</html>