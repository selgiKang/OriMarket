<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>모달 팝업 예제</title>
    <link rel="stylesheet" type="text/css" href="../../css/store/modal_popup.css">
</head>

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

    window.onload = function () {
        const modalElement = document.getElementById('myModal');
        modalElement.style.top = '-300px'; // 모달 닫힐 때 위치
    };
</script>
