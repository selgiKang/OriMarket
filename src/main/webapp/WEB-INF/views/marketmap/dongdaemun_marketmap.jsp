<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>시장 맵</title>
    <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
    <link rel= "stylesheet" href= "../../css/marketmap/marketmap.css">
    <style>
        button.backbtn {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #fff;
            margin: 0 0 0 10px;
            width: 35%;
            height: 40px;
            background-color: #46a973;
            border-radius: 35px;
            border: 1px solid #999;
            cursor: pointer;
            justify-content: center;
            position: absolute;
            z-index: 99999;
            top: 320px;
            left: 31%;
        }
        button.backbtn:hover {background-color:#333; color:#fff;}
    </style>
</head>
<body>
<jsp:include page="../header/header_search.jsp" />
<div class="map_wrap">
    <div class="commingsoon" style="width:375px; height:712px; z-index:999999; background-color:rgba(0,0,0,0.8);">
        <h2 style="color:#eee; margin:0 40px; padding:260px 0;">동대문시장 준비중입니다.</h2>
        <!-- 메인으로 가기 -->
        <button class="backbtn" onclick="window.location.replace('/')">메인으로 가기</button>
        <!--이동 화살표-->
        <div class="arrow_wrap">
            <a class="fa-up">
                <i class="fas fa-thin fa-circle-chevron-up marketmap_i scrollBy up" data-direction="top"></i>
            </a>
            <a class="fa-down">
                <i class="fas fa-thin fa-circle-chevron-down marketmap_i scrollBy down" data-direction="down"></i>
            </a>
            <a class="fa-left">
                <i class="fas fa-thin fa-circle-chevron-left marketmap_i scrollBy left" data-direction="left"></i>
            </a>
            <a class="fa-right">
                <i class="fas fa-thin fa-circle-chevron-right marketmap_i scrollBy right" data-direction="right"></i>
            </a>
        </div>
        <!--분할 지도-->
        <div class="map_bg_wrap">
            <!--<img class="map_bg03" src="../../img/marketmap/marketmap_noicon_page_03.png" alt="신원시장3컷">-->
            <!--1번째 분할-->
            <div class="map_bg_content1_box"></div>
            <!--2번째 분할-->
            <div class="map_bg_content2_box"></div>
            <!--3번째 분할-->
            <div class="map_bg_content3_box" style="position:absolute; top:0;">
                <img class="map_bg_content3_img" style="position:absolute; top:0; left:0; opacity:0.4;" src="../../img/marketmap/marketmap_noicon_page_03.png" alt="신원시장3컷">
                <%--

                                <!-- 영광마트 -->
                                <div class="map_bg_content3_icon store_ygmart_box" onclick="">
                                    <img class="store_ygmart_icon mart" src="../../img/marketmap/mart.png">
                                    <p class="store_ygmart_txt">영광마트</p>
                                </div>

                                <!-- 신림기름집 -->
                                <div class="map_bg_content3_icon store_shinrimoil_box" onclick="">
                                    <img class="store_shinrimoil_icon oil" src="../../img/marketmap/oil.png">
                                    <p class="store_shinrimoil_txt">신림기름집</p>
                                </div>

                                <!-- 오떡순 -->
                                <div class="map_bg_content3_icon store_odducksun_box" onclick="">
                                    <img class="store_odducksun_icon snackbar" src="../../img/marketmap/snackbar.png">
                                    <p class="store_odducksun_txt">오떡순</p>
                                </div>

                                <!-- 김치천국 -->
                                <div class="map_bg_content3_icon store_kimchiheven_box" onclick="">
                                    <img class="store_kimchiheven_icon kimchi" src="../../img/marketmap/kimchi.png">
                                    <p class="store_kimchiheven_txt">김치천국</p>
                                </div>

                                <!-- 신림즉석두부 -->
                                <div class="map_bg_content3_icon store_shinrimtofu_box" onclick="location.href='/store?favStoreName=과일나라'">
                                    <img class="store_shinrimtofu_icon tofu" src="../../img/marketmap/tofu.png">
                                    <p class="store_shinrimtofu_txt">과일나라</p>
                                </div>

                                <!-- 못난이꽈배기 -->
                                <div class="map_bg_content3_icon store_uglypretzel_box" onclick="">
                                    <img class="store_uglypretzel_icon pretzel" src="../../img/marketmap/pretzel.png">
                                    <p class="store_uglypretzel_txt">못난이꽈배기</p>
                                </div>

                                <!-- 중국 슈퍼 -->
                                <div class="map_bg_content3_icon store_chinamart_box" onclick="">
                                    <img class="store_chinamart_icon mart" src="../../img/marketmap/mart.png">
                                    <p class="store_chinamart_txt">중국슈퍼</p>
                                </div>
                --%>

                <!-- 배달 안되는 상점(지도표시용 텍스트) -->

            </div>
            <!--4번째 분할-->
            <div class="map_bg_content4_box"></div>
            <!--5번째 분할-->
            <div class="map_bg_content5_box"></div>
            <!--6번째 분할-->
            <div class="map_bg_content6_box"></div>
        </div>
    </div>
</div>

</body>
</html>