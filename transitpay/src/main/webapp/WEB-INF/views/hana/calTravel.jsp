<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/conacoount.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<style>
    .bank{
        display: none;
    }

    .backgroundbox{
         width: 100%;
         height: 300px;
         background: #259cfe;
         position: relative;
     }
    .backgroundbox .topbox{
        width: 1400px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translateX(-50%);
        margin-top: -50px;
        background: #c3d4e9;
    }
    #myModal{
        display: none;
    }
    .contents-1{
        width: 80%;
        margin: 50px auto;
    }

    /* 여행 일정 요소 스타일 */
    .c {
        border: 1px solid #ddd;
        padding: 20px;
        margin-bottom: 20px;
        background-color: #fff;
        border-radius: 5px;
        font-weight: 700;
    }

    /* 체크박스 스타일 */
    input[type="checkbox"] {
        margin-right: 10px;
    }

    /* 제목 스타일 */
    h1 {
        font-size: 18px;
        margin-top: 0;
        margin-bottom: 10px;
    }

    /* 레이블 스타일 */
    label {
        display: block;
        padding-left: 30px;
        position: relative;
        cursor: pointer;
    }

    /* 여행 버튼 스타일 */
    .travel-btn {
        background-color: #ffffff;
        color: #767676;
        border: 0;
        cursor: pointer;
        margin: 0 auto;
        text-align: center;
        padding: 12px;
        border: 5px solid #ddd;
        width: 100%;
        font-size: 18px;
        font-weight: 700;
    }
    .steps {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1rem;
        position: relative;
    }
    .step-button {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        border: none;
        background: white;
        transition: .4s;
        font-size: 20px;
        font-weight: 700;
        color: #7d7d7d;
    }
    .step-button[aria-expanded="true"] {
        width: 60px;
        height: 60px;
        background-color: #1b3285;
        color: #ffffff;
        font-weight: 700;
        font-size: 20px;
    }
    .done {
        background-color: white;
        color: #7d7d7d;
    }
    .step-item {
        z-index: 10;
        text-align: center;
    }
    #progress {
        -webkit-appearance:none;
        position: absolute;
        width: 95%;
        z-index: 5;
        height: 10px;
        margin-left: 18px;
        margin-bottom: 18px;
        background: white;
    }
    /* to customize progress bar */
    #progress::-webkit-progress-value {
        background-color: white;
        transition: .5s ease;
    }
    #progress::-webkit-progress-bar {
        background-color: white;

    }
    .card-box{
        display: flex;
    }
    .left-box{
        width: 40%;
        border-right: 1px solid #ddd;
        padding: 10px;
    }
    .left-box > div{
        font-weight: 700;
        font-size: 30px;
        margin-top: 5px;
        text-align: center;
    }
    .grid-container, .grid-container-1 {
        display: grid;
        grid-template-columns: repeat(3, 1fr); /* 3열로 구성 */
        grid-gap: 20px; /* 박스 간격 설정 */
        margin-bottom: 20px;
    }

    /* 그리드 아이템 스타일 */
    .grid-item {
        border: 1px solid #ccc;
        padding: 20px;
        text-align: center;
        background-color: #fff;
        border-radius: 5px;
        width: 185px;
    }
    .calImg{
        border: 0;
        padding: 10px;
        color: white;
        background: #3F51B5;
        font-weight: 700;
        border-radius: 5px;
        font-size: 20px;
        width: 400px;
    }
    .right-box{
        margin: 30px;
    }
    .item-food{
        float: left;
        color: #747474;
    }
    .item-food-1{
        font-size: 16px;
        float: right;;
    }
    .cal-member-amount{
        display: flex;
        flex-direction: column;
        font-size: larger;
        margin-bottom: 10px;
    }
    .grid-img{
        width: 50px;
        height: 50px;
        border-radius: 50px;
        margin-top: 5px;
    }
    .item-p{
        margin-top: 15px;
        color: #eb1158;
        font-weight: 600;
    }
    .step-title{
        margin-top: 5px;
        font-weight: 700;
        color: #494d4b;
    }
    .amount{
        color: #eb1158;
    }
    /*휴대폰 로그인*/
    .login{
        color: #413c3c;
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
        mix-blend-mode: normal;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        margin: 10px 0 5px 0;
        background: 0;
        border: 0;
        border-bottom: solid 3px #b1b1b1;
        color: white;
    }
    #phone-number::placeholder, #auth-number::placeholder{
        text-align: left;
        color: white;
        background: 0;
    }
    .confirm-button,  #auth-req-button{
        align-items: center;
        justify-content: center;
        width: 25%;
        float: right;
        border: 1px solid #a7a9a9;
        background-color: #a7a9a9;
        mix-blend-mode: normal;
        color: white;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 10px;
        margin: 10px 0 14px 0;
        color: #010101;
        font-weight: 700;
        padding: 15px 0;
        font-size: 15px;
    }
    .authbox{
        width: 100%;
    }

    .phone-container{
        width: 100%;
        text-align: center;
    }
    input::placeholder{
        text-align: center;
    }
    .button-container:hover{
        transform:scale(1.01);
        transition: transform .2s;
    }

    .grid-container-2 {
        display: grid;
        grid-template-columns: repeat(2, 1fr); /* 2열로 구성 */
        grid-gap: 20px; /* 그리드 아이템 간격 설정 */
        margin-bottom: 20px;
    }

    .grid-item-2 {
        border: 1px solid #ccc;
        padding: 20px;
        text-align: center;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .item-content {
        font-size: 18px;
        font-weight: 600;
    }

    .item-content h3 {
        margin-top: 0;
        margin-bottom: 10px;
        color: #333;
    }

    .item-content p {
        color: #666;
    }
    .login > p{
        text-align: left;
        font-weight: 700;
        font-size: 22px;
    }
    .row{
        margin-top: 15px;
    }
    #searchForm-1 input{
        border: 1px solid #bbb;
        border-radius: 10px;
        margin-top: 5px;
        margin-bottom: 5px;
        padding: 14px;
    }
    #searchForm{
        display: flex;
    }
    .card-row{
        padding:30px;
    }
    #searchForm-1 input{
        border: 1px solid #bbb;
        border-radius: 10px;
        margin-top: 5px;
        margin-bottom: 5px;
        width: 95%;
    }
    .idbox{
        margin-top: 5px;
        display: flex;
    }
    .tvlbtn2{
        box-sizing: border-box;
        height: 50px;
        margin-top: 30px;
        background: #2196F3;
        border-radius: 10px;
        float: left;
        border: 0;
    }
    .modal-content{
        margin-top: 500px;
    }
    .modal-body{
        text-align: center;
    }
    .calComplate{
        color: #707473;
        padding: 40px;
        margin: 0 auto;
        text-align: center;
        font-weight: 700;
        font-size: 20px;
    }
    input[type="text"]::placeholder {
        text-align: left;
    }
    .selectpoint{
        margin-left: 5px;
        border-radius: 5px;
        border: 0;
        background: black;
        color: white;
        font-size: 12px;
    }
    /* 모달 스타일 */
    .pointModal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        z-index: 1;
    }

    .point-modal-content {
        background-color: #fff;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 8px;
        width: 60%;
        max-width: 600px;
        position: relative;
    }

    .pointModalclose {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 24px;
        font-weight: bold;
        cursor: pointer;
    }

    /* 테이블 스타일 */
    .pointTable {
        width: 100%;
        border-collapse: collapse;
    }

    .pointTable th, .pointTable td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
    }

    .pointTable th {
        background-color: #009688;
        font-weight: bold;
        text-align: center;
        color: white;
    }

    /* 체크박스 스타일 */
    .pointTable input[type="checkbox"] {
        margin-right: 5px;
    }

    /* 테이블 내용 스타일 */
    .pointTable tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .pointTable tr:hover {
        background-color: #ddd;
    }
    .pointh3{
        padding: 10px 0;
        color: #757575;
        font-size: 23px;
    }
    .pointp{
        font-size: 14px;
        color: #929292;
    }
    #totalPoints{
        text-align: center;
        font-weight: 700;
        font-size: 20px;
        display: flex;
        width: 500px;
        margin: 0 auto;
        justify-content: center;
        padding-top: 20px;
    }
    .totaltext{
        color: #717171;
        font-size: 19px;
    }
    .totalPoint{
        color: #2196F3;
        margin: 0 10px;
    }
    .totalBtn{
        border: 0;
        background: #0c151a;
        font-size: 13px;
        width: 80px;
        border-radius: 8px;
        color: white;
        font-weight: 700;
    }
    .tvlbuttons{
        width: 100%;
        text-align: center;
        display: grid;
        justify-content: center;
    }
    .complatecal{
        border: 0;
        background: #0b0b0b;
        padding: 10px;
        font-weight: 700;
        color: white;
        border-radius: 5px;
        margin: 10px;
    }
    .complatetext1{
        margin-bottom: 2px;
    }
    .complatetext1{

    }
    strong{
        color: #008485;
    }
