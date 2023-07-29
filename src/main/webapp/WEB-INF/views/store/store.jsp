<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="script" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>오리시장</title>
    <link rel="stylesheet" type="text/css" href="../../css/store/store.css">
</head>
<style>
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

<body>

<div class="store_wrap">
<%--${buStoreImage} 이미지파일명 --%>
<jsp:include page="../header/header_search.jsp" />

<div class="main-container">
    <header style="padding:10px;">
        <div class="like-container">
            <img id="like_container_img" src="../../img/store/${sessionScope.buStoreImage}" alt="착한생칼국수">
<%--
        &lt;%&ndash; 찜 &ndash;%&gt;
            <c:if test="${!empty sessionScope.userId}">
                <form action="/storeFav" method="get">
                    <input type="hidden" value="${param.favStoreName}" name="favStoreName">
                    <input type="hidden" value="<%=session.getAttribute("userSeq")%>" name="userSeq">

                    <button type="submit" class="storeFav" onclick="event.preventDefault(); toggleHeart(this);" style="opacity: 0;" />
                       <c:if test="${sessionScope.favNumber =='' }">
                            <img src="../../img/store/empty_heart.png" alt="빈 하트" class="heart" >
                       </c:if>
                       <c:if test="${sessionScope.favNumber eq 1}">
                            <img src="../../img/store/filled_heart.png" alt="찬 하트" class="heart" >
                        </c:if>
                        <input type="hidden" name="favNumber" value="${sessionScope.favNumber}">&lt;%&ndash;<%=session.getAttribute("favNumber")%>&ndash;%&gt;
                </form>
            </c:if>
