<%@ page import="com.hanacard.transitpay.member.model.dto.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/index.css">
    <link rel="stylesheet" href="../../resources/css/main2.css">
    <script defer src="../../resources/js/index.js"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        .login{
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
            border: 1px solid #f9fafc;
            background-color: #ffffff;
            mix-blend-mode: normal;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            margin: 10px 0 5px 0;
        }
        .confirm-button{
            height: 50px;
            width: 25%;
            float: right;
            border: 1px solid #0bb2a2;
            background-color:#0bb2a2;
            mix-blend-mode: normal;
            color: white;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            margin: 10px 0 14px 0;
        }
        .authbox{
            width: 100%;
        }
        #auth-req-button{
            height: 50px;
            width: 25%;
            float: right;
            border: 1px solid #0bb2a2;
            background-color: #0bb2a2;
            mix-blend-mode: normal;
            color: white;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            margin: 10px 0 14px 0;
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
        .main-2 p{
            text-align: right;
            padding-right: 50px;
            font-weight: normal;
            color: #9E9E9E;
        }

        .loginbox{
            height: 240px;
            margin-top: 20px;
        }

        .loginafter {
            width: 80%;
            height: 160px;
            background-color: white;
            margin: 0 auto;
            border-radius: 10px;
            box-shadow: 1px 2px 12px 0px rgba(0, 0, 0, 0.25);
            padding-top: 30px;
        }
        #hanaloginbox  .logout{
            float: right;
            margin-right: 50px;
            padding-top: 20px;
            font-weight: normal;
            color: #9E9E9E;
        }
        .hanabox{
            width: 80%;
            margin: 0 auto;
        }

        .hana-1{
            display: flex;
            width: 100%;
            float: left;
            height: 20px;
            color: #8b8b8b;
            font-weight: 700;
            align-items: center;
        }

        .hanamoney-1{
            width: 100%;
            display: flex;
            width: 100%;
            display: flex;
            height: 70px;
            font-weight: 700;
            padding-top: 10px;
            font-size: 40px;
            align-items: center;
            color: #000000;
        }

        .hanawon{
            float: left;
            display: flex;
        }
        .hanawon-1{
            float: left;
            display: flex;
            margin: 10px;
        }

        .hana-1 img{
            width: 30px;
            margin-right: 5px;
        }
        .seemore > .seemore-1{
            color: #0ec1b1;
            float: right;
            align-items: center;
            width: 100%;
            float: right;
            text-align: right;
            margin: 0;
        }
        .notification{
            border-radius: 50%;
            background: #ff0049;
            width: 17px;
            height: 17px;
            padding: 3px 2px 1px 2px;
            color: white;
            display: block;
            bottom: 10px;
            float: right;
            line-height: 18px;
            font-weight: 800;
            position: relative;
            font-size: 15px;
        }
        .t1{
            color: #ff6400;
        }
</style>
</head>
<body>
    <div class="main-1">
        <header>
            <div class="nav">
                <a class="title" href="/">
                    <img src="../../resources/images/img-hana-symbol.png" style="width: 40px">
                    <p>하나 트래블싱크</p>
                </a>
                <ul class="menu">
                    <li><a href="travel">TOP 여행지</a></li>
                    <li><a href="mypage">내여행</a></li>
                    <li><a href="group">모임통장</a></li>
                    <li><a href="login">정산</a></li>
                </ul>
                <i class="totalmenu"></i>
            </div>
        </header>
        <div class="navbar-fixed">
            <div class="title"><a href="/">TRAVELSYNC</a></div>
            <ul id="menu">
                <li><a href="travelplans">TOP 여행지</a></li>
                <li><a href="mypage">내예약</a></li>
                <li><a href="login">로그인</a></li>
            </ul>
        </div>
        <hr class="navhr">
        <div class="box-container">
            <div class="main">
                <div class="mainBox1">
                    <div class="leftBox">
                        <div class="leftContent">
                            하나 트래블싱크
                        </div>
                        <div class="leftContent">
                            여행 모임 통장
                        </div>
                        <div class="leftContent-2">
                            실시간 일정, 함께하는 여행이 더 쉬워집니다
                        </div>
                        <div class="leftContent-2">
                            모임은 FUN하게 통장은 편하게
                        </div>
                        <button class="mytravel" onClick="location.href='travel'">여행일정 짜러가기</button>
                    </div>
                    <div class="rightContent">
                        <div class="cardContainer">
