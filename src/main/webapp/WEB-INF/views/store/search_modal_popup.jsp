<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>모달 팝업 예제</title>
</head>
<style>
    .tabs {
        border-radius: 5px;
        background: white;
        height: 100%;
        max-width: 365px;
        width: 100%;
        margin-top: 15px; /*리뷰관리 제목이랑 간격 조절*/

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

    .popup {
        width: 355px;
        position: absolute;
        height: 700px;
        top: 50%; /* 기본적으로 중앙에 위치하도록 설정 */
        transition: top 0.3s ease-in-out; /* top 속성이 변경될 때 애니메이션 효과 추가 */
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fff;
        padding: 20px;
        border-radius: 0 0 30px 30px;
        box-shadow: 5px 5px 5px 5px gray;


    }



    /* 핸드폰 사이즈*/
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
        margin: 0 auto;
        width: 375px;
        height: 812px;
        position: relative;
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

    /*버튼바*/
    .bottom-bar {
        position: absolute;
        bottom: 0;
        width: 100%;
        height: 60px;
        background-color: #f1f1f1;
        border-radius: 0 0 30px 30px;
    }

    .button-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
    }

    .button-container button {
        margin: 10px;
        padding: 8px 20px;
        font-size: 16px;
        cursor: pointer;
    }

    .bottom-bar {
        position: absolute;
        bottom: 20px;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 4px;
        background-color: #666666; /* 원하는 색상으로 변경 가능합니다 */
        border-radius: 2px;
    }
</style>

<body>
<div class="main-container">

<!-- 모달 팝업 -->
    <div id="myModal" class="popup" onclick="toggleModal()">
    <!-- 팝업 내용 -->
    <div class="popup">
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

                            여기에 배달 내용을 적어주세요


                        </div>
                    </div>
                </section>
                <section>
                    <div class="inside_tabs">
                        <div role="inside_tablist">

                            여기에 포장 내용을 적어주세요

                        </div>
                    </div>
                </section>
            </div>
        </div>

        <div class="bottom-bar"></div>

    </div>
    </div>
</div>
</div>
</body>
</html>
<script>
    let isModalOpen = false;

    // 모달 팝업 열기/닫기 토글 함수
    function toggleModal() {
        const modalElement = document.getElementById('myModal');
        isModalOpen = !isModalOpen;

        if (isModalOpen) {
            modalElement.style.top = '50%'; // 모달 열릴 때 위치
        } else {
            modalElement.style.top = '-300px'; // 모달 닫힐 때 위치
        }
    }
</script>
