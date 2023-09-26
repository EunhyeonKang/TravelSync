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
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
            border: 0;
            background: 0;
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
            width: 40px;
            margin-right: 5px;
            border-radius: 50px;
        }
        .seemore > .seemore-1{
            color: #0ec1b1;
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
        .kakaoa .kakao_btn{
            width: 40px;
            margin: 10px;
            float: left;
        }



        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 20% auto;
            padding: 20px;
            width: 400px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            text-align: center;
            position: relative;
            border-radius: 20px;
        }


        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            cursor: pointer;
        }
        .selecloc-1, .selecloc-2{
            box-sizing: border-box;
            height: 50px;
            border: 1px solid #0073681c;
            border-radius: 26px;
            text-align: center;
            margin: 0 auto;
            margin-right: 5px;
            margin-left: 5px;
            color: white;
            font-size: 18px;
            font-weight: 700;
            box-shadow: rgba(0, 0, 0, 0.18) 0px 13px 24px 0px, rgba(0, 0, 0, 0.08) 0px -6px 9px 0px inset;
        }
        .selecloc-1{
            background: #0bb2a2;
        }
        .selecloc-2{
            background: #d91717c4;
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
                    <c:choose>
                        <c:when test="${sessionScope.member != null}">
                            <li><a href="/categoryTravel">여행정보 보기</a></li>
                            <li><a href="/group">모임통장 개설</a></li>
                            <li><a href="/travel">여행계획</a></li>
                            <li><a href="/travel">게시판</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/categoryTravel">여행정보 보기</a></li>
                            <li><a href="/group">모임통장 개설</a></li>
                            <li><a href="/travel">여행계획</a></li>
                            <li><a href="/travel">게시판</a></li>
                            <li><a href="/mypage">마이페이지</a></li>
                        </c:otherwise>
                    </c:choose>

                </ul>
                <i class="totalmenu"></i>
            </div>
        </header>
        <div class="navbar-fixed">
            <div class="title"><a href="/">TRAVELSYNC</a></div>
            <ul id="menu">
                <li><a href="top3Travel">TOP 여행지</a></li>
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
                                            <img src="${sessionScope.member.kakao_img}">
                                            ${sessionScope.member.name}님 모임통장
                                        </div>
                                        <div class="hanamoney-1">
                                            <div class="hanawon"></div>
                                            <div class="hanawon-1"></div>
                                        </div>
                                        <div class="seemore">
                                            <a class="seemore-1" href="mypage">연결 계좌</a>
                                        </div>
                                    </div>
                                </div>
                                <button class="logout" onclick="performLogout();">로그아웃</button>
                                    <script>
                                        $(document).ready(function() {

                                        })
                                    </script>
                                </c:when>
                                <c:otherwise>
                                    <div class="hanamenu-1">
                                        <div class="phonebox">
                                            <img src="../../resources/images/new_2204_my_login_img001.png" alt="">
                                            <span class="phoneauth">핸드폰 본인인증으로 로그인해주세요</span>
                                        </div>
                                        <button class="button-container" onclick="performLogin();">
                                            <span class="login-button">간편 로그인</span>
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

                        <li><a href="/mygroup/${groupId}" class="hanamenu-a"><img src="../../resources/images/new_2204_my_login_ico004.png" alt=""><span class="hanameneSpan">모임통장</span></a></li>
                        <li><a href="travel" class="hanamenu-a"><img src="../../resources/images/new_2204_my_login_ico003.png" alt=""><span class="hanameneSpan">여행관리</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>이용 선택</h2>
            <button class="selecloc-1" onclick="location.href='/mypage/'">인증서로 한번에 계좌연동</button>
            <button class="selecloc-2" onclick="location.href='/mygroup/'+groupSid;">내 모임통장으로 가기</button>
        </div>
    </div>
    <%@ include file="main2.jsp" %>
</body>
<script>
    // Get the modal and button elements
    const modal = document.getElementById('myModal');
    const openModalBtn = document.getElementById('openModalBtn');
    const closeModalBtn = document.querySelector('.close');

    // Function to open the modal
    function openModal() {
        modal.style.display = 'block';
    }

    // Function to close the modal
    function closeModal() {
        modal.style.display = 'none';
    }

    closeModalBtn.addEventListener('click', closeModal);
    window.addEventListener('click', (e) => {
        if (e.target === modal) {
            closeModal();
        }
    });


    const groupSid ="${groupId}";
    var memberId = "${sessionScope.member.member_id}";
    var phone = "${sessionScope.member.phone}";

    if(groupSid!="" && memberId!=""){
        //계좌 존재 여부
        $.ajax({
            url:'/selectBackAccount',
            method: "POST",
            success: function(response) {
                console.log(response)
                if(response!=""){
                    //계좌가 있음, 모임통장 접속
                }else{
                    //계좌가 없음
                    var seemore =  document.querySelector('.seemore-1');
                    seemore.textContent = '계좌개설';
                    seemore.href='/account'
                    alert("계좌를 개설하세요!");
                    // location.href='/account';
                    // openModal();
                }
            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });
        //그룹에 초대된 회원
        //1.계좌연동 여부(acocunt)
        //2.모임통장 가입동의 여부
        //3.초대된 모임통장 접속
    } else if(!(groupSid!="" && memberId!="")){

        //그룹에 초대되지 않은 비회원
        //1.로그인
        //2.모임장이될 수 있음
    }

    function performLogout() {
        // Kakao 로그아웃 URL 설정
        var kakaoLogoutUrl = "https://kauth.kakao.com/oauth/logout?client_id=951e0627da48ee51855b252517b6352d&logout_redirect_uri=http://localhost:8080/logout";
        // Kakao 로그아웃 URL로 리다이렉트
        window.location.href = kakaoLogoutUrl;
    };
    function performLogin() {
        // 새로운 URL로 이동
        window.location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=951e0627da48ee51855b252517b6352d&redirect_uri=http://localhost:8080/api/social/login/kakao&response_type=code';
    };


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
    async function selectGroupAccount(groupIdList){
        var memberId = "${sessionScope.member.member_id}";
        if(memberId!="") {
            //모임통장 여러개 ,,, 이건 나중에 수정...
            groupIdList.forEach(function (val) {
                var groupId = val.group_id;
                $.ajax({
                    type: "POST",
                    url: "/selectUseTypeAccount",
                    data: {memberId: memberId, groupId: groupId},
                    success: function (response) {

                        // if(response!=null){
                        //     location.href='/mygroup/'+response.group_id;
                        // }else{
                        //     location.href='/mygroup';
                        // }
                    },
                    error: function (error) {
                        console.error("그룹 계정 업데이트 중 오류 발생: " + error);
                    }
                });
            })
            let result = 0;

            for (let index = 0; index < groupIdList.length; index++) {
                const groupId = groupIdList[index].group_id;

                try {
                    const response = await $.ajax({
                        url: '/selectGroupAccountInfo',
                        data: { memberId: memberId, groupId: groupId },
                        method: "POST",
                    });
                    result += response.g_balance;
                } catch (error) {
                    console.error("그룹 계정 정보 가져오기 중 오류 발생: " + error);
                }
            }

            const hanawon = document.querySelector('.hanawon');
            if (result !== -1) {
                hanawon.textContent = result.toLocaleString() + '원';
            } else {
                hanawon.textContent = '모임통장 개설';
            }

        }
    }
    // 페이지가 로드되면 애니메이션 및 메뉴바 처리 시작
    window.onload = function() {
        if("${sessionScope.member}"!="") {
            $.ajax({
                type: "POST",
                url: "/JoinGroupAccountAndMemberAccount",
                success: function (response) {
                    if (response != "") {
                        selectGroupAccount(response);
                        //2. 모임통장이 있으면 모임통장 경로로 이동
                    } else {
                        //1. 모임통장 개설하러가기

                    }
                },
                error: function (error) {
                    // 오류 처리
                }
            })
        }

        var groupId = "${groupId}";
        if("${sessionScope.groupAccount.group_id}"!="" && groupId !=""){
            $.ajax({
                type: "POST",
                url: "/selectGroupMember",
                data: {groupId: groupId},
                success: function (response) {
                    console.log(response + " selectGroupMember");
                },
                error: function (error) {
                }
            });
        }
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
            contents[i].style.padding = "3px";
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
        // handleScroll();
        // tid = setInterval(msg_time, 1000);
    };



    // 타이머
    /*
    var SetTime = 120; // 최초 설정 시간(기본 : 초)

    function msg_time() {
        var targetElement = document.getElementById('ViewTimer');

        if (!targetElement) {
            console.error("Element with ID 'ViewTimer' not found.");
            return;
        }

        m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";
        var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
        targetElement.innerHTML = msg;

        SetTime--;

        if (SetTime < 0) {
            clearInterval(setInterval(msg_time, 1000));
            //alrt('종료')
        }
    }*/



</script>

</html>
