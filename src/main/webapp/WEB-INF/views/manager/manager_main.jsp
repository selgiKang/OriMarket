<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" type="text/css" href="../../css/store/delivery_pickup.css">
</head>
<style>
  /*가운데 정렬*/
  * {
    margin: 0;
    padding: 0;
  }

  body {
    margin: 0 auto;
  }

  /*핸드폰화면 사이즈*/
  .manager_main-container {
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

  /*스크롤 가능은 하지만 스크롤바 안보이게*/
  .manager_main-container::-webkit-scrollbar {
    display: none;
  }

  /*탭 스타일*/
  body h1 {
    text-align: center;
    color: #4caf50;
    font-weight: 300;
    padding: 40px 0 20px 0;
    margin-bottom: -50px;
  }

  /*내용 적는 칸 배경 */
  .manager_main_tabs {
    border-radius: 5px;
    background: white;
    height: 100%;
    margin-top: 15px; /*리뷰관리 제목이랑 간격 조절*/
  }

  .manager_main_tabs input[name="tab-control"] {
    display: none;
  }

  /*배달, 포장 폰트*/
  .manager_main_tabs .content section h2,
  .manager_main_tabs ul li label {
    font-weight: bold;
    font-size: 16px;
    color: #4caf50;
    margin-top: 10px;
  }

  /*배달, 포장 전체 탭*/
  .manager_main_tabs ul {
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

  .manager_main_tabs ul li {
    box-sizing: border-box;
    flex: 1;
    width: 25%;
    padding: 0 10px;
    text-align: center;
  }

  /*배달, 포장 선택하기 전 색상*/
  .manager_main_tabs ul li label {
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

  .manager_main_tabs ul li label br {
    display: none;
  }

  .manager_main_tabs ul li label svg {
    fill: #929daf;
    height: 1.2em;
    vertical-align: bottom;
    margin-right: 0.2em;
    transition: all 0.2s ease-in-out;
  }

  /*배달, 포장 마우스 가져다 댔을 때 색상*/
  .manager_main_tabs ul li label:hover,
  .manager_main_tabs ul li label:focus,
  .manager_main_tabs ul li label:active {
    outline: 0;
    color: #bec5cf;
  }

  .manager_main_tabs ul li label:hover svg,
  .manager_main_tabs ul li label:focus svg,
  .manager_main_tabs ul li label:active svg {
    fill: #bec5cf;
  }

  /*배달, 포장 탭 밑에 있는 슬라이드바 설정*/
  .manager_main_tabs .slider {
    position: relative;
    width: 33.3333%;
    transition: all 0.33s cubic-bezier(0.38, 0.8, 0.32, 1.07);
  }

  .manager_main_tabs .slider .indicator {
    position: relative;
    width: 130px;
    max-width: 100%;
    margin: 0 auto;
    height: 2px;
    background: #4caf50;
    border-radius: 1px;
  }

  /*내용 적는 칸*/
  .manager_main_tabs .content {
    margin-top: 30px;
  }

  /*배달 포장 탭 넘어갈때 효과*/
  .manager_main_tabs .content section {
    display: none;
    animation-name: content;
    animation-direction: normal;
    animation-duration: 0.3s;
    animation-timing-function: ease-in-out;
    animation-iteration-count: 1;
    line-height: 1.4;
    /* 텍스트가 넘어가면 다음 줄로 바뀌게 하려면 아래 속성을 추가합니다. */
    word-wrap: break-word;
  }

  .manager_main_tabs input[name="tab-control"]:nth-of-type(1):checked ~ ul > li:nth-child(1) > label {
    cursor: default;
    color: #4caf50;
  }

  @media (max-width: 600px) {
    .manager_main_tabs input[name="tab-control"]:nth-of-type(1):checked ~ ul > li:nth-child(1) > label {
      background: rgba(0, 0, 0, 0.08);
    }
  }

  .manager_main_tabs input[name="tab-control"]:nth-of-type(1):checked ~ .slider {
    transform: translateX(0%);
  }

  .manager_main_tabs input[name="tab-control"]:nth-of-type(1):checked ~ .content > section:nth-child(1) {
    display: block;
  }

  .manager_main_tabs input[name="tab-control"]:nth-of-type(2):checked ~ ul > li:nth-child(2) > label {
    cursor: default;
    color: #4caf50;
  }

  @media (max-width: 600px) {
    .manager_main_tabs input[name="tab-control"]:nth-of-type(2):checked ~ ul > li:nth-child(2) > label {
      background: rgba(0, 0, 0, 0.08);
    }
  }

  .manager_main_tabs input[name="tab-control"]:nth-of-type(2):checked ~ .slider {
    transform: translateX(100%);
  }

  .manager_main_tabs input[name="tab-control"]:nth-of-type(2):checked ~ .content > section:nth-child(2) {
    display: block;
  }

  .manager_main_tabs input[name="tab-control"]:nth-of-type(3):checked ~ .slider {
    transform: translateX(200%);
  }

  .manager_main_tabs input[name="tab-control"]:nth-of-type(3):checked ~ .content > section:nth-child(3) {
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

  /*메뉴안 탭*/

  .inside_tabs {
    max-width: 320px;
    min-height: 300px;
  }

  div[role="inside_tablist"] {
    gap: 0.25rem;
    background-color: #d1d1d170;
    margin-bottom: 0.5rem;
    padding: 0.4rem;
    border-radius: 10px;
    width: 315px;
    text-align: center;
    margin-left: 15px;
  }

  button[role="tab"] {
    color: #67769e;
    background: none;
    border: none;
    padding: 0.75rem 1.25rem;
    cursor: pointer;
    font-weight: 700;
    border-radius: 10px;
    font-size: 5px;
    width: 150px;
  }

  button[role="tab"][aria-selected="true"] {
    background-color: #ffffff;
    width: 150px;
    color: #4caf50;
  }

  button[role="tab"][aria-selected="false"]:hover {
    color: #000000;
  }

  div[role="tabpanel"] {
    padding: 1rem;
  }

  .slider{
    margin-bottom: -25px;
  }

  #manager_main_login{
    width: 100%;
    text-align: right;
  }


</style>
<body>

<div class="manager_main-container">
  <h3>${sessionScope.managerName} 매니저 페이지</h3>
  <!--if문 추가-->
  <c:if test="${empty sessionScope.managerId}">
    <div id="manager_main_login"><a href="/managerJoin">회원가입</a>&nbsp;&nbsp;&nbsp;<a href="/managerLogin">로 그 인</a></div>
  </c:if>
  <div class="manager_main_tabs">
    <input type="radio" id="tab1" name="tab-control" checked>
    <input type="radio" id="tab2" name="tab-control">
    <input type="radio" id="tab3" name="tab-control">
    <ul>
      <li title="실시간 주문"><label for="tab1" role="button"><span>실시간 주문</span></label></li>
      <li title="수락 대기"><label for="tab2" role="button"><span>수락 대기</span></label></li>
      <li title="이전 내역"><label for="tab3" role="button"><span>이전 내역</span></label></li>
    </ul>
    <div class="slider">
      <div class="indicator"></div>
    </div>
    <!-- 탭 내용 -->
    <div class="content" id="content1">
      <!-- 탭1 내용 -->
      <p>실시간 주문 내용 표시</p>
    </div>
    <div class="content" id="content2">
      <!-- 탭2 내용 -->
      <p>수락 대기 내용 표시</p>
    </div>
    <div class="content" id="content3">
      <!-- 탭3 내용 -->
      <p>이전 내역 내용 표시</p>
    </div>
  </div>
</div>

</body>
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

  // 선택된 탭에 따라 내용을 보여주는 함수
  function showTabContent(tab) {
    const contentElements = document.querySelectorAll('.content');
    contentElements.forEach((content) => {
      content.style.display = 'none';
    });
    document.getElementById(tab.dataset.target).style.display = 'block';
  }

  const tabElements = document.querySelectorAll('label[for^="tab"]');
  tabElements.forEach((tab) => {
    tab.addEventListener('click', function (event) {
      const selectedTab = event.target.getAttribute('for');
      showTabContent(event.target);
    });
  });

  // 초기 로딩 시 첫 번째 탭 내용 보여주기
  showTabContent(tabElements[0]);
</script>
</html>

