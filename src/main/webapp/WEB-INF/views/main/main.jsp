<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }

    #main {
        margin: 0 auto;
        width: 375px;
        height: 812px;
        background-color: #c4c4c4;
        position: relative;
        text-align: center;
    }
    #header{
        width: 100%;
        height: 10%;
        background-color: #46A973;
    }

    #footer{
        width: 100%;
        height: 10%;
        background-color: #46A973;
        position: absolute;
        bottom: 0;
    }
    #marketmap{
        width: 90%;
        height: 40%;
        background: #cc4444;
        position: absolute;
        top: 20%;
    }

</style>
<body>

    <div id="main">
        <div id="header">
        <jsp:include page="../header/header_index.jsp" />
        </div>

        <div id="marketmap">
        <a href="/marketmap">마켓맵</a>
        </div>



        <div id="footer">
        <jsp:include page="../footer/nav_footer.jsp" />
        </div>
    </div>


</body>
</html>