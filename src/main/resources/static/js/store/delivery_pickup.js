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
