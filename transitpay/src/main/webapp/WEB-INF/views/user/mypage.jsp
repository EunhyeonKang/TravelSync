<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/conacoount.css">
    <link rel="stylesheet" href="../../../resources/css/mypage.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script defer src="../../../resources/js/mypage.js"></script>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="backgroundbox">
        <div class="topbox">
            <div class="contents">
                <div class="contents-1">
                    <div class="accountbox">
                        <div class="mypage-user">
                            <div class="user-detail">
                                <div class="mypage-box">
                                    <c:choose>
                                        <c:when test="${sessionScope.member.kakao_id == 0}">
                                            <img style="width: 50px; margin: 20px;border-radius: 50%" src="../../resources/upload/profile/${sessionScope.member.kakao_img}">
                                        </c:when>
                                        <c:otherwise>
                                            <img style="width: 50px;margin: 20px;border-radius: 50%" src="${sessionScope.member.kakao_img}">
                                        </c:otherwise>
                                    </c:choose>
                                    <p><strong>${sessionScope.member.name}</strong>님 환영합니다</p>
                                </div>
                                <div id="myTextarea">${sessionScope.member.code}</div>
                                <button id="myButton">복사</button>
                                <script>
                                    const myTextarea = document.getElementById("myTextarea");
                                    document.getElementById("myButton").onclick = () => {
                                        window.navigator.clipboard.writeText(myTextarea.value).then(() => {
                                            alert("복사완료");
                                        });
                                    };
                                </script>
                                <div class="mypage_logout">로그아웃</div>
                            </div>
                            <div class="menu1">
                                <div class="menu1-1">마이페이지</div>
                                <div class="menuhr"><hr/></div>
                                <a href="group">내정보수정</a>
                                <div class="menu1-1">여행관리</div>
                                <div class="menuhr"><hr/></div>
                                <a href="/saveTravel">저장된여행</a>
                                <a href="/afterTravel">모여라여행</a>
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
                                            <div class="saveboxcnt"><strong><a href="/saveTravel" id="travleLength"></a></strong></div>
                                        </div>
                                    </div>
                                    <button>여행 | 찜🩷</button>
                                </div>
                            </div>
                            <div class="travelbox-2">
                                <div>
                                    <div>
                                        <div class="travelsavebox">
                                            <img class="saveImg" src="../../../resources/images/save-hassle.svg" style="width: 70px;">
                                            <div>여행회비</div>
                                            <div class="saveboxcnt"><strong><a href="/afterTravel" id="completeTravelLength"></a></strong></div>
                                        </div>
                                    </div>
                                    <button>모여라회비💰</button>
                                </div>
                            </div>
                            <div class="travelbox-3">
                                <div class="chartbox">
                                    <canvas id="myChart"></canvas>
                                </div>
                                </p>
                                <div>
                                    <button>내 여행 리포트📈</button>
                                </div>
                            </div>
                            <p id="travelreport">
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
                                    <button onclick="openModal()" class="account-month" id="non-payment-account">미납 회비 현황 > </button>
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
    <div class="modal" id="myModal1" >
        <div id="pincode">
            <div class="table">
                <div class="cell">
                    <div id="anleitung">
<%--                        <div class="close" onclick="closeModal()">x</div>--%>
                        <p>
                            <strong>모임 비밀번호 입력</strong><br> 비밀번호 4자리를 입력해주세요
                        </p>
                    </div>

                    <div id="fields">
                        <div class="grid">
                            <div class="grid__col grid__col--1-of-4 numberfield"><span></span></div>
                            <div class="grid__col grid__col--1-of-4 numberfield"><span></span></div>
                            <div class="grid__col grid__col--1-of-4 numberfield"><span></span></div>
                            <div class="grid__col grid__col--1-of-4 numberfield"><span></span></div>
                        </div>
                    </div>

                    <div id="numbers">
                        <div class="grid">
                            <div class="grid__col grid__col--1-of-3"><button>1</button></div>
                            <div class="grid__col grid__col--1-of-3"><button>2</button></div>
                            <div class="grid__col grid__col--1-of-3"><button>3</button></div>

                            <div class="grid__col grid__col--1-of-3"><button>4</button></div>
                            <div class="grid__col grid__col--1-of-3"><button>5</button></div>
                            <div class="grid__col grid__col--1-of-3"><button>6</button></div>

                            <div class="grid__col grid__col--1-of-3"><button>7</button></div>
                            <div class="grid__col grid__col--1-of-3"><button>8</button></div>
                            <div class="grid__col grid__col--1-of-3"><button>9</button></div>

                            <div class="grid__col grid__col--1-of-3"></div>
                            <div class="grid__col grid__col--1-of-3"><button>0</button></div>
                            <div class="grid__col grid__col--1-of-3"></div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div id="restartbtn">RESTART</div>
    </div>
