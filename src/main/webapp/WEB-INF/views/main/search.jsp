<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../../css/user/join.css">

    <script src="../../js/user/join.js"></script>
</head>
<style>
    hr {
        width: 350px; /* 원하는 길이로 조정합니다. */
        margin: 0 auto;
        margin-top: 15px;
        position: absolute;
        top: 60px;
        left: 12px;
    }
    #hr1 {
        width: 350px; /* 원하는 길이로 조정합니다. */
        margin: 0 auto;
        margin-top: 15px;
        position: absolute;
        top: 230px;
        left: 12px;
    }
</style>

<body>
<div class="container" style="position: relative">
    <a href="/"><h1 style="position: fixed; left: 20px; top: 0; font-size: 30px; color: red">홈으로 바로가기</h1></a>
    <form action="/search" method="post">
        <div class="form_field">
            <h2 style="position: absolute; top: 10px; left: 40px;"><label for="address_kakao">배달받을 주소 설정하기</label></h2>
            <c:if test="${!empty userAddress1}">
                <a href="/mylocation" style="position: absolute; top: 75px; left: 20px">위치보기</a>
                <p style="position: absolute; top: 75px; left: 20px">현재 내가 설정한주소: <span style="color: yellow">${userAddress1} ${userAddressDetail1} </span></p>
            </c:if>
            <c:if test="${empty userAddress1}">
                <p style="position: absolute; top: 75px; left: 20px">현재 내가 설정한주소: <span style="color: red">주소를 등록해주세요..</span></p>
            </c:if>
            <hr>
            <div class="input_container">
                <input type="text" id="address_kakao" name="userAddress1" readonly style="position: absolute; top: 120px; right: 130px;" placeholder="주소검색버튼을눌러주세요..">
                <div class="btn_container" style="position: absolute; top: 120px; right: 60px">
                    <button type="button" class="btn_round" onclick="searchAddress()"
                            style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
                    </button>
                </div>
            </div>
        </div>

        <div class="form_field" style="position: absolute; top: 170px; right: 130px">
            <label for="address_detail"></label>
            <input type="text" id="address_detail" name="userAddressDetail1" placeholder="상세주소를 입력해주세요" required>
        </div>

        <input type="submit" value="등록하기" class="submit_btn" style="position: absolute; top: 210px; left: 20px;">
        <hr id="hr1">
        <p style="position: absolute; top: 240px; left: 20px;">내 주소 목록</p>
        <ul  style="position: absolute; top: 270px; left: 20px;">
            <li>키키키</li>
        </ul>

    </form>

</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>


</html>
