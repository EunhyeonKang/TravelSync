<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/conacoount.css">
    <link rel="stylesheet" href="../../../resources/css/calTravel.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="backgroundbox">
        <div class="topbox">
            <div class="contents">
                <div class="contents-1">
                    <c:forEach items="${sessionScope.travelNoti}" var="travelNoti">
                        <script>
                            var httpPattern = /^(http|):\/\//;
                            $.ajax({
                                url: '/selectNoti',
                                method: "GET",
                                data: {
                                    groupId: ${travelNoti.groupId}
                                },
                                success: function (response) {
                                    var container1 = document.querySelector('.grid-container-1');
                                    var calMember = document.querySelector('.cal-member');
                                    calMember.textContent = response.length + "명";
                                    response.forEach(function (val) {
                                        var item = document.createElement('div');
                                        item.className = 'grid-item';
                                        var itemImg = document.createElement('img');
                                        itemImg.className = 'grid-img';
                                        if (httpPattern.test(val.kakao_img)) {
                                            itemImg.src = val.kakao_img;
                                        } else {
                                            itemImg.src = '../../../resources/upload/profile/'+val.kakao_img;
                                        }
                                        var itemP = document.createElement('p');
                                        itemP.className = 'item-p';
                                        itemP.textContent = val.amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                                        item.appendChild(itemImg);
                                        item.appendChild(itemP);
                                        container1.appendChild(item);
                                    });
                                },
                                error: function (error) {
                                    console.error("Error occurred:", error);
                                }
                            });
                        </script>
                    <div class="container">
                        <div class="accordion" id="accordionExample">
                            <div class="steps">
                                <progress id="progress" value=0 max=100 ></progress>
                                <div class="step-item">
                                    <button class="step-button text-center" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        1
                                    </button>
                                    <div class="step-title">
                                        회비 정보 확인
                                    </div>
                                </div>
                                <div class="step-item">
                                    <button class="step-button text-center collapsed" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            2
                                    </button>
                                    <div class="step-title">
                                        모여라회비 내용 입력
                                    </div>
                                </div>
                                <div class="step-item">
                                    <button class="step-button text-center collapsed" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        3
                                    </button>
                                    <div class="step-title">
                                        회비납부 완료
                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div  id="headingOne">
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                                     data-bs-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="card-box">
                                            <div class="left-box">
                                                <div>
                                                    <div>모여라회비(N/1)</div>
                                                    <div>${travelNoti.groupName} 모임</div>
                                                    <img src="../../../resources/images/new_2204_my_r_img002.png">
                                                </div>
                                                <button class="calImg" onclick="location.href='/saveTravel'"><img src="../../../resources/images/search.png">여행 자세히 보기</button>
                                            </div>
                                            <div class="right-box">
                                                <span>
                                                    <h3>${travelNoti.travelTitle}</h3>
                                                    <span>여행기간 : [${fn:substring(travelNoti.travelStart, 0, 10)} ~ ${fn:substring(travelNoti.travelEnd, 0, 10)}]</span></h2>
                                                </span>

                                                <div class="cal-member-amount">
                                                    <span>회비 인원 : <span class="cal-member">3명</span></span><span>총 금액 :<span> <fmt:formatNumber type="number" value="${travelNoti.etc_expenses+travelNoti.food_expenses+travelNoti.accommodation_expenses}" pattern="#,###" />원</span></span>
                                                </div>
                                                <div class="grid-container-1">
                                                </div>
                                                <div class="grid-container">
                                                    <div class="grid-item">
                                                        <div class="item-food">식비</div>
                                                        <div class="item-food-1"><fmt:formatNumber type="number" value="${travelNoti.food_expenses}" pattern="#,###"/>원</div>
                                                    </div>
                                                    <div class="grid-item">
                                                        <div class="item-food">숙박비</div>
                                                        <div class="item-food-1"><fmt:formatNumber type="number" value="${travelNoti.accommodation_expenses}" pattern="#,###"/>원</div>
                                                    </div>
                                                    <div class="grid-item">
                                                        <div class="item-food">문화/기타</div>
                                                        <div class="item-food-1"><fmt:formatNumber type="number" value="${travelNoti.etc_expenses}" pattern="#,###"/>원</div>
                                                    </div>
                                                </div>
                                                <div class="c">
                                                    <label for="faq-${travelNoti.travelId}">
                                                        💰${sessionScope.member.name} 님이 납부할 금액은 <span class="amount"><fmt:formatNumber type="number" value="${travelNoti.amount}" pattern="#,###"/></span>원입니다.
                                                    </label>
                                                </div>
                                                <input type="hidden" value="${travelNoti.travelId}" id="notiTravelId">
                                                <button class="travel-btn">회비 납부하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div  id="headingTwo">
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="card-row">
                                            <div class="container2">
                                                <div class="day">납부할 내용을 입력해주세요</div>
                                                <button class="addplace-1"><div class="addtext"> <span class="account-number">${travelNoti.groupAccount}</span></div></button>
                                            </div>
                                            <input type="hidden" value="${travelNoti.groupAccount}" name="group_account">
                                            <input type="hidden" value="${travelNoti.groupId}" name="group_id">
                                            <span class="bank">${groupAccount.group_name}</span>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div>
                                                        <span class="idbox">출금 은행</span>
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
                                                        <input type="text" name="group_name" value="${sessionScope.groupAccountDetail.group_name}"/>
                                                        <br/>
                                                        <span class="idbox">입금 계좌</span>
                                                        <input type="text" name="group_account" value="${sessionScope.groupAccountDetail.group_account} (<fmt:formatNumber type="number" value="${sessionScope.groupAccountDetail.g_balance}" pattern="#,###" />원)"/>
                                                        <br/>
                                                        <span class="idbox">포인트<button class="selectpoint" id="selectPoint">조회</button></span>
                                                        <input type="text" name="point" value="0" placeholder="포인트를 입력해주세요"/>
                                                        <br/>
                                                        <span class="idbox">입금 금액</span>

                                                        <input type="text" name="balance" value="<fmt:formatNumber type='number' value='${travelNoti.amount}' pattern='#,###원'/>" placeholder="입금 금액을 입력해주세요"/>

                                                    </form>
                                                </div>
                                                <div class="tvlbuttons">
                                                    <button class="tvlbtn2" onclick="calExecution()">
                                                        <div>납부하기</div>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div  id="headingThree">
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                                     data-bs-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="tvlbuttons">
                                            <img src="../../../resources/images/complate.png" style="width: 100px; margin: 20px auto;">
                                            <p class="complatetext1"><strong>${travelNoti.groupName}</strong>에서 등록한 <strong>${travelNoti.travelTitle}</strong>일정의</p>
                                            <p class="complatetext2">모여라회비 납부를 성공했습니다.</p>
                                            <button class="complatecal" onclick="location.href='/mypage'">
                                                <div>모여라회비 내역보기</div>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="myModal" >
        <div id="pincode">
            <div class="table">
                <div class="cell">
                    <div id="anleitung">
                        <div class="close" onclick="closeModal()">x</div>
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
    <div id="pointModal" class="pointModal">
        <div class="point-modal-content">
            <span class="pointModalclose">&times;</span>
            <h3 class="pointh3"><img src="../../../resources/images/cashback.png" style="width: 35px;margin-right: 10px;">
                포인트 조회 결과</h3>
            <p class="pointp">- 추가할 포인트를 선택해주세요</p>
            <table class="pointTable">
                <thead>
                <tr>
                    <th>선택</th>
                    <th>포인트 내용</th>
                    <th>포인트</th>
                </tr>
                </thead>
                <tbody id="pointDetails">
                </tbody>
            </table>
            <div id="totalPoints"></div>
        </div>
    </div>

    <div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">(모여라)회비 실행 확인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    (모여라)회비 실행하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" onclick="executeCal()">확인</button>
                </div>
            </div>
        </div>
    </div>
