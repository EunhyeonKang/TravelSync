<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>트래블싱크</title>
    <link rel="stylesheet" href="../../../../resources/admin/css/common.css">
    <link rel="stylesheet" href="../../../../resources/admin/css/login.css">
	<script src="../../../../resources/admin/js/jquery-3.4.1.min.js"></script>
</head>

<body>
    <div id="wrap">
        <h1 class="login-logo">
            <img src="../../../../resources/images/img-hana-symbol.png" style="width: 50px;" alt="트래블싱크">
        </h1>
    </div>
    <div class="login-contents">
        <div class="login-aside">
            <p class="login-aside-slogan"><span class="hidden">트래블싱크</span></p>
            <p class="login-aside-notice">이 사이트는 Chrome 브라우저와<br>해상도 1920x1080에 최적화되어 있습니다. </p>
        </div>
        <div class="login-form">
            <h2 class="login-form-title">Admin Login</h2>
            <form action="/admin/login" method="POST">
                <dl class="login-form-input">
                    <dt class="login-text-user">Admin ID</dt>
                    <dd>
                        <div class="item-input login-icon-id">
                            <input type="text" id="USERID" name="username" placeholder="아이디를 입력하세요." required>
                        </div>
                    </dd>
                    <dt class="login-text-user">Password</dt>
                    <dd>
                        <div class="item-input login-icon-pw">
                            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요." required>
                        </div>
                    </dd>
                </dl>
                <!-- <div class="login-form-set">
                    <div class="item-check">
                        <input type="checkbox" name="exCheck1" id="exCheck1-1">
                        <label for="exCheck1-1"><span class="check-ico"></span>아이디 저장</label>
                    </div>
                </div> -->
                <div style="color: red; position: absolute; margin-top: 3px;" id="login_result"></div> 
                <button type="submit" id="login_btn" class="login-form-button">Login</button>
            </form>
        </div>
        <!-- <p class="login-copy-admin">Copyright &copy; KT. all rights reserved.</p> -->
    </div>
</body>
<script>
    $("#login_btn").click(function() {
        var admin = {
            name: "관리자",
            phone: "010-9366-0469",
            email: "admin@admin.com",
            join_date: "2023-09-12T04:17:16Z",
            kakao_img: "http://k.kakaocdn.net/dn/U9FRo/btst0zFhb4P/eh7HxK1ZBHtFqkGqC3CHRK/img_640x640.jpg",
            kakao_id: "3025165876"
        }

        // AJAX 요청
        $.ajax({
            type: "POST",
            url: "/insertKakaoAndPhoneMember",
            data: JSON.stringify(admin),
            contentType: "application/json",
            success : function(data, state, xhr) {
                location.href='/admin/template/list';
            },
            error : function(xhr, data) {
                $("#login_result").text('알 수 없는 에러가 발생했습니다.')
            }
        });
        // val()은 null이 나올 리는 없으나 혹시 몰라 작성
        if (username == null) {
            $("#login_result").text('아이디를 입력하세요.')
            return;
        } else if (password == null) {
            $("#login_result").text('비밀번호를 입력하세요.')
            return;
        }

        // 좌우 공백 제거
        username = username.trim()
        password = password.trim()

        if (username == "") {
            $("#login_result").text('아이디를 입력하세요.')
            return;
        } else if (password == "") {
            $("#login_result").text('비밀번호를 입력하세요.')
            return;
        }
    });
</script>
</html>