<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>물품관리menu</title>
    <style type="text/css">
        /* 전체적용 */
        @font-face {
            font-family: 'omyu_pretty';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        /* 전체 크기 */
        body{margin: 0; padding: 0; font-family:'LINESeedKR-Bd'; font-size: 16px; text-align: center;}
        #goods_container{width: 305px; border: 1px solid black;}

        /* 가게상호명,업주 */
        #goods_store{text-align: right;}

        /* 메뉴div */
        .goods_menu{background-color:  #46A973; width: 200px; height: 50px; text-align: center; margin: 0 auto; padding-top: 7%; border-radius: 8px;}
        .goods_menu>a{text-decoration: none; color: #eeeeee; font-size: 20px;}

    </style>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div>푸른과일마트</div>
        <small>대표:손예솔</small>
    </div>
    <div>
        <h1>상품관리메뉴</h1>
        <div class="goods_menu"><a href="/s1/${buUserId}">현 재고 확인</a></div>
        <br>
        <div class="goods_menu"><a href="/s2/${buUserId}">상품 신규등록</a></div>
        <br>
        <br>
    </div>
</div>
</body>
</html>