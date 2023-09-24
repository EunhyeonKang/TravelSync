<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
    .main {
        width: 100%;
        height: 850px;
    }.menu1-1{
         text-align: center;
         padding-top: 10px;
         color: #008485;
         font-weight: 700;
         font-size: 20px;
     }.traveltitle{
          text-align: left;
          left: 10px;
          color: #7a7d7d;
          font-size: 29px;
          width: 1155px;
          margin: 30px auto;
          font-weight: 600;
      }
    .traveltitle hr{
        border: 1px solid #929292;
    }.contents{
         width: 1200px;
         display: flex;
         margin: 30px auto;
     }.menu1 a:hover {
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
         margin: 20px;
     }.menuhr hr{
          border: 2px solid #008485;
      }.contents-1{
           padding: 10px 0 20px 20px;
           border-radius: 50px;
           width: 800px;
           display: table;
       }
    .contentsText{
        font-weight: 600;
        font-size: 17px;
        color: #606060;
        float: left;
        padding: 13px 0;
    }
    .section-1 div:nth-child(2){
        margin-left: auto;
    }
    .section-1{
        display: flex;
        padding: 20px 0;
    }

    .section-3{
        box-sizing: border-box;
        background: #F7F9F9;
        border-width: 1px 0px;
        border-style: solid;
        border-color: #BEBABA;

    }
    .newAccount{
        width: 180px;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 5px;
        font-weight: 700;
        font-size: 15px;
        padding: 5px 0;
        text-align: center;
        color: #008485;
        margin: 20px auto;
    }
    .hanaClassBox{
        width: 511px;
        padding: 15px 0;
        margin: 10px auto;
        background: #FFFFFF;
        border-radius: 5px;
    }
    .hanaClass{
        font-weight: 600;
        font-size: 20px;
        text-align: center;
        color: #000000;
    }
    .applyBox{
        width: 275px;
        height: 50px;
        background: rgba(0, 152, 153, 0.73);
        border: 1px solid #FFFFFF;
        border-radius: 5px;
        text-align: center;
        margin: 10px;
    }
    .applyBtn{
        font-weight: 700;
        font-size: 18px;
        text-align: center;
        color: #FFFFFF;
        background: #1e6c93;
        border: 0;
        text-align: center;
        margin: 0 auto;
        width: 100%;
        padding: 15px 0;
    }
    .applyBtn1{
        font-weight: 700;
        font-size: 18px;
        text-align: center;
        color: #FFFFFF;
        background: rgba(0, 152, 153, 0.73);
        border: 0;
        text-align: center;
        margin: 0 auto;
        width: 100%;
        padding: 15px 0;
    }
    .classSection{
        display: flex;
        padding: 10px;
        margin: 10px 0;
    }
    .class-1{
        width: 50%;
        font-weight: 600;
        font-size: 18px;
        color: #878787;
        float: left;
    }
    .plus{
        width: 50%;
        float: right;
        text-align: right;
    }
    /* 스테퍼 컨테이너 */
    .stepper {
        display: flex;
        align-items: center;
    }

    /* 각 스탭 */
    .step {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-left: 50px;
        z-index: 1;
    }

    /* 원 형태 스타일 */
    .circle {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        text-align: center;
        line-height: 31px;
        background-color: #FFFFFF;
        border: 2px solid #089b9c;
        color: #089b9c;
        font-family: 'Inter';
        font-weight: 700;
        font-size: 15px;
        margin-bottom: 5px;
    }

    /* 활성 스탭 스타일 */
    .active {
        background-color: #089b9c;
        color: #FFFFFF;
    }

    /* 가로선 스타일 */
    .line {
        width: 170px;
        height: 3px;
        background-color: #DCDCDC;
        position: relative;
        left: 180px;
    }

    /* 라벨 스타일 */
    .label {
        font-family: 'Inter';
        font-weight: 600;
        font-size: 15px;
        color: #089b9c;
    }
    .agreeDetail {
        display: none;
    }
    .plusButton{
        border: 0;
        background: 0;
        font-size: 18px;
        font-weight: 600;
        color: #878787;
    }
    .agreeDetail{
        padding: 0 0 20px 20px;
    }

    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        z-index: 2;
    }

    .modal-content {
        background-color: #fff;
        margin: 150px auto;
        padding: 30px;
        width: 600px;
        border-radius: 5px;
    }

    /* 닫기 버튼 스타일 */
    .close-btn {
        float: right;
        cursor: pointer;
        display: none;
    }

    .rec6{
        padding: 15px;
        width: 100%;
        box-sizing: border-box;
        height: 50px;
        text-align: left;
        background: #FFFFFF;
        border: 1px solid #CDC9C9;
        border-radius: 10px;
    }
    .flexClass{
        display: inline-block;
        width: 500px;
        margin-bottom: 20px;
    }
    #calculate{
        box-sizing: border-box;
        width: 500px;
        height: 50px;
        background: rgba(0, 152, 153, 0.73);
        color: #FFFFFF;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 10px;
        text-align: center;
        margin: 30px auto;
    }
    .idbox{
        float: left;
    }
    h2{
        text-align: center;
    }
    .group71 {
        text-align: center;
    }



    /* Style for the custom checkbox container */
    .checkbox-cell {
        width: 20px;
        text-align: center;
    }

    /* Style for the custom checkbox */
    .checkbox-cell input[type="checkbox"] + label::before {
        /*content: '\2713'; !* Unicode checkmark symbol *!*/
        font-size: 20px;
        display: inline-block;
        cursor: pointer;
        transition: color 0.3s;
    }

    /* Style for checked custom checkbox */
    .checkbox-cell input[type="checkbox"]:checked + label::before {
        color: #007bff;
    }

    /* Style for the agreement text and view terms */
    .text-cell {
        flex: 1;
        display: flex;
        align-items: center;
    }

    .agreement-text {
        padding-left: 10px;
    }

    /* Style for the link to view terms */
    .view-terms a {
        text-decoration: none;
        color: #007bff;
        transition: color 0.3s;
    }

    .view-terms a:hover {
        color: #0056b3;
    }

    /* Add some margin between rows */
    .agreement-row {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    .agreement-table{
        width: 80%;
        margin: 0 auto;
        display: grid;
        text-align: left;
    }

    .mygroup-box{
        margin: 20px auto;
        display: flex;
        width: 70%;
    }

    .chartbox{
        display: block;
        box-sizing: border-box;
        height: 300px;
        width: 300px;
        margin: 0 auto;
    }
    .selecloc-1, .selecloc-2{
        width: 200px;
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
    .invite-img{
        width: 100px;
    }
    .invite-box{
        margin: 40px;
        text-align: center;
    }
    .group-member-img{
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
    }
    #accountSelect, #memberSelect{
        border: 1px solid #a4a4a4;
        padding: 10px;
        width: 205px;
    }
    .accountBtn, .memberBtn{
        padding: 10px;
        border: 1px solid #5e83aafc;
        background: #5e83aafc;
        color: white;
    }
    .category-selectbox{
        text-align: center;
        margin-bottom: 20px;
    }
</style>
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
                    <div class="accountName"></div>
                    <div class="accountNum"></div>
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
                            $.ajax({
                                url:'/selectGroupAccountInfo',
                                data: { memberId : memberId },
                                method: "POST",
                                success: function(response) {
                                    document.querySelector('.accountName').textContent = response.group_name;
                                    document.querySelector('.accountNum').textContent = response.group_account;
                                    const hanaClass = document.querySelector('.hanaClass');
                                    hanaClass.textContent = "총 "+response.g_balance.toLocaleString()+"원";
                                    const newAccount = document.querySelector('.newAccount');
                                    newAccount.textContent = response.g_month + " "+response.g_day+"일, "+response.g_dues+"만원씩";
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
                        <button class="applyBtn" onclick="accountTransfer()">이체</button>
                    </div>
                    <div class="applyBox">
                        <button class="applyBtn1" onclick="location.href='/travel'">여행하러가기</button>
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
                <div class="modal" id="myModal">
                    <div class="modal-content">
                        <span class="close-btn" onclick="closeModal()">&times;</span>
                        <h2>비밀번호 입력</h2>
                        <div class="group71">
                            <div class="groupForm" id="groupForm">
                                <br/>
                                <div class="flexClass">
                                    <span class="idbox">비밀번호</span>
                                    <input type="password" name="groupPwd" class="rec6" placeholder="비밀번호를 입력해주세요"/>
                                </div>
                                <br/>
                                <div class="agreement-table">
                                    <label for="agree_all">
                                        <input type="checkbox" name="agree_all" id="agree_all">
                                        <span>모두 동의합니다</span>
                                    </label>
                                    <label>
                                        <input type="checkbox" name="agree" value="1">
                                        <span>서비스 이용약관 동의<strong>(필수)</strong></span>
                                    </label>
                                    <label>
                                        <input type="checkbox" name="agree" value="2">
                                        <span>개인정보처리방침 동의<strong>(필수)</strong></span>
                                    </label>
                                    <label>
                                        <input type="checkbox" name="agree" value="3">
                                        <span>개인정보처리방침 동의<strong>(필수)</strong></span>
                                    </label>
                                    <label>
                                        <input type="checkbox" name="agree" value="4">
                                        <span>위치정보사업 약관 동의<strong>(필수)</strong></span>
                                    </label>
                                    <label>
                                        <input type="checkbox" name="agree" value="5">
                                        <span>마케팅 수집 동의<strong class="select_disable">(선택)</strong></span>
                                    </label>
                                </div>
                            </div>
                            <button id="calculate" onclick="submitForm()">
                                <span>접속하기</span>
                            </button>

                        </div>
                    </div>

                </div>
                <div class="modal" id="inviteModal">
                    <div class="modal-content">
                        <span class="close-btn" onclick="inviteCloseModal()">&times;</span>
                        <h2>초대수락</h2>
                        <div class="invite-box">
                            <img class="invite-img" src="../../../resources/images/invite.png">
                        </div>
                        <div class="group71">
                            <button class="selecloc-1" onclick="location.href='/'">초대수락</button>
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
<script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
<script>
    function getTransactionsByAccount(){
        //선택한 계좌
        var selectedAccount = $("#accountSelect").val();
        $.ajax({
            url:'/getTransactionsByAccount',
            method: "POST",
            data : {accountNum : selectedAccount},
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
           console.log(response)
            var accountSelect = $('#accountSelect');
            response.forEach(function(account) {
                accountSelect.append($('<option>', {
                    value: account.account_num,
                    text: account.account_num // 계좌 번호 또는 다른 필요한 데이터로 대체할 수 있습니다.
                }));
            });
        },
        error: function(error) {
            console.error("Error occurred:", error);
        }
    });
    function groupAccountStatement() {
        var table = $('#example').DataTable({
            lengthChange: false,
            buttons: [ 'copy', 'excel', 'pdf', 'colvis' ],
            columns: [
                { data: 'group_account_tid' },
                { data: 'account_num' },
                { data: 'name' },
                { data: 'transaction_type' },
                { data: 'amount' },
                { data: 'balance' },
                { data: 'transaction_date' },
                { data: 'transaction_content' },
            ]
        });
        $.ajax({
            url: "/selectGroupAccountStatement",
            type: "POST",
            success: function (data) {
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
            console.log(response);
            var groupmember = document.querySelector('.stepper');
            response.forEach(function(member) {
                var groupMemberImg = document.createElement('img');
                groupMemberImg.className = 'group-member-img';
                groupMemberImg.src = member.kakao_img;
                groupmember.appendChild(groupMemberImg);
            });
        },
        error: function (error) {
            console.error(error);
        },
    });
    $.ajax({
        type: "POST",
        url: "/selectGroupAccountChart",
        data: { groupId: "${groupId}" },
        success: function (response) {
            console.log(response)
            var memberSelect = $('#memberSelect');
            memberSelect.empty();

            response.forEach(function(member) {
                memberSelect.append($('<option>', {
                    value: member.member_id,
                    text: member.name // 멤버 이름 또는 다른 필요한 데이터로 대체할 수 있습니다.
                }));
            });
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

    // 랜덤 색상 생성 함수
    function getRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }
    // 동의 모두선택 / 해제
    const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
        let agreeChk = document.querySelectorAll('input[name=agree]');
        for(let i = 0; i < agreeChk.length; i++){
            agreeChk[i].checked = e.target.checked;
        }
    });
    function deposit(){
        var groupAccount = "${sessionScope.groupAccountDetail}";

        if(groupAccount !=""){
            //회비 입금
            location.href='/deposit';
        }else{
            //계좌개설
            location.href='/account';
        }
    }
    function accountTransfer(){
        location.href ='/transfer';
    }
    function submitForm(){
        var modal = document.getElementById('myModal');
        modal.style.display = 'none';
        var groupId = "${groupId}";

        var groupPwdInputs = document.getElementsByName("groupPwd");
        var firstGroupPwdInput = groupPwdInputs[0];
        var groupPwdValue = firstGroupPwdInput.value;

        $.ajax({
            type: "POST",
            url: "/inputCheckPassword",
            data: { groupId : groupId },
            success: function(response) {
                if(groupPwdValue === response){
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
    }

    function totalGroupAccountStat(){
        var groupId = "${groupId}";
        $.ajax({
            type: "POST",
            url: "/totalGroupAccountStat",
            data: { groupId : groupId },
            success: function(response) {
                // console.log(response+ " totalGroupAccountStat");
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
                    if(response.pw_state !=1){
                        //모임원인데 비밀번호입력안한 모임원만 비밀번호입력
                        openModal();
                    }else {
                        connectAccount();
                    }
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
    /*
    function groupAccountStatement(){
        //모임통장 거래내역
        $.ajax({
            type: "POST",
            url: "/selectGroupAccountStatement",
            success: function (response) {
                if(response!="") {
                    var tableBody = document.querySelector(".fold-table tbody");

                    response.forEach(function (item) {
                        // 데이터 행 생성
                        var dataRow = document.createElement("tr");
                        dataRow.className = 'view';

                        var td = document.createElement("td");
                        td.textContent = item.account_num;

                        var tdcur = document.createElement("td");
                        tdcur.className = 'cur';
                        tdcur.textContent = item.target_account_num;

                        var tdpcs = document.createElement("td");
                        tdpcs.className = 'pcs';
                        tdpcs.textContent = item.transaction_date;

                        var tdcur1 = document.createElement("td");
                        tdcur1.className = 'cur';
                        tdcur1.textContent = item.transaction_type;

                        var tdper = document.createElement("td");
                        tdper.className = 'per';
                        tdper.textContent = item.amount;

                        var tdper1 = document.createElement("td");
                        tdper1.className = 'per';
                        tdper1.textContent = item.balance;

                        var tdper2 = document.createElement("td");
                        tdper2.className = 'per';
                        tdper2.textContent = item.transaction_content;


                        // .fold 클래스 요소 생성
                        var foldElement = document.createElement("tr");
                        foldElement.className = 'fold';

                        // 각 요소를 해당 부모 요소에 추가
                        dataRow.appendChild(td);
                        dataRow.appendChild(tdcur);
                        dataRow.appendChild(tdpcs);
                        dataRow.appendChild(tdcur1);
                        dataRow.appendChild(tdper);
                        dataRow.appendChild(tdper1);
                        dataRow.appendChild(tdper2);

                        tableBody.appendChild(dataRow);
                    });
                }else{
                    console.log("거래내역이 없음")
                }
            },
            error: function (error) {
                // 오류 처리
            }
        });
    }*/
    function openModal() {
        var modal = document.getElementById('myModal');
        modal.style.display = 'block';
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