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
    <style>
        /* 모달 스타일 */
        .custom-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .custom-modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            position: relative;
        }

        .custom-close {
            position: absolute;
            top: 0;
            right: 0;
            padding: 10px;
            cursor: pointer;
        }
        /* 테이블 스타일 */
        .custom-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        /* 테이블 헤더 스타일 */
        .custom-table th {
            background-color: #f2f2f2;
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }

        /* 테이블 바디 스타일 */
        .custom-table td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }

        /* 테이블 줄 번갈아가며 색상 변경 */
        .custom-table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        /* 모달 스타일 */
        .update-modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
        }

        /* 모달 내용 스타일 */
        .update-modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* 모달 닫기 버튼 스타일 */
        .update-close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .update-close:hover,
        .update-close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .update-modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
        }

        /* 모달 내용 스타일 */
        .update-modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            text-align: center;
        }

        /* 모달 닫기 버튼 스타일 */
        .update-close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .update-close:hover,
        .update-close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
        }

        table, th, td {
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* 입력 필드 스타일 */
        input[type="text"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        /* 저장 버튼 스타일 */
        #updateButton {
            background-color: #008CBA;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 2px;
            cursor: pointer;
            border-radius: 3px;
        }

        #updateButton:hover {
            background-color: #005f79;
        }
        #enroll, #updateGroup{
            background: #009688;
        }
        #cancel, #deleteGroup{
            background: #b5b5b5;
        }
        #myChart{
            display: block;
            box-sizing: border-box;
            height: 250px;
            width: 250px;
            padding: 10px;
        }
        .saveImg{
            width: 70px;
            margin: 10px;
        }.menu1-1{
             text-align: center;
             padding-top: 30px;
             color: #008485;
             font-weight: 700;
             font-size: 20px;
         }
        menu1 a:hover {
            background-color: #008485;
            color: white;
        }
        .menu1 a {
            text-decoration: none;
            color: #333;
            padding: 8px 10px;
            text-align: center;
            margin: 0 auto;
            border-radius: 5px;
            transition: background-color 0.2s;
        }.menu1 {
             display: flex;
             flex-direction: column;
             width: 200px;
             border-radius: 0px;
             padding: 10px;
             float: left;
         }
        .menuhr hr{
            border: 2px solid #00968829;
        }
    </style>
