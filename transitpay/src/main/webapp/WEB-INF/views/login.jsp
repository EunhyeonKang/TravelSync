<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="../../resources/css/login.css">
    <script defer src="../../resources/js/login.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
<div class="main">
    <%@ include file="include/header.jsp" %>
    <div class="group71">
        <div class="group31">
                <span id="login">로그인</span>
                <br/>
                <div class="flexlogin">
                    <span class="idbox">아이디</span>
                    <input type="text" name="id" id="rec6" placeholder="아이디를 입력해주세요" autocomplete="off"/>
                </div>
                <br/>
                <div class="flexlogin">
                    <span class="idbox">비밀번호</span>
                    <input type="password" name="pw" id="rec6" placeholder="비밀번호를 입력해주세요" autocomplete="off"/>
                </div>
                <br/>

                <button id="login2">
                    <span>로그인하기</span>
                </button>

            <br/>
        </div>
    </div>
    <%@ include file="include/footer.jsp" %>
</div>
</body>
</html>