</div>
    <div id="customModal" class="custom-modal">
        <div class="custom-modal-content">
            <span class="custom-close">&times;</span>
            <h2 class="monthstate">이번달 이용내역</h2>
        </div>
    </div>
    <div id="unpaidModal" class="modal">
        <div class="unpaid-modal-content">
            <span class="unpaid-close-btn" onclick="closeModal()">&times;</span>
            <h2 class="monthstate">미납 회비 안내</h2>
            <p>미납된 회비 정보를 여기에 표시합니다.</p>
        </div>
    </div>
    <div id="updateModal" class="update-modal">
        <div class="update-modal-content">
            <span class="update-close">&times;</span>
            <h2>모임수정</h2>
            <table>
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

    <div id="deletemodal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModal">×</span>
            <h3>삭제 확인</h3>

            <p>정말로 삭제하시겠습니까?</p>
            <img src="../../../resources/images/check.webp" style="width: 70px;margin: 5px;">
            <table id="groupTable" class="group-table">
                <thead>
                <tr>
                    <th>선택</th>
                    <th>그룹 이름</th>
                    <th>계좌</th>
                    <th>잔액</th>
                    <th>자동결제</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <br>
            <hr>
            <div style="color: #ee002d">모임탈퇴는 모임장만 할 수 있습니다. 모임원일 경우 모임퇴장하게 됩니다.</div>
            <div style="color: #ee002d">모임을 탈퇴할 시 모임 계설 시 연결된 계좌에 환급됩니다.</div>
            <button id="confirmDelete" class="delete-button">삭제</button>
        </div>
    </div>

    <div id="cardModal" class="modal1">
        <div class="modal-content1 card-modal-content">
            <span class="close1" onclick="closeCardModal()">&times;</span>
            <h2 class="card-title">모여라 체크카드(1394)</h2>
            <div class="date-search">
                <label for="selectedMonth">날짜 선택:</label>
                <select id="selectedMonth">
                    <option value="2023-01">2023년 1월</option>
                    <option value="2023-02">2023년 2월</option>
                </select>
                <button class="date-search" onclick="searchByMonth()">검색</button>
            </div>
            <div class="card-details">
                <div class="card-label">10월 사용금액</div>
                <div class="card-usage">
                    <div class="card-box">
                        <div class="card-value">415,000원</div>
                    </div>
                    <div class="card-buttons">
                        <button class="card-button">이번달 카드실적</button>
                        <button class="card-button card-cashback-button">
                            <span>받은 캐시백</span>
                            <span class="one">0원</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="card-history">
                <table id="cardHistoryTable" class="display" style="width:100%">
                    <thead>
                    <tr>
                        <th>거래일자</th>
                        <th>거래내용</th>
                        <th>거래금액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>2023-11-04</td>
                        <td>도톰카츠 청라점</td>
                        <td>-253,000원</td>
                    </tr>
                    <tr>
                        <td>2023-11-04</td>
                        <td>베스트웨스턴 하버파크호텔</td>
                        <td>-32,000원</td>
                    </tr>카
                    <tr>
                        <td>2023-11-05</td>
                        <td>파라다이스 씨티 씨메르(인천)</td>
                        <td>-60,000원</td>
                    </tr>
                    <tr>
                        <td>2023-11-05</td>
                        <td>손커피연구소 영종하늘도시점</td>
                        <td>-10,000원</td>
                    </tr>
                    <tr>
                        <td>2023-11-05</td>
                        <td>탕후루</td>
                        <td>-12,000원</td>
                    </tr>
                    <tr>
                        <td>2023-11-06</td>
                        <td>청라왕아구</td>
                        <td>-28,000원</td>
                    </tr>
                    <tr>
                        <td>2023-11-06</td>
                        <td>하나로마트</td>
                        <td>-20,000원</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%--    <%@ include file="../include/footer.jsp" %>--%>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