</head>
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
                            <div class="menu1">
                                <div class="menu1-1">마이페이지</div>
                                <div class="menuhr"><hr/></div>
                                <a href="group">내정보수정</a>
                                <div class="menu1-1">여행관리</div>
                                <div class="menuhr"><hr/></div>
                                <a href="/saveTravel">저장된여행</a>
                                <a href="/afterTravel">정산된여행</a>
                                <div class="menu1-1">모임/계좌 관리</div>
                                <div class="menuhr"><hr/></div>
                                <a href="group">모임내역</a>
                                <a href="group">계좌내역</a>
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
                                            <img class="saveImg" src="../../../resources/images/save-time.svg" style="width: 70px;">
                                            <div>저장된 여행</div>
                                            <div class="saveboxcnt"><a href="/saveTravel" id="travleLength"></a></div>
                                        </div>
                                    </div>
                                    <button>여행/찜🩷</button>
                                </div>
                            </div>
                            <div class="travelbox-2">
                                <div>
                                    <div>
                                        <div class="travelsavebox">
                                            <img class="saveImg" src="../../../resources/images/save-hassle.svg" style="width: 70px;">
                                            <div>정산된 여행</div>
                                            <div class="saveboxcnt"><a href="/afterTravel" id="completeTravelLength"></a></div>
                                        </div>
                                    </div>
                                    <button>정산/자동이체💰</button>
                                </div>
                            </div>
                            <div class="travelbox-3">
                                <div class="chartbox">
                                    <canvas id="myChart"></canvas>
                                </div>
                                <div>
                                    <button>정산된 여행경비</button>
                                </div>
                            </div>
                        </div>
                        <h2>계좌 관리</h2>
                        <div class="account-box-1">
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
                            <div class="account-box">
                                <div class="account-box-2">
                                    <img src="../../resources/images/new_2204_my_login_ico001.png" alt="">
                                    <button class="account-month" id="custom-account-month">이번달 이용내역 > </button>
                                    <div class="account-cnt">
                                        <div class="cnt-1-1" id="month-cnt"></div><span class="cnt-1">건</span>
                                        <div class="cnt-1-1" id="month-balance"></div><span class="cnt-1">원</span>
                                    </div>
                                </div>
                                <div class="account-box-2">
                                    <img src="../../resources/images/new_2204_my_login_ico004.png" alt="">
                                    <div class="account-month">미납 회비 현황 >  </div>
                                    <div class="account-cnt">
                                        <div class="cnt-1-2" id="payment-cnt"></div><span class="cnt-1">건</span>
                                        <div class="cnt-1-2" id="payment-balance"></div><span class="cnt-1">원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h2>모임 관리</h2>
                        <div class="card-1">
                            <div class="account2">
                                <div class="auto-charge-box">
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
                                <div class="auto-charge-box-2">
                                    <div class="auto-charge-box-1">
                                        <div class="auto-charge">
                                            <span class="charge-info">자동이체</span>
                                        </div>
                                        <div class="auto-charge2">
                                            <div class="chargebtn">
                                                <button class="charge-save-button" id="enroll">신청</button>
                                            </div>
                                            <div class="chargebtn">
                                                <button class="charge-save-button" id="cancel">해지</button>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="auto-charge-box-1">
                                        <div class="auto-charge">
                                            <span class="charge-info">모임수정 및 탈퇴</span>
                                        </div>
                                        <div class="auto-charge2">
                                            <div class="chargebtn">
                                                    <button class="charge-save-button" id="updateGroup">수정</button>
                                            </div>
                                            <div class="chargebtn">
                                                <button class="charge-save-button" id="deleteGroup">탈퇴</button>
                                            </div>

                                        </div>
                                    </div>
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
    <div id="customModal" class="custom-modal">
        <div class="custom-modal-content">
            <span class="custom-close">&times;</span>
            <h2>이번달 이용내역</h2>
        </div>
    </div>

    <div id="updateModal" class="update-modal">
        <div class="update-modal-content">
            <span class="update-close">&times;</span>
            <h2>모임수정</h2>
            <table>
                <tr>
                    <td>그룹 ID:</td>
                    <td id="groupID"></td>
                </tr>
                <tr>
                    <td>그룹 이름:</td>
                    <td id="groupName"></td>
                </tr>
                <tr>
                    <td>그룹 계좌:</td>
                    <td id="groupAccount"></td>
                </tr>
                <tr>
                    <td>그룹 잔액:</td>
                    <td id="groupBalance"></td>
                </tr>
                <tr>
                    <td>(매달)월 납부일:</td>
                    <td><input type="text" id="groupDay"></td>
                </tr>
                <tr>
                    <td>월 회비:</td>
                    <td><input type="text" id="groupDues"></td>
                </tr>
                <tr>
                    <td>자동 납부:</td>
                    <td>
                        <select name="g_autopay" class="rec6" id="groupAutopay">
                            <option value="" selected>선택</option>
                            <option value="N">N</option>
                            <option value="Y">Y</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호:</td>
                    <td><input type="password" id="groupPassword"></td>
                </tr>
            </table>
            <button id="updateButton">저장</button>
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
    $.ajax({
        type: "GET",
        url: "/completeCalculateTravel",
        success: function (response) {
            document.querySelector('#completeTravelLength').textContent=response+"개";
        },
        error: function (error) {
            console.error(error);
        },
    });
    $.ajax({
        type: "GET",
        url: "/selectMemberNotificationHistory",
        success: function (response) {
           console.log(response)
            var food = 0;
            var etc =0;
            var accommodation =0;
            response.forEach(function(item){
                food +=item.food_expenses;
                etc += item.etc_expenses;
                accommodation +=item.accommodation_expenses;
            })


            // 고정된 색상 배열
            const fixedColors = [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)'
            ];
            // 데이터 가공
            const data = [
                {
                    label: '음식',
                    data: food,
                    backgroundColor: fixedColors[0]
                },
                {
                    label: '기타',
                    data: etc,
                    backgroundColor: fixedColors[1]
                },
                {
                    label: '숙박',
                    data: accommodation,
                    backgroundColor: fixedColors[2]
                }
            ];


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
    // 모달 요소와 버튼 요소 가져오기
    var updateModal = document.getElementById("updateModal");
    var updateBtn = document.getElementById("updateGroup");
    var updateCloseBtn = document.getElementsByClassName("update-close")[0];

    // 버튼을 클릭하면 모달을 보이게 함
    updateBtn.addEventListener("click", function() {
        updateModal.style.display = "block";
    });

    // 모달 바깥 영역이나 닫기 버튼을 클릭하면 모달을 숨김
    window.addEventListener("click", function(event) {
        if (event.target == updateModal || event.target == updateCloseBtn) {
            updateModal.style.display = "none";
        }
    });
    $("#enroll").click(function(){
        var groupId = "${sessionScope.groupAccountDetail.group_id}";
        $.ajax({
            type: "POST",
            url: "/selectGroupAutopay",
            data: { groupId : groupId},
            success: function (response) {
               if(response==="Y"){
                   alert("자동이체 신청이 되었습니다.")
               }else{

               }
            }
        });
    })
    $("#cancel").click(function(){
        var groupId = "${sessionScope.groupAccountDetail.group_id}";
        $.ajax({
            type: "POST",
            url: "/deleteGroupAutopay",
            data: { groupId : groupId},
            success: function (response) {
                alert(response)
            }
        });
    })
    $('#updateButton').click(function(){
        var groupAccount = document.getElementById("groupAccount").textContent;
        var groupDay = document.getElementById("groupDay").value;
        var groupDues = document.getElementById("groupDues").value;
        var groupAutopay = document.getElementById("groupAutopay").value;
        var groupPassword = document.getElementById("groupPassword").value;

        var dataToSend = {
            groupAccount: groupAccount,
            groupDay: groupDay,
            groupDues: groupDues,
            groupAutopay: groupAutopay,
            groupPassword: groupPassword
        };

        $.ajax({
            type: "POST",
            url: "/updateGroupInfo",
            contentType: "application/json",
            data: JSON.stringify(dataToSend),
            success: function (response) {
                alert(response)
            }
        });
    })

    $.ajax({
        type: "POST",
        url: "/selectGroupInfo",
        data: { groupId : "${sessionScope.groupAccountDetail.group_id}" },
        success: function (response) {
            document.getElementById("groupName").textContent = response[0].group_name;
            document.getElementById("groupAccount").textContent = response[0].group_account;
            document.getElementById("groupBalance").textContent = response[0].g_balance;
            document.getElementById("groupDay").value = response[0].g_day;
            document.getElementById("groupDues").value = response[0].g_dues;
            document.getElementById("groupAutopay").value = response[0].g_autopay;
            var autopayValue = response[0].g_autopay;
            var groupAutopaySelect = document.getElementById("groupAutopay");

            var options = groupAutopaySelect.options;

            for (var i = 0; i < options.length; i++) {
                if (options[i].value === autopayValue) {
                    options[i].selected = i;
                    break;
                }
            }
            document.getElementById("groupPassword").value = response[0].group_pw;
            console.log(response);
        }
    });

    $.ajax({
        type: "POST",
        url: "/selectNotification",
        success: function (response) {
            var total=0;
            var paymentCnt = document.querySelector('#payment-cnt');
            var paymentBalance = document.querySelector('#payment-balance');
            if(response.length==0){
                paymentCnt.textContent=0;
                paymentBalance.textContent=0;
            }else{
                paymentCnt.textContent=response.length;
                response.forEach(function(val){
                    total += val.amount;
                })
                paymentBalance.textContent=total;
            }
        }
    });
    // 모달 요소와 버튼 요소 가져오기
    var customModal = document.getElementById("customModal");
    var customBtn = document.querySelector("#custom-account-month");
    var customCloseBtn = document.querySelector(".custom-close");

    // 버튼을 클릭하면 모달을 보이게 함
    customBtn.addEventListener("click", function() {
        customModal.style.display = "block";
    });

    // 모달 바깥 영역이나 닫기 버튼을 클릭하면 모달을 숨김
    window.addEventListener("click", function(event) {
        if (event.target == customModal || event.target == customCloseBtn) {
            customModal.style.display = "none";
        }
    });

    $.ajax({
        type: "POST",
        url: "/selectMyAccountMonthStatement",
        success: function (response) {
            var total = 0;
            var monthCnt = document.querySelector('#month-cnt');
            var monthBalance = document.querySelector('#month-balance');

            // 모달 내용을 추가할 부분
            var modalContent = document.querySelector('.custom-modal-content');
            var table = document.createElement('table');
            table.className = 'custom-table';

            // 테이블 헤더 생성
            var thead = document.createElement('thead');
            var headerRow = document.createElement('tr');
            var headers = ['날짜', '내용', '금액'];

            headers.forEach(function (headerText) {
                var th = document.createElement('th');
                th.textContent = headerText;
                headerRow.appendChild(th);
            });

            thead.appendChild(headerRow);
            table.appendChild(thead);

            // 테이블 바디 생성
            var tbody = document.createElement('tbody');
            response.forEach(function (transaction) {
                var row = document.createElement('tr');
                var cell1 = document.createElement('td');
                var cell2 = document.createElement('td');
                var cell3 = document.createElement('td');

                cell1.textContent = transaction.transaction_date;
                cell2.textContent = transaction.transaction_content;
                cell3.textContent = transaction.balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

                row.appendChild(cell1);
                row.appendChild(cell2);
                row.appendChild(cell3);
                tbody.appendChild(row);

                total += transaction.balance;
            });

            table.appendChild(tbody);
            modalContent.appendChild(table);

            monthCnt.textContent = response.length;
            monthBalance.textContent = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        },
        error: function (error) {
            console.error(error);
        },
    });


    $.ajax({
        type: "POST",
        url: "/selectMygroupTravelList",
        success: function (response) {
            $("#travleLength").text(response.length + "개");
        },
        error: function (error) {
            console.error(error);
        },
    });
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

                                    var cardButton = document.createElement("button");
                                    cardButton.classList.add("account-button");
                                    cardButton.textContent = "카드내역";


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
                                    accountGroup.appendChild(cardButton);
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
