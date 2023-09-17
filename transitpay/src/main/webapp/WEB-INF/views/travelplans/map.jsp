<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/map.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa75059f83f9e745604b52cb811450f4&libraries=services"></script>
    <style>
        .mypriceText {
            position: relative;
            display: inline-block;
            cursor: pointer;
        }

        /* Tooltip text */
        .mypriceText::before {
            content: "+ 버튼을 눌러 음식을 추가해주세요!";
            position: absolute;
            background-color: #333;
            color: #fff;
            padding: 5px;
            border-radius: 50px;
            width: 200px;
            padding: 20px 10px;
            margin: 5px;
            font-size: 14px;
            opacity: 0;
            transition: opacity 0.2s;
            visibility: hidden;
            bottom: 100%;
            left: 100%;
            transform: translateX(-50%);
        }

        /* Show the tooltip on hover */
        .mypriceText:hover::before {
            opacity: 1;
            visibility: visible;
        }

        .foodModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1000;
            overflow: auto;
        }

        /* Modal Content */
        .food-modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border-radius: 5px;
            max-width: 600px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
        }


        .food-close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            cursor: pointer;
        }


        .food-select-box {
            background-color: #fff;
            margin: 20px auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        /* Styling for the food table */
        #foodTable {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        #foodTable th, #foodTable td {
            padding: 10px;
            text-align: left;
            width: 20%;
            border-bottom: 1px solid #ddd;
        }

        #foodTable th:first-child {
            width: 20px; /* Adjust the checkbox column width */
        }

        /* Styling for checkboxes */
        input[type="checkbox"] {
            width: 20px;
            height: 20px;
            margin-right: 10px;
        }

        /* Styling for the Add to Cart button */
        #addToCart {
            background-color: #fff;
            color: #009688;
            border: 1px solid #009688;;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            justify-content: center;
            width: 100%;
        }

        #addToCart:hover {
            background-color: #009688;
            color: #fff;
        }

    </style>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        <span>여행·일정 등록</span>
        <hr/>
    </div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">여행 일정 추가</div>
            <div class="menuhr"><hr/></div>
            <a href="/travel">여행 장소 선택</a>
            <a href="map">여행 일정 추가</a>
            <a href="traffic">교통편 보기</a>
            <a href="/">TOP 여행지</a>
            <a href="/">여행 기록</a>
        </div>
        <div class="contents-1">
            <div class="container">
                <div class="contents1">
                    <input type="text" class="title-text" value="${param.travelTitle}"></span><a class="update-text">수정</a>
                    <button class="travel-data">과거 여행 내역</button>
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
                            <input id="searchInput" type="text" placeholder="여행, 어디로 떠나시나요?">
                            <img class="searchimg" src="../../resources/images/search.png">
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
                        <h3>음식을 선택해주세요.</h3>
                        <div class="food-select-box">
                            <table id="foodTable">
                                <thead>
                                <tr>
                                    <th>선택</th> <!-- Empty header for checkboxes -->
                                    <th>음식</th>
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
                    <div>교통보기</div>
                </button>
                <button class="tvlbtn2" onclick="tvlStorageFunc()">
                    <div>임시저장</div>
                </button>
            </div>
        </div>
        <div class="scheduleShare">
            <div class="userCircle"></div>
            <div class="userCircle"></div>
            <div class="userCircle"></div>

        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>

