<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/storeInfo.css">
</head>
<body>
<div class="main-container">
    <div class="storecare_container">
        <div class="tabs">
            <input class="input" name="tabs-1" type="radio" id="tab-1" checked="checked"/>
            <label class="label" for="tab-1">가게 관리</label>
            <div class="panel">
                <div class="line"></div>
                <form action="/storeInfoDelete?buUserNumber=${storeInfo.businessUser.buUserNumber}" method="post"
                      enctype="multipart/form-data">
                    <c:if test="${!empty storeInfo}">
                        <button class="backbtn" onclick="window.location.replace('a_buser')">&lt;</button>
                        <div class="line"></div>
                        <div class="storecare_logo">
                            <h3>로고</h3>
                            <div 0id="logo-preview">
                                <img src="../../img/store/${storeInfo.buStoreImageUrl}"
                                     style="max-width: 100%; height: auto;">
                            </div>
                            <div>
                                소속 시장 : ${storeInfo.market.marketName}
                            </div>
                            <div>
                                사업자번호 : ${storeInfo.businessUser.buUserNumber}
                            </div>
                            <div>
                                가게 이름 : ${storeInfo.buStoreName}
                            </div>
                            <div>
                                가게 번호 : ${storeInfo.buStorePhone}
                            </div>
                            <div>
                                가게 카테고리 : ${storeInfo.buStoreCategory}
                            </div>
                            <div>
                                가게 주소 : ${storeInfo.buStoreAddress} ${storeInfo.buStoreAddressDetail}
                            </div>
                            <div>
                                가게 오픈여부 : ${storeInfo.status}
                            </div>
                            <div>
                                가게 판매 리스트
                                <table>
                                    <c:forEach items="${storeInfo.items}" var="item">
                                        <tr>
                                            <th>물건 이름</th>
                                            <td>${item.itemName}</td>
                                        </tr>
                                        <tr>
                                            <th>물건 원가</th>
                                            <td>${item.itemCost}</td>
                                        </tr>
                                        <tr>
                                            <th>물건 판매가격</th>
                                            <td>${item.itemPrice}</td>
                                        </tr>
                                        <tr>
                                            <th>원산지</th>
                                            <td>${item.itemFrom}</td>
                                        </tr>
                                        <tr>
                                            <th>물건 등록일</th>
                                            <td>${item.itemRegDate}</td>
                                        </tr>
                                        <tr>
                                            <th>물건 카테고리</th>
                                            <td>${item.itemCategory}</td>
                                        </tr>
                                        <tr>
                                            <th>물건 이미지</th>
                                            <td><img src="../../img/store/${item.itemImageUrl}"
                                                     style="max-width: 100%; height: auto;"></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </c:if>
                    <div><input type="submit" value="삭제"></div>
                </form>
            </div>


        </div>

    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>

