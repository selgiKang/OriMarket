<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" type="text/css" href="../../css/store/delivery_pickup.css">
</head>

<body>

<div class="main-container">
  <h3 style="margin-top: 5px;">회원 리뷰관리</h3>
  <div class="tabs">
    <input type="radio" id="tab1" name="tab-control" checked>
    <input type="radio" id="tab2" name="tab-control">
    <ul>
      <li title="배달"><label for="tab1" role="button"><span>배달</span></label></li>
      <li title="포장"><label for="tab2" role="button"><span>포장</span></label></li>
    </ul>
    <div class="slider">
      <div class="indicator"></div>
    </div>
    <div class="content">
      <section>
        <div class="inside_tabs">
          <div role="inside_tablist">
            <button id="tab-1" aria-selected="true" aria-controls="tab-panel-1" role="tab" type="button" tabindex="0">
              작성 가능한 리뷰(__)
            </button>
            <button id="tab-2" aria-selected="false" aria-controls="tab-panel-2" role="tab" type="button" tabindex="-1">
              작성한 리뷰(__)
            </button>
          </div>
          <div id="tab-panel-1" aria-labelledby="tab-1" role="tabpanel" tabindex="0">
            <c:if test="${empty re}"> 작성가능 한 리뷰가 없습니다. 상품을 주문해주세요.!</c:if>
            <c:if test="${!empty re}">
            <c:forEach var="r" items="${re}" varStatus="status">
              <c:set var="reverseIndex" value="${re.size() - status.index - 1}" />
              <c:set var="currentItem" value="${re[reverseIndex]}" />
              <div class="my_review_list_store">
                <h4>불닭발</h4>
                <br>
                <div class="rate_and_date">
                  <h4 class="rating" data-rating="${currentItem.rating}"></h4>&nbsp;<h6 class="date">${currentItem.created_date}</h6>
                </div>
                <div class="line"></div>
                <div class="my_review_photo">
                  <img src="../../../../resources/static/img/store/kal.jpg">
                  <div class="line"></div>
                  <p>${currentItem.content}</p>
                </div>
              </div>
            </c:forEach>
            </c:if>
          </div>
          <div id="tab-panel-2" aria-labelledby="tab-2" role="tabpanel" tabindex="-1" hidden>
            <c:if test="${empty re}">작성하신 리뷰가 없습니다.!</c:if>
            <c:if test="${!empty re}">
              <c:forEach var="r" items="${re}" varStatus="status">
                <c:set var="reverseIndex" value="${re.size() - status.index - 1}" />
                <c:set var="currentItem" value="${re[reverseIndex]}" />
                <div class="my_review_list_store">
                  <h4>불닭발</h4>
                  <br>
                  <div class="rate_and_date">
                    <h4 class="rating" data-rating="${currentItem.rating}"></h4>&nbsp;<h6 class="date">${currentItem.created_date}</h6>
                  </div>
                  <div class="line"></div>
                  <div class="my_review_photo">
                    <img src="../../../../resources/static/img/store/kal.jpg">
                    <div class="line"></div>
                    <p>${currentItem.content}</p>
                  </div>
                </div>
              </c:forEach>
            </c:if>
          </div>
        </div>
      </section>
      <section>
        <div class="inside_tabs">
          <div role="inside_tablist">
            <button id="tab-3" aria-selected="true" aria-controls="tab-panel-3" role="tab" type="button" tabindex="0">
              작성 가능한 리뷰(__)
            </button>
            <button id="tab-4" aria-selected="false" aria-controls="tab-panel-4" role="tab" type="button" tabindex="-1">
              작성한 리뷰(__)
            </button>
          </div>
          <div id="tab-panel-3" aria-labelledby="tab-3" role="tabpanel" tabindex="0">
            포장탭에서 작성 가능한 리뷰
          </div>
          <div id="tab-panel-4" aria-labelledby="tab-4" role="tabpanel" tabindex="-1" hidden>
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
      </section>
    </div>
  </div>
</div>
<script src="../../js/store/delivery_pickup.js"></script>
</body>
</html>