<script>

    var selectedDetails;
    var selectedDate = [];
    var placeDataList = [];


    let totalPriceForThisPlace=0;
    let globalResponseData = null;
    let priceTextIdCounter = 0;
    var uniquePriceTextId;


    function tvlStorageFunc(){
        // 날짜 정보와 여행지 정보를 저장할 리스트
        const travelInfoList = [];

        // 모든 container2-box 요소를 선택
        const container2Boxes = document.querySelectorAll('.container2-box');

        // 각 container2-box 요소를 순회하며 정보 추출
        container2Boxes.forEach((container2Box, index) => {
            // 날짜 정보 추출
            const day = container2Box.querySelector('.day').textContent.trim();

            // container2 클래스의 내용 추출
            const container2 = container2Box.querySelector('.container2');
            const detailedDate = container2.querySelector('.days').textContent.trim();

            // 해당 container2-box 내부의 여행지 정보 추출
            const container3Elements = container2Box.querySelectorAll('.container3');
            const placesInfo = [];

            container3Elements.forEach((container3) => {
                const myplace = container3.querySelector('.myplace').textContent.trim();
                const myplaceinfo = container3.querySelector('.myplaceinfo').textContent.trim();
                const mypriceText = container3.querySelector('.mypriceText').textContent.trim();

                placesInfo.push({
                    myplace,
                    myplaceinfo,
                    mypriceText,
                });
            });

            // 추출한 정보를 객체로 저장
            const travelInfo = {
                day,
                detailedDate,
                placesInfo,
            };

            // 리스트에 추가
            travelInfoList.push(travelInfo);
        });

        // 결과 확인
        console.log(travelInfoList);
        $.ajax({
            url: "/saveTravelInfo", // 실제 서버 URL로 변경
            method: "POST",
            data: {
                travelInfoList: travelInfoList
            },
            success: function(response) {

            },
            error: function(error) {
                console.error("에러 발생:", error);
            }
        });

    }


    const modal = document.getElementById("foodModal");
    const tbody = foodTable.querySelector("tbody");
    const addToCartButton = document.getElementById("addToCart");
    addToCartButton.addEventListener("click", function () {
        const selectedItems = [];

        const rows = tbody.querySelectorAll("tr");
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

        document.getElementById(uniquePriceTextId).textContent = totalPriceForThisPlace + ' 원';
        modal.style.display = "none";
        totalPriceForThisPlace = 0;
    });

    function addPlaced(dateList,index) {
        const modal = document.getElementById("foodModal");
        modal.style.display = "block";
        const foodTable = document.getElementById("foodTable");
        const tbody = foodTable.querySelector("tbody");
        let totalPrices = []; // 각 행의 가격을 추적하기 위한 배열

        if (!globalResponseData || globalResponseData.length === 0) {
            var foodInput = prompt("가격을 입력해주세요");
            uniquePriceTextId = 'mypriceText-' + priceTextIdCounter;

            var newPriceText = document.createElement('div');
            newPriceText.className = 'mypriceText';
            newPriceText.id = uniquePriceTextId;
            newPriceText.textContent = foodInput + ' 원';
            priceTextIdCounter++;
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
                addButton.textContent = "+";
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
            var newPriceText = document.createElement('div');
            newPriceText.className = 'mypriceText';
            uniquePriceTextId = "mypriceText-" + priceTextIdCounter; // 고유한 ID 생성
            newPriceText.id = uniquePriceTextId; // ID를 요소에 할당
            priceTextIdCounter++;

        }


        const foodCloseButton = document.querySelector(".food-close-btn");
        foodCloseButton.addEventListener("click", () => {
            modal.style.display = "none";
        });


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
        if (index === 1) {
            newCancelButtonBox.src = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png'
        } else {
            newCancelButtonBox.src = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png'
        }
        newCancelButtonBox.style.width = '50px';
        newCancelButtonBox.style.height = '45px';
        var newPlaceInfo = document.createElement('div');
        newPlaceInfo.className = 'myplaces';

        var newPriceInfo = document.createElement('div');
        newPriceInfo.className = 'mypriceBox';

        var newPlusButton = document.createElement('button');
        newPlusButton.className = 'plus-button';
        newPlusButton.textContent = '+';

        // + 버튼 클릭 시
        newPlusButton.addEventListener('click', function () {
            const mypriceText = document.getElementById(uniquePriceTextId).textContent;
            const currentDiscountValue = getDiscountValue(selectedDetails.tags);
            const priceValue = parseInt(mypriceText.replace(/\D/g, ''));
            const newDiscountValue = parseInt(currentDiscountValue.replace(/\D/g, '')) + priceValue;
            updateDiscountValue(selectedDetails.tags, newDiscountValue);
            updateAmountValue(priceValue);

        });


        var newLikeStarBox = document.createElement('div');
        newLikeStarBox.className = 'likeStarBox';
        var newLikeImg = document.createElement('img');

        newLikeImg.className = 'likeImg';
        newLikeImg.src = '../../resources/images/like.png'

        var newLikeSpan = document.createElement('span');
        newLikeSpan.className = 'likeSpan';
        newLikeSpan.textContent = selectedDetails.likeCount;

        var newStarImg = document.createElement('img');
        newStarImg.src = '../../resources/images/star.png'
        newStarImg.style.width = '21px';
        newStarImg.className = 'StarImg';
        var newStarSpan = document.createElement('span');
        newStarSpan.className = 'starSpan';
        newStarSpan.textContent = selectedDetails.starCount;

        newLikeStarBox.appendChild(newLikeImg);
        newLikeStarBox.appendChild(newLikeSpan);
        newLikeStarBox.appendChild(newStarImg);
        newLikeStarBox.appendChild(newStarSpan);

        newPriceInfo.appendChild(newLikeStarBox);
        newPriceInfo.appendChild(newPriceText);
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


        var startPlace = index === 1 ? selectedPlaceName : null;
        var startPlaceX = parseFloat(newContainer.querySelector('.placeX').textContent);
        var startPlaceY = parseFloat(newContainer.querySelector('.placeY').textContent);

        var container2Box;
        var dateData = {};
        for (var i = 0; i < dateList.length; i++) {
            // selectedDate와 dateList[i].date 비교하여 추가
            if (selectedDate.includes(dateList[i].date)) {
                container2Box = document.querySelector('.dateListBox .container2-box:nth-child('+(i+1)+')');

                if (container2Box) { // container2Box가 존재할 때만
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

    function updateAmountValue(value) {
        const amountValue = document.querySelector('.amount-value');
        const currentAmount = parseInt(amountValue.textContent.replace(/\D/g, ''));
        amountValue.textContent = (currentAmount + value).toLocaleString() + "원";
    }


    function tvlBtnFunc() {
        // 빈 배열을 선언하여 데이터를 저장할 준비를 합니다.
        var dataList = [];
        var title = "${param.travelTitle}";
        var dateListBox = document.querySelector('.dateListBox');
        var container2Boxes = dateListBox.querySelectorAll('.container2-box');


        container2Boxes.forEach(function(container2Box) {
            var container2 = container2Box.querySelector('.container2');
            var dayValue = container2.querySelector('.day').textContent;

            var container3Elements = container2Box.querySelectorAll('.container3');

            container3Elements.forEach(function(container3) {
                var myPlaceValue = container3.querySelector('.myplace').textContent;
                var myPlaceInfoValue = container3.querySelector('.myplaceinfo').textContent;
                var placeX = container3.querySelector('.placeX').textContent;
                var placeY = container3.querySelector('.placeY').textContent;

                // 추출한 데이터를 객체로 만듭니다.
                var data = {
                    scheduleDate: dayValue,
                    travelTitle : myPlaceValue,
                    placeX: placeX,
                    placeY: placeY,
                    title : title
                };

                // 데이터를 배열에 추가합니다.
                dataList.push(data);
            });
        });
        // dataList 배열을 JSON 형식으로 변환합니다.
        var jsonData = JSON.stringify(dataList);

        $.ajax({
            url:'/travelplans/schedule',  // 수정된 부분
            method: "POST",
            data: jsonData,
            contentType: "application/json",
            headers: {
                'Content-Type': 'application/json'
            },
            success: function(response) {
                if (response === "요청 처리 중에 오류가 발생") {

                } else {
                    var link = document.createElement("a");
                    link.href = "/traffic?title="+"${param.travelTitle}";
                    link.click();
                }
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
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 7 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

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
        itemStr += '<button class="select-button" onclick="openModal()">선택</button>';
        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
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
                    selectedDate.splice(index, 1); // Remove the date if it's already selected
                } else {
                    selectedDate.push(clickDateVal); // Add the date if it's not selected
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
        departureButton.textContent = "출발지 선택";
        departureButton.addEventListener("click", () => {
            addPlaced(dateList,1);
        });
        completeButton.appendChild(departureButton);

        const arrivalButton = document.createElement("button");
        arrivalButton.className = "arrival-button";
        arrivalButton.textContent = "도착지 선택";
        arrivalButton.addEventListener("click", () => {
            addPlaced(dateList,2);
        });
        completeButton.appendChild(arrivalButton);

        const closeButton = document.querySelector(".close");
        closeButton.addEventListener("click", () => {
            modal.style.display = "none";
        });
    }



    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = '../../../resources/images/icons8-지도-핀-48.png',
            imageSize = new kakao.maps.Size(36, 36),  // 마커 이미지의 크기
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
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
            displayPlaces(data, details);

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
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for ( var i=0; i<places.length; i++ ) {
            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i],details); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

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
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
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
        contents += '<img class="detail-img" src="' + modifiedURL + '" alt="Item Image">';
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