--%>
        </div>
        <div class="main_contents_box">
            <div class="store_favheart_wrap">
                <%--가게이름--%>
                <input type="text" class="storename_txt" value="${sessionScope.favStoreName}" name="storeName${sessionScope.favNumber}" readonly>
                <%-- 찜 --%>
                <div class="favstoreheart">
                <c:if test="${!empty sessionScope.userId}">
                    <form action="/storeFav" method="get" style="width: 50px; height: 50px; display: flex; position: absolute;">
                        <input type="hidden" value="${param.favStoreName}" name="favStoreName">
                        <input type="hidden" value="<%=session.getAttribute("userSeq")%>" name="userSeq">

                        <div type="submit" class="storeFav" onclick="event.preventDefault(); toggleHeart(this);" style="opacity: 1;/* width:50px; height:50px; float:right;*/" />
                        <c:if test="${sessionScope.favNumber =='' }">
                            <img src="../../img/store/empty_heart.png" alt="빈 하트" class="heart" >
                        </c:if>
                        <c:if test="${sessionScope.favNumber eq 1}">
                            <img src="../../img/store/filled_heart.png" alt="찬 하트" class="heart" >
                        </c:if>
                        <input type="hidden" name="favNumber" value="${sessionScope.favNumber}"><%--<%=session.getAttribute("favNumber")%>--%>
                    </form>
                </c:if>
                </div>
            </div>

            <div class="review_wrap">
                <span class="review_count">
                    <c:if test="${!Double.isNaN(aveRating)}">
                      <small style="font-size: 16px;margin-right: 5px;"> &lt; 총 ${aveRating}점 &gt; : </small><span class="rating" data-rating="${Math.round(aveRating * 2) / 2}"></span><br>
                    </c:if>
                    <c:if test="${Double.isNaN(aveRating)}">
                        <small style="font-size: 16px;margin-right: 5px;">0</small><span class="rating" data-rating="${Math.round(aveRating * 2) / 2}"></span><br>
                    </c:if>
                    <small><a href="/storeReview" style="color: #4A98F7; font-size: 16px; padding-left:10px;">리뷰 보러가기 </a></small>
                    <%--리뷰--%>
                </span>
            </div>
            <%--storeAddress--%>
            <p>📍 서울 관악구 신림동 1587-39</p>
        </div>
    </header>

    <div class="coupon_wrap">
        <h4 style="margin: 0; color: #333;">쿠폰</h4>
        <section>
            <div class="coupon-container" onmousedown="startDragging(event)" onmousemove="dragging(event)" onmouseup="stopDragging()">
                <img class="coupon" src="../../img/store/coupon3.png" alt="쿠폰 사진1" onclick="showConfirmationDialog(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img class="coupon" src="../../img/store/coupon3.png" alt="쿠폰 사진2" onclick="showConfirmationDialog(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img class="coupon" src="../../img/store/coupon3.png" alt="쿠폰 사진3" onclick="showConfirmationDialog(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img class="coupon" src="../../img/store/coupon3.png" alt="쿠폰 사진4" onclick="showConfirmationDialog(this)">
                <!-- 추가적인 쿠폰 사진들 -->
            </div>
        </section>
    </div>
    <hr style="width: 90%; opacity: 0.4;">

    <%--공지사항--%>
    <c:if test="${lastM.totalMessage != null}">
        <section>
            <button class="notice-button" onclick="location.href='/storeMessageInsert'">${lastM.totalMessage}</button>
        </section>
    </c:if>
            <div class="tabmenu out-tabmenu">

                <ul>
                    <%--대표메뉴 버튼--%>
                    <li id="tab1" class="btnCon">
                        <input type="radio" checked name="tabmenu" id="tabmenu1">
                        <label for="tabmenu1">대표 메뉴</label>
                        <div class="tabCon">
                            <%--메뉴1--%>
                            <form action="/${userId}/cart/${a.itemId}" method="get">
                            <c:forEach var="a" items="${al}">
                                <c:if test="${a.itemCnt>0}">
                                    <div class="menu" type="button" onclick="/detailmenu/${a.itemId}">
                                        <a href="/detailmenu/${a.itemId}/${userId}" style="position:relative; display:flex;">
                                            <div class="menu-content">
                                                <h2 class="menu_name">${a.itemName}</h2>
                                                <input type="hidden" name="itemName">
                                                <h6 class="menu-description">${a.itemInfo}</h6>
                                                <h5 class="menu_price" style="line-height: 0;">${a.itemPrice} 원</h5>
                                                <input type="hidden" name="itemPrice">
                                                <input type="hidden" name="count" value="1">
                                                <input type="hidden" name="itemId" value="${a.itemId}">
                                            </div>
                                            <div class="menu-image"style="width:120px; height:120px; box-sizing:border-box; overflow:hidden;">
                                                <img src="../../img/store/item/${a.itemImageUrl}" alt="메뉴이미지" style="width: 100%;height:100%;">
                                                    <%--<a href="/user_review?itemId=${a.itemId}">리뷰작성하러가기</a>--%>
                                            </div>
                                        </a>
                                    </div>
                                </c:if>
                                <c:if test="${a.itemCnt==0}">
                                    <div class="menu" type="button">
                                       <%-- <a href="/detailmenu/${a.itemId}" style="position:relative; display:flex;">--%>
                                            <div class="menu-content">
                                                <h2 class="menu_name">${a.itemName}</h2>
                                                <input type="hidden" name="itemName">
                                                <h6 class="menu-description">${a.itemInfo}</h6>
                                                <h5 class="menu_price" style="line-height: 0;">품절상품입니다.</h5>
                                                <input type="hidden" name="itemPrice">
                                                <input type="hidden" name="count" value="1">
                                                <input type="hidden" name="itemId" value="${a.itemId}">
                                            </div>
                                            <div class="menu-image"style="width:120px; height:120px; box-sizing:border-box; overflow:hidden;">
                                                <img src="../../img/store/item/${a.itemImageUrl}" alt="메뉴이미지" style="width: 100%;height:100%;">
                                                    <%--<a href="/user_review?itemId=${a.itemId}">리뷰작성하러가기</a>--%>
                                            </div>
                                        </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                            </form>
                            <%-- &lt;%&ndash;메뉴2&ndash;%&gt;
                            <div class="menu">
                                <div class="menu-content">
                                    <h2>칼국수</h2>
                                    <h6 class="menu-description">인공 조미료를 쓰지 않고 순수 천연재료로 만들어 시원한 바다맛을 느낄 수 있는 착한 생 칼국수 대표 메뉴</h6>
                                    <h5>3,800원</h5>
                                </div>
                                <div class="menu-image">
                                    <img src="../../img/store/kal.jpg" alt="메뉴이미지">
                                </div>
                            </div>
                        </div>--%>
                    </li>

                    <%--여름메뉴 버튼--%>
                    <li id="tab2" class="btnCon">
                        <input type="radio" name="tabmenu" id="tabmenu2">
                        <label for="tabmenu2"><a href="/storenotice0">여름 메뉴</a></label>
                        <div class="tabCon">
                            <%--메뉴1--%>
                            <div class="menu">
                                <div class="menu-content">
                                    <h2>${ menu.menu_name }</h2>
                                    <h6 class="menu-description">${ menu.menu_info }</h6>
                                    <h5>${ menu.menu_price }</h5>
                                </div>
                                <div class="menu-image"style="width:120px; height:120px; box-sizing:border-box; overflow:hidden;">
                                    <img src="../../img/store/cold.jpg" alt="메뉴이미지" style="width: 100%;width: 100%;height:100%;">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li id="tab3" class="btnCon">
                        <input type="radio" name="tabmenu" id="tabmenu3">
                        <label for="tabmenu3">식사용</label>
                        <div class="tabCon">
                            내용 적기
                        </div>
                    </li>
                    <li id="tab4" class="btnCon">
                        <input type="radio" name="tabmenu" id="tabmenu4">
                        <label for="tabmenu4">사이드</label>
                        <div class="tabCon"></div>
                    </li>
                    <li id="tab5" class="btnCon">
                        <input type="radio" name="tabmenu" id="tabmenu5">
                        <label for="tabmenu5">음료</label>
                        <div class="tabCon"></div>
                    </li>
                </ul>
            </div>
    </div>
</div>
</script>
<script src="../../js/store/store_script.js"></script>
</body>
</html>
