<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/map.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa75059f83f9e745604b52cb811450f4&libraries=services"></script>
    <script src="../../../resources/js/socket.js"></script>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        <span>여행·일정 등록</span>
        <hr/>
    </div>
    <div class="travelboxking">
        <div class="contents">
            <div class="menu1">
                <div class="menu1-1">여행 장소 선택</div>
                <div class="menuhr"><hr/></div>
                <a href="/travel">여행 장소 선택</a>
                <a href="map">여행 일정 추가</a>
                <a href="/categoryTravel">TOP 여행지</a>
                <h2 class="bookmarkh2">즐겨찾기 목록</h2>
                <div class="slider">
                    <div class="item-list">
                    </div>
                </div>
            </div>
            <div class="contents-1">
                <div class="container">
                    <div class="contents1">
                        <input type="text" class="title-text" value="${param.travelTitle}"><a class="update-text">수정</a></span>
                        <button class="travel-data">과거 여행계획 내역</button>
                    </div>
                    <div class="before-custom-modal" id="beforeTravelModal">
                        <div class="before-modal-content">
                            <span class="before-close-button" id="beforeCloseTravelModal">&times;</span>
                            <h2 class="reportInfo">내 여행 리포트📈</h2>
                            <div class="chartbox">
                                <canvas id="myChart"></canvas>
                            </div>
                            <p id="travelreport">
                        </div>
                    </div>
                    <div class="contents2">
                        <span class="date">${param.travelStart} - ${param.travelEnd}</span>
                        <span class="dday">(${param.daysLeft} 일) D - ${param.dDay}</span>
                    </div>
                </div>

                <div class="map_wrap">
                    <div id="map"></div>
                    <div id="menu_wrap" class="bg_white">
                        <div class="option">
                            <div class="search">
                                <input id="searchInput" type="text" placeholder="여행, 어디로 떠나시나요?" autocomplete="off">
                                <img class="searchimg" src="../../resources/images/search.png" style="width: 50px;" >
                                <div id="searchDropdown" class="dropdown-content"></div>
                            </div>
                        </div>
                        <hr>
                        <ul id="placesList"></ul>
                        <div id="pagination"></div>
                    </div>
                </div>
                <div id="startModal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <div class="select-date-box">
                            <h3>날짜를 선택해주세요.</h3>
                            <div class="select-box">

                            </div>
                            <div class="date-btn-box">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="foodModal" id="foodModal">
                    <div class="food-modal-content">
                        <span class="food-close-btn">&times;</span>
                        <div class="select-date-box">
                            <h3>여행경비를 선택해주세요.</h3>
                            <div class="food-select-box">
                                <table id="foodTable">
                                    <thead>
                                    <tr>
                                        <th>선택</th>
                                        <th>키워드</th>
                                        <th>가격</th>
                                        <th>개수</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                                <button id="addToCart">추가하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <c:set var="travelStart" value="${param.travelStart}" />
                <c:set var="travelEnd" value="${param.travelEnd}" />

                <script>
                    var travelStart = "${travelStart}";
                    var travelEnd = "${travelEnd}";
                    var dateList = [];

                    var currentDate = new Date(travelStart);
                    var endDate = new Date(travelEnd);

                    while (currentDate <= endDate) {
                        dateList.push({ date: currentDate.toISOString().split("T")[0], day: currentDate.getDay() });
                        currentDate.setDate(currentDate.getDate() + 1);
                    }

                    var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
                    document.write('<div class="dateListBox">')
                    for (var i = 0; i < dateList.length; i++) {
                        document.write('<div class="container2-box">');
                        document.write('<div class="container2">');
                        document.write('<div class="days">day ' + (i + 1) + '</div>');
                        document.write('<div class="day">' + dateList[i].date+'</div>');
                        document.write('<div class="day1">' + ' (' + daysOfWeek[dateList[i].day] + ')</div>');
                        document.write('</div></div>');
                    }
                    document.write('</div>')
                </script>

                <div class="exchangebox2">
                    <div class="payment-amount">
                        <div class="amount-label">여행예산(원)</div>
                        <div class="amount-value">0</div>
                    </div>
                    <div class="exchange-rate">
                        <div class="discount-section">
                            <span class="discount-label">식비</span>
                            <span class="discount-value">0</span>
                        </div>
                        <div class="rate-section">
                            <span class="rate-label">숙박비</span>
                            <span class="rate-value">0</span>
                        </div>
                        <div class="etc-section">
                            <span class="etc-label">문화·기타</span>
                            <span class="etc-value">0</span>
                        </div>
                    </div>
                </div>
                <div class="tvlbuttons">
                    <button class="tvlbtn2" onclick="tvlBtnFunc()">
                        <div>이전</div>
                    </button>
                    <button class="tvlbtn2" onclick="tvlBtnFunc()">
                        <div>저장하기</div>
                    </button>
                </div>
            </div>
            <%@ include file="../socket.jsp" %>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>

