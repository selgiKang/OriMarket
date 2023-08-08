<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색결과</title>
    <style>
        .search_result_header{width:375px; background-color:#eee; margin-bottom:20px; margin: auto;}
        .search_result_wrap{width:375px; background-color:#eee; margin:0 auto; height: 712px;}
        .search_result_box{width:320px; height:auto; background-color:#fff; border-radius: 25px; padding:10px 15px; margin:10px;}
        .search_result_title{text-align: center;}

        .result_item{ width:280px; padding:0 10px; border:1px solid #eee; border-radius: 15px; margin:10px auto; display: flex;}
        .result_item:hover{cursor: pointer; border:1px solid #ffbf41;}
        .result_item_txt{width:60%; padding:10px;}
        .result_item_img{width:40%; padding:5px;}
    </style>
</head>
<body>
<div class="search_result_header">
    <jsp:include page="../header/header_search.jsp" />
</div>
<!-- 상품검색 -->
<c:if test="${not empty it1}">
    <div class="search_result_wrap">
        <div class="search_result_box">
            <div class="search_result_content">
                <h2 class="search_result_title">상품 검색 결과</h2>
                    <hr style="width:90%; opacity: 0.4;">
                    <c:forEach var="a" items="${it1}">
                        <div class="result_item" onclick="location.href='/store?favStoreName=${a.businessStore.buStoreName}'">
                            <div class="result_item_txt">
                                <p>상품: ${a.itemName}</p>
                                <p>가격: ${a.itemPrice}</p>
                            </div>
                            <div class="result_item_img">
                                <img src="../../img/store/item/${a.itemImageUrl}" alt="메뉴이미지" style="width:100%;height:100%; margin: auto;box-sizing: border-box;display: inline-block;">
                            </div>
                        </div>
                    </c:forEach>
            </div>
        </div>
    </div>
</c:if>
<!-- 가게검색 -->
<c:if test="${!empty st123}">
    <div class="search_result_wrap">
        <div class="search_result_box">
            <div class="search_result_content">
                    <h2 class="search_result_title">가게 검색 결과</h2>
                    <hr style="width:90%; opacity: 0.4;">
                        <c:forEach var="b" items="${st123}">
                            <div class="result_item" onclick="location.href='/store?favStoreName=${b.buStoreName}'" style="display: flex; justify-content: space-between;">
                            <p>${b.buStoreName}</p>
                            <p> > </p>
                        </c:forEach>
                    </div>
            </div>
        </div>
    </div>
</c:if>
</body>
</html>
