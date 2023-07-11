<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>시장 맵</title>
    <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
    <style>
        body{margin:0 auto; font-size:16px;}
        div.map_wrap{width:375px; height:712px; border:3px solid #333; background-color:#eee;}

        <!-- 지도이동버튼 -->
        div.arrow_wrap{width:375px; height:712px; border:3px solid #333; position:relative;}
        .arrow_wrap>a{position:absolute; width:375px; height:712px; cursor: pointer; z-index:99999;}
        i{font-size:36px; color:#000; opacity:0.4;}
        i.fa-circle-chevron-left{position:absolute; top:50%; left:2%;}
        i.fa-circle-chevron-right{position:absolute; top:50%; right:2%;}
        i.fa-circle-chevron-up{position:absolute; top:2%; left:46%;}
        i.fa-circle-chevron-down{position:absolute; bottom:2%; left:46%;}

        <!-- 지도bg -->
        div.map_bg_wrap{width:375px; height:712px; box-sizing:border-box;}
        div.map_bg_content3_box{width:375px; height:712px; position:absolute; /*background-image: url("../../img/marketmap/marketmap_noicon_page_03.png"); background-repeat: no-repeat; background-size:cover;*/}
        img.map_bg_content3_img{width:375px; height:712px;}

        <!-- 상점 공통 -->

        <!-- 영광마트 -->
        .map_bg_content3_icon{width:90px; height:90px; position:absolute; cursor: pointer;}
        .store_ygmart_box{position:absolute; top:1%; left:58%;  text-align:center;}
        img.mart{width:55px; height:55px;}
        p.store_ygmart_txt{margin:0; font-size: 14px; font-weight: 800;}

        <!-- 신림기름집 -->
        .map_bg_content3_icon{width:90px; height:90px; position:absolute; cursor: pointer;}
        .store_shinrimoil_box{position:absolute; top:5%; left:75%;  text-align:center;}
        img.oil{width:35px; height:75px;}
        p.store_shinrimoil_txt{margin:0; font-size: 14px; font-weight: 800;}

        <!-- 오떡순 -->
        .map_bg_content3_icon{width:90px; height:90px; position:absolute; cursor: pointer;}
        .store_odducksun_box{position:absolute; top:53%; left:75%;  text-align:center;}
        img.snackbar{width:90px; height:70px;}
        p.store_odducksun_txt{margin:0; font-size: 14px; font-weight: 800;}

        <!-- 김치천국 -->
        .map_bg_content3_icon{width:90px; height:90px; position:absolute; cursor: pointer;}
        .store_kimchiheven_box{position:absolute; top:68%; left:74%;  text-align:center;}
        img.kimchi{width:70px; height:55px;}
        p.store_kimchiheven_txt{margin:0; font-size: 14px; font-weight: 800;}

        <!-- 신림즉석두부 -->
        .map_bg_content3_icon{width:90px; height:90px; position:absolute; cursor: pointer;}
        .store_shinrimtofu_box{position:absolute; top:79%; left:74%;  text-align:center;}
        img.tofu{width:60px; height:50px;}
        p.store_shinrimtofu_txt{margin:0; font-size: 14px; font-weight: 800;}

        <!-- 못난이꽈배기 -->
        .map_bg_content3_icon{width:90px; height:90px; position:absolute; cursor: pointer;}
        .store_uglypretzel_box{position:absolute; top:90%; left:75%;  text-align:center;}
        img.pretzel{width:65px; height:45px;}
        p.store_uglypretzel_txt{margin:0; font-size: 14px; font-weight: 800;}

    </style>
</head>
<body>
    <div class="map_wrap">
        <!--이동 화살표-->
        <div class="arrow_wrap">
            <a class="fa-up">
                <i class="fas fa-thin fa-circle-chevron-up scrollBy up" data-direction="top"></i>
            </a>
            <a class="fa-down">
                <i class="fas fa-thin fa-circle-chevron-down scrollBy down" data-direction="down"></i>
            </a>
            <a class="fa-left">
                <i class="fas fa-thin fa-circle-chevron-left scrollBy left" data-direction="left"></i>
            </a>
            <a class="fa-right">
                <i class="fas fa-thin fa-circle-chevron-right scrollBy right" data-direction="right"></i>
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
                <div class="map_bg_content3_icon store_shinrimtofu_box" onclick="">
                    <img class="store_shinrimtofu_icon tofu" src="../../img/marketmap/tofu.png">
                    <p class="store_shinrimtofu_txt">신림즉석두부</p>
                </div>

                <!-- 못난이꽈배기 -->
                <div class="map_bg_content3_icon store_uglypretzel_box" onclick="">
                    <img class="store_uglypretzel_icon pretzel" src="../../img/marketmap/pretzel.png">
                    <p class="store_uglypretzel_txt">못난이꽈배기</p>
                </div>
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