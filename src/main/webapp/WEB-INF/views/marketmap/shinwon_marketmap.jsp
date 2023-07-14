<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>시장 맵</title>
    <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
    <link rel= "stylesheet" href= "../../css/marketmap/marketmap.css">
</head>
<body>
    <jsp:include page="../header/header_index.jsp" />
    <div class="map_wrap">
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
            <div class="map_bg_content3_box">
                <img class="map_bg_content3_img" src="../../img/marketmap/marketmap_noicon_page_03.png" alt="신원시장3컷">

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
                <div class="map_bg_content3_icon store_shinrimtofu_box" onclick="location.href='/store?favStoreName=싱싱과일가게'">
                    <img class="store_shinrimtofu_icon tofu" src="../../img/marketmap/tofu.png">
                    <p class="store_shinrimtofu_txt">신림즉석두부</p>
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

</body>
</html>