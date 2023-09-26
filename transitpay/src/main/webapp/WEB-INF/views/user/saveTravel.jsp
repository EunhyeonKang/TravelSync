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
        @import url("https://fonts.googleapis.com/css?family=Poppins:400,400i,700");
        *, *::after, *::before {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: "Poppins", sans-serif;
        }
        div.c {
            position: relative;
            margin: 2em;
        }
        input {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            opacity: 0;
            visibility: 0;
        }
        h1 {
            background: linear-gradient(142deg, #0a7987 0%, rgb(136 206 217 / 87%) 52.08%, #159db0 100%);
            color: white;
            padding: 23px 15px 10px 15px;
            position: relative;
            border-radius: 5px;
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
            transition: max-height 0.5s ease; /* 아코디언 내용이 천천히 열리도록 설정 */
            background-color: white;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.2);
            text-align: center;
            border-radius: 5px;
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
        }

        .schedule-card:hover {
            transform: translateY(-5px);
        }

        .schedule-card h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .schedule-card p {
            margin: 0;
            font-size: 14px;
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
        .item-list{
            display: flex;
        }
        .item{
            margin-right: 10px;
        }
        #myChart {
            width: 500px !important;
            height: 500px !important;
            display: block;
            margin: 10px auto;
            box-sizing: border-box;
        }
        .totalTravel{
            font-size: 25px;
            font-weight: 700;
            color: #252525;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        <span>여행 저장 보기</span>
        <hr/>
    </div>
    <div class="contents">
        <h2>여행 총 금액</h2>
        <div class="contents-1">
            <div class="trafficContainerBox">
                <span>${param.title}</span>
                <div class="traffic-modal-content">
                    <c:forEach items="${sessionScope.travelInfoList}" var="travelInfo">
                        <div class="c">
                            <input type="checkbox" id="faq-${travelInfo.travelId}">
                            <h1><img src="../../../resources/images/testAcc.png"><label for="faq-${travelInfo.travelId}">${travelInfo.travelTitle}[${travelInfo.groupName} ${travelInfo.groupAccount}]<p class="travel-date-text-1">연결 계좌번호 : ${travelInfo.accountNum}</p></label></h1>
                                <div class="p">

                                    <c:if test="${sessionScope.member.member_id == travelInfo.groupLeader}">
                                        <p class="travel-date-text">모임장</p>
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
                                    <div class="totalTravel"></div>
                                <canvas id="myChart" style="width: 200px; height: 200px"></canvas>
                                </div>
                        </div>
                        <script>
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
                                            console.log(schedule);
                                            // People Number원
                                            var peopleNumber = document.createElement("p");
                                            peopleNumber.textContent = "인원: " + schedule.pnum;
                                            scheduleCard.appendChild(peopleNumber);

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
                                        document.querySelector('.totalTravel').textContent= "총 "+(food + etc + accommodation)+" 원";
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
                        </script>
                    </c:forEach>
                </div>
                <div>
                    <h2>찜목록</h2>
                    <div class="item-list">

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</body>
<script>

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
            console.log(response)
            var itemContainer = document.querySelector('.item-list');
            if (response.length > 0) {
                response.forEach(function (data) {
                    var itemDiv = document.createElement('div');
                    itemDiv.className = 'item';
                    var itemImage = document.createElement('img');
                    var originalURL =data.photo;
                    var idMatch = originalURL.match(/id=([^&]+)/);
                    var id = idMatch ? idMatch[1] : null;
                    var modifiedURL = id ? originalURL.replace(idMatch[0], "&" + "id=" + id) : originalURL;
                    itemImage.src = modifiedURL;
                    itemImage.className='item-img'
                    itemImage.alt = data.content;
                    itemDiv.appendChild(itemImage);

                    var itemHeading = document.createElement('h2');
                    itemHeading.textContent = data.content;
                    itemDiv.appendChild(itemHeading);

                    var paragraphlocation = document.createElement('p');
                    paragraphlocation.textContent = '지역 : ' + data.location;
                    // var paragraphtag = document.createElement('p');
                    // paragraphtag.textContent = data.tags;

                    itemDiv.appendChild(paragraphlocation);
                    // itemDiv.appendChild(paragraphtag);


                    itemContainer.appendChild(itemDiv);
                })
            }else{

            }
        },
        error: function (error) {``
            console.error(error);
        },
    });

</script>
</html>
