<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }

    #main {
        margin: 0 auto;
        width: 375px;
        height: 812px;
        background-color: #eee;
        text-align: center;
    }
    #header{
        width: 100%;
        height: 100px;
        background-color: #46A973;
    }

    #footer{
        width: 100%;
        height: 200px;
        background-color: #46A973;
    }

    #connextion_market{
        width: 335px;
        height: 400px;
        margin:20px auto;
        background: #fff;
        border-radius:3%;

    }
    .clear:before{content:''; display:block; clear:both;}

    /*2023-07-12 메인페이지 수정 1차 */
    #main_wrap_box{width:375px; height:612px;}
    span.connextion_title{float:left; margin:10px 20px;}
    .connextion_title_img{width:28px; height:28px; text-align:left;}
    .connextion_marketbox{margin:10% auto;}
    /*단골시장box공통*/
    .connextion_mk1_wrap, .connextion_mk2_wrap, .connextion_mk3_wrap, .connextion_mk4_wrap{
        display:inline-block; width:120px; height:100px; background-color:#eee; border-radius:3%; margin:10px; cursor:pointer;
    }
    .connextion_mk1, .connextion_mk2, .connextion_mk3, .connextion_mk4{
        width:35%; height:35%; text-decoration:none; color:#333;
    }
    .connextion_mk1_wrap:hover, .connextion_mk2_wrap:hover, .connextion_mk3_wrap:hover, .connextion_mk4_wrap:hover {box-shadow:1px 1px 10px #999; box-sizing:border-box;}
    a>p{text-align:center; vertical-align:center; margin-top:20px;}

    /*배너*/
    #main_banner_wrap{width:335px; height:170px; background-color:#fff; margin:0 auto; border-radius:3%;}
    .main_slidebanner_box{}
    .mainbanner1{}
    .mainbanner2{}
    .mainbanner3{}
    .mainbanner4{}

</style>
<body>

    <div id="main">
        <div id="header">
        <jsp:include page="../header/header_index.jsp" />
        </div>
        <div id="main_wrap_box">
            <span class="connextion_title clear"><img class="connextion_title_img clear" src="../../img/main/singsing.png">단골시장</span>
            <div id="connextion_market" class="clear">
                <div class="connextion_marketbox clear">
                    <div class="connextion_mk1_wrap"><a class="connextion_mk1" href="/marketmap2"><p>신림신원시장</p></a><p>　</p></div>
                    <div class="connextion_mk2_wrap"><a class="connextion_mk2" href=""><p>단골시장등록</p></a><p>+</p></div>
                    <div class="connextion_mk3_wrap"><a class="connextion_mk3" href=""><p>단골시장등록</p></a><p>+</p></div>
                    <div class="connextion_mk4_wrap"><a class="connextion_mk4" href=""><p>단골시장등록</p></a><p>+</p></div>
                </div>
            </div>
            <div id="main_banner_wrap">
                <div class="main_slidebanner_box">
                    <div class="mainbanner1"><img src="" alt="메인배너1"></div>
                    <div class="mainbanner2"><img src="" alt="메인배너2"></div>
                    <div class="mainbanner3"><img src="" alt="메인배너3"></div>
                    <div class="mainbanner4"><img src="" alt="메인배너4"></div>
                </div>
            </div>
        </div>
        <div id="footer">
        <jsp:include page="../footer/footer.jsp" />
        </div>
    </div>


</body>
</html>