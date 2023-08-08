<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/store/menuclick_style.css">
    <link rel="stylesheet" type="text/css" href="../../css/store/detailmenu.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/paper/bootstrap.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="../../js/common/jquery-3.6.4.js"></script>
    <script src="https://kit.fontawesome.com/1d53132cda.js" crossorigin="anonymous"></script>
    <script src="../../js/store/detailmenu.js"></script>
</head>

<body style="margin: 0 auto">
<div id="detailmenu_wrap">
    <div class="selected_menu">
        <div class="mainfood">
            <!-- 뒤로가기 -->
            <button class="backbtn" onclick="location.href='/store?favStoreName=${sessionScope.favStoreName}'"><
            </button>
            <img src="../../img/store/item/${item.itemImageUrl}" alt="메뉴이미지"
                 style="width: 90%;height: 90%; margin: auto;box-sizing: border-box;display: inline-block;">
        </div>
        <p class="pic_not">위 사진은 연출된 사진으로 실제와 다를 수 있습니다.</p>
        <div class="main_menu_wrap">
            <div class="main_menu_name">
                <h1>${item.itemName}</h1>
                <h5>${item.itemInfo}</h5>
            </div>
            <form action="/${userId}/cart" method="post" id="cartForm">
                <input type="hidden" value="${item.businessStore}" name="businessStore">
                <div class="mymenu_container">
                    <div class="mymenu">
                        <div class="radio">
                            <h5>가격</h5>
                            <label><input type="radio" value="${item.itemName}" name="itemName"
                                          checked/>${item.itemName}</label>
                            <input type="hidden" value="${item.itemId}" name="itemId" id="itemId">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${item.itemPrice}"
                                                                       name="itemPrice"
                                                                       style="outline: none;border: none; width: 55%;"/>
                        </div>
                        <table style="margin-left:20px;">
                            <tr>
                                <td style="margin-right:15px;">개수</td>
                                <%-- js 적용됨 class 이름 바꿀 때 js 파일도 참조--%>
                                <%-- 이 값은 따로 param으로 가져가서 set, save하기 --%>
                                <td>
                                    <button type="button" class="menu_btn_minus" onclick="minusBtn()"
                                            style="margin-left:20px;"><i class="fas fa-solid fa-square-minus"
                                                                         style="color: #46a973; font-size: 24px;"></i>
                                    </button>
                                </td>
                                <td class="detailmenu_count"><input type="text" id="countInput" name="count" value="1"
                                                                    size="1"></td>
                                <td>
                                    <button type="button" class="menu_btn_plus" onclick="plusBtn()"><i
                                            class="fas fa-solid fa-square-plus"
                                            style="color: #46a973; font-size: 24px;"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td><small style="color: red">현재 재고: ${item.itemCnt}개</small></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div>
                    <button type="button" class="dm_cart" onclick="submitForm()">장바구니 담기</button>
                    <%--올 때 재고 확인해서 hidden으로 넣기--%>
                    <input type="hidden" id="itemCnt" value="${item.itemCnt}">
                    <input type="hidden" id="cartCnt" value="${cartItem}">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- HTML 코드는 여기에 위치합니다 -->

<script>
    let isSubmitting = false;

    function submitForm() {
        if (isSubmitting) return; // 이미 제출 중이면 함수를 빠져나감
        isSubmitting = true; // 제출 중 상태로 변경

        // 장바구니 담기 로직 시작
        // 재고
        var itemCnt = parseInt(document.getElementById("itemCnt").value, 10);
        // 선택 수
        var countInput = parseInt(document.getElementById("countInput").value, 10);
        // 장바구니 수량
        var cartCnt = parseInt(document.getElementById("cartCnt").value, 10);

        const itemId = document.getElementById("itemId").value;

        // 아이디
        const userId = '<%= session.getAttribute("userId") %>';

        console.log("userId:", userId); // userId의 값을 콘솔에 출력해보세요.
        if (userId === null || userId === "null") {
            alert("장바구니를 이용하시려면 로그인이 필요합니다.");
            window.location.href = "/mypage";
        } else {
            console.log("장바구니 수량" + cartCnt);
            console.log("전체 수량" + countInput + cartCnt);
            // if문 추가해서 재고 보다 많이 담으면 재고 알림?
            if (isNaN(cartCnt)) {
                cartCnt = 0;
            }
            if (itemCnt < countInput + cartCnt) {
                alert("재고 수량보다 많습니다.")
                window.location.href = "/detailmenu/" + itemId + "/" + userId;
            } else {
                const confirmed = confirm("장바구니에 담으시겠습니까?");
                if (confirmed) {
                    // 아래 두 줄 추가
                    document.getElementById("cartForm").submit();
                    return;
                } else {
                    // 사용자가 "취소"를 클릭한 경우 추가적인 동작을 여기에 추가할 수 있습니다.
                }
            }
        }

        isSubmitting = false; // 제출 완료 후 상태 변경
    }

    function viewCart() {
        window.location.href = "/" + userId + "/cart";
    }
</script>

<jsp:include page="../footer/nav_footer.jsp"/>
</body>
</html>

 