<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/index.css">
    <script defer src="../../resources/js/index.js"></script>
    <style>
        .navbar-fixed {
            display: none;
        }
        @font-face {
            font-family: "hana";
            src: url("../../resources/font/Hana2-Bold.otf") format('opentype');
        }
        .title p{
            font-family: hana;
            font-size: smaller;

        }
        .title{
            display: flex;
            align-items: center;
        }

    </style>
</head>
<body>
<div class="main">
    <header>
        <div class="nav">
            <a class="title" href="/">

                <img src="../../resources/images/img-hana-symbol.png" style="width: 40px">
                <p>하나 트렌지페이</p>
            </a>
            <ul class="menu">
                <li><a href="travel">TOP 여행지</a></li>
                <li><a href="mypage">내예약</a></li>
                <li><a href="hanamoney">하나머니</a></li>
                <li><a href="login">로그인</a></li>
            </ul>
            <i class="fab fa-twitter-square"></i>
            <i class="fas fa-bars"></i>
        </div>
    </header>
    <div class="navbar-fixed">
        <div class="title"><a href="/">TRANSITPAY</a></div>
        <ul id="menu">
            <li><a href="travelplans">TOP 여행지</a></li>
            <li><a href="mypage">내예약</a></li>
            <li><a href="login">로그인</a></li>
        </ul>
    </div>
    <div class="mainBox1">
        <div class="leftBox">
            <div class="leftContent">
                나를 아는 여행앱
            </div>
            <div class="leftContent">
                하나트렌지페이
            </div>
            <div class="leftContent-2">
                예약부터 일정까지 여행이 더 쉬워집니다
            </div>

            <button class="mytravel" onClick="location.href='travel'">MY 여행지</button>

        </div>
        <div class="rightContent">
            <div class="cardContainer">
                <img class="tvlcard1" src="../../resources/images/tvl_1.png">
                <img class="tvlcard2" src="../../resources/images/tvl_2.png">
            </div>
        </div>
    </div>
</div>
<%@ include file="main2.jsp" %>
</body>
<script>
    // 페이지가 로드되면 애니메이션 및 메뉴바 처리 시작
    window.onload = function() {
        // rightContent 요소를 찾습니다.
        const rightContent = document.querySelector('.rightContent');

        // rightContent 요소에 show 클래스를 추가하여 천천히 나타나는 애니메이션을 시작합니다.
        rightContent.classList.add('show');
        // 왼쪽 컨텐츠들에 대한 애니메이션 적용
        var contents = document.querySelectorAll('.leftContent, .leftContent-2, .mytravel');
        var animationDelay = 150; // 애니메이션 간격 (0.5초)

        for (var i = 0; i < contents.length; i++) {
            contents[i].style.transition = "left 1.0s cubic-bezier(.39, .575, .565, 1.000)";
            contents[i].style.left = "0";
            contents[i].style.padding = "0px";
            contents[i].style.fontWeight = 'bolder';
            contents[i].style.opacity = "1";
            contents[i].style.transitionDelay = animationDelay * i + "ms";
        }

        // 스크롤 이벤트를 감지하여 메뉴바를 추가/제거하는 함수
        var navbarFixed = document.querySelector('.navbar-fixed');
        function handleScroll() {
            if (window.pageYOffset >= 600) {
                navbarFixed.style.display = 'flex'; // 메뉴바를 보이도록 설정
            } else {
                navbarFixed.style.display = 'none'; // 메뉴바를 숨기도록 설정
            }
        }

        // 스크롤 이벤트를 바인딩
        window.addEventListener('scroll', handleScroll);

        // 페이지 로딩 시 한 번 실행하여 초기 상태를 설정
        handleScroll();

    };
</script>

</html>
