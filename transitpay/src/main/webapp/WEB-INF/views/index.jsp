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
                            <li><a href="/categoryTravel">여행정보</a></li>
                            <li><a href="/group">모임통장</a></li>
                            <li><a href="/travel">여행계획</a></li>
                            <li><a href="/mypage">마이페이지</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/categoryTravel">여행정보 보기</a></li>
                            <li><a href="/group">모임통장 개설</a></li>
                            <li><a href="/travel">여행계획</a></li>
                        </c:otherwise>
                    </c:choose>

                </ul>
                <i class="totalmenu"></i>
            </div>
        </header>
        <div class="navbar-fixed">
            <div class="title"><a href="/">TRAVELSYNC</a></div>
            <ul id="menu">
                <li><a href="top3Travel">여행정보</a></li>
                <li><a href="mypage">모임통장</a></li>
                <li><a href="login">여행계획</a></li>
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
                        <li><a class="hanamenu-a" id="mypage">마이페이지</a></li>
                        <li><a href="travel" class="hanamenu-a">여행계획</a></li>
                        <li><a class="hanamenu-a" id="noti">알림</a>
                            <div id="notificationDropdown" class="dropdown-content">
                                <!-- 알림 내용이 여기에 추가됩니다. -->
                            </div>
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
                                            <c:choose>
                                                <c:when test="${sessionScope.member.kakao_id == 0}">
                                                    <!-- 조건이 true일 때 출력할 내용 -->
                                                    <img src="../../resources/upload/profile/${sessionScope.member.kakao_img}">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${sessionScope.member.kakao_img}">
                                                </c:otherwise>
                                            </c:choose>
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
                             </c:when>
                                <c:otherwise>
                                    <div class="hanamenu-1">
                                        <div class="phonebox">
                                            <img src="../../resources/images/new_2204_my_login_img001.png" alt="">
                                            <span class="phoneauth">본인인증으로 로그인해주세요</span>
                                        </div>
                                        <button class="button-container" onclick="performLogin();">
                                            <span class="login-button">간편 로그인</span>
                                        </button>
                                    </div>
                                    <p><span class="signup">회원가입</span> | <span class="login">로그인</span></p>
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
    $('#noti').click(function(){
        if(${sessionScope.member==null}) {
            alert("로그인하세요");
        }else{
            location.href='/calTravel';
        }
    })
    $('#mypage').click(function(){
        if(${sessionScope.member==null}) {
            alert("로그인하세요");
        }else{
            location.href='/mypage';
        }
    })

    if(${sessionScope.member==null}) {
        var signup = document.querySelector('.signup');
        signup.addEventListener('click', (e) => {
            location.href = '/join';
        })
        var login = document.querySelector('.login');
        login.addEventListener('click', (e) => {
            location.href = '/login';
        })
    }


    const groupSid ="${groupId}";
    var memberId = "${sessionScope.member.member_id}";
    var phone = "${sessionScope.member.phone}";

    if(groupSid!="" && memberId!=""){
        //계좌 존재 여부
        $.ajax({
            url:'/selectBackAccount',
            method: "POST",
            success: function(response) {
                if(response!=""){
                }else{
                    var seemore =  document.querySelector('.seemore-1');
                    seemore.textContent = '계좌연동';
                    seemore.href='/account'

                    $.ajax({
                        type: "POST",
                        url: "/insertHanaAccount",
                        success: function (response) {

                        },
                        error: function (error) {
                            console.error(error);
                        },
                    });
                }
            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });

    } else if(!(groupSid!="" && memberId!="")){

    }


    async function selectGroupAccount(groupIdList){
        var memberId = "${sessionScope.member.member_id}";
        if(memberId!="") {
            //모임통장 여러개 ,,, 이건 나중에 수정...
            groupIdList.forEach(function (val) {var isScrolling = false;

                function startScroll() {
                    isScrolling = true;
                }

                function endScroll() {
                    isScrolling = false;
                }
                var groupId = val.group_id;
                $.ajax({
                    type: "POST",
                    url: "/selectUseTypeAccount",
                    data: {memberId: memberId, groupId: groupId},
                    success: function (response) {

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
    window.onload = function() {
        if("${sessionScope.member}"!="") {
            $.ajax({
                type: "POST",
                url: "/JoinGroupAccountAndMemberAccount",
                success: function (response) {
                    if (response != "") {
                        selectGroupAccount(response);
                    } else {
                        const hanawon = document.querySelector('.hanawon');
                        hanawon.textContent = '0원';
                    }
                },
                error: function (error) {
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
                },
                error: function (error) {
                }
            });
        }

        const rightContent = document.querySelector('.rightContent');
        rightContent.classList.add('show');
        var contents = document.querySelectorAll('.leftContent, .leftContent-2, .mytravel');
        var animationDelay = 150;

        for (var i = 0; i < contents.length; i++) {
            contents[i].style.transition = "left 1.0s cubic-bezier(.39, .575, .565, 1.000)";
            contents[i].style.left = "0";
            contents[i].style.padding = "3px";
            contents[i].style.fontWeight = 'bolder';
            contents[i].style.opacity = "1";
            contents[i].style.transitionDelay = animationDelay * i + "ms";
        }

        var navbarFixed = document.querySelector('.navbar-fixed');
        function handleScroll() {
            if (window.pageYOffset >= 600) {
                navbarFixed.style.display = 'flex'; // 메뉴바를 보이도록 설정
            } else {
                navbarFixed.style.display = 'none'; // 메뉴바를 숨기도록 설정
            }
        }
        window.addEventListener('scroll', handleScroll);
    };
</script>
</html>
