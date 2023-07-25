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

        /**/
        div.connextion_mk2_wrap{position:relative;}
        .connexion_marketbox_wrap{display: flex; justify-items: center; align-items: center;}
        img.connexion_market_img{
            width: 120px;
            height: 65px;
            position: absolute;
            top: 42%;
            left: 6%;}
        a.connextion_mk2{position:absolute; top:-9%; left:21%;}
        .connextion_mk2 > p {
            position: absolute;
            width: 120px;
            top: 2%;
            left: -40%;
            font-size: 16px;
            background-color: #ffbf41;
            border-radius: 10px;}

        .navicon{
            font-size: 5em;
            animation: motion 0.6s
            linear 0s
            infinite alternate;
        }
        @keyframes motion {
            0% {margin-top: 0px;}
            100% {margin-top: 8px;}
        }
    </style>
</head>
<body>
    <div id="main">
        <jsp:include page="../header/header_index.jsp" />
        <div id="main_wrap_box">
            <div class="modal">
                <div class="modal_body">
                    <div class="container">
                        <form action="/" method="post">
                            <div class="form_field">
                                <h2 style="margin:30px 0;"><label for="address_kakao">단골시장 추가하기</label></h2>
                                    <a href="/connexion_market" class="current_location_btn" style="text-decoration:none; color:#333; cursor: pointer;"><i class="fa-solid fa-location-dot header_i" style="font-size: 16px;"></i>&nbsp;가까운 시장찾기 > </a>
                                    <p style="margin-top:30px; font-size: 14px;">현재 내가 설정한 주소: <span style="color: red; font-size: 14px;">주소를 등록해주세요..</span></p>
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

            </div>
            <div id="connextion_market" class="clear">
                <c:if test="${empty userId}">
                    <span class="connextion_title clear" style="font-weight:800;font-size: 18px;font-family: 'omyu pretty';/*border: 2px solid #999;*/width: 290px;border-radius: 5px;height: 50px; display: flex; justify-content: flex-start; align-items: center;">&nbsp;<img class="connextion_title_img clear navicon" src="../../img/main/navi.png">&nbsp;<p>&nbsp나의 단골시장</p></span>
                </c:if>
                <c:if test="${!empty userId}">
                    <span class="connextion_title clear" style="font-weight:800;font-size: 18px;font-family: 'omyu pretty';/*border: 2px solid #999;*/width: 290px;border-radius: 5px;height: 50px; display: flex; justify-content: flex-start; align-items: center;">&nbsp;<img class="connextion_title_img clear navicon" src="../../img/main/navi.png">&nbsp;<p>&nbsp;${userNickname}님의 단골시장</p></span>
                </c:if>
                <hr style="width:280px;margin-left: 8%;opacity: 0.4;">
                <div class="connextion_marketbox clear">
                    <div class="connexion_marketbox_wrap" style="padding:10px 20px;">
                        <div class="connextion_mk1_wrap" style="margin-right:20px;">
                            <img class="connexion_market_img" src="../../img/main/market2.png">
                            <a class="connextion_mk1" href="/shinwon_marketmap">
                                <p style="font-weight: 800;">내가 등록한시장</p>
                            </a>
                        </div>
                        <c:if test="${!empty marketName}">
                        <div class="connextion_mk2_wrap btn-open-popup" onclick="modal" style="margin-right:20px;">
                            <img class="connexion_market_img" src="../../img/main/market2.png">
                            <a class="connextion_mk2" href="">
                                <p>${marketName}</p>
                            </a>
                        </div>
                        </c:if>
                        <c:if test="${empty marketName}">
                            <div class="connextion_mk2_wrap btn-open-popup" onclick="modal"><a class="connextion_mk2" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                        </c:if>
                    </div>
                    <div class="connexion_marketbox_wrap" style="padding:10px 20px;">
                      <div class="connextion_mk3_wrap"><a class="connextion_mk3" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                      <div class="connextion_mk4_wrap"><a class="connextion_mk4" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
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
    <script>

    </script>
    <script type="text/javascript" src="../../js/main/main_slidebanner.js"></script>
    <script type="text/javascript" src="../../js/main/connexion_market.js"></script>
</body>
</html>