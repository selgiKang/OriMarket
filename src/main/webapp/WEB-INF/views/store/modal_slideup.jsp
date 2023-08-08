<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../css/store/modal_slideup.css">
    <title>Modal Popup</title>
</head>
<body>
<div class="main-container">
    <!-- 모달 팝업창을 .main-container 안에 넣어줍니다. -->
    <div class="modal" id="modal">
        <div class="modal-content">
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


                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="inside_tabs">
                            <div role="inside_tablist">

                            </div>
                        </div>
                    </section>
                </div>
            </div>


        </div>
    </div>
</div>

<script>
    const modal = document.getElementById('modal');

    let isDragging = false;
    let startOffsetY = 0;
    let modalOffsetY = 0;

    modal.addEventListener('mousedown', (event) => {
        // 마우스를 누를 때 모달창을 보이도록 위치 설정
        modal.style.bottom = '0';
        isDragging = true;
        startOffsetY = event.clientY - modal.getBoundingClientRect().top;
        modalOffsetY = modal.offsetTop;

        // 드래그 중인 상태에서 cursor 스타일 변경
        modal.classList.add('dragging');
    });

    window.addEventListener('mousemove', (event) => {
        if (isDragging) {
            const newY = event.clientY - startOffsetY;
            const maxY = window.innerHeight - modal.clientHeight;
            const minY = 50;
            const newTop = Math.max(minY, Math.min(newY, maxY));
            modal.style.top = `${newTop}px`;
        }
    });

    window.addEventListener('mouseup', () => {
        isDragging = false;

        // 드래그 종료시 cursor 스타일 원래대로 돌려놓기
        modal.classList.remove('dragging');
    });
</script>


</body>
</html>
