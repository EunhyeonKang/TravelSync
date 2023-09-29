<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../../../resources/css/taffic.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>

        div.c {
            position: relative;
            margin: 2em 0 0 0;
        }
        input {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            opacity: 0;

        }
        h1 {
            padding: 23px 15px 10px 15px;
            position: relative;
            color: #414141;
            box-shadow: 9px -4px 15px 0px #e5e5e5;
            border-radius: 10px;
            margin: 0;
            background: aliceblue;
        }
        label::before {
            content: "";
            border: 15px solid transparent;
            font-size: 20px;
        }
        label {
            cursor: pointer;
            position: relative;
            align-items: center;
            font-size: 20px;
        }
        div.p {
            max-height: 0;
            overflow: auto;
            transition: max-height 0.5s ease;
            background-color: white;
            box-shadow: 3px 3px 20px 0 rgba(0, 0, 0, 0.2);
            text-align: center;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        /* 스크롤바 스타일링 */
        div.p::-webkit-scrollbar {
            width: 10px;  /* 스크롤바의 너비 */
        }
        div.p::-webkit-scrollbar-thumb {
            height: 30%; /* 스크롤바의 길이 */
            background: #848484; /* 스크롤바의 색상 */
            border-radius: 10px;
        }
        div.p::-webkit-scrollbar-track {
            background: #84848447;  /* 스크롤바 뒷 배경 색상 */
        }

        div.p p {
            padding: 10px 0 0 20px;
        }

        input:checked ~ h1 ~ div.p {
            max-height: 600px;
        }
        .faq-235 {
            font-size: 20px;
        }
        .travel-date-text {
            text-align: left;
            display: flex;
            align-items: center;
            height: 50px;
        }
        .travel-date-text span img {
            max-height: 100%;
            margin-right: 10px;
            width: 30px;
        }
        .travel-date-text-1 {
            text-align: right;
        }

        .schedule-card {
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 10px;
            padding: 10px;
            display: flex;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            transition: transform 0.3s ease-in-out;
            flex: 1;
            text-align: left;
        }

        .schedule-card:hover {
            transform: translateY(-5px);
        }

        .schedule-card h3 {
            font-size: 18px;
            margin-bottom: 10px;
            flex: 1;
        }

        .schedule-card p {
            margin: 0;
            font-size: 14px;
            flex: 1;
        }

        .schedule-card p:first-child {
            font-weight: bold;
        }

        /* 여행 일정 카드 내부의 각 항목 스타일링 */
        .schedule-card .category {
            color: #007BFF;
        }
        .item-img{
            width: 200px;
            height: 200px;
            border-radius: 100px;
        }

        #myChart {
            width: 500px !important;
            height: 500px !important;
            /*display: block;*/
            margin: 10px auto;
            box-sizing: border-box;
        }
        .totalTravel{
            font-size: 25px;
            font-weight: 700;
            color: #252525;
            margin-top: 20px;
        }

        .slider{
            height: 400px;
            margin: 0 auto;
            position: relative;
            display: grid;
            place-items: center;
            overflow: hidden;
        }

        .item-list{
            display:flex;
            width: calc(300px * 12);
            animation: scroll 40s linear infinite;
        }

        .item-list:hover{
            animation-play-state:paused;
        }

        @keyframes scroll{
            0% {
                transform: translateX(0);
            }
            100%{
                transform: translateX(calc(-300px * 6));
            }
        }

        .item{
            height: 250px;
            width: 300px;
            display: flex;
            align-items:center;
            padding: 15px;
            perspective:100px;
        }

        .item-card{
            width:100%;
            transition:transform 1s;
            border-radius:10px;
            overflow:hidden;
        }

        .item-card:hover{
            transform:translateZ(18px);
        }

        /* 슬라이더 그라데이션 그림자 */

        .slider::before,
        .slider::after {
            /*background:linear-gradient(to right, #f6f4f2 0%,*/
            /*rgba(255,255,255,0) 100%);*/
            content:'';
            height:100%;
            position:absolute;
            width:15%;
            z-index:2;
        }

        .slider::before{
            left:0;
            top:0;
        }

        .slider::after{
            right:0;
            top:0;
            transform: rotateZ(180deg);
        }
        .travel-btn{
            padding: 13px;
            border-radius: 10px;
            border: 0;
            font-size: 18px;
            color: #ffffff;
            font-weight: 600;
            border: 1px solid;
            background: #2196F3;
        }
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

            /* 버튼에 호버할 때 툴팁 스타일 */
        /* 버튼을 포함하는 부모 요소에 상대적인 위치 설정 */
        .label-wrapper {
            position: relative;
        }

        /* 버튼에 호버할 때 툴팁 스타일 */리
        .travel-btn:hover + p.travel-date-text-1::before {
            content: "여행일정이 없습니다"; /* 툴팁 내용 설정 */
            position: absolute;
            background-color: #333; /* 배경색 설정 */
            color: #fff; /* 글자색 설정 */
            padding: 10px 10px; /* 내부 여백 설정 */
            border-radius: 5px; /* 테두리 둥글기 설정 */
            font-size: 14px; /* 글자 크기 설정 */
            white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
            z-index: 1; /* 다른 요소 위에 표시하기 위한 z-index 설정 */
            top: -50px; /* 버튼 위에 위치하도록 설정 */
            left: 8.2%; /* 가운데 정렬을 위한 왼쪽 위치 설정 */
            transform: translateX(-50%); /* 가운데 정렬 */
            opacity: 0; /* 처음에는 툴팁 숨김 */
            transition: opacity 0.3s ease-in-out; /* 부드러운 페이드 효과 설정 */
        }

        /* 버튼 위에 호버할 때 툴팁 표시 */
        .travel-btn:hover + p.travel-date-text-1::before {
            opacity: 1; /* 툴팁을 표시 */
        }
        .calBtn{
            padding: 6px;
            border: 0;
            background: #000000;
            border-radius: 5px;
            color: white;
            font-weight: 700;
            margin-left: 5px;
        }
    </style>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>

    <div class="backgroundbox">
        <div class="topbox">
        <div class="contents">
            <div class="contents-1">
                <h2>최근 저장한 여행</h2>
                <div class="trafficContainerBox">
                    <span>${param.title}</span>
                    <div class="traffic-modal-content">
                        <c:forEach items="${sessionScope.travelInfoList}" var="travelInfo">
                            <div class="c">
                                <input type="checkbox" id="faq-${travelInfo.travelId}">
                                <c:if test="${not empty travelInfo.travelStart}">
                                <h1>
                                    <label for="faq-${travelInfo.travelId}">${travelInfo.travelTitle} [${fn:substring(travelInfo.travelStart, 0, 10)} ~ ${fn:substring(travelInfo.travelEnd, 0, 10)}]