<script>
    function phoneModal(){
        var deletemodal = document.querySelector('#deletemodal');
        deletemodal.style.display='none';
        var modal = document.getElementById('myModal1');
        modal.style.display = 'block';
        jQuery(document).ready(function($) {
            $(document).ready(function() {

                var pin = (+!![] + []) + (!+[] + !![] + []) + (!+[] + !![] + !![] + []) + (!+[] + !![] + !![] + !![] + []);
                var enterCode = "";
                enterCode.toString();

                $("#numbers button").click(function() {

                    var clickedNumber = $(this).text().toString();
                    enterCode = enterCode + clickedNumber;
                    var lengthCode = parseInt(enterCode.length);
                    lengthCode--;
                    $("#fields .numberfield:eq(" + lengthCode + ")").addClass("active");

                    if (lengthCode == 3) {
                        var enteredCode = parseInt(enterCode);

                        var groupId = "${groupId}";
                        $.ajax({
                            type: "POST",
                            url: "/inputCheckPassword",
                            data: { groupId : groupId },
                            success: function(response) {
                                var storePw = parseInt(response.trim());
                                // 모달 닫기
                                $('#deletemodal').hide();
                                $('#myModal1').hide();
                                var groupId = "${sessionScope.groupAccount.group_id}";
                                $.ajax({
                                    type: "POST",
                                    url: "/deleteGroups",
                                    data: { groupId: groupId },
                                    success: function(response) {
                                        alert("그룹이 삭제되었습니다.")
                                        location.href = "/";
                                    },
                                    error: function(error) {
                                    }
                                });
                            },
                            error: function(error) {
                            }
                        });
                        if (enterCode == pin) {
                            $("#fields .numberfield").addClass("right");
                            $("#numbers").addClass("hide");
                            $("#anleitung p").html("Amazing!<br>You entered the correct Code!");

                        } else {
                            $("#fields").addClass("miss");
                            enterCode = "";
                            setTimeout(function() {
                                $("#fields .numberfield").removeClass("active");
                            }, 200);
                            setTimeout(function() {
                                $("#fields").removeClass("miss");
                            }, 500);

                        }

                    } else {}

                });

                $("#restartbtn").click(function(){
                    enterCode = "";
                    $("#fields .numberfield").removeClass("active");
                    $("#fields .numberfield").removeClass("right");
                    $("#numbers").removeClass("hide");
                    $("#anleitung p").html("<strong>Please enter the correct PIN-Code.</strong><br> It is: 1234 / Also try a wrong code");
                });

            });
        });
    }

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




    $.ajax({
        type: "POST",
        url: "/selectGroupInfo",
        data: { groupId: "${sessionScope.groupAccountDetail.group_id}" },
        success: function (response) {
            var groupTable = document.getElementById("groupTable").getElementsByTagName('tbody')[0];
            response.forEach(function (item) {
                document.getElementById("groupAccount").textContent = item.group_account;
                document.getElementById("groupBalance").textContent = item.g_balance.toLocaleString() + "원";
                document.getElementById("groupDay").value = item.g_day; // input 요소이므로 .value를 사용
                document.getElementById("groupDues").value = item.g_dues; // input 요소이므로 .value를 사용
                document.getElementById("groupAutopay").value = item.g_autopay;
                document.getElementById("groupPassword").value = item.group_pw; // 비밀번호 input 요소
                var row = groupTable.insertRow(-1);

                var checkboxCell = row.insertCell(0);
                var checkbox = document.createElement("input");
                checkbox.type = "checkbox";
                checkbox.name = "groupToDelete";
                checkbox.value = item.group_id;
                checkboxCell.appendChild(checkbox);

                var dataCells = [
                    item.group_name,
                    item.group_account,
                    item.g_balance.toLocaleString() + "원",
                    item.g_autopay
                ];

                for (var i = 0; i < dataCells.length; i++) {
                    var cell = row.insertCell(i + 1);
                    cell.textContent = dataCells[i];
                }
            });

            document.getElementById("groupName").textContent = response[0].group_name;
            var selectedGroupIds = [];
            var checkboxes = document.getElementsByName("groupToDelete");


            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].addEventListener("change", function () {
                    if (this.checked) {
                        selectedGroupIds.push(this.value);
                    } else {
                        var index = selectedGroupIds.indexOf(this.value);
                        if (index !== -1) {
                            selectedGroupIds.splice(index, 1);
                        }
                    }
                });
            }

        }
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
                                    cardButton.addEventListener("click", function(){
                                        openCardModal();
                                    });
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

                                    groupAccountInfoDiv.appendChild(groupAccountInfoSpan);
                                    groupAccountInfoDiv.appendChild(groupAccountInfoInput);
                                    groupAccountInfoDiv.appendChild(groupAccountInfoButton);

                                    accountGroup.appendChild(groupAccountButton);
                                    accountGroup.appendChild(cardButton);
                                    accountGroup.appendChild(groupAccountBankDiv);
                                    accountGroup.appendChild(groupAccountInfoDiv);
                                    slide2.appendChild(accountGroup)
                                } else {
                                }
                            },
                            error: function (error) {
                            }
                        });
                    }
                } else {

                }
            },
            error: function (error) {
            },
        });
    }

</script>
</html>
