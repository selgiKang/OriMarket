    // 이미지를 그레이스케일로 변경하는 함수
    function changeToGrayscale(element) {
        element.style.filter = "grayscale(100%)";
    }

    // 쿠폰 등록 확인 대화상자 표시
    function showConfirmationDialog(element) {
        const confirmation = confirm("쿠폰을 등록하시겠습니까?");
        if (confirmation) {
            alert("등록이 되었습니다!");
            element.style.filter = "grayscale(100%)";
        }
    }

    // 마우스 다운 이벤트 핸들러
    function startDragging(event) {
        event.preventDefault();
    }

    // 마우스 이동 이벤트 핸들러
    function dragging(event) {
        event.preventDefault();
    }

    // 마우스 업 이벤트 핸들러
    function stopDragging() {
        event.preventDefault();
    }
    
    
let isDragging = false;
let initialPosition = null;
let xOffset = 0;
let lastMousePosition = null;
let animationId = null;

function startDragging(event) {
  isDragging = true;
  initialPosition = event.clientX;
  lastMousePosition = event.clientX;
}

function dragging(event) {
  if (!isDragging) return;
  const currentPosition = event.clientX;
  const dx = currentPosition - lastMousePosition;
  xOffset += dx;
  event.target.parentElement.style.transform = `translateX(${xOffset}px)`;
  lastMousePosition = currentPosition;
}

function stopDragging() {
  if (!isDragging) return;
  isDragging = false;
  initialPosition = null;
  lastMousePosition = null;
  cancelAnimationFrame(animationId);
}

const container = document.querySelector('.coupon-container');

container.addEventListener('mousedown', startDragging);
container.addEventListener('mousemove', dragging);
container.addEventListener('mouseup', stopDragging);

container.addEventListener('mouseleave', () => {
  if (!isDragging) return;
  cancelAnimationFrame(animationId);
});

container.addEventListener('mouseenter', () => {
  if (!isDragging) return;
  animateCoupon();
});

function animateCoupon() {
  const containerRect = container.getBoundingClientRect();
  const containerWidth = containerRect.width;
  const couponWidth = container.querySelector('.coupon').offsetWidth;
  const maxOffset = containerWidth - couponWidth;
  const speed = (lastMousePosition - initialPosition) / 10;

  xOffset += speed;
  xOffset = Math.max(-maxOffset, Math.min(0, xOffset));
  container.style.transform = `translateX(${xOffset}px)`;

  if (xOffset > -maxOffset && xOffset < 0) {
    animationId = requestAnimationFrame(animateCoupon);
  }
}




    function hoverHeart(element) {
        var inputElement = element.nextElementSibling;
        element.src = element.src.replace("empty_heart.png", "filled_heart.png");
}


function toggleHeart(element) {
    var inputElement = element.querySelector('input[name="favNumber"]');
    var currentValue = inputElement.value;
    console.log("click!")
    if (currentValue === "") {
        inputElement.value = "1";
        // 이미지를 변경하는 코드 추가
        element.querySelector('.heart').src = "../../img/store/filled_heart.png";
    } else {
        inputElement.value = "";
        // 이미지를 변경하는 코드 추가
        element.querySelector('.heart').src = "../../img/store/empty_heart.png";
    }

    element.closest('form').submit(); // 수정된 부분: form을 submit
}