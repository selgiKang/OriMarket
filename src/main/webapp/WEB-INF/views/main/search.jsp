<%@ page import="com.choongang.OriMarket.user.UserAddress" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../../css/user/join.css">
    <link rel="stylesheet" type="text/css" href="../../css/main/main_search.css">

    <script src="../../js/user/join.js"></script>
</head>


<body>
<div class="container">
    <div class="search_wrap">
        <form action="/search" method="post">
            <div class="form_field">
                <!-- 뒤로가기 -->
                <button class="backbtn" onclick="window.location.replace('/')">&lt;</button>
                <h2 style="position: absolute; top: 1px; left: 25%;"><label for="address_kakao">배달받을 주소 설정하기</label>
                </h2>
                <c:if test="${!empty userAddress1}">
                    <a href="/mylocation" class="mylocation_btn">위치보기</a>
                    <p style="position: absolute;width: 280px;top: 12%;left: 5px;padding: 10px 29px;">현재 내가 설정한주소: <span
                            style="color: #46A973;">${userAddress1} ${userAddressDetail1}</span></p>
                </c:if>
                <c:if test="${empty userAddress1}">
                    <p style="position: absolute; top: 75px; left: 20px">현재 내가 설정한주소: <span style="color: red">주소를 등록해주세요..</span>
                    </p>
                </c:if>
                <hr>
                <div class="input_container">
                    <input type="text" id="address_kakao" name="userAddress1" readonly
                           style="position: absolute; top: 35%; right: 30%;" placeholder="주소검색버튼을눌러주세요..">
                    <div class="btn_container" style="position: absolute; top: 35%; right: 10%">
                        <button type="button" class="btn_round" onclick="searchAddress()"
                                style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; font-family: 'omyu pretty', Arial, sans-serif;">
                            주소검색
                        </button>
                    </div>
                </div>
            </div>

            <div class="form_field" style="position: absolute; top: 44%; right: 30%">
                <label for="address_detail"></label>
                <input type="text" id="address_detail" name="userAddressDetail1" placeholder="상세주소를 입력해주세요" required>
            </div>

            <input type="submit" value="등록하기" class="submit_btn" style="position: absolute;top: 52%;left: 9%;">
            <hr id="hr1">
        </form>
        <p style="position: absolute;top: 62%;left: 25px;">내 주소 목록</p>
        <ul style="position: absolute;top: 66%;left: 3px;">
            <c:forEach var="userAddress" items="${userAd}" varStatus="status">
                <li style="margin-top: 5px;">${userAd[userAd.size() - status.index - 1].userAddress1} ${userAd[userAd.size() - status.index - 1].userAddressDetail1}
                    <a href="/updateAddress?userAddressSeq=${userAd[userAd.size() - status.index - 1].userAddressSeq}">변경</a>
                    <a href="/deleteAddress?userAddressSeq=${userAd[userAd.size() - status.index - 1].userAddressSeq}">삭제</a>
                </li>

            </c:forEach>
        </ul>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</body>


</html>
