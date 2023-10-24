<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="../../../resources/css/mygroup.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        내 모임통장<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">내 모임통장</div>
            <div class="menuhr"><hr/></div>
            <a href="group">모임통장 </a>
            <a href="/groupStatement">모임통장 내역</a>
        </div>
        <div class="contents-1">
            <div class="section-1">
                <div class="contentsText">
                    <div class="accountAndInfo">
                        <div class="accountName"></div>
                        <div class="accountNum"></div>
                    </div>
                    <div class="cardAndTransfer">
                        <button class="cardBtn" onclick="accountTransfer()">
                            <div class="card1">이체</div>
                        </button>
                        <button class="cardBtn" onclick="openCardModal()">
                            <div class="card">카드</div>
                        </button>
                    </div>
                </div>
                <div class="stepper">
                </div>
            </div>
            <div class="section-3">
                <div class="newAccount"></div>
                <div class="chartbox">
                    <canvas id="myChart"></canvas>
                </div>
                <div class="hanaClassBox">
                    <div class="hanaClass"></div>
                    <script>
                        $(document).ready(function() {
                            var memberId = "${sessionScope.member.member_id}";
                            var groupId = "${groupId}";
                            $.ajax({
                                url:'/selectGroupAccountInfo',
                                data: { memberId : memberId, groupId : groupId },
                                method: "POST",
                                success: function(response) {
                                    $.ajax({
                                        type: "POST",
                                        url: "/selectGroupAccountChart",
                                        data: { groupId: response.group_id,groupAccount : response.group_account},
                                        success: function (response) {
                                            var memberSelect = $('#memberSelect');
                                            memberSelect.empty();
                                            response.forEach(function(member) {
                                                memberSelect.append($('<option>', {
                                                    value: member.member_id,
                                                    text: member.name
                                                }));
                                            });
                                            // 고정된 색상 배열
                                            const fixedColors = [
                                                'rgb(89,208,201)',
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
                                            // 데이터가 비어있는지 확인하고 메시지 표시
                                            if (chartData.labels.length === 0) {
                                                const canvas = document.getElementById('myChart');
                                                const ctx = canvas.getContext('2d');
                                                ctx.font = '20px Arial';
                                                ctx.fillStyle = 'rgb(0, 0, 0)';
                                                ctx.textAlign = 'center';
                                                // ctx.fillText('사용 이력이 없습니다.', canvas.width / 4, canvas.height / 4);
                                                ctx.fillText('사용 이력이 없습니다.', canvas.width / 1.6, canvas.height / 1.5);
                                            }
                                        },
                                        error: function (error) {
                                            console.error(error);
                                        },
                                    });
                                    document.querySelector('.accountName').textContent = response.group_name;
                                    document.querySelector('.accountNum').textContent = response.group_account;
                                    const hanaClass = document.querySelector('.hanaClass');
                                    hanaClass.textContent = "총 "+response.g_balance.toLocaleString()+"원";
                                    const newAccount = document.querySelector('.newAccount');
                                    newAccount.textContent = response.g_month + " "+response.g_day+"일, "+response.g_dues+"원씩";
                                }
                            })
                        })
                    </script>
                </div>
                <div class="mygroup-box">
                    <div class="applyBox">
                        <button class="applyBtn" onclick="deposit()">회비 입금</button>
                    </div>

                    <div class="applyBox">
                        <button class="applyBtn1" onclick="location.href='/travel/${groupId}'">여행계획</button>
                    </div>
                </div>

                <div id="cardModal" class="modal">
                    <div class="modal-content card-modal-content" style="position: absolute">
                        <span class="close" onclick="closeCardModal()">&times;</span>
                        <h2 class="card-title">프렌즈 체크카드(1394)</h2>
                        <div class="date-search">
                            <label for="selectedMonth">날짜 선택:</label>
                            <select id="selectedMonth">
                                <option value="2023-01">2023년 1월</option>
                                <option value="2023-02">2023년 2월</option>
                                <!-- 다른 월도 추가 -->
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
                                </tr>
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
                <table id="example" class="display" style="width:100%">
                    <div class="category-selectbox">
                        <select id="accountSelect">
                        </select>
                        <button class="accountBtn" onclick="getTransactionsByAccount()">계좌별 조회</button>
                        <select id="memberSelect">
                        </select>
                        <button class="memberBtn" onclick="getTransactionsByMember()">사용자별 조회</button>
                    </div>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>모임계좌</th>
                        <th>입금자</th>
                        <th>거래유형</th>
                        <th>잔액</th>
                        <th>입금금액</th>
                        <th>입금날짜</th>
                        <th>입금내용</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>

                <div class="modal" id="inviteModal">
                    <div class="modal-content" style="padding: 50px 0; margin: 0 auto;">
                        <span class="close-btn" onclick="inviteCloseModal()">&times;</span>
                        <h2>초대수락</h2>
                        <div class="invite-box">
                            <img class="invite-img" src="../../../resources/images/invite2.png">
                        </div>
                        <div class="invitecodebox"><input type="text" value="" class="invitecode" id="code" placeholder="초대코드를 입력해주세요"></div>
                        <div class="group71">
                            <button class="selecloc-1" onclick="inviteAccept()">초대수락</button>
                            <button class="selecloc-2" onclick="location.href='/'">초대거절</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</div>
</body>
<link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script>

    function closeModal(){
        document.querySelector('#myModal').style.display = 'none';
    }
    function openModal(){
        var modal = document.getElementById('myModal');
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
                    var modal = document.getElementById('myModal');
                    modal.style.display = 'none';
                    var groupId = "${groupId}";
                    $.ajax({
                        type: "POST",
                        url: "/inputCheckPassword",
                        data: { groupId : groupId },
                        success: function(response) {
                            var storePw = parseInt(response.trim());
                            if(storePw===enteredCode){
                                alert('접속완료')
                                //groupaccount에 insert
                                //연결계좌 확인
                                // connectAccount();
                                //총 그룹계좌 내역 조회
                                // totalGroupAccountStat();
                            }else{
                                alert("비밀번호가 틀립니다");
                                openModal();
                            }
                        },
                        error: function(error) {
                        }
                    });
                    // Check the PIN
                    if (enterCode == pin) {

                        // Right PIN!
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
    function inviteAccept(){
        var inviteCodeInput = document.querySelector(".invitecode").value;
        $.ajax({
            url:'/updateInviteAccept',
            method: "POST",
            data : {code : inviteCodeInput},
            success: function(response) {
                var recode = document.getElementById('code').value;
                var code = "${sessionScope.member.code}"
                var data = {
                    code: code,
                    recode: recode
                };
                $.ajax({
                    type: "POST",
                    url: "/cashbackPayment",
                    data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환
                    contentType: "application/json", // 데이터 타입을 JSON으로 설정
                    success: function (data) {
                        // 성공 시 처리
                    },
                    error: function (xhr, data) {
                        $("#login_result").text('알 수 없는 에러가 발생했습니다.');
                    }
                });
                location.href='/mygroup/${groupId}';
            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });

    }
    function searchByMonth() {
        var selectedMonth = document.getElementById("selectedMonth").value;
        var filteredData = yourData.filter(function(item) {
            var transactionDate = new Date(item.transactionDate); // 데이터에서 날짜 필드에 따라 수정
            var transactionMonth = transactionDate.getFullYear() + "-" + (transactionDate.getMonth() + 1).toString().padStart(2, '0'); // "YYYY-MM" 형식으로 변환
            return transactionMonth === selectedMonth;
        });

        var totalAmount = 0;
        filteredData.forEach(function(item) {
            // 실제 데이터에서 금액 필드에 따라 수정
            totalAmount += item.amount;
        });
        updateMonthUsage(selectedMonth, totalAmount);
    }

    function updateMonthUsage(selectedMonth, totalAmount) {
        document.querySelector(".card-value").textContent = selectedMonth + " 사용금액: " + totalAmount.toLocaleString() + "원";
    }

    $(document).ready(function() {
        $('#cardHistoryTable').DataTable({
            autoWidth: false,
            language: { //언어 설정
                paginate: {
                    previous: "이전",
                    next: "다음"
                },
                zeroRecords: "검색 결과가 없습니다.",
                info: "전체 거래내역 _TOTAL_개 중에서 _START_ 번부터 _END_ 번까지의 결과",
                lengthMenu: "_MENU_ 행까지 조회"
            }
            , columnDefs: [
                {
                    targets: -1,
                    className: 'dt-body-center'
                },
            ],
        });
    });

    function openCardModal() {
        var modal = document.getElementById("cardModal");
        modal.style.display = "block";
    }


    function closeCardModal() {
        var modal = document.getElementById("cardModal");
        modal.style.display = "none";
    }

    function getTransactionsByAccount(){
        var selectedAccount = $("#accountSelect").val();
        $.ajax({
            url:'/getTransactionsByAccount',
            method: "POST",
            data : {accountNum : selectedAccount},
            success: function(response) {
                console.log(response + " 거래별내역")

                var table = $('#example').DataTable();
                table.clear().draw();
                table.rows.add(response).draw();
            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });
    }
    function getTransactionsByMember(){
        var selectedMember = $("#memberSelect").val();
        $.ajax({
            url:'/getTransactionsByMember',
            method: "POST",
            data: { groupId: "${groupId}" , memberId: selectedMember},
            success: function(response) {
                var table = $('#example').DataTable();
                table.clear().draw();
                table.rows.add(response).draw();
            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });
    }
    $.ajax({
        url:'/selectBackAccount',
        method: "POST",
        success: function(response) {
            var accountSelect = $('#accountSelect');
            response.forEach(function(account) {
                accountSelect.append($('<option>', {
                    value: account.account_num,
                    text: account.account_num
                }));
            });
        },
        error: function(error) {
            console.error("Error occurred:", error);
        }
    });
    function groupAccountStatement() {
        var groupAccount = document.querySelector('.accountNum').textContent;
        var table = $('#example').DataTable({
            lengthChange: false,
            autoWidth: false,
            language: { //언어 설정
                paginate: {
                    previous: "이전",
                    next: "다음"
                },
                zeroRecords: "검색 결과가 없습니다.",
                info: "전체 거래내역 _TOTAL_개 중에서 _START_ 번부터 _END_ 번까지의 결과",
                lengthMenu: "_MENU_ 행까지 조회"
            }
            , columnDefs: [
                {
                    targets: -1,
                    className: 'dt-body-center'
                },

            ],
            buttons: [ 'copy', 'excel', 'pdf', 'colvis' ],
            columns: [
                { data: 'group_account_tid' },
                { data: 'account_num' },
                { data: 'name' },
                { data: 'transaction_type' },
                {
                    data: 'amount',
                    render: function(data) {
                        return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
                    }
                },
                {
                    data: 'balance',
                    render: function(data) {
                        return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
                    }
                },
                { data: 'transaction_date' },
                { data: 'transaction_content' },
            ]
        });
        $.ajax({
            url: "/selectGroupAccountStatement",
            type: "POST",
            data: { groupAccount: groupAccount},
            success: function (data) {
                var table = $('#example').DataTable();
                table.clear().draw();
                table.rows.add(data).draw();
            },
            error: function (request, status, error) {

            }
        });
    }
    $.ajax({
        type: "POST",
        url: "/selectAllGroupMembers",
        data: { groupId: "${groupId}" },
        success: function (response) {
            var groupmember = document.querySelector('.stepper');
            response.forEach(function(member) {
                var groupMemberImg = document.createElement('img');
                groupMemberImg.className = 'group-member-img';
                if(member.kakao_id==0){
                    groupMemberImg.src = '../../../resources/upload/profile/'+member.kakao_img;
                }else{
                    groupMemberImg.src = member.kakao_img;
                }

                groupmember.appendChild(groupMemberImg);
            });
        },
        error: function (error) {
            console.error(error);
        },
    });


    function getRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    function deposit(){
        location.href='/deposit';
    }
    function accountTransfer(){
        location.href ='/transfer';
    }


    function totalGroupAccountStat(){
        var groupId = "${groupId}";
        $.ajax({
            type: "POST",
            url: "/totalGroupAccountStat",
            data: { groupId : groupId },
            success: function(response) {
                console.log(response+ " totalGroupAccountStat");
            },
            error: function(error) {
            }
        });
    }
    function insertGroupMember(){
        var groupId = "${groupId}";
        $.ajax({
            type: "POST",
            url: "/insertGroupMember",
            data: { groupId : groupId },
            success: function(response) {
            },
            error: function(error) {
            }
        });
    }

    function selectGroupMember(){
        var groupId = "${groupId}";
        $.ajax({
            type: "POST",
            url: "/selectGroupMember",
            data: { groupId : groupId},
            success: function(response) {
                if(response!=""){
                    connectAccount();
                }else{
                    //모임원아니면 초대수락
                    groupInviteModal();
                }
            },
            error: function(error) {
            }
        });
    }
    function connectAccount(){
        $.ajax({
            type: "POST",
            url: "/JoinGroupAccountAndMemberAccount",
            success: function (response) {
                //연동 계좌가 있는지 확인
                if(response!=""){
                    //연동계좌가 있으면 그룹계좌 가져오기
                    groupAccountStatement();
                }else{
                    //연동하러가기
                    // location.href='/mypage'
                }
            },
            error: function (error) {
                // 오류 처리
            }
        })

    }

    function groupInviteModal(){
        var modal = document.getElementById('inviteModal');
        modal.style.display = 'block';
        insertGroupMember();
    }
    function inviteCloseModal(){
        var modal = document.getElementById('inviteModal');
        modal.style.display = 'none';
    }
    $(document).ready(function() {
        var memberId = "${sessionScope.member.member_id}";
        var groupSid = `${sessionScope.groupId}`;
        if(memberId==""){
            location.href = '/';
        }else{
            selectGroupMember();
        }
    });

</script>

</html>