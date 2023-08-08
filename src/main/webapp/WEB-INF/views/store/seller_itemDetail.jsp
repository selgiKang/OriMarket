<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신규상품등록</title>
    <link rel="stylesheet" type="text/css" href="../../css/store/seller_itemDetail.css">
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div class="sn_wrap">
            <div>${buStore.buStoreName}</div>
            <small>대표:${buUser.buUserName}</small>
        </div>
    </div>
    <div class="goods_store_wrap">
        <div class="goods_store_list_wrap">
            <div id="goods_title">
                <div class="top_title_wrap">
                    <!-- 뒤로가기 -->
                    <button class="backbtn" onclick="window.history.go(-1)">&lt;</button>
                    <h1>상품상세정보</h1>
                </div>
            </div>
                <form action="/update_itemDetail" method="post" enctype="multipart/form-data">
                    <table id="goods_table">
                        <td><input type="hidden" name="itemId" value="${items.itemId}"></td>
                        <tr>
                            <td>상품명</td>
                            <td class="input_wrap"><input type="text" name="itemName" value="${items.itemName}"></td>
                        </tr>
                        <tr>
                            <td>상품수량</td>
                            <td><input type="text" name="itemCnt" value="${items.itemCnt}"></td>
                        </tr>
                        <tr>
                            <td>원가</td>
                            <td><input type="text" name="itemCost" value="${items.itemCost}"></td>
                        </tr>
                        <tr>
                            <td>판매가</td>
                            <td><input type="text" name="itemPrice" value="${items.itemPrice}"></td>
                        </tr>
                        <tr>
                            <td>무게</td>
                            <td><input type="text" name="itemG" value="${items.itemG}"></td>
                        </tr>
                        <tr>
                            <td>원산지</td>
                            <td><input type="text" name="itemFrom" value="${items.itemFrom}"></td>
                        </tr>
                        <tr>
                            <td>입고일</td>
                            <td><input type="text" name="itemRegDate" value="${items.itemRegDate}"></td>
                        </tr>
                        <tr>
                            <td>상세정보</td>
                            <td><textarea name="itemInfo" rows="7">${items.itemInfo}</textarea></td>
                        </tr>
                        <tr>
                            <td>상품 카테고리</td>
                            <td><select type="" name="itemCategory" class="select" id="lang">
                                <option value="사장님추천">사장님추천</option>
                                <option value="인기메뉴">인기메뉴</option>
                                <option value="선착순특가">할인메뉴</option>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td>상품사진</td>
                            <td style="width: 70%;">
                                <input type="file" accept="image/*" name="pictureUrl" id="logo-upload" onchange="previewPicture(event)" style="width: 82%;">
                                <div id="logo-preview" style="width: 80%; display: inline-block;">
                                     <img src="../../img/store/item/${items.itemImageUrl}" style="max-width: 100%; height: auto;">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <div id="goods_btn">
                        <input type="submit" value="수정">
                        <a href="/s1/${buUserId}"><input type="button" value="리스트"></a>
                    </div>
                </form>
            </div>
            <br>
        </div>
    </div>
</div>
</body>
<script>
    function previewPicture(event) {
        const pictureInput = event.target;
        const picturePreview = document.getElementById('logo-preview');

        if (pictureInput.files && pictureInput.files[0]) {
            const reader = new FileReader();

            reader.onload = function (e) {
                const imgElement = document.createElement('img');
                imgElement.src = e.target.result;
                imgElement.style.maxWidth = '100%'; // 이미지 크기 조절 (선택사항)
                imgElement.style.height = "auto";
                picturePreview.innerHTML = ''; // 이미지 미리보기 업데이트
                picturePreview.appendChild(imgElement);
            };

            reader.readAsDataURL(pictureInput.files[0]);
        }
    }
</script>
</html>