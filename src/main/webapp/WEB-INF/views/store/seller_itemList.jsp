<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>현 재고 리스트</title>
    <style type="text/css">
        /* 전체적용 */
        @font-face {
            font-family: 'omyu_pretty';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        /* 전체 크기 */
        body{margin: 0; padding: 0; font-family:'LINESeedKR-Bd'; font-size: 16px; text-align: center; width: 100%; height: 100%}
        #goods_container{width: 375px; height:812px; margin: 0 auto;}

        /* 가게상호명,업주 */ /* 230723 승원 */
        #goods_store{height:100px; background-color:#46A973; color:#fff; text-align: right; display: flex; justify-content: end; align-items: center;}
        .snun_wrap{margin-right:20px}

        /* 230723 승원 */
        .goods_store_wrap{background-color:#eee; height:712px;}
        .top_title_wrap h1{text-align:center; margin:15px 18%;}

        #goods_title{padding:20px 0 0;}
        #goods_title a{color:#333; margin:10px 5px; margin-right: 0;}
        .top_title_wrap{ display: flex; align-items: center;}
        button.backbtn { display: flex; align-items: center; font-size: 20px; color: #999; margin: 0 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
        button.backbtn:hover {background-color:#333; color:#fff;}

        /* ------------------------------------------ 공통적용css---------------------------------------------- */

        #goods_list{font-size: 14px; margin: auto;}
        /* 230723 승원 */
        #goods_list table{ border-radius: 5px; background-color:#fff; padding:20px 5px; margin:auto;}


        /* 230723 승원 */
        #goods_title > a > input{ background-color: #ffbf41; color: #333; font-weight:600; padding: 8px 8px; border:none; border-radius:5px; cursor:pointer;}
        #goods_title > a > input:hover {background-color:#333; color:#fff;}

        .goods_listTitle{color: #46A973; margin-bottom:15px;}
    </style>
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
                <button class="backbtn" onclick="window.history.go(-1)">&lt;</button>
                <h1>현 재고 목록</h1>
            </div>
            <input type="button" class="delete_btn" value="선택품목 삭제" onclick="deleteSelectedItems()">
            <a href="/s2/${buUserId}"><input type="button" class="insert_btn" value="신규품목 등록"></a>
        </div>
        <br>
        <div id="goods_list">
            <table>
                <tr class="goods_listTitle">
                    <td></td>
                    <td>순번</td>
                    <td>상품명</td>
                    <td>상품수량</td>
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
            console.log({ itemIds: selectedItems });
            $.ajax({
                url: "/delete_items",
                type: "DELETE",
                data: { itemIds: selectedItems },
                success: function(result) {
                    // 삭제 성공 시, 페이지를 새로고침하여 목록을 업데이트
                    if (result === "success") {
                        location.reload();
                    }
                },
                error: function(xhr, status, error) {
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