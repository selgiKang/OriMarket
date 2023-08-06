<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>라이더 목록</title>
    <script src="../../js/common/jquery-3.6.4.js"></script>
    <link rel="stylesheet" href="../../css/admin/rider.css">
</head>
<body>
<div id="rider_container">
    <div id="rider_store">
        <div class="snun_wrap">
            <h1>라이더 목록</h1>
        </div>
    </div>
    <div class="rider_store_wrap">
        <div id="rider_title">
            <div class="top_title_wrap">
                <!-- 뒤로가기 -->
                <a href="/adminMain">
                    <button class="backbtn">&lt;</button>
                </a>
            </div>
            <a><input type="button" class="delete_btn" value="라이더 삭제" onclick="deleteSelectedRiders()"></a>
            <a><input type="button" class="show_all_btn" value="전체회원 보기" onclick="showAllManagerUsers()"></a>
        </div>
        <td>
            <select type="" name="rider_search" class="select" id="searchType">
                <option value="id">아이디 검색</option>
                <option value="name">이름 검색</option>
            </select>
            <input type="text" id="searchText" placeholder="검색어를 입력하세요">
            <!-- 검색 버튼 -->
            <button onclick="searchRiders()">검색</button>
        </td>
        <br>
        <div id="rider_list">
            <table>
                <tr class="rider_listTitle">
                    <td></td>
                    <td>순번</td>
                    <td>라이더명</td>
                    <td>아이디</td>
                    <td>전화번호</td>
                    <td>주소</td>
                    <td>운전면허</td>
                </tr>
                <c:forEach var="rider" items="${riders}" varStatus="status">
                    <tr>
                        <td><input type="checkbox" value="${rider.riderId}"></td>
                        <td><a href="/rider_detail/${rider.riderId}">${status.index+1}</a></td>
                        <td>${rider.riderName}</td>
                        <td>${rider.riderId}</td>
                        <td>${rider.riderPhone}</td>
                        <td>${rider.riderAddress}</td>
                        <td>${rider.driverLicense}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    function deleteSelectedRiders() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
        var selectedRiders = [];

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                var riderSeq = checkboxes[i].value;
                selectedRiders.push(riderSeq);
            }
        }

        // 선택된 항목들을 서버로 보내어 삭제 처리
        if (selectedRiders.length > 0) {
            $.ajax({
                url: "/delete_riders",
                type: "DELETE",
                contentType: "application/json", // 데이터 전송 형식을 JSON으로 설정
                data: JSON.stringify(selectedRiders), // JSON 형식으로 변환하여 전송
                success: function (result) {
                    // 삭제 성공 시, 페이지를 새로고침하여 목록을 업데이트
                    if (result === "success") {
                        alert("라이더 삭제가 완료되었습니다.");
                        window.location.reload();
                    }
                },
                error: function (xhr, status, error) {
                    // 에러 처리
                    console.error("Error:", error);
                }
            });
        }
    }


    //검색기능
    function searchRiders() {
        // 선택한 검색 조건을 가져옴
        var searchType = document.getElementById('searchType').value;
        // 입력한 검색어를 가져와 소문자로 변환
        var searchText = document.getElementById('searchText').value.toLowerCase();

        // 라이더 목록의 모든 행을 가져옴
        var riders = document.querySelectorAll('#rider_list table tr');

        for (var i = 1; i < riders.length; i++) { // 1부터 시작하여 테이블 헤더 행을 건너뜀
            // 행에서 라이더 아이디와 이름을 가져옴
            var riderId = riders[i].querySelector('td:nth-child(4)').textContent.toLowerCase();
            var riderName = riders[i].querySelector('td:nth-child(3)').textContent.toLowerCase();

            // 검색어가 비어있으면 모든 행을 보여줌
            if (searchText === '') {
                riders[i].style.display = '';
            } else {
                // 검색 조건과 검색어를 기준으로 행을 필터링하여 보여줄지 숨길지 결정
                if (
                    (searchType === 'id' && riderId.includes(searchText)) || // 검색 조건이 '라이더 아이디 검색'이면 라이더 아이디로 필터링
                    (searchType === 'name' && riderName.includes(searchText)) // 검색 조건이 '라이더 이름 검색'이면 라이더 이름으로 필터링
                ) {
                    riders[i].style.display = ''; // 일치하는 행은 보여줌
                } else {
                    riders[i].style.display = 'none'; // 일치하지 않는 행은 숨김
                }
            }
        }
    }

    //엔터키로 검색되게
    var searchText = document.getElementById('searchText');
    searchText.addEventListener('keyup', function (event) {
        if (event.keyCode === 13) { // Enter 키를 누른 경우
            searchRiders(); // 검색 기능 함수를 호출
        }
    });

    // 전체회원 보기
    function showAllManagerUsers() {
        // 라이더 목록의 모든 행을 가져옴
        var riders = document.querySelectorAll('#rider_list table tr');

        // 모든 행을 보여줌
        for (var i = 1; i < riders.length; i++) { // 1부터 시작하여 테이블 헤더 행을 건너뜀
            riders[i].style.display = '';
        }
    }

</script>