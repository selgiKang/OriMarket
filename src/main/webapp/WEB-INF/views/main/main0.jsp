<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OriMarket</title>
    <link rel= "stylesheet" href= "../../css/main/main.css">
    <link rel= "stylesheet" href= "../../css/main/connexion_market.css">
    <style>

/*        .connextion_mk1_wrap a{
            width: 120px;
            height: 100px;
            background-image: url("../../../../resources/static/img/main/market.png");
            background-position:center center; background-repeat: no-repeat;
        }*/
        div.connextion_mk1_wrap{position:relative;}
        .connexion_marketbox_wrap{display: flex; justify-items: center; align-items: center;}
        img.connexion_market_img{
            width: 120px;
            height: 65px;
            position: absolute;
            top: 42%;
            left: 6%;}
        a.connextion_mk1{position:absolute; top:-9%; left:21%;}
        .connextion_mk1 > p {
            position: absolute;
            width: 120px;
            top: 2%;
            left: -40%;
            font-size: 16px;
            background-color: #ffbf41;
            border-radius: 10px;}

    </style>
</head>
<body>

<!-- ******************************단골시장추가하기 테스트********************************* -->
<div id="main">
    <jsp:include page="../header/header_index.jsp" />
    <div id="main_wrap_box">
<%--        <div class="modal">
            <div class="modal_body">
                <div class="container">
                    <form action="/" method="post">
                        <div class="form_field">
                            <h2 style="margin:30px 0;"><label for="address_kakao">단골시장 추가하기</label></h2>
                            <a href="/connexion_market0" class="current_location_btn" style="text-decoration:none; color:#333; cursor: pointer;"><i class="fa-solid fa-location-dot header_i" style="font-size: 16px;"></i>&nbsp;가까운 시장찾기 > </a>
                            <p style="margin-top:30px; font-size: 14px;">현재 내가 설정한 주소: <span style="color: red; font-size: 14px;">주소를 등록해주세요..</span></p>
                            <button type="button">단골시장 추가하기</button>
                            <hr style="margin-top:30px;">
                            <div class="input_container" style="margin-top:30px;">
                                <input type="text" id="address_kakao" name="userAddress" readonly style="width:190px; height:30px; border:1px solid #ffbf41; border-radius: 35px; float:left;"  placeholder=" 주소를 입력해 주세요">
                                <div class="btn_container" >
                                    <button type="button" class="btn_round" onclick="searchAddress()"
                                            style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; float: right; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>--%>

    <div class="modal">
        <div class="modal_body">
            <div class="container">
                <form action="/your_registration_page.jsp" method="post"> <!-- 수정 필요: "your_registration_page.jsp"에 실제 처리 로직을 작성해야함-->
                    <div class="form_field">
                        <h2 style="margin:30px 0;"><label for="address_kakao">단골시장 추가하기</label></h2>
                        <a href="/connexion_market0" class="current_location_btn" style="text-decoration:none; color:#333; cursor: pointer;">
                            <i class="fa-solid fa-location-dot header_i" style="font-size: 16px;"></i>&nbsp;가까운 시장찾기 > </a>
                        <p style="margin-top:30px; font-size: 14px;">현재 내가 설정한 주소: <span style="color: red; font-size: 14px;" id="address_display">주소를 등록해주세요..</span></p>
                        <hr style="margin-top:30px;">
                        <div class="input_container" style="margin-top:30px;">
                            <input type="text" id="address_kakao" name="userAddress" readonly style="width:190px; height:30px; border:1px solid #ffbf41; border-radius: 35px; float:left;"  placeholder=" 주소를 입력해 주세요">
                            <div class="btn_container" >
                                <button type="button" class="btn_round" onclick="searchAddress()"
                                        style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; float: right; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- "단골시장 추가하기" 버튼 -->
                    <div class="form_field">
                        <button type="submit" class="btn_round" style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; float: right; font-family: 'omyu pretty', Arial, sans-serif;">단골시장 추가하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

        <div id="connextion_market" class="clear">
            <c:if test="${empty userId}">
                <span class="connextion_title clear" style="font-weight:800; font-size: 18px;">&nbsp;<img class="connextion_title_img clear" src="../../img/main/singsing.png">&nbsp;&nbsp; 나의 단골시장</span>
            </c:if>
            <c:if test="${!empty userId}">
                <span class="connextion_title clear" style="font-weight:800; font-size: 18px;">&nbsp;<img class="connextion_title_img clear" src="../../img/main/singsing.png">&nbsp;&nbsp;${userNickname}님의 단골시장</span>
            </c:if>
                <div class="connextion_marketbox clear">
                    <div class="connexion_marketbox_wrap" style="padding:10px 20px;">
                      <div class="connextion_mk1_wrap" style="margin-right:20px;"><img class="connexion_market_img" src="../../img/main/market2.png"><a class="connextion_mk1" href="/shinwon_marketmap"><p style="font-weight: 800;">신원시장</p></a></div>
                       <div class="connextion_mk2_wrap btn-open-popup" onclick="modal"><a class="connextion_mk2" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                    </div>
                    <div class="connexion_marketbox_wrap" style="padding:10px 20px;">
                        <div class="connextion_mk3_wrap btn-open-popup"  style="margin-right:20px;"  onclick="modal"><a class="connextion_mk3" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                    <div class="connextion_mk4_wrap btn-open-popup"  onclick="modal"><a class="connextion_mk4" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                    </div>
            </div>
        </div>
        <div id="main_banner_wrap">
            <div class="main_slidebanner_box slideshow-container">
                <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn.png" alt="메인배너1"></div>
                <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn2.png" alt="메인배너2"></div>
                <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn3.png" alt="메인배너3"></div>
                <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn4.png" alt="메인배너4"></div>
            </div>
            <div class="list-button">
                <span class="list-button-item active"></span>
                <span class="list-button-item"></span>
                <span class="list-button-item"></span>
                <span class="list-button-item"></span>
            </div>
        </div>
    </div>
    <jsp:include page="../footer/footer.jsp" />
</div>
<script type="text/javascript" src="../../js/main/main_slidebanner.js"></script>
<script type="text/javascript" src="../../js/main/connexion_market.js"></script>

</body>
</html>