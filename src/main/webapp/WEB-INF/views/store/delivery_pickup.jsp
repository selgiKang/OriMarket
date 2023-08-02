<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" type="text/css" href="../../css/store/delivery_pickup.css">
  <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
  <link href="../../css/order/order_pastorder.css" rel="stylesheet" media="all">
</head>
<style>
  /*가운데 정렬*/
  * {
    margin: 0;
    padding: 0;
  }

  body {
    font-family: 'LINESeedKR-Bd', sans-serif;
  }

  /*핸드폰화면 사이즈*/
  .main-container {
    width: 375px;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #eee;
    overflow: auto;
    overflow-x: hidden;
  }

  /*스크롤 가능은 하지만 스크롤바 안보이게*/
  .main-container::-webkit-scrollbar {
    display: none;
  }

  /*탭 스타일*/
  body h1 {
    text-align: center;
    color: #4caf50;
    font-weight: 300;
    padding: 40px 0 20px 0;
    margin-bottom: -50px;
    align-items: center;
  }

  /*내용 적는 칸 배경 */
  .tabs {
    border-radius: 5px;
    background: white;
    height: 100%;
    max-width: 365px;
    width: 100%;
    margin-top: 15px; /*리뷰관리 제목이랑 간격 조절*/
    margin-bottom:15px;
  }


  .tabs input[name="tab-control"] {
    display: none;

  }

  /*배달, 포장 폰트*/
  .tabs .content section h2,
  .tabs ul li label {
    font-weight: bold;
    font-size: 18px;
    color: #4caf50;
    margin-top: 10px;

  }

  /*배달, 포장 전체 탭*/
  .tabs ul {
    list-style-type: none;
    padding-left: 0;
    display: flex;
    flex-direction: row;
    margin-bottom: 10px;
    justify-content: space-between;
    align-items: flex-end;
    flex-wrap: wrap;
    width: 360px;

  }

  .tabs ul li {
    box-sizing: border-box;
    flex: 1;
    width: 25%;
    padding: 0 10px;
    text-align: center;
  }

  /*배달, 포장 선택하기 전 색상*/
  .tabs ul li label {
    transition: all 0.3s ease-in-out;
    color: #929daf;
    overflow: hidden;
    text-overflow: ellipsis;
    display: block;
    cursor: pointer;
    transition: all 0.2s ease-in-out;
    white-space: nowrap;
    -webkit-touch-callout: none;
  }


  .tabs ul li label br {
    display: none;

  }
  .tabs ul li label svg {
    fill: #929daf;
    height: 1.2em;
    vertical-align: bottom;
    margin-right: 0.2em;
    transition: all 0.2s ease-in-out;

  }

  /*배달, 포장 마우스 가져다 댔을 때 색상*/
  .tabs ul li label:hover,
  .tabs ul li label:focus,
  .tabs ul li label:active {
    outline: 0;
    color: #bec5cf;
  }
  .tabs ul li label:hover svg,
  .tabs ul li label:focus svg,
  .tabs ul li label:active svg {
    fill: #bec5cf;
  }

  /*배달, 포장 탭 밑에 있는 슬라이드바 설정*/
  .tabs .slider {
    position: relative;
    width: 50%;
    transition: all 0.33s cubic-bezier(0.38, 0.8, 0.32, 1.07);
  }
  .tabs .slider .indicator {
    position: relative;
    width: 130px;
    max-width: 100%;
    margin: 0 auto;
    height: 2px;
    background: #4caf50;
    border-radius: 1px;
  }

  /*내용 적는 칸*/
  .tabs .content {
    margin-top: 20px;

  }

  /*배달 포장 탭 넘어갈때 효과*/
  .tabs .content section {
    display: none;
    animation-name: content;
    animation-direction: normal;
    animation-duration: 0.3s;
    animation-timing-function: ease-in-out;
    animation-iteration-count: 1;
    line-height: 1.4;
    /* 텍스트가 넘어가면 다음 줄로 바뀌게 하려면 아래 속성을 추가합니다. */
    word-wrap: break-word;
    /* 스크롤생성 */
    height:424px;
    overflow-y: scroll;
  }
  .tabs .content section {
    -ms-overflow-style: none;
    scrollbar-width: none;
  }
  .tabs .content section::-webkit-scrollbar {
    display: none;
  }

  .tabs
  input[name="tab-control"]:nth-of-type(1):checked
  ~ ul
  > li:nth-child(1)
  > label {
    cursor: default;
    color: #4caf50;
  }
  .tabs
  input[name="tab-control"]:nth-of-type(1):checked
  ~ ul
  > li:nth-child(1)
  > label

  @media (max-width: 600px) {
    .tabs
    input[name="tab-control"]:nth-of-type(1):checked
    ~ ul
    > li:nth-child(1)
    > label {
      background: rgba(0, 0, 0, 0.08);
    }
  }
  .tabs input[name="tab-control"]:nth-of-type(1):checked ~ .slider {
    transform: translateX(0%);
  }
  .tabs
  input[name="tab-control"]:nth-of-type(1):checked
  ~ .content
  > section:nth-child(1) {
    display: block;
  }
  .tabs
  input[name="tab-control"]:nth-of-type(2):checked
  ~ ul
  > li:nth-child(2)
  > label {
    cursor: default;
    color: #4caf50;
  }
  .tabs
  input[name="tab-control"]:nth-of-type(2):checked
  ~ ul
  > li:nth-child(2)
  > label

  @media (max-width: 600px) {
    .tabs
    input[name="tab-control"]:nth-of-type(2):checked
    ~ ul
    > li:nth-child(2)
    > label {
      background: rgba(0, 0, 0, 0.08);
    }
  }
  .tabs input[name="tab-control"]:nth-of-type(2):checked ~ .slider {
    transform: translateX(100%);
  }
  .tabs
  input[name="tab-control"]:nth-of-type(2):checked
  ~ .content
  > section:nth-child(2) {
    display: block;
  }

  @keyframes content {
    from {
      opacity: 0;
      transform: translateY(5%);
    }
    to {
      opacity: 1;
      transform: translateY(0%);
    }
  }

  .inside_tabs{
    margin: 10px;
  }

  .searchbar_wrap{width: 95%; margin: auto;}
  .searchbar_wrap > input[type="search"]{width: 86%;margin-left: 7px;}
  .fa-solid, .fas{font-size: 20px;}




  /*주문내역 폼*/

  .main-box {
    border: 1px solid #999;
    width: 320px;
    padding: 10px;
    border-radius: 10px;
    position: relative;
    margin-bottom: 10px;
  }

  .top{
    display: flex; /* Use flexbox to align items horizontally */
    align-items: center; /* Vertically center align items */
    justify-content: space-between;

  }

  .small-box {
    background-color: #4caf50;
    color: #fff;
    padding: 5px;
    width: 70px;
    height: 10px;
    border-radius: 5px;
    font-weight: bolder;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 5px;
    margin-left: 1px;
  }

  .date{
    display: flex;
    float: left;
    flex-direction: row;
    font-size: 13px;
    font-weight: bolder;
    color: #999999;
    margin-right: 83px;
  }


  .storepicture img{
    width: 83px;
    height:84px;
    float: left;
    border-radius: 10px;
    /*margin-top: 7px;*/
  }

  img {
    margin-bottom: 5px;
  }

  .middle {
    margin-left: 93px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 7px;
  }

  .storename,
  .orderitems {
    flex-grow: 1;
  }

  .orderitems{

    font-size: 10px;
    color: #666666;
  }

  .reorder{
    background-color: white;
    border: 1px solid red;
    border-radius: 5px;
    width: 80px;
    height: 25px;
    color: red;
    font-weight: bolder;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 73px;
    cursor: pointer;
  }
  .orderdetailcheck{
    background-color: white;
    border: 1px solid #333;
    border-radius: 5px;
    width: 80px;
    height: 25px;
    color: #333;
    font-weight: bolder;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: -65px;
    cursor: pointer;
  }

  .mybutton{
    display: flex;
    justify-content: flex-end;
    margin-top: 8px;
    margin-left: 10px;
    padding-left: 9px;
  }

  .header{
    font-family: 'omyu_pretty';
  }

  .order_pastorder_footer{
    font-family: 'omyu_pretty';
  }
  button.backbtn{display: flex; align-items: center; font-size: 20px; color: #999; margin: 0 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center; margin-right:20%;}
  button.backbtn:hover {background-color:#333; color:#fff;}
  .headermsg_wrap{width:90%; display: flex; justify-content: flex-start; align-items: end;}

  /* 230802 */
  .createable_review_wrapbox{padding-left:20px;}
  .createable_review_wrap{border: 10px;}
  .createable_review_box{margin-bottom:10px;}
  .review_item_wrap{padding: 0 15px 20px;}
  .review_chk_wrap{display: flex; justify-content: space-between; margin: 6px 0;}
  .review_chk_wrap p{font-size:14px;}
  .review_txt_wrap{padding: 5px 10px;background-color: #ededed;border-radius: 4px;}
</style>
<body>
<div class="main-container">
  <div class="header">
    <jsp:include page="../header/header_index.jsp" />
  </div>
  <div class="headermsg_wrap">
    <%--뒤로가기--%>
    <button class="backbtn" onclick="window.location.replace('/mypage')">&lt;</button>
    <h3 style="margin: 15px 5px 5px; font-size: 20px;">회원 리뷰관리</h3>
  </div>
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

          <div class="createable_review_wrapbox">
          <div id="tab-panel-1" aria-labelledby="tab-1" role="tabpanel" tabindex="0" class="createable_review_wrap">
            <c:forEach items="${newOrders}" var="pastOrder">
              <c:if test="${pastOrder.deliveryType eq '배달'}">
                  <c:set var="processedStoreNames" value="" scope="page" />
                  <c:set var="firstStoreName" value="true" scope="page" />
                  <c:forEach items="${pastOrder.newOrderDetails}" var="orderDetail">
                    <c:if test="${orderDetail.reviewtrue ne '리뷰'}">
                    <c:if test="${!processedStoreNames.contains(orderDetail.buStoreName)}">
                      <c:set var="processedStoreNames" value="${processedStoreNames},${orderDetail.buStoreName}" scope="page" />
                      <div class="createable_review_box">
                      <p style="font-size: 16px; margin-top: ${firstStoreName eq 'true' ? '0' : '10px'}; /*margin-bottom: -11px;*/
                              border-top: ${firstStoreName eq 'true' ? 'none' : '1px solid #eee;'}; position: relative; padding-top:10px;">
                        ${orderDetail.buStoreName}
                          <button style="position: absolute; right: 0;border: none;padding: 3px 8px;background-color: #4caf50;color: #fff;border-radius: 4px;"
                                  onclick="location.href='/user_review?buStoreName=${orderDetail.buStoreName}&orderNumber=${orderDetail.orderNumber}'">리뷰 쓰기</button>
                      </p>
                      <c:set var="firstStoreName" value="false" scope="page" />
                    </c:if>
                        <span style="font-size: x-small; padding-left: 3px;">구매상품 :${orderDetail.itemName}</span>
                    </c:if>
                  </c:forEach>
                </div>
              </c:if>
            </c:forEach>
          </div>
          </div>
          <div id="tab-panel-2" aria-labelledby="tab-2" role="tabpanel" tabindex="-1" hidden>
            <c:forEach items="${re}" var="r">
              <c:if test="${r.newOrder.deliveryType eq '배달'}">
              <div style="width: 315px; margin-top: 10px;border-radius: 7px;box-shadow: 0px 1px 10px rgba(0,0,0,0.2);">
                <img src="../../img/store/${r.businessStore.buStoreImageUrl}" style="max-width: 90%;margin: 11px 11px 0;padding: 5px;/* padding: 5px; */height: auto;border-radius: 8px;">
                <div class="review_item_wrap">
                  <p style="font-size: 16px; margin-top: ${firstStoreName eq 'true' ? '0' : '10px'};/* margin-bottom: -11px;*/
                                border-top: ${firstStoreName eq 'true' ? 'none' : '1px solid #46A973'}; position: relative;">
                            ${r.buStoreName} <span style="font-size: x-small;">구매상품 : ${r.itemName}</span>
                  </p>
                  <div class="review_chk_wrap">
                    <p>별점 : ${r.rating}점 </p>
                    <p>맛 : ${r.taste}점 </p>
                    <p>양 : ${r.amount}점 </p>
                  </div>
                  <div class="review_txt_wrap">
                    <p>${r.content}</p>
                  </div>
                </div>
              </div>
              </c:if>
            </c:forEach>
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
          <div class="createable_review_wrapbox">
            <div id="tab-panel-3" aria-labelledby="tab-3" role="tabpanel" tabindex="0" class="createable_review_wrap">
              <c:forEach items="${newOrders}" var="pastOrder">
                <c:if test="${pastOrder.deliveryType eq '포장'}">
                  <c:set var="processedStoreNames" value="" scope="page" />
                  <c:set var="firstStoreName" value="true" scope="page" />
                  <c:forEach items="${pastOrder.newOrderDetails}" var="orderDetail">
                    <c:if test="${orderDetail.reviewtrue ne '리뷰'}">
                      <c:if test="${!processedStoreNames.contains(orderDetail.buStoreName)}">
                        <c:set var="processedStoreNames" value="${processedStoreNames},${orderDetail.buStoreName}" scope="page" />
                        <div class="createable_review_box">
                          <p style="font-size: 16px; margin-top: ${firstStoreName eq 'true' ? '0' : '10px'}; /*margin-bottom: -11px;*/
                                  border-top: ${firstStoreName eq 'true' ? 'none' : '1px solid #eee;'}; position: relative; padding-top:10px;">
                              ${orderDetail.buStoreName}
                            <button style="position: absolute; right: 0;border: none;padding: 3px 8px;background-color: #4caf50;color: #fff;border-radius: 4px;"
                                    onclick="location.href='/user_review?buStoreName=${orderDetail.buStoreName}&orderNumber=${orderDetail.orderNumber}'">리뷰 쓰기</button>
                          </p>
                          <c:set var="firstStoreName" value="false" scope="page" />
                        </c:if>
                        <span style="font-size: x-small; padding-left: 3px;">구매상품 :${orderDetail.itemName}</span>
                      </c:if>
                    </c:forEach>
                  </div>
                </c:if>
              </c:forEach>
            </div>
          </div>
          <div id="tab-panel-4" aria-labelledby="tab-4" role="tabpanel" tabindex="-1" hidden>
            <c:forEach items="${re}" var="r">
              <c:if test="${r.newOrder.deliveryType eq '포장'}">
                <div style="width: 315px; margin-top: 10px;border-radius: 7px;box-shadow: 0px 1px 10px rgba(0,0,0,0.2);">
                  <img src="../../img/store/${r.businessStore.buStoreImageUrl}" style="max-width: 90%;margin: 11px 11px 0;padding: 5px;/* padding: 5px; */height: auto;border-radius: 8px;">
                  <div class="review_item_wrap">
                    <p style="font-size: 16px; margin-top: ${firstStoreName eq 'true' ? '0' : '10px'}; /*margin-bottom: -11px;*/
                            border-top: ${firstStoreName eq 'true' ? 'none' : '1px solid #46A973'}; position: relative;">
                        ${r.buStoreName} <span style="font-size: x-small;">구매상품 : ${r.itemName}</span>
                    </p>
                    <div class="review_chk_wrap">
                         <p>별점 : ${r.rating}점</p>
                        <p>맛 : ${r.taste}점</p>
                        <p>양 : ${r.amount}점</p>
                    </div>
                    <div class="review_txt_wrap">
                        <p>
                            ${r.content}
                        </p>
                    </div>
                    </div>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
      </section>
    </div>
  </div>
  <div class="order_pastorder_footer">
    <jsp:include page="../footer/footer.jsp" />
  </div>
</div>
<script src="../../js/store/delivery_pickup.js"></script>
<script>
  const tabElements = document.querySelectorAll('button[role="tab"]');
  const panelElements = document.querySelectorAll('[role="tabpanel"]');
  let activeIndex = 0;

  tabElements.forEach(function (tab, index) {
    // 탭 클릭 이벤트 처리
    tab.addEventListener("click", function (event) {
      setActiveTab(index);
    });

    // 키보드 이벤트 처리
    tab.addEventListener("keydown", function (event) {
      const lastIndex = tabElements.length - 1;

      if (event.code === "ArrowLeft" || event.code === "ArrowUp") {
        if (activeIndex === 0) {
          // 첫 번째 요소, 마지막 요소로 이동
          setActiveTab(lastIndex);
        } else {
          // 왼쪽으로 이동
          setActiveTab(activeIndex - 1);
        }
      } else if (event.code === "ArrowRight" || event.code === "ArrowDown") {
        if (activeIndex === lastIndex) {
          // 마지막 요소, 첫 번째 요소로 이동
          setActiveTab(0);
        } else {
          // 오른쪽으로 이동
          setActiveTab(activeIndex + 1);
        }
      } else if (event.code === "Home") {
        // 첫 번째 요소로 이동
        setActiveTab(0);
      } else if (event.code === "End") {
        // 마지막 요소로 이동
        setActiveTab(lastIndex);
      }
    });
  });

  function setActiveTab(index) {
    // 현재 활성화된 탭을 비활성화 처리
    tabElements[activeIndex].setAttribute("aria-selected", "false");
    tabElements[activeIndex].tabIndex = -1;

    // 새로운 탭을 활성화 처리
    tabElements[index].setAttribute("aria-selected", "true");
    tabElements[index].tabIndex = 0;
    tabElements[index].focus();

    setActivePanel(index);
    activeIndex = index;
  }

  function setActivePanel(index) {
    // 현재 활성화된 패널 숨기기
    panelElements[activeIndex].setAttribute("hidden", "");
    panelElements[activeIndex].tabIndex = -1;

    // 새로운 활성화된 패널 보이기
    panelElements[index].removeAttribute("hidden");
    panelElements[index].tabIndex = 0;
  }

</script>
</body>
</html>
