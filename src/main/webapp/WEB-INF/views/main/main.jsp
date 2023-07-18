<%@ page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OriMarket</title>
    <link rel= "stylesheet" href= "../../css/main/main.css">
    <style>
        .modal {
            position: absolute;

            width: 375px;
            height: 812px;

            z-index: 999999;

            display: none;

            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal.show {
            display: block;
        }

        .modal_body {
            position: absolute;
            top: 50%;
            left: 50%;

            width: 300px;
            height: 700px;
            border-radius: 30px;
            padding:20px;

            text-align: center;

            background-color: rgb(255, 255, 255);
            border-radius: 10px;
            box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

            transform: translateX(-50%) translateY(-50%);
        }
        .btn_round{height:30px;}
        .btn_round:hover {background-color:#000;}
        .current_location_btn:hover {font-weight: bold;}
    </style>
</head>
<body>
    <div id="main">
        <jsp:include page="../header/header_index.jsp" />
        <div id="main_wrap_box">
            <div class="modal">
                <div class="modal_body">
                    <div class="container">
                        <form action="/search" method="post">
                            <div class="form_field">
                                <h2 style="margin:30px 0;"><label for="address_kakao">단골시장 추가하기</label></h2>
                                    <a href="" class="current_location_btn" style="text-decoration:none; color:#333; cursor: pointer;">현재 위치로 등록하기</a>
                                    <p style="margin-top:30px; font-size: 14px;">현재 내가 설정한주소: <span style="color: red; font-size: 14px;">주소를 등록해주세요..</span></p>
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
            <c:if test="${empty userId}">
            <span class="connextion_title clear" style="font-weight:800; font-size: 18px;">&nbsp;<img class="connextion_title_img clear" src="../../img/main/singsing.png">&nbsp;&nbsp; 나의 단골시장</span>
            </c:if>
            <c:if test="${!empty userId}">
                <span class="connextion_title clear" style="font-weight:800; font-size: 18px;">&nbsp;<img class="connextion_title_img clear" src="../../img/main/singsing.png">&nbsp;&nbsp;${userNickname}님의 단골시장</span>
            </c:if>
            <div id="connextion_market" class="clear">
                <div class="connextion_marketbox clear">
                    <div class="connextion_mk1_wrap"><a class="connextion_mk1" href="/shinwon_marketmap"><p style="font-weight: 800;">신림<br>신원시장</p></a><p style="font-size: 10px;">　</p></div>
                    <div class="connextion_mk2_wrap btn-open-popup" onclick="modal"><a class="connextion_mk2" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                    <div class="connextion_mk3_wrap"><a class="connextion_mk3" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                    <div class="connextion_mk4_wrap"><a class="connextion_mk4" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
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
        const body = document.querySelector('#connextion_market');
        const modal = document.querySelector('.modal');
        const btnOpenPopup = document.querySelector('.btn-open-popup');

        btnOpenPopup.addEventListener('click', () => {
            modal.classList.toggle('show');

            if (modal.classList.contains('show')) {
                body.style.overflow = 'hidden';
            }
        });

        modal.addEventListener('click', (event) => {
            if (event.target === modal) {
                modal.classList.toggle('show');

                if (!modal.classList.contains('show')) {
                    body.style.overflow = 'auto';
                }
            }
        });
    </script>
    <script type="text/javascript" src="../../js/main/main_slidebanner.js"></script>
</body>
</html>