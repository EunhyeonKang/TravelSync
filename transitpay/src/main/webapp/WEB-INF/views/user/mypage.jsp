<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/conacoount.css">
    <link rel="stylesheet" href="../../../resources/css/mypage.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script defer src="../../resources/js/mypage.js"></script>
</head>
<style>

    .backgroundbox{
        width: 100%;
        height: 300px;
        background: linear-gradient(156deg, #0c96a8 0%, rgb(165 225 234 / 87%) 52.08%, #159db0 100%);
        position: relative;
    }
    .backgroundbox .topbox{
        width: 1400px;
        height: 700px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translateX(-50%);
        margin-top: -50px;
        background: white;
    }
    .mypage-user{
        padding: 30px;
        margin: 5px;
        height: 950px;
        border-right: 1px solid #d8d8d8;
    }
    .user-detail{
        border: 1px solid #d8d8d8;
        padding: 30px;
        border-radius: 10px;
        margin: 5px;
        height: 300px;
        width: 150px;
        background: #fcfcfc;
    }
    .accountbox{
        margin-left: 30px;
    }
    h2{
        margin:10px;
    }
    .account-box-1{
        display: flex;
    }
    .chartbox{
        width: 250px;
    }
    .auto-charge-box{
        float: left;
        padding-left: 30px;
        border-left: 1px solid #d8d8d8;
        margin-left: 30px;
        height: 220px;
    }
    .travelbox{
        padding-bottom: 0;
        padding-right: 0;
    }
    .travelsavebox{
        padding: 65px;
        color: #50575d;
        text-align: center;
        font-size: 20px;
        font-weight: 700;
    }
    .saveboxcnt{
        margin-top: 15px;
    }
    .chargeboxbtn{
        display: flex;
    }
    .auto-charge-box-1{
        margin-top: 10px;
    }
    .mypage-img{
        width: 100px;
        height: 110px;
        border-radius: 50%;
    }
    .mypage-box{
        text-align: center;
    }
    .mypage_logout{
        float: right;
    }
    .slider-2 {
        height:400px;
        position:relative;
    }

    .slider-2 .slides > div {
        position:absolute;
        top:0;
        left:0;
        width:100%;
        height:200px;
        background-position:center;
        /* 이미지를 최대한 안짤리게 한다. */
        background-size:cover;
        /* 배경 반복 금지 */
        background-repeat:no-repeat;
        opacity:0;
        transition: opacity 0.5s;
    }

    .slider-2 .slides > div.active {
        opacity:1;
        z-index: 1;
    }

    @media ( max-width:700px ) {
        .slider-2 {
            height:300px;
        }
    }

    .slider-2 .page-nav {
        position:absolute;
        width:100%;
        text-align:center;
        bottom:0;
        left:0;
    }

    .slider-2 .page-nav > div {
        display:inline-block;
        width:15px;
        height:15px;
        background-color:rgba(255,255,255,0.5);
        border-radius:2px;
        cursor:pointer;
    }

    .slider-2 .page-nav > div.active {
        background-color:rgba(255,255,255,1);
    }

    .slider-2>.side-btns>div{
        position: absolute;
        top: 50px;
        width: 30%;
        height: 100px;
        cursor: pointer;
        z-index: 10;
    }

    .slider-2>.side-btns>div>span:active{
        transform:translatey(-40%);
    }
    .slider-2>.side-btns>div:last-child{
        left:auto;
        right:0;
    }

    .slider-2>.side-btns>div>span{
        position: absolute;
        top: 50%;
        transform: translatey(-50%);
        left: inherit;
        right: inherit;
        width: 70px;
        height: 70px;
        background-color: rgb(255 255 255 / 12%);
        border-radius: 100%;
        margin: 0 10px;
    }
    .slider-2>.side-btns>div>span > i{
        position:absolute;
        top:50%;
        left:50%;
        font-size:3rem;
        color:rgba(0,0,0,0.4);
        transform:translateX(-70%) translateY(-50%);
    }

    .slider-2>.side-btns>div:last-child>span > i {
        transform:translateX(-20%) translateY(-50%);
    }

</style>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
<%--    <div class="traveltitle">--%>
<%--        마이페이지<hr/></div>--%>
    <div class="backgroundbox">
        <div class="topbox">
            <div class="contents">
                <div class="contents-1">
                    <div class="accountbox">
                        <div class="mypage-user">
                            <div class="user-detail">
                                <div class="mypage-box">
                                    <img class="mypage-img" src="${sessionScope.member.kakao_img}">
                                    <p>${sessionScope.member.name}님 환영합니다</p>
                                </div>
                                <div class="mypage_logout">로그아웃</div>
                            </div>
                        </div>
                    </div>
                    <div class="accountbox">
                        <h2>여행 관리</h2>
                        <div class="travelbox">
                            <div class="travelbox-1">
                                <div>
                                    <div>
                                        <div class="travelsavebox">
                                            <div>저장된 여행</div>
                                            <div class="saveboxcnt"><a href="/saveTravel">2개</a></div>
                                        </div>
                                    </div>
                                    <button>여행 찜🩷</button>
                                </div>
                            </div>
                            <div class="travelbox-2">
                                <div>
                                    <div>
                                        <div class="travelsavebox">
                                            <div>정산할 여행</div>
                                            <div class="saveboxcnt"><a href="">1개</a></div>
                                        </div>
                                    </div>
                                    <button>정산알림🛎</button>
                                </div>
                            </div>
                            <div class="travelbox-3">
                                <div class="chartbox">
                                    <canvas id="myChart"></canvas>
                                </div>
                                <div>
                                    <button>자동이체💰</button>
                                </div>
                            </div>

                        </div>
                        <h2>계좌 관리</h2>
                        <div class="account-box-1">
                            <div class="account">
                                <div class="account-details">
                                    <a href="/accountDetail">
                                        <button class="account-button">연결계좌</button>
                                    </a>
                                    <div class="bank"></div>
                                    <div class="account-info">
                                        <span class="account-number" name="account_num"></span>
                                        <input type="hidden" name="accountId" value="">
                                        <button class="change-account" id="change-account">연결계좌 변경</button>
                                    </div>
                                </div>
                            </div>
                            <div class="account">
                                <div class="account2">
                                    <div class="new-account-details">

                                        <div class="slider-2">
                                            <div class="side-btns">
                                                <div><span><i class="fas fa-caret-left"></i></span></div>
                                                <div><span><i class="fas fa-caret-right"></i></span></div>
                                            </div>
                                            <div class="slides">
                                                <div class="slide2-1 active">
                                                    <%--                                                <button class="account-button" onclick="location.href='/mygroup/${groupAccount.group_id}'">모임통장</button>--%>
                                                    <%--                                                <div class="bank">${groupAccount.group_name}</div>--%>
                                                    <%--                                                <div class="account-info">--%>
                                                    <%--                                                    <span class="account-number">${groupAccount.group_account}</span>--%>
                                                    <%--                                                    <input type="hidden" name="accountId" value="">--%>
                                                    <%--                                                    <button class="change-account" onclick="location.href='/groupAccountDetail'">모임통장 내역</button>--%>
                                                    <%--                                                </div>--%>
                                                </div>
                                                <div class="slide2-1"></div>
                                                <div class="slide2-1"></div>
                                            </div>

                                            <div class="page-nav">
                                                <div class="active"></div>
                                                <div></div>
                                                <div></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <h2>모임 관리</h2>
                        <div class="card-1">
                            <div class="account2">
                                <div></div>
                                <div class="auto-charge-box">
                                    <div class="auto-charge-box-1">
                                        <div class="auto-charge">
                                            <span class="charge-info">회비 및 정산 알림</span>
                                        </div>
                                        <div class="auto-charge2">
                                            <div class="chargebtn">
                                                <button class="charge-save-button">내역</button>
                                            </div>
                                            <div class="chargebtn">
                                                <button class="charge-save-button">탈퇴</button>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="auto-charge-box-1">
                                        <div class="auto-charge">
                                            <span class="charge-info">회비 및 정산 알림</span>
                                        </div>
                                        <div class="auto-charge2">
                                            <div class="chargebtn">
                                                <button class="charge-save-button">내역</button>
                                            </div>
                                            <div class="chargebtn">
                                                <button class="charge-save-button">탈퇴</button>
                                            </div>

                                        </div>
                                    </div>
<%--                                    <div class="auto-charge">--%>
<%--                                        <span class="charge-info">모임통장 알림</span>--%>
<%--                                        <button class="charge-status">ON</button>--%>
<%--                                    </div>--%>

                                </div>
                            </div>
                            <div class="notificationbox">
                                <div class="notification">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="accountModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="account-container">
                <div class="account-hana">
                    <h3>트래블싱크</h3>
                    <h2>연결계좌 정보예요</h2>
                    <p>주계좌를 변경할 수 있습니다.</p>
                    <div>
                        <div id="searchForm" action="/controller/board/list" method="get">
                            <select name="type" class="selecttype" id="selecttype">
                            </select>
                            <input type="text" name="accountNum" value="">
                            <input type="hidden" name="amount" value="">
                            <button type="button" class="account-change-btn" id ="auth-res-button">연결계좌 변경</button>
                        </div>
                    </div>
                    <div class="account-total">
                        <div class="openbanking">
                            하나카드 오픈뱅킹
                        </div>
                        <button class="selectbtn">
                            계좌한번에 조회하기
                        </button>
                    </div>
                    <div class="acc-box">
                        <div class="add-acc-box">
                            <h3>하나트렌지페이</h3>
                            <h2>계좌가 없으신가요?</h2>
                            <a href="">계좌개설하기</a>
                            <img src="../../../resources/images/account.png">
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
<%--    <%@ include file="../include/footer.jsp" %>--%>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<script>
    <%--alert("${sessionScope.groupAccountDetail}")--%>
    if ("${sessionScope.member}" !== "") {
        var memberId = "${sessionScope.member.member_id}";
        $.ajax({
            type: "POST",
            url: "/JoinGroupAccountAndMemberAccount",
            success: function (response) {
                if (response.length > 0) {
                    for (let index = 0; index < response.length; index++) {
                        const groupId = response[index].group_id;
                        $.ajax({
                            type: "POST",
                            url: "/selectGroupAccountInfo",
                            data: { memberId: memberId, groupId: groupId },
                            success: function (groupResponse) {
                                var slide2 = document.querySelector('.slides .slide2-1:nth-child('+(index+1)+')');
                                var accountGroup = document.createElement('div');
                                accountGroup.className='account-group';
                                if (groupResponse !== null) {
                                    var groupAccountButton = document.createElement("button");
                                    groupAccountButton.classList.add("account-button");
                                    groupAccountButton.textContent = "모임통장";
                                    groupAccountButton.onclick = function() {
                                        location.href = "/mygroup/" + groupResponse.group_id;
                                    };

                                    var groupAccountBankDiv = document.createElement("div");
                                    groupAccountBankDiv.classList.add("bank");
                                    groupAccountBankDiv.textContent = groupResponse.group_name;

                                    var groupAccountInfoDiv = document.createElement("div");
                                    groupAccountInfoDiv.classList.add("account-info");

                                    var groupAccountInfoSpan = document.createElement("span");
                                    groupAccountInfoSpan.classList.add("account-number");
                                    groupAccountInfoSpan.textContent = groupResponse.group_account;

                                    var groupAccountInfoInput = document.createElement("input");
                                    groupAccountInfoInput.type = "hidden";
                                    groupAccountInfoInput.name = "accountId";
                                    groupAccountInfoInput.value = "";

                                    var groupAccountInfoButton = document.createElement("button");
                                    groupAccountInfoButton.classList.add("change-account");
                                    groupAccountInfoButton.textContent = "모임통장 내역";
                                    groupAccountInfoButton.onclick = function() {
                                        location.href = "/groupAccountDetail";
                                    };

                                    // Append elements to the parent container (slide2)
                                    groupAccountInfoDiv.appendChild(groupAccountInfoSpan);
                                    groupAccountInfoDiv.appendChild(groupAccountInfoInput);
                                    groupAccountInfoDiv.appendChild(groupAccountInfoButton);

                                    accountGroup.appendChild(groupAccountButton);
                                    accountGroup.appendChild(groupAccountBankDiv);
                                    accountGroup.appendChild(groupAccountInfoDiv);
                                    slide2.appendChild(accountGroup)
                                } else {
                                    // Handle the case when groupResponse is null or empty
                                }
                            },
                            error: function (error) {
                                // Handle errors for the inner AJAX call
                            }
                        });
                    }
                } else {
                    // Handle the case when response is an empty array
                }
            },
            error: function (error) {
                // Handle errors for the outer AJAX call
            },
        });
    }


    $('#deleteGroup').click( function() {
        var groupId = "${sessionScope.groupAccount.group_id}";
        $.ajax({
            type: "POST",
            url: "/deleteGroups",
            data: { groupId : groupId },
            success: function(response) {
                location.href="/";
            },
            error: function(error) {
            }
        });
    } );

    $.ajax({
        type: "POST",
        url: "/selectGroupAccountChart",
        data: { groupId: 96 ,groupAccount : "${sessionScope.groupAccountDetail.group_account}"},
        success: function (response) {
            var memberSelect = $('#memberSelect');
            memberSelect.empty();

            memberSelect.append($('<option>', {
                value: response.member_id,
                text: response.name // 멤버 이름 또는 다른 필요한 데이터로 대체할 수 있습니다.
            }));

            // 고정된 색상 배열
            const fixedColors = [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)'
            ];
            // 데이터 가공
            const data = response.map((item,index) => {
                return {
                    label: item.name,
                    data: item.amount,
                    backgroundColor: fixedColors[index % fixedColors.length],
                    hoverOffset: 4
                };
            });

            // 차트 설정
            const chartData = {
                labels: data.map(item => item.label),
                datasets: [
                    {
                        data: data.map(item => item.data),
                        backgroundColor: data.map(item => item.backgroundColor),
                        hoverOffset: 4,
                    },
                ],
            };

            const chartConfig = {
                type: 'doughnut',
                data: chartData,
            };

            // 차트 생성
            const myChart = new Chart(
                document.getElementById('myChart'),
                chartConfig
            );
        },
        error: function (error) {
            console.error(error);
        },
    });
    $('.slider-2 .page-nav > div').click(function() {

        var $this = $(this);
        var $pagenav = $this.parent()
        var $current = $pagenav.find('.active');

        $current.removeClass('active');
        $this.addClass('active');

        var index = $this.index();
        var $slider = $this.closest('.slider-2');

        $slider.find('.slides > div.active').removeClass('active');
        $slider.find('.slides > div').eq(index).addClass('active');


    });

    $('.slider-2 > .side-btns > div:first-child').click(function() {
        var $this = $(this);
        var $slider = $this.closest('.slider-2');

        var $current = $slider.find('.page-nav > div.active');
        var $post = $current.prev();

        if ( $post.length == 0 ) {
            $post = $slider.find('.page-nav > div:last-child');
        }

        $post.click();
    });

    $('.slider-2 > .side-btns > div:last-child').click(function() {
        var $this = $(this);
        var $slider = $this.closest('.slider-2');

        var $current = $slider.find('.page-nav > div.active');
        var $post = $current.next();

        if ( $post.length == 0 ) {
            $post = $slider.find('.page-nav > div:first-child');
        }

        $post.click();
    });


</script>
</html>
