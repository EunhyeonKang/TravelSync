<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/travel.css">
    <link rel="stylesheet" href="../../../resources/css/conacoount.css">
    <script defer src="../../../resources/js/index.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>

</style>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        여행·일정 등록<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">연결계좌/카드관리</div>
            <div class="menuhr"><hr/></div>
            <a href="mypage">마이페이지</a>
            <a href="conaccount">연결계좌/카드관리</a>
            <a href="mytravel">내 여행</a>
            <!-- 추가 메뉴 항목들 -->
        </div>
        <div class="contents-1">
            <div class="exchange">
                <div class="exchange-1">
                    <div class="container2">
                        <div class="day">이체할 내용을 입력해주세요</div>
                        <div class="bank"></div>
                        <button class="addplace-1"><div class="addtext"> <span class="account-number">${groupAccount.group_account}</span></div></button>
                    </div>
                    <!-- 검색 화면 -->
                    <span class="bank">${groupAccount.group_name}</span>
                    <div class="row">
                        <div class="col-lg-12">
                            <div>
                                <span class="idbox">받는 사람 은행/계좌번호</span>
                                <div id="searchForm" action="" method="get">
                                    <select name="type" class="selecttype" id="selecttype">
                                    </select>
                                    <input type="hidden" name="accountId" value="">
                                    <input type="text" name="accountNum" value="">
                                    <input type="hidden" name="amount" value="">
<%--                                    <button type="button" class="pbuttonaction" id ="auth-res-button"><div class="selectaction">연결계좌 변경</div></button>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="searchForm-1" action="">
                                <span class="idbox">모임 통장</span>
                                <input type="text" name="group_name" value="${sessionScope.groupAccountDetail.group_name}" autocomplete="off"/>
                                <br/>
                                <span class="idbox">모임통장 계좌번호</span>
                                <input type="text" name="group_account" value="${sessionScope.groupAccountDetail.group_account} (잔액 : ${sessionScope.groupAccountDetail.g_balance})" autocomplete="off"/>
                                <br/>
                                <span class="idbox">이체 금액</span>
                                <input type="text" name="balance" value="" placeholder="이체 금액을 입력해주세요" autocomplete="off"/>
                                <span class="idbox">거래내용</span>
                                <input type="text" name="transaction_content" value="" placeholder="거래 내용을 입력해주세요" autocomplete="off"/>
                            </form>
                        </div>
                    </div>
<%--                    <div class="perrate">우대율 80%</div>--%>
                </div>
            </div>
            <div class="exchangebox">
                <div class="exchangebox-1">
                    모임 통장 계좌은 트래블싱크에서 계좌 연결 후 주 계좌로 설정이 필요합니다.<br>
                    이 후, 트래블싱크를 이용하여 상대방으로부터 입출금을 할 수 있습니다.<br>
                    입금,이체 메뉴를 선택하시면 거래할 수 있는 화면이 표시되고 계좌 입출금이 가능합니다.
                </div>
            </div>

            <div class="tvlbuttons">
                <button class="tvlbtn2" onclick="deposit()">
                    <div>이체</div>
                </button>
            </div>
        </div>
    </div>

    <%@ include file="../include/footer.jsp" %>
</div>
</body>
<script>
    //입출금
    function deposit(){
        var selectedOption = $('#selecttype option:selected');
        var selectType = document.getElementById("selecttype");
        var accountNum = selectedOption.attr('data-account-num');
        var selectedOption = selectType.options[selectType.selectedIndex];
        var accountBank = selectedOption.text;
        var groupName = document.querySelector('input[name="group_name"]').value;
        var groupAccount = "${sessionScope.groupAccountDetail.group_account}";
        var balance = document.querySelector('input[name="balance"]').value;
        var groupId = ${sessionScope.groupAccountDetail.group_id};
        var transaction_content = document.querySelector('input[name="transaction_content"]').value;
        var dataToSend = {
            accountBank: accountBank,
            accountNum: accountNum,
            groupName: groupName,
            groupAccount: groupAccount,
            balance: balance,
            transaction_content : transaction_content
        };

        $.ajax({
            type: "POST",
            url: "/insertGroupAccountTransfer",
            data: JSON.stringify(dataToSend),
            contentType: "application/json; charset=UTF-8", // 컨텐츠 타입 설정
            success: function(response) {
                alert("이체 성공");
                location.href='/mygroup/'+groupId;
            },
            error: function(error) {
            }
        });
    }

    window.onload = function() {
        $.ajax({
            url:'/selectBackAccount',
            method: "POST",
            success: function(response) {
                var select = document.getElementById('selecttype');
                var inputAccountNum = $('input[name=accountNum]'); // input 엘리먼트를 변수로 저장

                // 데이터를 옵션으로 추가
                response.forEach(function (item) {
                    var option = document.createElement('option');
                    option.value = item.account_id;
                    option.text = item.account_bank;
                    option.setAttribute('data-account-num', item.account_num); // 각 옵션에 account_num을 저장
                    option.setAttribute('data-balance', item.balance); // 각 옵션에 balance를 저장
                    select.appendChild(option);
                    if (item.account_main === '1') {
                        var main = document.createElement('div');
                        document.querySelector('input[name=accountId]').value = item.account_id;
                        main.style.color = '#E91E63';
                        main.style.marginLeft = '5px';
                        main.textContent = '(주계좌)';

                        const bank = document.querySelector('.bank');
                        bank.textContent = item.account_bank;
                        bank.appendChild(main);
                        const accountNumber = document.querySelector('.account-number');
                        accountNumber.textContent = "(주계좌) "+item.account_bank + " " +item.account_num;
                        option.selected = true;
                        inputAccountNum.val(item.account_num + " (잔액 : "+item.balance+")");
                    }
                });
                // select 요소의 변경 이벤트 리스너 추가
                select.addEventListener('change', function () {
                    var selectedOption = select.options[select.selectedIndex];
                    const bank = document.querySelector('.bank');
                    const accountBalance = selectedOption.getAttribute('data-balance'); // 선택한 옵션의 balance 가져오기
                    bank.textContent = selectedOption.text;
                    const accountNum = selectedOption.getAttribute('data-account-num'); // 선택한 옵션의 account_num 가져오기
                    inputAccountNum.val(accountNum + ' (잔액 : ' + accountBalance + ')'); // input에 account_num과 잔액 설정
                });
            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });
    }

</script>
</html>
