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
    <script defer src="../../../resources/js/admin.js"></script>
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
                <div style="color: red; position: absolute; margin-top: 3px;" id="login_result"></div> 
                <button type="submit" id="login_btn" class="login-form-button">Login</button>
        </div>
    </div>
</body>

</html>