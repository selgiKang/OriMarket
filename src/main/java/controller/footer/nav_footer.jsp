<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .nav_footer {
            width: 375px;
            height: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #46a973;
            border-radius: 25px;
            padding: 10px;
        }
        
        .nav_footer img {
            width: 30px;
            height: 30px;
        }
    </style>
    <script>
        function toggleImage(element) {
            var homeImage = document.getElementById("nav_home_img");
            var listImage = document.getElementById("nav_list_img");
            var cartImage = document.getElementById("nav_cart_img");
            var starImage = document.getElementById("nav_star_img");
            var userImage = document.getElementById("nav_user_img");
            
            if (element.id === "nav_home_img") {
                homeImage.src = "../img/nav_home2.png";
                listImage.src = "../img/nav_list1.png";
                cartImage.src = "../img/nav_cart1.png";
                starImage.src = "../img/nav_star1.png";
                userImage.src = "../img/nav_user1.png";
            } else if (element.id === "nav_list_img") {
                listImage.src = "../img/nav_list2.png";
                homeImage.src = "../img/nav_home1.png";
                cartImage.src = "../img/nav_cart1.png";
                starImage.src = "../img/nav_star1.png";
                userImage.src = "../img/nav_user1.png";
            } else if (element.id === "nav_cart_img") {
                cartImage.src = "../img/nav_cart2.png";
                listImage.src = "../img/nav_list1.png";
                homeImage.src = "../img/nav_home1.png";
                starImage.src = "../img/nav_star1.png";
                userImage.src = "../img/nav_user1.png";
            } else if (element.id === "nav_star_img") {
                starImage.src = "../img/nav_star2.png";
                listImage.src = "../img/nav_list1.png";
                homeImage.src = "../img/nav_home1.png";
                cartImage.src = "../img/nav_cart1.png";
                userImage.src = "../img/nav_user1.png";
            } else if (element.id === "nav_user_img") {
                userImage.src = "../img/nav_user2.png";
                listImage.src = "../img/nav_list1.png";
                homeImage.src = "../img/nav_home1.png";
                cartImage.src = "../img/nav_cart1.png";
                starImage.src = "../img/nav_star1.png";
            }
        }
    </script>
</head>
<body>
    <div class="nav_footer">
        <img id="nav_home_img" src="../img/nav_home1.png" alt="main Icon" onclick="toggleImage(this)">
        <img id="nav_list_img" src="../img/nav_list1.png" alt="list Icon" onclick="toggleImage(this)">
        <img id="nav_cart_img" src="../img/nav_cart1.png" alt="cart Icon" onclick="toggleImage(this)">
        <img id="nav_star_img" src="../img/nav_star1.png" alt="favorite Icon" onclick="toggleImage(this)">
        <img id="nav_user_img" src="../img/nav_user1.png" alt="user Icon" onclick="toggleImage(this)">
    </div>
</body>
</html>
