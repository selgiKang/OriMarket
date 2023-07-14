<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <title>오리시장</title>
    <link rel="stylesheet" type="text/css" href="../../css/store/store.css">
</head>
<body>

<div class="main-container">
    <header>
        <div class="like-container">
            <img src="../../img/store/store.jpg" alt="착한생칼국수"

            >
        <%-- 찜 --%>
            <c:if test="${not empty userId}">
                <form action="/storeFav" method="get">
                    <input type="hidden" value="싱싱과일가게" name="favStoreName">
                    <input type="hidden" value="<%=session.getAttribute("userSeq")%>" name="userSeq">

                    <button type="submit" class="storeFav" onclick="event.preventDefault(); toggleHeart(this);">
                       <c:if test="${sessionScope.favNumber =='' }">
                            <img src="../../img/store/empty_heart.png" alt="빈 하트" class="heart" >
                       </c:if>
                       <c:if test="${sessionScope.favNumber eq 1}">
                            <img src="../../img/store/filled_heart.png" alt="찬 하트" class="heart" >
                        </c:if>
                        <input type="hidden" name="favNumber" value="${sessionScope.favNumber}"><%--<%=session.getAttribute("favNumber")%>--%>
                    </button>
                </form>
            </c:if>
        </div>
        <%--storeName--%>
        <h1><input type="text" value="싱싱과일가게" name="storeName${sessionScope.favNumber}"></h1>
        <img class="star" src="../../img/store/star.png" alt="별"><a style="float: left;" href="#">>486</a>
        <br>
        <%--storeAddress--%>
        <p>📍 서울 관악구 신림동 1587-39</p>
    </header>



    <section>
        <div class="coupon-container" onmousedown="startDragging(event)" onmousemove="dragging(event)" onmouseup="stopDragging()">
            <img class="coupon" src="../../img/store/coupon3.png" alt="쿠폰 사진1" onclick="showConfirmationDialog(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img class="coupon" src="../../img/store/coupon3.png" alt="쿠폰 사진2" onclick="showConfirmationDialog(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img class="coupon" src="../../img/store/coupon3.png" alt="쿠폰 사진3" onclick="showConfirmationDialog(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img class="coupon" src="../../img/store/coupon3.png" alt="쿠폰 사진4" onclick="showConfirmationDialog(this)">
            <!-- 추가적인 쿠폰 사진들 -->
        </div>
    </section>

    <section>
        <button class="notice-button">📢공지사항 : 안녕하세요. 착한 생 칼국수입니다...</button>
    </section>

    <section>
        <nav class="slidemenu">

            <!-- 대표메뉴  -->
            <input type="radio" name="slideItem" id="slide-item-1" class="slide-toggle" checked/>
            <label for="slide-item-1"><span>대표 메뉴</span></label>

            <!-- 여름메뉴 -->
            <input type="radio" name="slideItem" id="slide-item-2" class="slide-toggle"/>
            <label for="slide-item-2"><span>여름 메뉴</span></label>

            <!-- 식사용 -->
            <input type="radio" name="slideItem" id="slide-item-3" class="slide-toggle"/>
            <label for="slide-item-3"><span>식사용</span></label>

            <!-- 음료 -->
            <input type="radio" name="slideItem" id="slide-item-4" class="slide-toggle"/>
            <label for="slide-item-4"><span>음료</span></label>

            <!-- 사이드 -->
            <input type="radio" name="slideItem" id="slide-item-5" class="slide-toggle"/>
            <label for="slide-item-5"><span>사이드</span></label>

            <!-- 바 -->
            <div class="slider">
                <div class="bar"></div>
            </div>

        </nav>
    </section>

    <section class="container">
        <div class="menu" onclick="location.href='/detailmenu'">
            <div class="menu-content">
                <h2>칼국수</h2>
                <h6>인공 조미료를 쓰지 않고 순수 천연재료로 만들어 시원한 바다맛을 느낄 수 있는 착한 생 칼국수 대표 메뉴!</h6>
                <h5>-곱빼기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1000원</h5>
                <br>
                <h4>3,800원</h4>
            </div>
            <div class="menu-image">
                <img src="../../img/store/kal.jpg" alt="칼국수" class="right-image">
            </div>
        </div>

        <div class="menu">
            <div class="menu-content">
                <h2>칼국수</h2>
                <h6>인공 조미료를 쓰지 않고 순수 천연재료로 만들어 시원한 바다맛을 느낄 수 있는 착한 생 칼국수 대표 메뉴!</h6>
                <h5>-곱빼기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1000원</h5>
                <br>
                <h4>3,800원</h4>
            </div>
            <div class="menu-image">
                <img src="../../img/store/kal.jpg" alt="칼국수" class="right-image">
            </div>
        </div>

        <div class="menu">
            <div class="menu-content">
                <h2>칼국수</h2>
                <h6>인공 조미료를 쓰지 않고 순수 천연재료로 만들어 시원한 바다맛을 느낄 수 있는 착한 생 칼국수 대표 메뉴!</h6>
                <h5>-곱빼기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1000원</h5>
                <br>
                <h4>3,800원</h4>
            </div>
            <div class="menu-image">
                <img src="../../img/store/kal.jpg" alt="칼국수" class="right-image">
            </div>
        </div>
    </section>

</div>


<script src="../../js/store/store_script.js"></script>
</body>
</html>
