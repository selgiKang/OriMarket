<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orimarket_BusinessReview</title>
<%--    <script>--%>
<%--        function editReply() {--%>
<%--            document.getElementById('businessReplyText').style.display = 'none';--%>
<%--            document.getElementById('businessReplyInput_txt').style.display = 'inline';--%>
<%--            document.getElementById('reviewSubmitButton').style.display = 'inline';--%>
<%--            document.getElementById('reviewEditButton').style.display = 'none';--%>
<%--        }--%>
<%--    </script>--%>
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
    </style>
</head>
<body id="business_review_body">
<header id="business_review_header">
    <h3>가게 리뷰</h3>
</header>
<main>
    <table class="panel">
    <c:if test="${not empty reviewList}">
        <c:forEach var="list" items="${reviewList}" varStatus="status">
            <form action="/ReplyInsert" method="post">
                <input type="hidden" name="review_id" value="${list.review_id}">
                <tr class="business_review_title">
                    <td>메뉴: </td>
                    <td style="text-align: left;">불닭발 </td>
                </tr>
                <tr>
                    <td>개수:</td><td style="text-align: left;">작성 날짜</td>
                </tr>
                <tr>
                    <td class="rate_and_date">
                        <h4 class="rating" data-rating="${list.rating}"></h4><h6 class="date">${list.created_date}</h6>
                    </td>
                    <td class="rate_and_date">
                       <h6 class="date">${list.created_date}</h6>
                    </td>
                </tr>
                <tr>
                    <td class="my_review_photo">
                        <img src="../../../../resources/static/img/store/kal.jpg">
                        <p>${list.content}</p>
                    </td>
                </tr>
                <c:if test="${empty list.businessReplyMessage}">
                    <tr><td>답댓글 달기</td></tr>
                    <tr>
                        <td>
                            <textarea type="textarea" id="business_review_messageArea" name="businessReplyMessage" maxlength="500" placeholder="500자 이내 작성"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="완료"></td>
                    </tr>
                </c:if>
                <c:if test="${!empty list.businessReplyMessage}">
                    <tr>
                        <td>답댓글</td>
                    </tr>
                    <tr>
                        <td>
                            <span id="businessReplyText">${list.businessReplyMessage}</span>
                            <textarea id="businessReplyInput_txt" name="businessReplyMessage" placeholder="댓글을 수정하시려면 여기를 클릭하고 수정하기를 눌러주세요"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" id="reviewEditButton">수정하기</button>
                           <%-- <button type="submit" id="reviewSubmitButton" style="display: none;">저장하기</button>--%>
                        </td>
                    </tr>
                </c:if>
            </form>
        </c:forEach>
    </c:if>
    </table>
</main>
</body>
</html>
