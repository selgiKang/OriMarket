<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>현 재고 리스트</title>
    <link rel="stylesheet" type="text/css" href="../../css/store/seller_itemList.css">
    <script src="../../js/common/jquery-3.6.4.js"></script>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div class="snun_wrap">
            <div>${buStore.buStoreName}</div>
            <small>대표:${buUser.buUserName}</small>
        </div>
    </div>
    <div class="goods_store_wrap">
        <div id="goods_title">
            <div class="top_title_wrap">
                <!-- 뒤로가기 -->
                <button class="backbtn" onclick="window.location.replace('/storenotice1')">&lt;</button>
                <h1>현 재고 목록</h1>
            </div>
            <a><input type="button" class="delete_btn" value="선택품목 삭제" onclick="deleteSelectedItems()"></a>
            <a href="/s2/${buUserId}"><input type="button" class="insert_btn" value="신규품목 등록"></a>
        </div>
        <br>
        <div id="goods_list">
            <table>
                <tr class="goods_listTitle">
                    <td></td>
                    <td>순번</td>
                    <td>상품명</td>
                    <td>수량</td>
                    <td>판매가</td>
                    <td>입고일</td>
                    <td>카테고리</td>
                </tr>
                <c:forEach var="it" items="${items}" varStatus="status">
                    <tr>
                        <td><input type="checkbox" value="${it.itemId}"></td>
                        <td><a href="/seller_itemDetail/${it.itemId}">${status.index+1}</a></td>
                        <td>${it.itemName}</td>
                        <td>${it.itemCnt}</td>
                        <td><span class="formatted-price">${it.itemPrice}</span></td>
                        <td>${it.itemRegDate}</td>
                        <td>${it.itemCategory}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    // 선택된 체크박스 항목들을 삭제하는 함수
    function deleteSelectedItems() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
        var selectedItems = [];

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                var itemId = checkboxes[i].value;
                selectedItems.push(itemId);
            }
        }

        // 선택된 항목들을 서버로 보내어 삭제 처리
        if (selectedItems.length > 0) {
            console.log(selectedItems);
            console.log({itemIds: selectedItems});
            $.ajax({
                url: "/delete_items",
                type: "DELETE",
                data: {itemIds: selectedItems},
                success: function (result) {
                    // 삭제 성공 시, 페이지를 새로고침하여 목록을 업데이트
                    if (result === "success") {
                        window.location.href = "/s1/${buUserId}";
                    }
                },
                error: function (xhr, status, error) {
                    // 에러 처리
                    console.error("Error:", error);
                }
            });
        }
    }

    function formatNumberWithCommas(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    //백단위로 ',' 찍히게 하기
    var priceElements = document.getElementsByClassName("formatted-price");
    for (var i = 0; i < priceElements.length; i++) {
        var price = parseInt(priceElements[i].textContent);
        var formattedPrice = formatNumberWithCommas(price);
        priceElements[i].textContent = formattedPrice;
    }
</script>