<script>
    $.ajax({
        type: "GET",
        url: "/selectMemberNotificationHistory",
        success: function (response) {
            var food = 0;
            var etc =0;
            var accommodation =0;
            response.forEach(function(item){
                food +=item.food_expenses;
                etc += item.etc_expenses;
                accommodation +=item.accommodation_expenses;

            })

            var totalcategory = food + etc + accommodation;
            var manyCategory = "";
            var percent;
            if (accommodation > food && accommodation > etc) {
                manyCategory = "숙박";
                percent = (accommodation / totalcategory) * 100;
            } else if (food > accommodation && food > etc) {
                manyCategory = "음식";
                percent = (food / totalcategory) * 100;
            } else {
                manyCategory = "기타·문화";
                percent = (etc / totalcategory) * 100;
            }

            var travelreport = document.querySelector('#travelreport');
            var cdiv = document.createElement('div');
            cdiv.innerHTML = '여행·일정에서 가장 많은 항목은 <div class="manyCategory category-' + manyCategory + '">' + manyCategory + '</div> 입니다.';
            cdiv.classList.add('category'); // 'category' 클래스 추가
            travelreport.appendChild(cdiv);

            var total = document.createElement('div');
            total.innerHTML = '총 여행·일정(모여라회비) 금액의 <div class="percent">' + percent.toFixed(2) + '%</div>를 차지합니다.';
            total.classList.add('percentage'); // 'percentage' 클래스 추가
            travelreport.appendChild(total);

            var reportBtn = document.createElement('button');
            reportBtn.textContent='자세히 보기';
            reportBtn.classList.add('reportBtn'); // 'percentage' 클래스 추가
            travelreport.appendChild(reportBtn);

            reportBtn.addEventListener('click', function() {
                location.href = '/afterTravel';
            });

            // 고정된 색상 배열
            const fixedColors = [
                'rgb(0, 92, 255)',
                'rgb(211, 211, 211)',
                'rgb(241, 241, 241)'
            ];
            // 데이터 가공
            const data = [
                {
                    label: '음식',
                    data: food,
                    backgroundColor: fixedColors[0]
                },
                {
                    label: '기타·문화',
                    data: etc,
                    backgroundColor: fixedColors[1]
                },
                {
                    label: '숙박',
                    data: accommodation,
                    backgroundColor: fixedColors[2]
                }
            ];


            // 데이터 총합 계산
            const total1 = data.reduce((acc, item) => acc + item.data, 0);

            // 퍼센티지 계산 및 라벨 설정
            data.forEach(item => {
                const percentage = ((item.data / total1) * 100).toFixed(1); // 소수점 1자리까지 표시
                item.label += '(' +percentage+'%)';
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
                options: {
                    plugins: {
                        legend: {
                            display: true, // 레전드 숨김
                        },
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    const label = context.label || '';
                                    if (label) {
                                        return label + ' : ' + context.formattedValue+'원';
                                    }
                                    return '';
                                },
                            },
                        },
                    },
                },
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

    // 버튼 클릭 시 모달 열기
    $(".travel-data").click(function() {
        $("#beforeTravelModal").css("display", "block");
    });

    // 모달 닫기 버튼 클릭 시 모달 닫기
    $("#beforeCloseTravelModal").click(function() {
        $("#beforeTravelModal").css("display", "none");
    });

    // 모달 외부 클릭 시 모달 닫기
    $(window).click(function(event) {
        if (event.target.id === "beforeTravelModal") {
            $("#beforeTravelModal").css("display", "none");
        }
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
                    itemHeading.style.fontSize = '16px';
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
    // 페이지 로드 시 실행
    window.onload = function () {
        // 세션 스토리지에서 WebSocket 연결 상태 확인
        var socketOpen = sessionStorage.getItem('socketOpen');

        if (socketOpen === 'true') {
            // WebSocket 연결을 다시 열기
            wsOpen();
        }

        // 세션 스토리지에서 저장된 상태 삭제 (선택사항)
        sessionStorage.removeItem('socketOpen');
    };

    var selectedDetails;
    var selectedDate = [];
    var placeDataList = [];
    var selectedDateTmp=[];
    let totalPriceForThisPlace=0;
    let globalResponseData = null;
    let priceTextIdCounter = 0;
    var uniquePriceTextId;
    var dateTmp;
    window.onload = function() {
        getCurrentPosBtn();
    }

    function getDiscountValue(tags) {
        if (tags.includes('음식')) {
            return document.querySelector('.discount-value').textContent;
        } else if (tags.includes('숙박')) {
            return document.querySelector('.rate-value').textContent;
        } else {
            return document.querySelector('.etc-value').textContent;
        }
    }


    function updateDiscountValue(tags, value) {
        if (tags.includes('음식')) {
            document.querySelector('.discount-value').textContent = value.toLocaleString() + "원";
        } else if (tags.includes('숙박')||tags.includes('캠핑장')) {
            document.querySelector('.rate-value').textContent = value.toLocaleString() + "원";
        } else {
            document.querySelector('.etc-value').textContent = value.toLocaleString() + "원";
        }

    }
    function insertSchedule(tags, value){
        var category;
        if (tags.includes('음식')) {
            category = '음식';
        } else if (tags.includes('숙박')||tags.includes('캠핑장')) {
            category = '숙박';
        } else {
            category = '기타';
        }
        var pnum = priceTextIdCounter;
        var containerCur = document.querySelectorAll('.container3');
        var cur = containerCur[priceTextIdCounter-1];
        var myPlaceValue = cur.querySelector('.myplace').textContent;
        var placeX = cur.querySelector('.placeX').textContent;
        var placeY = cur.querySelector('.placeY').textContent;
        var data = {
            pnum: pnum,
            schedule_date: dateTmp,
            schedule_place : myPlaceValue,
            placeX: placeX,
            placeY: placeY,
            travel_title : "${param.travelTitle}",
            price : value,
            category : category,
            groupId : ${param.groupId}
        };
        //일정 추가할때마다 db에 저정하기
        $.ajax({
            url:'/insertSchedule',
            method: "POST",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function(response) {

            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });
    }
    function openModalFunc(){
        ws.send(JSON.stringify({ type: 'openModal'}));
    }
    //추가하기 버튼 눌렀을 때 실행
    const addToCartButton = document.getElementById("addToCart");
    const tbody = foodTable.querySelector("tbody");
    addToCartButton.addEventListener("click", function () {
        const selectedItems = [];
        const rows = tbody.querySelectorAll("tr");
        totalPriceForThisPlace = 0;
        for (let i = 0; i < rows.length; i++) {
            const checkbox = rows[i].querySelector("input[type='checkbox']");
            if (checkbox.checked) {
                const foodNameElement = rows[i].querySelector(".foodName");
                const foodPriceElement = rows[i].querySelector(".foodPrice");

                if (foodNameElement && foodPriceElement) {
                    const foodName = foodNameElement.textContent;
                    const foodPrice = parseFloat(foodPriceElement.textContent.replace(/[^0-9.]/g, ''));
                    selectedItems.push({ foodName, foodPrice });
                    totalPriceForThisPlace += foodPrice;
                }
            }
        }

        ws.send(JSON.stringify({ type: 'totalPriceForThisPlace', data: totalPriceForThisPlace }));
        const foodCloseButton = document.querySelector(".food-close-btn");
        foodCloseButton.addEventListener("click", () => {
            modal.style.display = "none";
        });
        const currentDiscountValue = getDiscountValue(selectedDetails.tags);
        const newDiscountValue = parseInt(currentDiscountValue.replace(/\D/g, '')) + totalPriceForThisPlace;
        const resultval = newDiscountValue - parseInt(currentDiscountValue.replace(/\D/g, ''));

        const discountValue = {
            tags : selectedDetails.tags,
            newDiscountValue : newDiscountValue
        };

        ws.send(JSON.stringify({ type: 'discountValue', data: discountValue }));
        ws.send(JSON.stringify({ type: 'amountValue', data: totalPriceForThisPlace }));
        insertSchedule(selectedDetails.tags,resultval);
    });
    function updateAmountValue(totalPriceForThisPlace){
        const amountValue = document.querySelector('.amount-value');
        const currentAmount = parseInt(amountValue.textContent.replace(/\D/g, ''));
        amountValue.textContent = (currentAmount + totalPriceForThisPlace).toLocaleString() + "원";
    }
    function foodModal(){
        const newPriceInfo = document.querySelector('.mypriceBox');
        const modal = document.getElementById("foodModal");
        modal.style.display = "block";
        const foodTable = document.getElementById("foodTable");
        const tbody = foodTable.querySelector("tbody");
        let totalPrices = []; // 각 행의 가격을 추적하기 위한 배열

        if (!globalResponseData || globalResponseData.length === 0 || globalResponseData=="") {
            var foodInput = prompt("가격을 입력해주세요");
            uniquePriceTextId = 'mypriceText-' + priceTextIdCounter;
            var newPriceText = document.createElement('div');
            newPriceText.className = 'mypriceText';
            newPriceText.id = uniquePriceTextId;
            newPriceText.textContent = foodInput;
            newPriceInfo.appendChild(newPriceText);
            modal.style.display = "none";
        }else {
            for (let i = 0; i < globalResponseData.length; i++) {
                const row = document.createElement("tr");

                const checkboxCell = document.createElement("td");
                const checkbox = document.createElement("input");
                checkbox.type = "checkbox";
                checkboxCell.appendChild(checkbox);

                const foodNameCell = document.createElement("td");
                foodNameCell.className = 'foodName';
                foodNameCell.textContent = globalResponseData[i].foodName;

                const foodPriceCell = document.createElement("td");
                foodPriceCell.className = 'foodPrice';

                const priceText = globalResponseData[i].foodPrice.replace("원", "").replace(",", "");
                const price = parseFloat(priceText);

                foodPriceCell.textContent = globalResponseData[i].foodPrice; // "원"을 제거하지 않고 그대로 표시
                totalPrices.push(price); // 각 행의 초기 가격을 배열에 추가

                const actionCell = document.createElement("td");
                const addButton = document.createElement("button");
                addButton.textContent = "추가";
                addButton.className='food-add'
                addButton.addEventListener("click", () => {
                    // + 버튼 클릭 시 해당 행의 가격을 2배로 증가
                    const rowIndex = i; // 현재 행의 인덱스
                    totalPrices[rowIndex] += price; // 현재 행의 가격을 2배로 증가
                    foodPriceCell.textContent = totalPrices[rowIndex].toLocaleString() + "원"; // 숫자를 통화 형식으로 표시
                });
                actionCell.appendChild(addButton);

                row.appendChild(checkboxCell);
                row.appendChild(foodNameCell);
                row.appendChild(foodPriceCell);
                row.appendChild(actionCell);

                tbody.appendChild(row);
            }
            uniquePriceTextId = "mypriceText-" + priceTextIdCounter; // 고유한 ID 생성
            var newPriceText = document.createElement('div');
            newPriceText.className = 'mypriceText';
            newPriceText.id = uniquePriceTextId; // ID를 요소에 할당
            newPriceInfo.appendChild(newPriceText);
        }
    }
    function openModal() {
        $.ajax({
            url:'/travelplans/naverTravelData',
            method: "GET",
            data : {
                selectedPlaceName : selectedDetails.content
            },
            success: function(response) {
                globalResponseData = response;

            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });
        const modal = document.getElementById("startModal");
        const foodModal = document.getElementById("foodModal");
        modal.style.display = "block";

        const selectBox = modal.querySelector(".select-box");
        const dateContainer = modal.querySelector(".date-btn-box");
        const foodModalTbody = foodModal.querySelector("tbody");
        selectBox.innerHTML = ""; // 선택 정보 초기화
        dateContainer.innerHTML = ""; // 날짜 정보 초기화
        foodModalTbody.innerHTML="";
        selectedDate = [];
        const selectBoxSpan1 = document.createElement("span");
        selectBoxSpan1.textContent =  selectedDetails.content+"("+selectedDetails.location+")";
        const selectBoxSpan2 = document.createElement("span");
        selectBoxSpan2.textContent =  selectedDetails.tags;

        var originalURL = selectedDetails.photo;
        var idMatch = originalURL.match(/id=([^&]+)/);
        var id = idMatch ? idMatch[1] : null;
        var modifiedURL = id ? originalURL.replace(idMatch[0], "&" + "id=" + id) : originalURL;

        selectBox.appendChild(selectBoxSpan1);
        selectBox.appendChild(selectBoxSpan2);

        for(var d=0;d<dateList.length;d++){
            const dateBox = document.createElement("div");
            dateBox.className = "date-box";

            const dateBoxInner = document.createElement("div");
            dateBoxInner.className = "date-box-1";

            const dateElement = document.createElement("div");
            dateElement.className = "dates";
            dateElement.textContent = dateList[d].date;

            dateBoxInner.appendChild(dateElement);
            dateBox.appendChild(dateBoxInner);

            const dateButton = document.createElement("button");
            dateButton.className = "date-btn-1";
            dateButton.textContent = "+";

            dateButton.addEventListener("click", () => {
                const existingImages = dateBox.querySelectorAll("img");
                const clickedDateElement = dateBox.querySelector(".dates");
                const clickDateVal = clickedDateElement.textContent;
                const index = selectedDate.indexOf(clickDateVal);

                if (index !== -1) {
                    selectedDate.splice(index, 1);
                } else {
                    selectedDate.push(clickDateVal);
                }

                if (existingImages.length > 0) {
                    existingImages.forEach(img => img.remove());
                } else {
                    const imageElement = document.createElement("img");
                    imageElement.src = modifiedURL;
                    imageElement.style.width = "60px";
                    imageElement.style.height = "60px";
                    imageElement.style.position = "absolute";
                    imageElement.style.padding = "6px";
                    imageElement.style.margin = "23px auto";

                    imageElement.addEventListener("click", () => {
                        const clickedImageIndex = selectedDate.indexOf(clickDateVal);
                        if (clickedImageIndex !== -1) {
                            selectedDate.splice(clickedImageIndex, 1); // Remove date from selectedDate
                        }
                        imageElement.remove(); // Remove the clicked image
                        // console.log(selectedDate); // Log selectedDate after removal
                    });
                    dateBox.appendChild(imageElement);
                }
            });

            const hotelSelectText = document.createElement("span");
            hotelSelectText.textContent = "날짜선택";

            dateBox.appendChild(dateButton);
            dateBox.appendChild(hotelSelectText);

            dateContainer.appendChild(dateBox);
        }


        const completeButton = document.createElement("div");
        completeButton.className = "date-select-btn";
        dateContainer.appendChild(completeButton);


        const departureButton = document.createElement("button");
        departureButton.className = "departure-button";
        departureButton.textContent = "날짜 선택";
        departureButton.addEventListener("click", () => {
            const dateListInfo = {
                dateList : dateList,
                selectedDate : selectedDate
            };
            ws.send(JSON.stringify({ type: 'selectDateList', data: dateListInfo }));
        });
        completeButton.appendChild(departureButton);

        const closeButton = document.querySelector(".close");
        closeButton.addEventListener("click", () => {
            modal.style.display = "none";
        });
    }
    function totalPriceFunc(totalPriceForThisPlace){
        const modal = document.getElementById("foodModal");
        document.getElementById(uniquePriceTextId).textContent = totalPriceForThisPlace;
        modal.style.display = "none";
        totalPriceForThisPlace = 0;
    }
    function addPlaced(dateList,selectedDate) {
        const startModal = document.querySelector("#startModal");
        startModal.style.display = "none";

        // 선택된 장소 정보를 가져옴 (예시로 장소 이름 가져옴)
        var selectedPlaceName = selectedDetails.content;
        // 새로운 요소 생성
        var newContainer = document.createElement('div');
        newContainer.className = 'container3';
        // "취소" 버튼 추가
        var newCancelButtonBox = document.createElement('img');
        var newCancelButton = document.createElement('button');
        var newCancelButtonContent = document.createElement('div');
        newCancelButtonBox.className = 'localBox';

        var newPlaceInfo = document.createElement('div');
        newPlaceInfo.className = 'myplaces';

        var newPriceInfo = document.createElement('div');
        newPriceInfo.className = 'mypriceBox';

        var newPlusButton = document.createElement('button');
        newPlusButton.className = 'plus-button';
        newPlusButton.textContent = '비용추가';

        priceTextIdCounter++;


        // + 버튼 클릭 시
        newPlusButton.addEventListener('click', function () {
            ws.send(JSON.stringify({ type: 'foodModal'}));
        });

        var newLikeStarBox = document.createElement('div');
        newLikeStarBox.className = 'likeStarBox';
        var newLikeImg = document.createElement('img');

        newLikeImg.className = 'likeImg';
        newLikeImg.src = '../../resources/images/like.png'

        var newLikeSpan = document.createElement('span');
        newLikeSpan.className = 'likeSpan';
        newLikeSpan.textContent = selectedDetails.likeCount;

        // var newStarImg = document.createElement('img');
        // newStarImg.src = '../../resources/images/star.png'
        // newStarImg.style.width = '21px';
        // newStarImg.className = 'StarImg';
        // var newStarSpan = document.createElement('span');
        // newStarSpan.className = 'starSpan';
        // newStarSpan.textContent = selectedDetails.starCount;

        newLikeStarBox.appendChild(newLikeImg);
        newLikeStarBox.appendChild(newLikeSpan);
        // newLikeStarBox.appendChild(newStarImg);
        // newLikeStarBox.appendChild(newStarSpan);
        newPriceInfo.appendChild(newLikeStarBox);
        newPriceInfo.appendChild(newPlusButton);
        var newPNums = document.createElement('div');
        newPNums.className = 'pnums';
        var newPNum = document.createElement('div');

        newPNum.className = 'pnum';
        newPNum.innerHTML = '<span>' + (priceTextIdCounter) + '</span>';
        newPNums.appendChild(newPNum);

        var newPlaceInfoDetails = document.createElement('div');
        newPlaceInfoDetails.className = 'place-info';

        var newPlaceName = document.createElement('div');
        var newPlace = document.createElement('div');
        newPlace.className = 'myplace';
        newPlace.textContent = selectedPlaceName;

        var cancel = document.createElement('button');
        cancel.className = 'cancel'
        cancel.textContent = 'x';

        newPlaceName.appendChild(newPlace);
        newPlaceName.appendChild(cancel);

        var newPlaceInfoContent = document.createElement('div');
        newPlaceInfoContent.className = 'myplaceinfo';
        newPlaceInfoContent.textContent = selectedDetails.tags;

        var newPlaceX = document.createElement('div');
        newPlaceX.className = 'placeX';
        newPlaceX.textContent = selectedDetails.x;
        newPlaceX.style.display = 'none';
        var newPlaceY = document.createElement('div');
        newPlaceY.className = 'placeY';
        newPlaceY.textContent = selectedDetails.y;
        newPlaceY.style.display = 'none';

        // 요소들을 조립하고 추가
        newPlaceInfoDetails.appendChild(newPlaceName);
        newPlaceInfoDetails.appendChild(newPlaceInfoContent);
        newPlaceInfoDetails.appendChild(newPlaceX);
        newPlaceInfoDetails.appendChild(newPlaceY);
        newPlaceInfoDetails.appendChild(newPriceInfo);

        newPlaceInfo.appendChild(newPNums);
        newPlaceInfo.appendChild(newPlaceInfoDetails);
        newCancelButton.appendChild(newCancelButtonContent);
        newCancelButtonBox.appendChild(newCancelButton);
        newContainer.appendChild(newCancelButtonBox);
        newContainer.appendChild(newPlaceInfo);


        // var startPlace = index === 1 ? selectedPlaceName : null;
        var startPlaceX = parseFloat(newContainer.querySelector('.placeX').textContent);
        var startPlaceY = parseFloat(newContainer.querySelector('.placeY').textContent);

        var container2Box;
        var dateData = {};

        for (var i = 0; i < dateList.length; i++) {
            // selectedDate와 dateList[i].date 비교하여 추가
            if (selectedDate.includes(dateList[i].date)) {
                dateTmp = dateList[i].date;
                container2Box = document.querySelector('.dateListBox .container2-box:nth-child('+(i+1)+')');
                if (container2Box) {
                    container2Box.appendChild(newContainer);
                }
            }
        }


        // .cancel 버튼 클릭 이벤트 핸들러 추가
        cancel.addEventListener('click', function () {
            // .container3 요소를 부모 노드에서 제거
            priceTextIdCounter--;
            newContainer.parentNode.removeChild(newContainer);
            // 배열에서 해당 장소 데이터를 제거
            var indexToRemove = placeDataList.findIndex(function (item) {
                return (
                    item.selectedDate === selectedDate &&
                    item.place === selectedPlaceName &&
                    item.x === startPlaceX &&
                    item.y === startPlaceY
                );
            });

            if (indexToRemove !== -1) {
                placeDataList.splice(indexToRemove, 1);
            }
        });
    }


    function tvlBtnFunc() {
        var data = {
            travel_title: "${param.travelTitle}",
            food_expenses: parseInt(document.querySelector('.discount-value').textContent.replace(/[^0-9.]/g, ''), 10),
            accommodation_expenses: parseInt(document.querySelector('.rate-value').textContent.replace(/[^0-9.]/g, ''), 10),
            etc_expenses: parseInt(document.querySelector('.etc-value').textContent.replace(/[^0-9.]/g, ''), 10),
            groupId : ${param.groupId}
        };
        $.ajax({
            url:'/insertScheduleTotalAmount',  // 수정된 부분
            method: "POST",
            data: JSON.stringify(data),
            contentType: "application/json",
            headers: {
                'Content-Type': 'application/json'
            },
            success: function(response) {
                ws.send(JSON.stringify({ type: 'saveTravel'}));
            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });
    }



    // 마커를 담을 배열입니다
    var markers = [];

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.56646, 126.98121), // 지도의 중심좌표
            level: 9, // 지도의 확대 레벨
            mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
        };

    // 지도를 생성한다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    function locationLoadSuccess(pos){
        // 현재 위치 받아오기
        var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);

        // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
        map.panTo(currentPos);

        // 마커 생성
        var marker = new kakao.maps.Marker({
            position: currentPos
        });

        // 기존에 마커가 있다면 제거
        marker.setMap(null);
        marker.setMap(map);
    };

    function locationLoadError(pos){
        alert('위치 정보를 가져오는데 실패했습니다.');
    };

    // 위치 가져오기 버튼 클릭시
    function getCurrentPosBtn(){
        navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
    };


    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places,details) {
        selectedDetails = details; // 선택된 장소 정보 저장
        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>';
        }

        itemStr += '  <span class="tel">' + places.phone  + '</span>' +
            '</div>';

        // "선택" 버튼 추가
        // itemStr += '<button class="select-button" onclick="addPlaced(' + index + ')">선택</button>';
        itemStr += '<button class="select-button" onclick="openModalFunc()">선택</button>';
        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }


    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
        imageSize = new kakao.maps.Size(24, 35),  // 마커 이미지의 크기
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다

        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }
    // 선을 그리는 함수
    function drawLineBetweenMarkers(marker1, marker2) {

        var path = [marker1.getPosition(), marker2.getPosition()];
        var polyline = new kakao.maps.Polyline({
            path: path,
            strokeWeight: 5, // 선의 두께 (두껍게 설정)
            strokeColor: 'rgb(64,64,64)',
            strokeOpacity: 1,
            strokeStyle: 'dashed', // 점선 스타일 설정
            strokeDashArray: [10, 5], // 점선의 간격과 공백 설정 (10px 선, 5px 공백)
        });

        polyline.setMap(map); // 지도에 선을 표시

        var latlng1 = marker1.getPosition();
        var latlng2 = marker2.getPosition();
        var distance = getDistance(latlng1, latlng2);

        // 거리 정보를 표시할 커스텀 오버레이 생성
        var overlayContent = '<div class="distance-overlay">거리: ' + distance.toFixed(2) + ' 미터</div>';
        var overlay = new kakao.maps.CustomOverlay({
            content: overlayContent,
            position: path[1], // 선의 끝점 위치에 표시
            xAnchor: 0,
            yAnchor: 0,
        });
        overlay.setMap(map);
    }
    // 두 지점 간의 거리를 계산하는 함수
    function getDistance(latlng1, latlng2) {
        var lat1 = latlng1.getLat();
        var lng1 = latlng1.getLng();
        var lat2 = latlng2.getLat();
        var lng2 = latlng2.getLng();

        var deg2rad = Math.PI / 180;
        var radius = 6371; // 지구 반경 (단위: km)

        var dLat = (lat2 - lat1) * deg2rad;
        var dLng = (lng2 - lng1) * deg2rad;

        var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(lat1 * deg2rad) * Math.cos(lat2 * deg2rad) *
            Math.sin(dLng / 2) * Math.sin(dLng / 2);

        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        var distance = radius * c;

        return distance * 1000; // km를 미터로 변환
    }

    // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
    function setMarkers(map) {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }
    }
    // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
    function showMarkers() {
        setMarkers(map)
    }

    // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
    function hideMarkers() {
        setMarkers(null);
    }
    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }




    var searchInput = document.getElementById('searchInput');
    var searchDropdown = document.getElementById('searchDropdown');

    searchInput.addEventListener('input', function() {
        var searchValue = searchInput.value;
        if (searchValue.trim() === '') {
            searchDropdown.innerHTML = '';
            return;
        }
        var travelPlaces = (${param.travelPlaceJson}).toString();

        $.ajax({
            url: "/searchResult", // 실제 서버 URL로 변경
            method: "GET",
            data: {
                searchText: searchValue,
                travelPlaces: travelPlaces
            },
            success: function(response) {
                showDropdown(response); // 검색 결과를 드롭다운으로 표시
            },
            error: function(error) {
                console.error("에러 발생:", error);
            }
        });
    });


    function showDropdown(data) {
        searchDropdown.innerHTML = '';
        if (data.length > 0) {
            var placeboxDiv = document.querySelector('.placebox');
            var placeSearch = document.querySelector('.place-search-result');
            data.forEach(function(item) {
                var dropdownItem = document.createElement('button');
                dropdownItem.textContent = item.content;
                dropdownItem.classList.add('dropdown-item');
                searchDropdown.appendChild(dropdownItem);

                dropdownItem.addEventListener('click', function() {
                    var selectedValue = item.content;
                    var selectedTNum = item.t_num; // t_num 값 가져오기
                    searchInput.value = selectedValue;
                    // 선택한 아이템 조회하기
                    $.ajax({
                        url: "getItemDetails", // 실제 서버 URL로 변경
                        method: "GET",
                        data: { itemId: selectedTNum }, // 아이템의 고유 ID 전송
                        success: function(details) {
                            // 아이템의 내용
                            var itemContent = details.content;
                            // 아이템의 태그
                            var itemTags = details.tags;
                            // 아이템의 이미지
                            var originalURL =details.photo;
                            var idMatch = originalURL.match(/id=([^&]+)/);
                            var id = idMatch ? idMatch[1] : null;
                            var modifiedURL = id ? originalURL.replace(idMatch[0], "&" + "id=" + id) : originalURL;
                            var likeCount = details.likeCount;
                            var starCount = details.starCount;

                            // 검색 내용 마커 찍기
                            ps.keywordSearch(itemContent, function(data, status, pagination) {
                                placesSearchCB(data, status, pagination, details); // Pass the details object
                            });

                        },
                        error: function(error) {
                            console.error("아이템 조회 에러:", error);
                        }
                    });

                    searchDropdown.innerHTML = ''; // 드롭다운 닫기
                });
            });

        } else {
            var dropdownItem = document.createElement('div');
            dropdownItem.textContent = "검색 결과 없음";
            dropdownItem.classList.add('dropdown-item');
            searchDropdown.appendChild(dropdownItem);
        }
    }
    function placesSearchCB(data, status, pagination,details) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            // displayPlaces(data, details);
            const displayPlaceMarker = {
                places : data,
                details : details
                // 다른 필요한 정보도 추가할 수 있음
            };
            ws.send(JSON.stringify({ type: 'displayPlaceMarker', data: displayPlaceMarker }));

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }


    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places, details) {
        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            // bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        // removeMarker();

        for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i],details); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            // bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title, details);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title, details);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
            selectedDetails.x = places[i].x;
            selectedDetails.y = places[i].y;
            break;
        }

        drawLinesBetweenMarkers(markers);

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        // map.setBounds(bounds);
    }
    function drawLinesBetweenMarkers(markers) {
        // for (var i = 0; i < markers.length - 1; i++) {
        //     for (var j = i + 1; j < markers.length; j++) {
        //         drawLineBetweenMarkers(markers[i], markers[j]);
        //     }
        // }
        for (var i = 0; i < markers.length - 1; i++) {
            drawLineBetweenMarkers(markers[i], markers[i + 1]);
        }
    }
    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title, details) {
        var contents = '<div class="infowindow-container">';
        contents += '<div class="infowindow-title">' + title + '</div>';

        var itemContent = details.content;
        var itemTags = details.tags;
        var originalURL = details.photo;
        var idMatch = originalURL.match(/id=([^&]+)/);
        var id = idMatch ? idMatch[1] : null;
        var modifiedURL = id ? originalURL.replace(idMatch[0], "&" + "id=" + id) : originalURL;

        contents += '<div class="infowindow-content">' + itemContent + '</div>';
        contents += '<div class="infowindow-tags">' + itemTags + '</div>';
        contents += '<img class="detail-img" style="width: 300px; height: 200px" src="' + modifiedURL + '" alt="Item Image">';
        contents += '</div>';

        infowindow.setContent(contents);
        infowindow.open(map, marker);
    }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }

</script>
</body>
</html>
