<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신규상품등록</title>
    <link rel="stylesheet" type="text/css" href="../../css/store/seller_itemRegister.css">
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
        <div class="goods_store_new_wrap">
            <div>
              <h1>신규상품등록</h1>
            </div>
        <div>
            <form action="/s2" method="post" enctype="multipart/form-data">
                <table id="goods_listTable">
                    <tr>
                        <td>상품명</td>
                        <td><input type="text" name="itemName"></td>
                    </tr>
                    <tr>
                        <td>상품수량</td>
                        <td><input type="text" name="itemCnt" placeholder="판매단위 수량만 입력해주세요"></td>
                    </tr>
                    <tr>
                        <td>원가</td>
                        <td><input type="text" name="itemCost" placeholder="원가금액만 입력해주세요"></td>
                    </tr>
                    <tr>
                        <td>판매가</td>
                        <td><input type="text" name="itemPrice" placeholder="판매금액만 입력해주세요"></td>
                    </tr>
                    <tr>
                        <td>무게</td>
                        <td><input type="text" name="itemG" placeholder="그램(g)수만 입력해주세요."></td>
                    </tr>
                    <tr>
                        <td>원산지</td>
                        <td><input type="text" name="itemFrom"></td>
                    </tr>
                    <tr>
                        <td>입고일</td>
                        <td><input type="date" name="itemRegDate"></td>
                    </tr>
                    <tr>
                        <td>상세정보</td>
                        <td><textarea name="itemInfo" placeholder="등록상품과 관련된 상세정보만 입력해주세요."></textarea></td>
                    </tr>
                    <tr>
                        <td>상품 카테고리</td>
                        <td><select type="" name="itemCategory" class="select" id="lang">
                                <option value="사장님추천">추천메뉴</option>
                                <option value="인기메뉴">인기메뉴</option>
                                <option value="선착순특가">할인메뉴</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="file_tr">
                        <td>상품사진</td>
                        <td><input type="file" accept="image/*" name="pictureUrl"></td>
                    </tr>
                </table>
                <br>
                <div id="goods_btn">
                    <!-- 등록버튼 클릭하면 모달창 띄워서 등록이 완료되었습니다. 표시하고 계속 상품등록할 수 있도록 같은 등록페이지로 리다이렉트 -->
                    <input type="submit" value="등록">
                    <!-- 뒤로가기 -->
                    <input type="reset" onclick="window.history.go(-1)" value="취소">
                    <a href="/s1/${buUserId}">리스트</a>
                </div>
            </form>
            <div>
            </div>
        </div>
        <br>
        </div>
    </div>
</div>
</body>
</html>
