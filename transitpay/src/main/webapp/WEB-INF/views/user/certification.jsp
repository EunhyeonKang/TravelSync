    <%@ page import="com.hanacard.transitpay.member.model.dto.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/index.css">
    <link rel="stylesheet" href="../../../resources/css/main2.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background: linear-gradient(137deg, #FFFFFF 0%, #000000 100%);
        }

        .modal-content {
            background-color: #000000c9;
            margin: 15% auto;
            padding: 20px;
            width: 50%;
            height: 560px;
            border-radius: 20px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .login{
            color: #FFFBFB;
            text-align: center;
            display: inline-block;
        }
        .login img{
            width: 150px;
            margin: 0 auto;
        }
        #phone-number, #auth-number{
            width: 70%;
            height: 50px;
            float: left;
            display: flex;
            mix-blend-mode: normal;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            margin: 10px 0 5px 0;
            background: 0;
            border: 0;
            border-bottom: solid 3px #b1b1b1;
            color: white;
         }
        #phone-number::placeholder, #auth-number::placeholder{
            text-align: left;
            color: white;
            background: 0;
        }
        .confirm-button,  #auth-req-button{
            align-items: center;
            justify-content: center;
            width: 25%;
            float: right;
            border: 1px solid #a7a9a9;
            background-color: #a7a9a9;
            mix-blend-mode: normal;
            color: white;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            margin: 10px 0 14px 0;
            color: #010101;
            font-weight: 700;
            padding: 15px 0;
            font-size: 15px;
        }
        .authbox{
            width: 100%;
        }

        .phone-container{
            width: 100%;
            text-align: center;
            margin-top: 30px;
        }
        input::placeholder{
            text-align: center;
        }
        .button-container:hover{
            transform:scale(1.01);
            transition: transform .2s;
        }
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