</style>
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
                                        itemP.textContent = val.amount + "원";
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
                                                    <span>회비 인원 : <span class="cal-member">3명</span></span><span>총 금액 : <span>${travelNoti.etc_expenses+travelNoti.food_expenses+travelNoti.accommodation_expenses}</span>원</span>
                                                </div>
                                                <div class="grid-container-1">
                                                </div>
                                                <div class="grid-container">
                                                    <div class="grid-item">
                                                        <div class="item-food">식비</div>
                                                        <div class="item-food-1">${travelNoti.food_expenses}원</div>
                                                    </div>
                                                    <div class="grid-item">
                                                        <div class="item-food">숙박비</div>
                                                        <div class="item-food-1">${travelNoti.accommodation_expenses}원</div>
                                                    </div>
                                                    <div class="grid-item">
                                                        <div class="item-food">문화/기타</div>
                                                        <div class="item-food-1">${travelNoti.etc_expenses}원</div>
                                                    </div>
                                                </div>
                                                <div class="c">
                                                    <label for="faq-${travelNoti.travelId}">
                                                        💰${sessionScope.member.name} 님이 납부할 금액은 <span class="amount">${travelNoti.amount}</span>원입니다.
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
                                                        <input type="text" name="group_account" value="${sessionScope.groupAccountDetail.group_account} (${sessionScope.groupAccountDetail.g_balance})"/>
                                                        <br/>
                                                        <span class="idbox">포인트<button class="selectpoint" id="selectPoint">조회</button></span>
                                                        <input type="text" name="point" value="0" placeholder="포인트를 입력해주세요"/>
                                                        <br/>
                                                        <span class="idbox">입금 금액</span>
                                                        <input type="text" name="balance" value="${travelNoti.amount}" placeholder="입금 금액을 입력해주세요"/>
                                                    </form>
                                                </div>
                                                <div class="tvlbuttons">
                                                    <button class="tvlbtn2" onclick="calExecution()">
                                                        <div>정산실행</div>
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
                    <h5 class="modal-title" id="exampleModalLabel">정산 실행 확인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    정말로 정산을 실행하시겠습니까?
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
    // 모달 열기 버튼 클릭 시
    $('#selectPoint').click(function(event){
        event.preventDefault(); // 이벤트의 기본 동작 중단

        $.ajax({
            url: '/selectPointListOfMember',
            method: "POST",
            success: function (response) {
                // 데이터를 모달에 추가
                var pointDetails = document.getElementById('pointDetails');
                pointDetails.innerHTML = ''; // 이전 내용 초기화

                // 변수를 사용하여 체크한 포인트 합계 초기화
                var totalPoints = 0;

                // 데이터를 테이블 형식으로 추가
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
                        pointInput.value = totalPoints + 'P';
                        balanceInput.value = balanceInput.value - totalPoints;
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
        var selectedOption = $('#selecttype option:selected');
        var selectType = document.getElementById("selecttype");
        var accountNum = selectedOption.attr('data-account-num');
        var selectedOption = selectType.options[selectType.selectedIndex];
        var accountBank = selectedOption.text;
        var groupName = document.querySelector('input[name="group_name"]').value;
        var groupAccount = document.querySelector('input[name="group_account"]').value;
        var amount = document.querySelector('input[name="balance"]').value;
        var travelId = document.querySelector('#notiTravelId').value;
        var groupId =document.querySelector('input[name="group_id"]').value;

        var pointInput = document.querySelector('input[name="point"]');
        var point = pointInput ? pointInput.value : "0";
        var dataToSend = {
            accountBank: accountBank,
            accountNum: accountNum,
            groupName: groupName,
            groupAccount: groupAccount,
            amount : amount,
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
                confirmationModal.hide();
                const step3Button = document.querySelectorAll('.step-button')[2];
                step3Button.click();
            },
            error: function (error) {
                console.error("Error occurred:", error);
            }
        });
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
                    inputAccountNum.val(item.account_num + "(" + item.balance + ")");
                }
            });

            select.addEventListener('change', function () {
                var selectedOption = select.options[select.selectedIndex];
                const bank = document.querySelector('.bank');
                const accountBalance = selectedOption.getAttribute('data-balance');
                bank.textContent = selectedOption.text;
                const accountNum = selectedOption.getAttribute('data-account-num');
                inputAccountNum.val(accountNum + ' (' + accountBalance + ')');
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
