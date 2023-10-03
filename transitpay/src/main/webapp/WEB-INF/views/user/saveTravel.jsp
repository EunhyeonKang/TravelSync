<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../../../resources/css/taffic.css">
    <link rel="stylesheet" href="../../../resources/css/saveTravel.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa75059f83f9e745604b52cb811450f4&libraries=services"></script>
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
                                    <script>
                                        $(document).ready(function() {
                                            $.ajax({
                                                type: "POST",
                                                url: "/selectMygroupSchedule",
                                                data: {travelId: ${travelInfo.travelId}},
                                                success: function (response) {
                                                    var mapContainerId = "map-${travelInfo.travelId}"; // travelId를 사용하여 고유한 ID 생성
                                                    var mapContainer = document.getElementById(mapContainerId);

                                                    if (mapContainer) {
                                                        var options = {
                                                            center: new kakao.maps.LatLng(37.52829468089088, 126.64407499265728),
                                                            level: 9
                                                        };
                                                        var map = new kakao.maps.Map(mapContainer, options);


                                                    } else {
                                                        console.error("Map container not found:", mapContainerId);
                                                    }

                                                    var tbody = document.getElementById("scheduleList-${travelInfo.travelId}");
                                                    tbody.innerHTML = ""; // 기존 내용 초기화

                                                    if (response.length > 0) {
                                                        for (var i = 0; i < response.length; i++) {
                                                            var schedule = response[i];
                                                            var row = document.createElement("tr");

                                                            var markerPosition = new kakao.maps.LatLng(schedule.placeY, schedule.placeX); // 마커의 위치
                                                            var marker = new kakao.maps.Marker({
                                                                position: markerPosition
                                                            });
                                                            marker.setMap(map);


                                                            // // People Number원
                                                            // var peopleNumber = document.createElement("p");
                                                            // peopleNumber.textContent = "인원: " + schedule.pnum;
                                                            // scheduleCard.appendChild(peopleNumber);
                                                            // 일자
                                                            var dateCell = document.createElement("td");
                                                            dateCell.textContent = schedule.schedule_date;
                                                            row.appendChild(dateCell);

                                                            // 장소
                                                            var placeCell = document.createElement("td");
                                                            placeCell.textContent = schedule.schedule_place;
                                                            row.appendChild(placeCell);

                                                            // 가격
                                                            var priceCell = document.createElement("td");
                                                            priceCell.textContent = schedule.price + "원";
                                                            row.appendChild(priceCell);

                                                            // 카테고리
                                                            var categoryCell = document.createElement("td");
                                                            categoryCell.textContent = schedule.category;
                                                            row.appendChild(categoryCell);

                                                            tbody.appendChild(row);
                                                        }
                                                        var food = response[0].food_expenses;
                                                        var etc = response[0].etc_expenses;
                                                        var accommodation = response[0].accommodation_expenses;
                                                        var totalText2 = document.querySelector(".totaltext2-${travelInfo.travelId}");
                                                        totalText2.textContent = food + etc + accommodation;
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
                                                        // var ctx = document.getElementById('myChart').getContext('2d')
                                                        // var myChart = new Chart(ctx, {
                                                        //     type: 'pie', // 파이 차트 형식
                                                        //     data: chartData
                                                        // });

                                                    } else {
                                                        // response가 비어있는 경우에 대한 처리
                                                    }

                                                },
                                                error: function (error) {
                                                    console.error(error);
                                                },
                                            });
                                        });
                                    </script>
                                </c:if>
                                <c:if test="${empty travelInfo.travelStart}">
                                    <h1>
                                        <label for="faq-${travelInfo.travelId}">
                                            <button class="travel-btn">여행일정 짜기</button>
                                            <p class="travel-date-text-1">${travelInfo.groupName} ${travelInfo.groupAccount}</p>
                                        </label>
                                    </h1>
                                </c:if>
                                    <div class="p">
                                        <c:choose>
                                            <c:when test="${not empty travelInfo.travelStart}">
                                                <div id="map-${travelInfo.travelId}" style="width: 100%; height: 400px;"></div>
                                                <p class="travel-date-text">
                                                    <strong>${fn:substring(travelInfo.travelStart, 0, 10)} ~ ${fn:substring(travelInfo.travelEnd, 0, 10)}</strong>
                                                    (<c:forEach items="${fn:split(fn:replace(fn:replace(travelInfo.travelPlace, '[', ''), ']', ''), ',')}" var="item">
                                                    <c:set var="itemWithoutQuotes" value="${fn:replace(item, '\"', '')}" />
                                                    ${itemWithoutQuotes}
                                                </c:forEach>)  ${travelInfo.groupType}
                                                </p>
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th>일자</th>
                                                            <th>장소</th>
                                                            <th>가격</th>
                                                            <th>카테고리</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="travel-content" id="scheduleList-${travelInfo.travelId}">
                                                    </tbody>
                                                </table>
                                                <div class="totalTravel">
                                                    <span>총</span>
                                                    <span class="totaltext2-${travelInfo.travelId}"></span>
                                                    <span>원</span>
                                                </div>
                                                <c:if test="${sessionScope.member.member_id == travelInfo.groupLeader}">
                                                    <p class="travel-date-text">
                                                        <span><img src="../../../resources/images/free-icon-crown-4315531.png"></span>
                                                        <button class="calBtn" onclick="calculate(${travelInfo.travelId})">모임원들에게 회비요청</button>
                                                    </p>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <p>여행 정보가 없습니다.</p>
                                            </c:otherwise>
                                        </c:choose>
<%--                                        <canvas id="myChart" style="width: 200px; height: 200px"></canvas>--%>
                                    </div>
                            </div>

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

    function calculate(travelId){
        var calBtn = document.querySelector(".calBtn");
        var ancestorElement = calBtn.parentElement.parentElement.parentElement;
        var inputElement = ancestorElement.querySelector("input");
        var inputValue = inputElement.id;

        var cinput =  document.getElementById(inputValue).parentElement;
        var total = cinput.querySelector('.totaltext2-'+travelId).textContent;
        //모임원 인원 수대로
        $.ajax({
            type: "POST",
            url: "/selectAllGroupMembers",
            data: {
                groupId: "${sessionScope.groupAccountDetail.group_id}"
            },
            success: function (response) {
                notification(response,total,travelId);
            },
            error: function (error) {
                console.error(error);
            },
        });

    }
    function notification(groupMember,totalAmount,travelId){
        var requestData = {
            groupMember: groupMember,
            amount: totalAmount,
            group_id: "${sessionScope.groupAccountDetail.group_id}",
            travel_id : travelId
        };
        $.ajax({
            type: "POST",
            url: "/calTravelGroupMemberNotification",
            data: JSON.stringify(requestData),
            contentType: "application/json",
            success: function (response) {
                alert(response)
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
            console.log(response)
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
