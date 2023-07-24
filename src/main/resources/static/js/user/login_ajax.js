
// 이미 모달창이 열려있을 때도 팝업창이 뜨도록 수정
function validateLoginForm() {
    const userId = document.getElementById("userId").value;
    const userPassword = document.getElementById("userPassword").value;

    // 서버로 로그인 정보 전달 (AJAX 요청)
    fetch("/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ userId, userPassword })
    })
        .then(response => response.text())
        .then(data => {
            if (data === "로그인 성공") {
                // 로그인 성공
                window.location.replace('/')
            } else {
                // 로그인 실패
                const errorMessage = "아이디 또는 비밀번호가 틀립니다.";
                alert(errorMessage);
                document.querySelector('.modal').classList.add('show');
            }
        })
        .catch(error => {
            console.error("Error:", error);
        });

    // 폼 전송을 막음 (기본 동작 취소)
    return false;
}
/* ---------------------------------------로그인 모달창 open 이벤트처리 */
/* 로그인 모달 */
const body = document.querySelector('#mypage_content');
const modal = document.querySelector('.modal');
const btnOpenPopup = document.querySelector('.btn-open-popup');

btnOpenPopup.addEventListener('click', () => {
    modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
        body.style.overflow = 'hidden';
    }
});

modal.addEventListener('click', (event) => {
    if (event.target === modal) {
        modal.classList.toggle('show');

        if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
        }
    }
});
