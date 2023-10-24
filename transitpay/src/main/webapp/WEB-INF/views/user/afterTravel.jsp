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
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>

    <div class="backgroundbox">
        <div class="topbox">
        <div class="contents">
            <div class="contents-1">
                <h2>여행 내역</h2>
                <div>
                    <select name="grouptype" class="rec6">
                        <option value="" selected>모임통장 선택</option>
                        <option value="여행">323-309815-93841</option>
                        <option value="여행">251-125382-12432</option>
                        <option value="여행">982-401023-12002</option>
                    </select>
                </div>
                <div class="trafficContainerBox">
                    <span>${param.title}</span>
                    <div class="traffic-modal-content">
                        <c:forEach items="${sessionScope.travelInfoList}" var="travelInfo">
                            <input type="hidden" value="${travelInfo.travelId}" id="travelId">
                            <div class="c">
                                <input type="checkbox" id="faq-${travelInfo.travelId}">
                                <c:if test="${not empty travelInfo.travelStart}">
                                    <h1>
                                        <label for="faq-${travelInfo.travelId}"><div class="saveTravelTitle">${travelInfo.travelTitle}</div><div class="saveDate">[${fn:substring(travelInfo.travelStart, 0, 10)} ~ ${fn:substring(travelInfo.travelEnd, 0, 10)}]</div>
                                                <%--                                        <img src="../../../resources/images/testAcc.png">--%>
                                            <p class="travel-date-text-1">${travelInfo.groupName} ${travelInfo.groupAccount}</p>
                                        </label>
                                    </h1>
                                    <script>
                                        $.ajax({
                                            type: "POST",
                                            url: "/selectMygroupSchedule",
                                            data: {travelId: ${travelInfo.travelId}},
                                            success: function (response) {
                                                var tbody = document.getElementById("scheduleList-${travelInfo.travelId}");
                                                tbody.innerHTML = ""; // 기존 내용 초기화

                                                if (response.length > 0) {
                                                    for (var i = 0; i < response.length; i++) {
                                                        var schedule = response[i];
                                                        var row = document.createElement("tr");

                                                        var dateCell = document.createElement("td");
                                                        dateCell.textContent = schedule.schedule_date;
                                                        row.appendChild(dateCell);

                                                        // 장소
                                                        var placeCell = document.createElement("td");
                                                        placeCell.textContent = schedule.schedule_place;
                                                        row.appendChild(placeCell);

                                                        // 가격
                                                        var priceCell = document.createElement("td");
                                                        var formattedPrice = schedule.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                                        priceCell.textContent = formattedPrice + "원";
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
                                                    var totalText2 = document.querySelector(".totaltext2-"+${travelInfo.travelId});
                                                    totalText2.textContent = (food + etc + accommodation).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");


                                                    // 차트 생성
                                                    const ctx = document.getElementById('myChart-${travelInfo.travelId}');

                                                    new Chart(ctx, {
                                                        type: 'doughnut',
                                                        data: {
                                                            labels: ["음식", "기타", "숙박"],
                                                            datasets: [{
                                                                label: '여행경비',
                                                                data: [food, etc, accommodation],
                                                                borderWidth: 1,
                                                                backgroundColor: [
                                                                    'rgb(211, 211, 211)',
                                                                    'rgb(241, 241, 241)',
                                                                    'rgb(0, 92, 255)'
                                                                ],
                                                                hoverOffset: 4
                                                            }]
                                                        },

                                                        // 데이터 가공

                                                        options: {
                                                            scales: {
                                                                y: {
                                                                    beginAtZero: true
                                                                }
                                                            }
                                                        }
                                                    });

                                                } else {
                                                    // response가 비어있는 경우에 대한 처리
                                                }

                                            },
                                            error: function (error) {
                                                console.error(error);
                                            },
                                        });
                                        $.ajax({
                                            type: "GET",
                                            url: "/selectNotificationTravel",
                                            data : {travelId : ${travelInfo.travelId}},
                                            success: function (response) {
                                                var tableBody = document.querySelector("#calculationTable-${travelInfo.travelId} tbody");
                                                var calMember = document.querySelector('.cal-member-${travelInfo.travelId}');
                                                calMember.textContent = response.length + "명";
                                                var totalamount =0;
                                                response.forEach(function(item){
                                                    var row = tableBody.insertRow();
                                                    var nameCell = row.insertCell(0);
                                                    var amountCell = row.insertCell(1);
                                                    var calCell = row.insertCell(2);
                                                    nameCell.textContent = item.name;
                                                    totalamount+=item.amount;
                                                    amountCell.textContent = item.amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                                                    calCell.textContent='정산완료';
                                                })
                                                var formattedPrice =totalamount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                                document.querySelector('#totalamount-${travelInfo.travelId}').textContent = formattedPrice;
                                                selectMygroupSchedule(${travelInfo.travelId});
                                            },
                                            error: function (error) {
                                                console.error(error);
                                            },
                                        });
                                    </script>
                                </c:if>
                                <div class="p">
                                    <p class="travel-date-text">
                                        <span><img src="../../../resources/images/free-icon-crown-4315531.png"></span>
                                        <button class="calBtn">정산완료</button>
                                        <button class="calBtn" style="background: cadetblue;">삭제</button>
                                    </p>
                                    <c:choose>
                                        <c:when test="${not empty travelInfo.travelStart}">
                                            <span class="">
                                                <div class="totalTravel">
                                                    <span>정산인원 :
                                                        <span class="cal-member-${travelInfo.travelId}"></span>
                                                    </span>
                                                <span>/ 총</span>
                                                <span class="totaltext2-${travelInfo.travelId}"></span>
                                                <span>원</span>
                                                </div>
                                            </span>
                                            <div id="tableContainer">
                                                <table id="calculationTable-${travelInfo.travelId}" border="1">
                                                    <thead>
                                                    <tr>
                                                        <th>이름</th>
                                                        <th>금액</th>
                                                        <th>정산여부</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <!-- 정산 내역이 여기에 추가될 것입니다. -->
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="totalamountbox"><span class="totalamount">(모여라)회비를 <span class="red-text" id="totalamount-${travelInfo.travelId}"></span>원 지불했습니다.</span>
                                                <div class="interestbox">
                                                    <div class="interest">${sessionScope.interest}원</div>은 트래블싱크에서 지원해드립니다.</div>
                                                </div>
                                            <div class="chart-div">
                                                <img src="../../../resources/images/5022329.png" style="width: 80px; margin: 15px">
<%--                                                <canvas id="myChart-${travelInfo.travelId}" style="width: 300px; height: 200px;"></canvas>--%>
                                            </div>
                                            <button class="detail-button" data-travelId="${travelInfo.travelId}">자세히 보기</button>
                                            <div id="myModalDetail-${travelInfo.travelId}" class="modal-detail">
                                                <div class="modal-content-detail">
                                                    <span class="close" id="closex" onclick="closex()">&times;</span>
                                                    <h2>일정 내용</h2>
                                                    <table>
                                                        <thead>
                                                        <p class="travel-date-text">
                                                            <strong>${fn:substring(travelInfo.travelStart, 0, 10)} ~ ${fn:substring(travelInfo.travelEnd, 0, 10)}</strong>
                                                            (<c:forEach items="${fn:split(fn:replace(fn:replace(travelInfo.travelPlace, '[', ''), ']', ''), ',')}" var="item">
                                                            <c:set var="itemWithoutQuotes" value="${fn:replace(item, '\"', '')}" />
                                                            ${itemWithoutQuotes}
                                                        </c:forEach>)  ${travelInfo.groupType}
                                                        </p>
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
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <p>여행 정보가 없습니다.</p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
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
    // 모달 요소 가져오기
    var modal = document.querySelector(".modal-detail");

    // 자세히보기 버튼 클릭 이벤트 처리
    var detailButtons = document.querySelectorAll(".detail-button");
    detailButtons.forEach(function(button) {
        button.addEventListener("click", function() {
            // 클릭한 버튼의 travelId 가져오기
            var travelId = button.getAttribute("data-travelId");
            // 해당 travelId를 가진 모달을 열기
            var modal = document.getElementById("myModalDetail-" + travelId);
            if (modal) {
                modal.style.display = "block";
            }
        });
    });

    function closex(){
        var modal = document.querySelector("#myModalDetail-375");
        modal.style.display = "none";
    }
    // 모달 닫기 버튼 처리
    var closeButton = document.getElementById("closex");
    closeButton.onclick = function() {

        console.log(111)
        // 모달 숨기기
        modal.style.display = "none";
    }
    // 모달 외부 클릭 시 모달 숨기기
    window.addEventListener("click", function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });


    function selectMygroupSchedule(travelId){
        $.ajax({
            type: "POST",
            url: "/selectMygroupSchedule",
            data: {travelId: travelId},
            success: function (response) {
                console.log(response)
            },
            error: function (error) {
                console.error(error);
            },
        });
    }
    // $.ajax({
    //     type: "POST",
    //     url: "/selectMygroupTravelList",
    //     success: function (response) {
    //         console.log(response)
    //     },
    //     error: function (error) {
    //         console.error(error);
    //     },
    // });

</script>
</html>
