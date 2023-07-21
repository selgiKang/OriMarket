/*쿠폰 이미지 등록하면 회색으로 변하게*/
function changeToGrayscale(element) {
    element.style.filter = "grayscale(100%)";
}

function showConfirmationDialog(event) {
    const element = event.target;
    if (!element.classList.contains('coupon')) {
        return;
    }
    if (element.classList.contains('registered')) {
        alert("이미 등록된 쿠폰입니다!");
        return;
    }
    const confirmation = confirm("쿠폰을 등록하시겠습니까?");
    if (confirmation) {
        alert("등록이 되었습니다!");
        changeToGrayscale(element);
        element.classList.add('registered');
    }
}

const coupons = document.querySelectorAll('.coupon');

coupons.forEach(coupon => {
    coupon.addEventListener('click', showConfirmationDialog);
});



/*쿠폰 이미지 클릭앤드래그 해서 나머지 쿠폰도 보이게 하기*/
let isDragging = false;
let initialPosition = null;
let xOffset = 0;
let lastMousePosition = null;

function startDragging(event) {
    event.preventDefault(); // 드래그 시 브라우저 기본 이벤트 방지
    isDragging = true;
    initialPosition = event.clientX;
    lastMousePosition = event.clientX;
}

function dragging(event) {
    event.preventDefault(); // 드래그 시 브라우저 기본 이벤트 방지
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
}

const container = document.querySelector('.coupon-container');

container.addEventListener('mousedown', startDragging);
document.addEventListener('mousemove', dragging);
document.addEventListener('mouseup', stopDragging);

container.addEventListener('mouseleave', () => {
    if (!isDragging) return;
    stopDragging();
});

container.addEventListener('mouseenter', () => {
    if (!isDragging) return;
    startDragging();
});




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


    const menuDescription = document.querySelector('.menu-description');
    const textLength = menuDescription.innerText.length;
    if (textLength > 22) {
        menuDescription.classList.add('multiline');
    }

    if (window.location.hash === '#seller_itemRegist') {
        alert('[[${message}]]'); // message 변수는 컨트롤러에서 전달한 Flash Attribute
    }

    //메뉴 눌러도 화면 안움직이게 하기
/*
const tabmenuInputs = document.querySelectorAll('.tabmenu input');
const tabConContainers = document.querySelectorAll('.tabCon');

tabmenuInputs.forEach((input, index) => {
    input.addEventListener('click', (event) => {
        event.stopPropagation();
        tabConContainers.forEach((container, containerIndex) => {
            if (containerIndex === index) {
                container.style.display = 'block';
            } else {
                container.style.display = 'none';
            }
        });
    });
});*/
