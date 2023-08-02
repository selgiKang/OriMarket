<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orimarket_BusinessReview</title>
    <script>
        function editReply() {
            document.getElementById('businessReplyText').style.display = 'none';
            document.getElementById('businessReplyInput_txt').style.display = 'inline';
            document.getElementById('reviewSubmitButton').style.display = 'inline';
            document.getElementById('reviewEditButton').style.display = 'none';
            document.getElementById('business_review_btn_2').style.display = 'inline';
        }
    </script>
    <style>
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }
        #business_review_body{
            font-family: "LINESeedKR-Bd",sans-serif;
            width: 375px;
            font-size: 16px;
            margin: 0 auto;
            margin-top: 10px;
        }
        #business_review_header>h3{
            text-align: center;
        }
        .review_table{
            width: 100%;
        }
        .review_table_td_1{
            width: 100px;
            text-align: center;
        }
        .rating::before {
            content: "☆☆☆☆☆";
            color: lightgray;
        }

        .rating[data-rating="1"]::before {
            content: "★☆☆☆☆";
            color: gold;
        }

        .rating[data-rating="2"]::before {
            content: "★★☆☆☆";
            color: gold;
        }

        .rating[data-rating="3"]::before {
            content: "★★★☆☆";
            color: gold;
        }

        .rating[data-rating="4"]::before {
            content: "★★★★☆";
            color: gold;
        }

        .rating[data-rating="5"]::before {
            content: "★★★★★";
            color: gold;
        }  .rating::before {
               content: "☆☆☆☆☆";
               color: lightgray;
           }

        .rating[data-rating="1"]::before {
            content: "★☆☆☆☆";
            color: gold;
        }

        .rating[data-rating="2"]::before {
            content: "★★☆☆☆";
            color: gold;
        }

        .rating[data-rating="3"]::before {
            content: "★★★☆☆";
            color: gold;
        }

        .rating[data-rating="4"]::before {
            content: "★★★★☆";
            color: gold;
        }

        .rating[data-rating="5"]::before {
            content: "★★★★★";
            color: gold;
        }
        .rating[data-rating="1.5"]::before {
            content: "★½☆☆☆";
            color: gold;
        }
        .rating[data-rating="2.5"]::before {
            content: "★★½☆☆";
            color: gold;
        }
        .rating[data-rating="3.5"]::before {
            content: "★★★½☆";
            color: gold;
        }
        .rating[data-rating="4.5"]::before {
            content: "★★★★½";
            color: gold;
        }
    </style>
</head>
<body id="business_review_body">
<header id="business_review_header">
    <h3>내 가게 리뷰 <small>&lt; 총: ${aveRating}점 &gt;</small></h3>
    <h3 style="margin-top: -20px;" class="rating" data-rating="${Math.round(aveRating * 2) / 2}"></h3>
</header>
<main>
    <c:if test="${not empty reviewList}">
        <c:forEach var="list" items="${reviewList}" varStatus="status">
            ${status.index + 1}
            <table class="review_table" border="1" style="border-collapse: collapse;">
                <form action="/ReplyInsert" method="post">
                    <input type="hidden" name="review_id" value="${list.review_id}">
                    <tr>
                        <td class="review_table_td_1">닉네임</td><td>${list.user.userNickname}</td>
                    </tr>
                    <tr class="business_review_title">
                        <td class="review_table_td_1">메뉴 </td>
                        <td style="text-align: left;">${list.item.itemName}</td>
                    </tr>
                    <tr>
                        <td class="review_table_td_1">별점</td>
                        <td><h4 class="rating" data-rating="${list.rating}"></h4></td>
                    </tr>
                    <tr>
                        <td class="my_review_photo" colspan="2">
                            <img src="../../../../resources/static/img/review/${list.pictureUrl}">
                            <p>${list.content}</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;" class="review_table_td_1">리뷰 작성일</td>
                        <td class="rate_and_date">
                            <h6 class="date">${list.createdDate}</h6>
                        </td>
                    </tr>
                    <tr>
                        <td class="review_table_td_1">사장님 답변</td>
                        <td>
                            <span id="businessReplyText">${list.businessReplyMessage}</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="review_table_td_1" style="font-size: small">답변 작성일</td>
                        <td>
                            ${list.getFormattedCreatedDate1()}
                        </td>
                    </tr>
                </form>
            </table>
            <br>
        </c:forEach>
    </c:if>
</main>
</body>
</html>