<%--                                        <img src="../../../resources/images/testAcc.png">--%>
                                        <p class="travel-date-text-1">${travelInfo.groupName} ${travelInfo.groupAccount}</p>
                                    </label>
                                </h1>
                                </c:if>
                                <c:if test="${empty travelInfo}">
                                    <h1>
                                        <img src="../../../resources/images/testAcc.png">
                                        <label for="faq-${travelInfo.travelId}">
                                            <button class="travel-btn">여행일정 짜기</button>
                                            <p class="travel-date-text-1">${travelInfo.groupName} ${travelInfo.groupAccount}</p>
                                        </label>
                                    </h1>
                                </c:if>
                                    <div class="p">
                                        <c:if test="${sessionScope.member.member_id == travelInfo.groupLeader}">
                                            <p class="travel-date-text">
                                                <span><img src="../../../resources/images/free-icon-crown-4315531.png"></span>
                                                <button class="calBtn" onclick="calculate()">모임원들에게 회비요청</button>
                                                <div>연결 계좌번호 : ${travelInfo.accountNum}</div>
                                            </p>
                                        </c:if>
                                        <c:choose>
                                            <c:when test="${not empty travelInfo.travelStart}">
                                                <p class="travel-date-text">
                                                    <strong>${fn:substring(travelInfo.travelStart, 0, 10)} ~ ${fn:substring(travelInfo.travelEnd, 0, 10)}</strong>
                                                    (<c:forEach items="${fn:split(fn:replace(fn:replace(travelInfo.travelPlace, '[', ''), ']', ''), ',')}" var="item">
                                                    <c:set var="itemWithoutQuotes" value="${fn:replace(item, '\"', '')}" />
                                                    ${itemWithoutQuotes}
                                                </c:forEach>)  ${travelInfo.groupType}
                                                </p>
                                                <div class="travel-content" id="scheduleList-${travelInfo.travelId}">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <p>여행 정보가 없습니다.</p>
                                            </c:otherwise>
                                        </c:choose>
                                        <canvas id="myChart" style="width: 200px; height: 200px"></canvas>
                                    </div>
                            </div>
                            <script>
                                window.onload = function() {
                                    $.ajax({
                                        type: "POST",
                                        url: "/selectMygroupSchedule",
                                        data: {travelId: ${travelInfo.travelId}},
                                        success: function (response) {
                                            var scheduleList = document.getElementById("scheduleList-${travelInfo.travelId}");
                                            if (response.length > 0) {
                                                for (var i = 0; i < response.length; i++) {
                                                    var schedule = response[i];
                                                    var scheduleCard = document.createElement("div");
                                                    scheduleCard.classList.add("schedule-card");

                                                    // Schedule Date
                                                    var scheduleDate = document.createElement("h3");
                                                    scheduleDate.textContent = schedule.schedule_date;
                                                    scheduleCard.appendChild(scheduleDate);

                                                    // Schedule Place
                                                    var schedulePlace = document.createElement("p");
                                                    schedulePlace.textContent = "장소: " + schedule.schedule_place;
                                                    scheduleCard.appendChild(schedulePlace);

                                                    // // People Number원
                                                    // var peopleNumber = document.createElement("p");
                                                    // peopleNumber.textContent = "인원: " + schedule.pnum;
                                                    // scheduleCard.appendChild(peopleNumber);

                                                    // Price
                                                    var price = document.createElement("p");
                                                    price.textContent = "가격: " + schedule.price + "원";
                                                    scheduleCard.appendChild(price);

                                                    // Category
                                                    var category = document.createElement("p");
                                                    category.textContent = "카테고리: " + schedule.category;
                                                    scheduleCard.appendChild(category);

                                                    scheduleList.appendChild(scheduleCard);
                                                }
                                                var food = response[0].food_expenses;
                                                var etc = response[0].etc_expenses;
                                                var accommodation = response[0].accommodation_expenses;
                                                var totalval = document.createElement('div');
                                                totalval.className='totalTravel';
                                                var totaltext1 = document.createElement('span');
                                                totaltext1.textContent="총 ";
                                                var totaltext2 = document.createElement('span');
                                                totaltext2.className='totaltext2';
                                                totaltext2.textContent=(food + etc + accommodation);
                                                var totaltext3 = document.createElement('span');
                                                totaltext3.textContent=" 원";
                                                totalval.appendChild(totaltext1);
                                                totalval.appendChild(totaltext2);
                                                totalval.appendChild(totaltext3);

                                                scheduleList.appendChild(totalval);
                                                // 차트를 그릴 데이터 준비
                                                var chartData = {
                                                    labels: ["음식", "기타", "숙박", "교통"], // 카테고리 레이블
                                                    datasets: [{
                                                        data: [food, etc, accommodation,25000], // 카테고리별 비용 데이터
                                                        backgroundColor: [
                                                            'rgb(240, 229, 222)', // 음식
                                                            'rgb(171, 208, 206)', // 기타
                                                            'rgb(124, 120, 119)', // 숙박
                                                            'rgb(217, 212, 207)'  // 교통
                                                        ],
                                                        borderColor: [
                                                            'rgb(240, 229, 222)', // 음식
                                                            'rgb(171, 208, 206)', // 기타
                                                            'rgb(124, 120, 119)', // 숙박
                                                            'rgb(217, 212, 207)'  // 교통
                                                        ],
                                                        borderWidth: 1
                                                    }]
                                                };

                                                // 차트 생성
                                                var ctx = document.getElementById('myChart').getContext('2d')
                                                var myChart = new Chart(ctx, {
                                                    type: 'pie', // 파이 차트 형식
                                                    data: chartData
                                                });
                                            } else {
                                                // response가 비어있는 경우에 대한 처리
                                            }

                                        },
                                        error: function (error) {
                                            console.error(error);
                                        },
                                    });
                                }
                            </script>
                        </c:forEach>
                    </div>
                    <h2>즐겨찾기 목록</h2>
                    <div class="slider">
                        <div class="item-list">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