<%--                            <img class="tvlcard2" src="../../resources/images/tvl_1.png">--%>
<%--                            <img class="tvlcard1" src="../../resources/images/tvl_2.png">--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-2">
                    <ul class="hanamenu">
                        <li><a href="mypage" class="hanamenu-a">마이페이지</a></li>
                        <li><a href="travel" class="hanamenu-a">여행계획</a></li>
                        <li><a href="hanamoney" class="hanamenu-a">알림<span class="notification">1</span></a>
                        </li>
                    </ul>
                    <hr>
                    <div class="loginbox">
                        <div id="hanaloginbox">
                            <c:choose>
                                <c:when test="${sessionScope.member != null}">
                                <div class="loginafter">
                                    <div class="hanabox">

                                        <div class="hana-1">
                                            <img src="../../resources/images/tvl_main_effect02.png">
                                            하나트래블싱크
                                        </div>
                                        <div class="hanamoney-1">
                                            <div class="hanawon"></div>
                                            <div class="hanawon-1"> > </div>
                                        </div>
                                        <div class="seemore">
                                            <a class="seemore-1" href="mypage">연결 계좌</a>
                                        </div>
                                    </div>
                                </div>
                                <a class="logout" href="/logoutMember">로그아웃</a>
                                    <script>
                                        $(document).ready(function() {
                                            var memberId = "${sessionScope.member.member_id}";
                                            $.ajax({
                                                type: "POST",
                                                url: "/selectAmountMember",
                                                data: { memberId : memberId },
                                                success: function(response) {
                                                    const hanawon = document.querySelector('.hanawon');
                                                    hanawon.textContent = response;
                                                },
                                                error: function(error) {
                                                }
                                            });
                                        });
                                    </script>
                                </c:when>
                                <c:otherwise>
                                    <div class="hanamenu-1">
                                        <div class="phonebox">
                                            <img src="../../resources/images/new_2204_my_login_img001.png" alt="">
                                            <span class="phoneauth">핸드폰 본인인증으로 로그인해주세요</span>
                                        </div>
                                        <button class="button-container">
                                            <span class="login-button">로그인</span>
                                        </button>
                                    </div>
                                    <p>회원가입</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <hr>
                    <ul class="hanamenu">
                        <li>
                            <a href="mypage" class="hanamenu-a"><img src="../../resources/images/new_2204_my_login_ico001.png" alt=""><span class="hanameneSpan">계좌관리</span></a>
                        </li>
                        <li><a href="group" class="hanamenu-a"><img src="../../resources/images/new_2204_my_login_ico004.png" alt=""><span class="hanameneSpan">모임통장</span></a></li>
                        <li><a href="travel" class="hanamenu-a"><img src="../../resources/images/new_2204_my_login_ico003.png" alt=""><span class="hanameneSpan">여행관리</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="phone-container">
                <div class="login">
                    <h2>로그인</h2>
                    <p>안전하고 간편하게 로그인하세요.</p>
                    <img src="../../resources/images/phone-call.svg" alt="">

                    <input type ="tel" id ="phone-number" name="phone" placeholder="전화번호를 입력해주세요">
                    <button type ="button" id ="auth-req-button">인증요청</button>
                    <p id="ViewTimer"></p>
                    <div class="authbox">
                        <input type ="text" id ="auth-number" placeholder="인증번호를 입력해주세요">
                        <button type="button" class="confirm-button" id ="auth-res-button">확인</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <%@ include file="main2.jsp" %>
</body>
<script>
    /*
    // 핸드폰 인증
    const authReqButton= document.querySelector('#auth-req-button');
    const authResButton= document.querySelector('#auth-res-button');

    var authCode="";

    authReqButton.onclick=()=>{
        const phoneNumberObj= document.querySelector('#phone-number');
        let phoneNumber = phoneNumberObj.value;
        $.ajax({
            type:"get",
            url:"/checkPhoneLogin",
            data:{
                "phoneNumber" : phoneNumber
            },
            dataType:"text",
            success:function(data){
                authCode= data;
            },error:function(data){
                alert ('실패');
            }
        })
    }
    authResButton.onclick=()=>{
        const authnumberobj=document.querySelector('#auth-number');
        let authNumber=authnumberobj.value;
        if(authNumber==authCode){
            alert("인증성공");
            location.href='signup';
        }else{
            alert("인증실패");
        }
    }

*/


    $(document).ready(function() {
        // "인증확인" 버튼 클릭 시 AJAX 요청
        $("#auth-res-button").click(function() {
            var phoneNumber = $("#phone-number").val();
            var modal = $("#myModal");
            //var cleanedPhoneNumber = phoneNumber.replace(/-/g, '');

            // AJAX 요청
            $.ajax({
                type: "POST",
                url: "/selectOneMember", // 서버 측 엔드포인트 URL
                data: JSON.stringify({ phoneNumber: phoneNumber }), // JSON 형태로 데이터 전송
                contentType: "application/json", // 컨텐츠 타입을 JSON으로 설정
                success: function(response) {
                    // response 변수에 서버로부터 받은 응답이 들어있습니다.
                    alert("로그인 성공")
                    // modal.css("display", "none");
                    location.href='/'
                },
                error: function(error) {
                    // 요청 실패 시 처리
                    console.error("인증번호 요청 실패:", error);
                }
            });
        });
    });

</script>

</html>
