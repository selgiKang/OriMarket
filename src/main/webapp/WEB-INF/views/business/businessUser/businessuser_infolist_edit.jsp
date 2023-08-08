<%@ page import="com.choongang.OriMarket.user.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<style>
    #infolist_main3{width: 80%; height:512px; position:relative; border-radius: 25px; border-radius: 25px; background-color:#fff; padding:20px; margin: 0 auto; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.5);}

    .top_title_wrap{ display: flex; align-items: center;}
    .top_title_wrap h2{text-align:center; margin:15px 10%;}

    button.backbtn { display: flex; align-items: center; font-size: 20px; color: #999; margin: 0 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
    button.backbtn:hover {background-color:#333; color:#fff;}

    .infolist_content_wrap{width:90%; margin: 20px auto;}

    .infolist_table_td_1{font-size: 16px; font-weight: 700;}
    .infolist_table_td_2{height:30px; border-radius: 5px;}
    input[type=text] {width: 90%; height: 25px; font-size: 15px; border: 0; border-radius: 15px; outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);}


</style>
<html>
<head>
    <meta charset= "UTF-8">
    <title>Ori_UserInfo</title>
    <link rel="stylesheet" href="../../css/user/user_infolist.css">
    <script>
        <%-- 서버에서 에러 메시지를 전달할 경우 알림 팝업 띄우기 --%>
        <% if (request.getAttribute("updateError") != null) { %>
        window.onload = function() {
            var errorMessage = "<%= request.getAttribute("updateError") %>";
            if (errorMessage.trim() !== "") {
                alert(errorMessage);
            }
        };
        <% } %>
        <% if (request.getAttribute("deleteError") != null) { %>
        window.onload = function() {
            var errorMessage = "<%= request.getAttribute("deleteError") %>";
            if (errorMessage.trim() !== "") {
                alert(errorMessage);
            }
        };
        <% } %>
    </script>
</head>
<body>
<div class="infolist_wrap" style="width:375px; height:812px; background-color: #46A973; margin:0 auto; display: flex; justify-content: center; align-items: center;">
    <div class="top_title_wrap">
        <form action="/buUserUpdate" method="post">
            <div id="infolist_main3">
                <!-- 뒤로가기 -->
                <button class="backbtn" onclick="location.href='/infolist1'">&lt;</button>
                <h2>${buUserResult.buUserName}님 회원 정보</h2>
                <div class="infolist_content_wrap">
                    <table id="infolist_table_1">
                        <tr>
                            <td class="infolist_table_td_1">사업자 번호</td>
                            <td class="infolist_table_td_2">
                                <input type="hidden" name="buUserNumber" value="${buUserResult.buUserNumber}" readonly>${buUserResult.buUserNumber}
                            </td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">소속 시장</td>
                            <td class="infolist_table_td_2">
                                <input type="hidden" name="market" value="${buUserResult.market.marketSeq}" readonly>${buUserResult.market.marketName}
                            </td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">아 이 디</td>
                            <td class="infolist_table_td_2">
                                <input type="hidden" name="buUserId" value="${buUserResult.buUserId}" readonly>${buUserResult.buUserId}
                            </td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">비밀번호</td>
                            <td class="infolist_table_td_2">
                                <input type="hidden" name="buUserPassWord" value="${buUserResult.buUserPassWord}" readonly>${buUserResult.buUserPassWord}
                            </td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">이 름</td>
                            <td class="infolist_table_td_2">
                                <input type="hidden" name="buUserName" value="${buUserResult.buUserName}" readonly>${buUserResult.buUserName}
                            </td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">휴 대 폰</td>
                            <td class="infolist_table_td_2"><input type="text" name="buUserPhone" value="${buUserResult.buUserPhone}"></td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">이 메 일</td>
                            <td class="infolist_table_td_2"><input type="text" name="buUserEmail" value="${buUserResult.buUserEmail}"></td>
                        </tr>
                        <tr>
                            <td class="infolist_table_td_1">주 소</td>
                            <td class="infolist_table_td_2">
                                <input type="text" name="buUserAddress" value="${buUserResult.buUserAddress}" style="width:50%; margin-bottom:5px;"><button type="button" class="btn_round" onclick="searchAddress()"
                                                                                                     style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
                            </button>
                                <input type="text" name="buUserAddressDetail" value="${buUserResult.buUserAddressDetail}" placeholder="상세주소를입력해주세요...">

                            </td>
                        </tr>
                    </table>
                    <table id="infolist_table_2" style="margin:20px 0;">
                        <td><button id="infolist_btn_edit" style="width:120px;">회원 정보 수정</button></td>
                        <td><button id="infolist_btn_delete" style="width:120px;"><a href="/buUserDelete" style="text-decoration:none; color:#333;">회원 탈퇴</a></button></td>
                    </table>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>