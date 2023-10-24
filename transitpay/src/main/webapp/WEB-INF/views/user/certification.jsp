    <%@ page import="com.hanacard.transitpay.member.model.dto.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/index.css">
    <link rel="stylesheet" href="../../../resources/css/main2.css">
    <link rel="stylesheet" href="../../../resources/css/certification.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <style>

    </style>
</head>
<body>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="phone-container">
            <div class="login">
                <h2>[2단계] 휴대폰 인증</h2>
                <p>안전하고 간편하게 로그인하세요.</p>
                <p><c:out value="${member.name}"/>님의 휴대폰 인증</p>
                <img src="../../../resources/images/phone-call.svg" alt="">

                <input type ="tel" id ="phone-number" name="phone" placeholder="전화번호를 입력해주세요">
                <button type ="button" id ="auth-req-button">인증요청</button>
                <p id="ViewTimer"></p>
                <div class="authbox">
                    <input type ="text" id ="auth-number" placeholder="인증번호를 입력해주세요">
                    <button type="button" class="confirm-button" id ="auth-res-button">확인</button>
                </div>
                <%--                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=951e0627da48ee51855b252517b6352d--%>
                <%--&redirect_uri=http://localhost:8080/api/social/login/kakao&response_type=code" class="kakaoa"><img class="kakao_btn" src="../../resources/images/kakaologin.png" width="30"></a>--%>
                <%--                    <a href="https://kauth.kakao.com/oauth/logout?client_id=951e0627da48ee51855b252517b6352d&logout_redirect_uri=http://localhost:8080/logout" class="kakaoa">logout</a>--%>
            </div>

        </div>
    </div>
</div>
</body>
<script>

    // 모달창 열기
    $(document).ready(function() {
        var modal = $("#myModal");
        var btn = $(".button-container");
        var span = $(".close").eq(0);

        modal.css("display", "block");

        span.click(function() {
            modal.css("display", "none");
        });

        $(window).click(function(event) {
            if (event.target === modal[0]) {
                modal.css("display", "none");
            }
        });
    });
    $(document).ready(function() {
        // "인증확인" 버튼 클릭 시 AJAX 요청
        $("#auth-res-button").click(function() {
            var member = {
                name: "<c:out value='${member.name}' />",
                phone: $("#phone-number").val(),
                email: "<c:out value='${member.email}' />",
                join_date: "<c:out value='${member.join_date}' />",
                kakao_img: "<c:out value='${member.kakao_img}' />",
                kakao_id: "<c:out value='${member.kakao_id}' />"
            };

            var modal = $("#myModal");

            // AJAX 요청
            $.ajax({
                type: "POST",
                url: "/insertKakaoAndPhoneMember",
                data: JSON.stringify(member),
                contentType: "application/json",
                success: function(response) {
                    alert(response);
                    location.href = '/';
                },
                error: function(error) {
                    console.error("로그인 실패 : ", error);
                }
            });
        });
    });
</script>

</html>
