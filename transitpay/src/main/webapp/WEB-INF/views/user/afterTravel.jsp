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
    <style>
        .cal-member{
            color: #2196F3;
        }
        .totaltext2{
            color: #ff0049;
        }
        /* 모달 전체 화면을 덮는 배경 */
        .modal-detail {
            display: none;
            position: fixed;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 800px;
            background-color: rgb(216 229 242);
            z-index: 1;
            overflow: auto;
            text-align: center;
            border-radius: 20px;
        }

        /* 모달 내용을 감싸는 컨테이너 */
        .modal-content-detail {
            background-color: #fefefe; /* 모달 내용 배경색 */
            margin: 10% auto; /* 모달을 화면 중앙에 위치시킴 */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* 모달 내용의 너비 */
        }

        /* 모달 닫기 버튼 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        /* 모달 내용의 스크롤바 스타일 (필요시) */
        .modal-content-detail {
            max-height: 80vh; /* 모달 내용의 최대 높이 조정 */
            overflow-y: auto; /* 세로 스크롤바 추가 */
        }
        .detail-button{
            padding: 10px;
            background: 0;
            margin: 10px;
            border: 2px solid #b1b2b3;
            border-radius: 5px;
            color: #939596;
            font-weight: 700;
        }
        .chart-div{
            width: 300px;
            margin: 0 auto;
        }
        .saveTravelTitle{
            color: #009688;
            margin-right: 10px;
        }
        .saveDate{
            color: #a6a6a6;
        }
        #totalamount{
            color: #E91E63;
            font-size: 20px;
            font-weight: 700;
        }

        .totalamountbox{
            font-size: 18px;
            font-weight: 700;
            color: #646464;
        }
        .interest{
            color: darkcyan;
            font-size: 20px;
        }
        .interestbox{
            display: flex;
            justify-content: center; display: flex;
        }
        .red-text{
            color: red;
        }
        .rec6{
            width: 120px;
            padding: 10px;
            border-radius: 10px;
            font-weight: 700;
            color: #757777;
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
