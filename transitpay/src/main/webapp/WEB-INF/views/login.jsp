<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="../../resources/css/login.css">
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
<script>
    $("#login2").click(function() {
        var idInput = document.querySelector('input[name="id"]').value;
        var pwInput = document.querySelector('input[name="pw"]').value;

        var member = {
            email : idInput,
            pw : pwInput
        }
        // var member = {
        //     name: "테스트1",
        //     phone: "01022254433",
        //     email: "test1@test.com",
        //     join_date: "2023-09-12T04:17:16Z",
        //     kakao_img: "http://k.kakaocdn.net/dn/b8XagJ/btssTqJHXWP/y9huItKDndOduWJJEY7S3K/img_640x640.jpg",
        //     kakao_id: "3024819436"
        // }
        // var member1 = {
        //     name: "테스트2",
        //     phone: "010-0909-0811",
        //     email: "test2@test.com",
        //     join_date: "2023-09-12T04:17:16Z",
        //     kakao_img: "http://k.kakaocdn.net/dn/U9FRo/btst0zFhb4P/eh7HxK1ZBHtFqkGqC3CHRK/img_640x640.jpg",
        //     kakao_id: "3025165876"
        // }

        // AJAX 요청
        $.ajax({
            type: "POST",
            url: "/loginMember",
            data: JSON.stringify(member),
            contentType: "application/json",
            success: function(response) {
                location.href = '/';
            },
            error: function(error) {
                console.error("로그인 실패 : ", error);
            }
        });
    });
</script>
</html>
