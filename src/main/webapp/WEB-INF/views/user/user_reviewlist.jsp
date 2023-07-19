<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<style>
    @font-face {
        font-family: 'LINESeedKR-Bd', sans-serif;
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }

    .line {
        border-top: 1px solid #c4c4c4;
        width: 330px;
        margin: 30px auto;
        position: relative;
        right: 8px;
    }

    * {
        margin: 0;
        padding: 0;
    }

    body {
        margin: 0 auto;
    }

    .main-container {
        width: 375px;
        height: 812px;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #eee;
        overflow: auto;
        overflow-x: hidden;
        font-family: 'LINESeedKR-Bd', sans-serif;
    }

    .main-container::-webkit-scrollbar {
        display: none;
    }

    .my_review_list{
        margin-top: 10px;
        margin: 20px;
    }
    .my_review_list_store{
        background-color: white;
        margin: 15px;
        padding: 15px;

    }

    .rating, .date {
        display: inline-block;
    }

    .rate_and_date{
        margin-top: -20px;
    }

    .my_review_photo {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .my_review_photo img {
        width: 300px;
    }
</style>
<body>

<div class="main-container">
    <div class="my_review_total_list">

        <div class="my_review_list">
            <h3>내가 쓴 총 리뷰 ___개</h3>
        </div>

        <div class="line"></div>

        <div class="my_review_list_store">
            <a href="/user_review"><h4>불닭발</h4></a><br>
            <div class="rate_and_date">
            <h4 class="rating">★★★★☆</h4>&nbsp;<h6 class="date">2023.07.12</h6>
            </div>

            <div class="line"></div>

            <div class="my_review_photo">
                <img src="../../../../resources/static/img/store/kal.jpg">
                <div class="line"></div>
                <p>맛있어요! 배달도 빠르고 벌써 네번째 주문이네요! 또 주문할게요</p>

            </div>

        </div>

        <div class="my_review_list_store">
            <a href="#"><h4>칼국수</h4></a><br>
            <div class="rate_and_date">
                <h4 class="rating">★★★★☆</h4>&nbsp;<h6 class="date">2023.07.10</h6>
            </div>

            <div class="line"></div>

            <div class="my_review_photo">
                <img src="../../../../resources/static/img/store/pizza.jpg">
                <div class="line"></div>
                <p>맛있어요! 배달도 빠르고 벌써 네번째 주문이네요! 또 주문할게요</p>

            </div>

        </div>

    </div>


</div>


</body>
</html>