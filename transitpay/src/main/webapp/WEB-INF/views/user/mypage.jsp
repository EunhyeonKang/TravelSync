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
                        <h2>내 여행</h2>
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
                        <h2>나의 프로젝트</h2>
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
                                        <button class="account-button" onclick="location.href='/mygroup/${groupAccount.group_id}'">모임통장</button>
                                        <div class="bank">${groupAccount.group_name}</div>
                                        <div class="account-info">
                                            <span class="account-number">${groupAccount.group_account}</span>
                                            <input type="hidden" name="accountId" value="">
                                            <button class="change-account" onclick="location.href='/groupAccountDetail'">모임통장 내역</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h2>내 모임</h2>
                        <div class="card-1">
                            <div class="account2">
                                <div class="new-account-details">
                                    <button class="account-button" onclick="location.href='/mygroup/${groupAccount.group_id}'">모임통장</button>
                                    <div class="bank">${groupAccount.group_name}</div>
                                    <div class="account-info">
                                        <span class="account-number">${groupAccount.group_account}</span>
                                        <input type="hidden" name="accountId" value="">
                                        <button class="change-account" onclick="location.href='/groupAccountDetail'">모임통장 내역</button>
                                    </div>
                                </div>
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
<script>
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
</script>
</html>
