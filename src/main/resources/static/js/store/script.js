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
    element.src = element.src.replace("empty_heart.png", "filled_heart.png");
}

function toggleHeart(element) {
    if (element.src.includes("filled_heart.png")) {
        element.src = element.src.replace("filled_heart.png", "empty_heart.png");
    } else {
        element.src = element.src.replace("empty_heart.png", "filled_heart.png");
    }
}






// JavaScript 코드
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("menu");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {
    slideIndex = 1;
  }
  slides[slideIndex - 1].style.display = "block";
  setTimeout(showSlides, 2000); // 2초마다 슬라이드 전환
}