<%--    <%@ include file="../include/footer.jsp" %>--%>
</div>
</body>
<script>
    function calculate(){
        var calBtn = document.querySelector(".calBtn");
        var ancestorElement = calBtn.parentElement.parentElement.parentElement;
        var inputElement = ancestorElement.querySelector("input");
        var inputValue = inputElement.id;

        var cinput =  document.getElementById(inputValue).parentElement;
        var total = cinput.querySelector('.totaltext2').textContent;
        //모임원 인원 수대로
        $.ajax({
            type: "POST",
            url: "/selectAllGroupMembers",
            data: { groupId: "${sessionScope.groupAccountDetail.group_id}" },
            success: function (response) {
                notification(response,total);
            },
            error: function (error) {
                console.error(error);
            },
        });

    }
    function notification(groupMember,totalAmount){
        var requestData = {
            groupMember: groupMember,
            amount: totalAmount,
            group_id: "${sessionScope.groupAccountDetail.group_id}"
        };
        $.ajax({
            type: "POST",
            url: "/calTravelGroupMemberNotification",
            data: JSON.stringify(requestData),
            contentType: "application/json",
            success: function (response) {
                console.log(response)
            },
            error: function (error) {
                console.error(error);
            },
        });
    }
    $.ajax({
        type: "POST",
        url: "/selectMygroupTravelList",
        success: function (response) {
        },
        error: function (error) {
            console.error(error);
        },
    });
    $.ajax({
        type: "GET",
        url: "/selectBookmarkTravelList",
        success: function (response) {
            var itemContainer = document.querySelector('.item-list');
            if (response.length > 0) {
                response.forEach(function (data) {
                    var itemDiv = document.createElement('div');
                    itemDiv.className = 'item';
                    var itemcCrd = document.createElement('div');
                    itemcCrd.className = 'item-card';
                    var itemImage = document.createElement('img');
                    var originalURL =data.photo;
                    var idMatch = originalURL.match(/id=([^&]+)/);
                    var id = idMatch ? idMatch[1] : null;
                    var modifiedURL = id ? originalURL.replace(idMatch[0], "&" + "id=" + id) : originalURL;
                    itemImage.src = modifiedURL;
                    itemImage.className='item-img'
                    itemImage.alt = data.content;
                    itemcCrd.appendChild(itemImage);

                    var itemHeading = document.createElement('h2');
                    itemHeading.textContent = data.content;
                    itemcCrd.appendChild(itemHeading);

                    var paragraphlocation = document.createElement('p');
                    paragraphlocation.textContent = '지역 : ' + data.location;
                    // var paragraphtag = document.createElement('p');
                    // paragraphtag.textContent = data.tags;

                    itemcCrd.appendChild(paragraphlocation);
                    // itemDiv.appendChild(paragraphtag);

                    itemDiv.appendChild(itemcCrd);
                    itemContainer.appendChild(itemDiv);
                })
            }else{

            }
        },
        error: function (error) {
            console.error(error);
        },
    });

</script>
</html>
