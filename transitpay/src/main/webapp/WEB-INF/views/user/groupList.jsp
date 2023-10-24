<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../../../resources/css/taffic.css">
    <link rel="stylesheet" href="../../../resources/css/groupList.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>

    <div class="backgroundbox">
        <div class="topbox">
            <div class="contents">

                <div class="contents-1">
                    <h2>여행 총 금액</h2>
                    <div class="trafficContainerBox">
                        <span>${param.title}</span>
                        <div class="traffic-modal-content">
                            <c:forEach items="${sessionScope.travelInfoList}" var="travelInfo">
                                <div class="c">
                                    <input type="checkbox" id="faq-${travelInfo.travelId}">
                                    <c:if test="${not empty travelInfo.travelStart}">
                                        <h1>
                                            <img src="../../../resources/images/testAcc.png">
                                            <label for="faq-${travelInfo.travelId}">${travelInfo.travelTitle} (${fn:substring(travelInfo.travelStart, 0, 10)} ~ ${fn:substring(travelInfo.travelEnd, 0, 10)})
                                                <p class="travel-date-text-1">${travelInfo.groupName} ${travelInfo.groupAccount}</p>
                                            </label>
                                        </h1>
                                    </c:if>
                                    <c:if test="${empty travelInfo.travelStart}">
                                        <h1>
                                            <img src="../../../resources/images/testAcc.png">
                                            <label for="faq-${travelInfo.travelId}">
                                                <button class="travel-btn">여행계획 세우러가기</button>
                                                <p class="travel-date-text-1">${travelInfo.groupName} ${travelInfo.groupAccount}</p>
                                            </label>
                                        </h1>
                                    </c:if>
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
                                                <div class="travel-content" id="scheduleList-${travelInfo.travelId}">연결 계좌번호 : ${travelInfo.accountNum}
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
        error: function (error) {``
            console.error(error);
        },
    });

</script>
</html>