<%--    <%@ include file="../include/footer.jsp" %>--%>
</div>
</body>
<script>
    function closeModal(){
        document.querySelector('#myModal').style.display = 'none';
    }
    function openModal(){
        confirmationModal.hide();
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
                                    var selectedOption = $('#selecttype option:selected');
                                    var selectType = document.getElementById("selecttype");
                                    var accountNum = selectedOption.attr('data-account-num');
                                    var selectedOption = selectType.options[selectType.selectedIndex];
                                    var accountBank = selectedOption.text;
                                    var groupName = document.querySelector('input[name="group_name"]').value;
                                    var groupAccount = document.querySelector('input[name="group_account"]').value;
                                    var amount = document.querySelector('input[name="balance"]').value;
                                    var numericValue = amount.replace(/\D/g, '');
                                    var travelId = document.querySelector('#notiTravelId').value;
                                    var groupId =document.querySelector('input[name="group_id"]').value;

                                    var pointInput = document.querySelector('input[name="point"]');
                                    var point = pointInput ? pointInput.value : "0";

                                    var dataToSend = {
                                        accountBank: accountBank,
                                        accountNum: accountNum,
                                        groupName: groupName,
                                        groupAccount: groupAccount,
                                        amount : numericValue,
                                        groupId : groupId,
                                        travelId : travelId,
                                        point : point
                                    };

                                    $.ajax({
                                        url: '/calExecution',
                                        method: "POST",
                                        data: JSON.stringify(dataToSend),
                                        contentType: "application/json; charset=UTF-8",
                                        success: function (response) {
                                            // 모달 숨기기
                                            const step3Button = document.querySelectorAll('.step-button')[2];
                                            step3Button.click();
                                        },
                                        error: function (error) {
                                            console.error("Error occurred:", error);
                                        }
                                    });
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
    // 모달 열기 버튼 클릭 시
    $('#selectPoint').click(function(event){
        event.preventDefault();

        $.ajax({
            url: '/selectPointListOfMember',
            method: "POST",
            success: function (response) {
                var pointDetails = document.getElementById('pointDetails');
                pointDetails.innerHTML = '';

                var totalPoints = 0;

                response.forEach(function(item){
                    var row = document.createElement('tr');

                    var checkboxCell = document.createElement('td');
                    var checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    checkboxCell.appendChild(checkbox);

                    var contentCell = document.createElement('td');
                    contentCell.textContent = item.poi_content;

                    var pointCell = document.createElement('td');
                    var pointValue = item.poi_point;
                    pointCell.textContent = pointValue + 'P';
                    pointCell.style.textAlign = 'right';

                    // 체크박스 상태가 변경될 때 합계 업데이트
                    checkbox.addEventListener('change', function() {
                        if (checkbox.checked) {
                            totalPoints += pointValue;
                        } else {
                            totalPoints -= pointValue;
                        }
                        updateTotalPoints(totalPoints); // 합계 업데이트 함수 호출
                    });

                    row.appendChild(checkboxCell);
                    row.appendChild(contentCell);
                    row.appendChild(pointCell);

                    pointDetails.appendChild(row);
                });

                // 모달 열기
                var modal = document.getElementById('pointModal');
                modal.style.display = 'block';

                // 합계 업데이트 함수 호출
                updateTotalPoints(totalPoints);

                // 합계를 표시하는 함수
                function updateTotalPoints(totalPoints) {
                    var totalPointsElement = document.getElementById('totalPoints');
                    totalPointsElement.innerHTML = ''; // 이전 내용 초기화

                    // 합계 표시를 위한 요소들 생성 및 추가
                    var totaltext = document.createElement('div');
                    totaltext.className = 'totaltext';
                    totaltext.textContent = '합계 : ';

                    var totalPoint = document.createElement('div');
                    totalPoint.className = 'totalPoint';
                    totalPoint.textContent = totalPoints + 'P';

                    var totalBtn = document.createElement('button');
                    totalBtn.className = 'totalBtn';
                    totalBtn.textContent = '추가';

                    // 추가 버튼 클릭 시 포인트 입력란에 합계 추가
                    totalBtn.addEventListener('click', function() {
                        var pointInput = document.querySelector('input[name="point"]');
                        var balanceInput = document.querySelector('input[name="balance"]');
                        var balance = parseInt(balanceInput.value.replace(/\D/g, ''),10);
                        pointInput.value = totalPoints + 'P';
                        var result = balance - totalPoints;
                        var formattedResult = result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                        balanceInput.value = formattedResult;
                        document.getElementById('pointModal').style.display = 'none';
                    });

                    totalPointsElement.appendChild(totaltext);
                    totalPointsElement.appendChild(totalPoint);
                    totalPointsElement.appendChild(totalBtn);
                }
            },
            error: function (error) {
                console.error("Error occurred:", error);
            }
        });
    });


    // 모달 닫기 버튼 클릭 시
    var closeBtn = document.getElementsByClassName('pointModalclose')[0];
    closeBtn.onclick = function() {
        var modal = document.getElementById('pointModal');
        modal.style.display = 'none';
    }

    // 모달 외부 클릭 시 모달 닫기
    window.onclick = function(event) {
        var modal = document.getElementById('pointModal');
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    }


    var confirmationModal = new bootstrap.Modal(document.getElementById('confirmationModal'));
    function calExecution() {
        confirmationModal.show();
    }
    function executeCal() {
        openModal();

    }

    $.ajax({
        url: '/selectBackAccount',
        method: "POST",
        success: function (response) {
            var select = document.getElementById('selecttype');
            var inputAccountNum = $('input[name=accountNum]');

            response.forEach(function (item) {
                var option = document.createElement('option');
                option.value = item.account_id;
                option.text = item.account_bank;
                option.setAttribute('data-account-num', item.account_num);
                option.setAttribute('data-balance', item.balance);
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
                    accountNumber.textContent = "(주계좌) " + item.account_bank + " " + item.account_num;
                    option.selected = true;
                    inputAccountNum.val(item.account_num + "(" + parseFloat(item.balance).toLocaleString() + "원)");
                }
            });
            select.addEventListener('change', function () {
                var selectedOption = select.options[select.selectedIndex];
                const bank = document.querySelector('.bank');
                const accountBalance = selectedOption.getAttribute('data-balance');
                const formattedBalance = parseFloat(accountBalance).toLocaleString();
                bank.textContent = selectedOption.text;
                const accountNum = selectedOption.getAttribute('data-account-num');
                inputAccountNum.val(accountNum + ' (' + formattedBalance + '원)');
            });
        },
        error: function (error) {
            console.error("Error occurred:", error);
        }
    });

    const stepButtons = document.querySelectorAll('.step-button');
    const progress = document.querySelector('#progress');

    Array.from(stepButtons).forEach((button, index) => {
        button.addEventListener('click', () => {
            progress.setAttribute('value', (index * 100) / (stepButtons.length - 1));

            stepButtons.forEach((item, secindex) => {
                if (index > secindex) {
                    item.classList.add('done');
                }
                if (index < secindex) {
                    item.classList.remove('done');
                }
            });
        });
    });
    const calBtn = document.querySelector('.travel-btn');
    calBtn.addEventListener('click', () => {
        const step2Button = document.querySelectorAll('.step-button')[1];
        step2Button.click();
    });

</script>
</html>
