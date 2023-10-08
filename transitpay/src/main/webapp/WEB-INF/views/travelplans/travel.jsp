<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/travel.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script src="../../../resources/js/socket.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <style>
        #chatting::placeholder{
            font-size: 11px;
        }
        .chating{
            background-color: #e3efff;
            height: 400px;
            overflow: auto;
            border-radius: 10px;
            padding: 10px;

        }
        .chating .me{
            padding: 10px;
            background: #1286f3;
            border-radius: 10px;
            float: right;
            color: white;
            font-weight: 700;
            text-align: right;
            margin-bottom: 5px;
        }
        .chating .others{
            float: left;
            margin: 0;
        }
        .user-name{
            font-weight: 700;
            color: #363636;
            padding: 4px;
            float: left;
            width: 100%;
        }
        .other-msg{
            background: white;
            padding: 10px;
            float: left;
            font-weight: 700;
            color: #676767;
            border-radius: 10px;
        }
        .chating .start{
            color: #AAAAAA;
            text-align: center;
        }
        .chating .exit{
            color: red;
            text-align: center;
            font-size: 11px;
        }
        .sendimg{
            width: 34px;
        }
        #sendBtn{
            background: 0;
            border: 0;
            margin: 5px;
            position: absolute;
            right: 0;
        }
        #container{
            margin: 20px 10px 10px 10px;
            width: 500px;
            padding: 15px;
            height: 550px;
            background: white;
            border-radius: 10px;
            z-index: 1;
        }
        .sendth{
            display: flex;
            width: 100%;
            position: relative;
        }
        .inputTable{
            width: 100%;
        }
        .start{
            font-size: 10px;
            margin: 0;
            color: #000000;
            font-weight: 700;
            background: #ececec;
            border-radius: 10px;
            padding: 5px;
            line-height: 6px;
        }

        /* 숫자 스타일 */
        .count-badge {
            display: inline-block;
            width: 30px;
            height: 30px;
            background-color: #242b33;
            color: #fff; /* 글자 색상 */
            text-align: center;
            float: left;
            border-radius: 50%; /* 원 모양 */
            font-size: 16px; /* 글자 크기 */
            line-height: 30px; /* 세로 중앙 정렬 */
            margin-right: 5px; /* 숫자와 텍스트 사이 여백 */
        }

        /* 텍스트 스타일 */
        .item-text {
            font-size: 16px; /* 텍스트 글자 크기 */
            text-align: left;
            line-height: 30px; /* 세로 중앙 정렬 */
        }
        .table td{
            width: 300px;
            text-align: left;
            float: left;
        }
        .table{

            margin: 0 auto;
        }
        .popul{
            margin-left: 50px;
            color: #5F5F5F;
        }
    </style>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
<%--    <hr class="mainhr"/>--%>
    <div class="traveltitle">
        여행·일정 등록<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">여행 장소 선택</div>
            <div class="menuhr"><hr/></div>
            <a href="/travel">여행 장소 선택</a>
            <a href="map">여행 일정 추가</a>
            <a href="/categoryTravel">TOP 여행지</a>
        </div>
<%--        <form id="travelForm">--%>
            <div class="contents-1">

                <div class="btn-group">
                    <div class="btn btn1 active" onclick="moveToDomestic()">
                        <button type="button" name="kr">국내여행</button>
                    </div>
                    <div class="btn btn2" onclick="moveToOverseas()">
                        <button type="button" name="fc">해외여행</button>
                    </div>
                    <div class="active-bar" style="left: 0; width: 50%;"></div>
                </div>

                <div class="search">
                    <input id="searchInput" type="text" placeholder="여행, 어디로 떠나시나요?">
                    <img class="searchimg" src="../../resources/images/search.png"  style="width: 50px;" onclick="searchBtn()" >
                    <div id="searchDropdown" class="dropdown-content"></div>
                </div>
                <div class="placebox">
                    <div class="place-search-result">검색결과가 없습니다.<br/>검색할 장소를 추가해주세요.</div>
                </div>

                <div class="selectinfo">
                    <div class="placeselect">
                        장소선택
                    </div><br>
                    <div class="placeselect2">
                    </div>
                </div>
                <div class="selectinfo">
                    <div class="placeselect">
                        제목입력
                    </div><br>
                    <input type="text" class="title-text" name="title" placeholder="여행 제목을 입력해주세요">
                </div>

                <div class="selectinfo">

                    <div class="placeselect">
                        날짜선택
                    </div><br>
                    <input name="datetimes" class="datetimes" id="datern"/>

                </div>
                <button class="tvlbutton" onclick="sendSelectedData()">
                    <div class="tvlselect">선택완료</div>
                </button>
            </div>
        <%@ include file="../socket.jsp" %>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</body>
<script>

    const titleInput = document.querySelector('.title-text');
    titleInput.addEventListener('keypress', function(event) {
        if (event.key === 'Tab') {
            const travelTitle = titleInput.value;
            ws.send(JSON.stringify({ type: 'travelTitle', data: travelTitle }));
        }
        if (event.key === 'Enter') {
            // 엔터 키가 눌렸을 때 입력 내용을 출력
            const travelTitle = titleInput.value;
            ws.send(JSON.stringify({ type: 'travelTitle', data: travelTitle }));
        }
    })
    $('input[name="datetimes"]').daterangepicker({
        "locale":{
            "format": "YYYY/MM/DD",
            "separator": " - ",
            "applyLabel": "적용",
            "cancelLabel": "취소",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "daysOfWeek": ["일","월", "화", "수", "목", "금", "토"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"] },
    }, function (start, end, label) {
        const datetimes = {
            start : start.format('YYYY/MM/DD'),
            end : end.format('YYYY/MM/DD')
        };
        ws.send(JSON.stringify({ type: 'datetimes', data: datetimes }));
    });

    var selectedData = [];
    var activeBar = document.querySelector('.active-bar');

    function moveToDomestic() {
        var btn1 = document.querySelector('.btn1');
        var btn2 = document.querySelector('.btn2');
        btn1.classList.add('active');
        btn2.classList.remove('active');
        activeBar.style.left = '0';
        activeBar.style.width = '50%';
    }

    function moveToOverseas() {
        var btn1 = document.querySelector('.btn1');
        var btn2 = document.querySelector('.btn2');
        btn2.classList.add('active');
        btn1.classList.remove('active');
        activeBar.style.left = '50%';
        activeBar.style.width = '46%';
    }
        // 선택된 장소를 삭제하는 함수
    function removeSelectedPlace(button) {
        const placeselect2 = button.closest('.placeselect2');
        const categoryselect = document.createElement('button');

        placeselect2.removeChild(button);
        categoryselect.style.display = 'none';
    }
    // 선택 버튼을 누를 때마다 장소를 추가하는 함수
    function addSelectedPlace(region) {
        const placeselect2 = document.querySelector('.placeselect2');

        const categoryselect = document.createElement('button');
        categoryselect.className = 'categoryselect';

        const div = document.createElement('div');
        const span = document.createElement('span');
        span.className = 'region';
        span.textContent = region;

        const img = document.createElement('img');
        img.className = 'ximg';
        img.style.width=  '10px';
        img.src = '../../resources/images/x.png';

        img.addEventListener('click', function() {
            removeSelectedPlace(categoryselect);
        });

        div.appendChild(span);
        div.appendChild(img);
        categoryselect.appendChild(div);
        placeselect2.appendChild(categoryselect);

        const dateRangePicker = $('input[name="datetimes"]').data('daterangepicker');
        const goingDate = dateRangePicker.startDate.format('YYYY-MM-DD');
        const returningDate = dateRangePicker.endDate.format('YYYY-MM-DD');

        selectedData.push(region);
    }

    function getType() {
        var btn1 = document.querySelector('.btn1');
        var btn2 = document.querySelector('.btn2');

        if (btn1.classList.contains('active')) {
            return '국내여행';
        } else if (btn2.classList.contains('active')) {
            return '해외여행';
        }

        // Default fallback value
        return 'Unknown';
    }

    function getDates() {
        return $('input[name="datetimes"]').val();
    }
    function sendSelectedData() {
        const travelTitle = $('input[name="title"]').val();
        const dateRangePicker = $('input[name="datetimes"]').data('daterangepicker');
        const goingDate = dateRangePicker.startDate.format('YYYY-MM-DD');
        const returningDate = dateRangePicker.endDate.format('YYYY-MM-DD');
        const travelPlaceList = selectedData;
        const groupId = "${sessionScope.groupAccountDetail.group_id}";

        var travelInfoData = {
            travelPlaceList: travelPlaceList,
            travelStart: goingDate,
            travelEnd: returningDate,
            travelTitle: travelTitle,
            groupId:groupId
        }
        $.ajax({
            url:'/travelplans/map',  // 수정된 부분
            method: "POST",
            data: JSON.stringify(travelInfoData),
            contentType: "application/json",
            success: function(response) {
                ws.send(JSON.stringify({ type: 'travelSubmit',data: response}));
            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });

    }

    const selectedPlaces = [];
    // 선택 버튼 클릭 시 실행할 함수
    function onSelectionButtonClick() {
        const region = searchInput.value; // 선택한 지역을 여기에 넣으세요
        const placeInfo = {
            region: region,
            // 다른 필요한 정보도 추가할 수 있음
        };
        ws.send(JSON.stringify({ type: 'addPlace', data: placeInfo }));
        console.log(region);

        // addSelectedPlace(region);
        const selectButton = this; // 선택한 버튼을 가져옴
        const cancelButton = selectButton.nextElementSibling; // 취소 버튼 가져옴

        selectButton.style.display = 'none'; // 선택 버튼 숨기기
        cancelButton.style.display = 'block'; // 취소 버튼 보이기

        // 선택한 지역을 배열에 추가
        selectedPlaces.push(region);

    }

    // 취소 버튼을 누를 때 실행되는 함수
    function onCancelButtonClick() {
        const selectButton = document.querySelector('.pbutton');
        const cancelButton = document.querySelector('.pbuttonaction');
        const placeboxDiv = document.querySelector('.placebox');
        const categorybtn = document.querySelector('.categoryselect');
        const placesDiv = cancelButton.closest('.places');
        placeboxDiv.removeChild(placesDiv);
        categorybtn.style.display = 'none';
        selectButton.style.display = 'block'; // 선택 버튼 보이기
        cancelButton.style.display = 'none'; // 취소 버튼 숨기기
    }

    var searchInput = document.getElementById('searchInput');
    var searchDropdown = document.getElementById('searchDropdown');
    searchInput.addEventListener('click', function() {
        searchLocation();
    });
    searchInput.addEventListener('input', function() {
    var searchValue = searchInput.value;

    if (searchValue.trim() === '') {
        searchLocation();
        searchDropdown.innerHTML = '';
        return;
    }

    $.ajax({
        url: "/placeSearch", // 실제 서버 URL로 변경
        method: "GET",
        data: { searchText: searchValue },
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
        dropdownItem.textContent = item;
        dropdownItem.classList.add('dropdown-item');
        searchDropdown.appendChild(dropdownItem);

        dropdownItem.addEventListener('click', function() {
        var selectedValue = item;
        searchInput.value = selectedValue;
        // 선택한 아이템 조회하기

        // 받아온 장소의 세부 정보를 사용하여 UI 업데이트
        var placesDiv = document.createElement('div');
        placesDiv.classList.add('places');
        var placeleftDiv = document.createElement('div');
        placeleftDiv.classList.add('placeleft');

        var placeDiv = document.createElement('div');
        placeDiv.classList.add('place');

        var contentSpan = document.createElement('span');
        contentSpan.classList.add('placespan');
        contentSpan.textContent = selectedValue;

        placeDiv.appendChild(contentSpan);
        placeleftDiv.appendChild(placeDiv);
        placesDiv.appendChild(placeleftDiv);

        if (selectedValue) {
        var selectionButton = document.createElement('button');
        selectionButton.classList.add('pbutton');

        selectionButton.innerHTML = '<div class="select">선택</div>';
        selectionButton.addEventListener('click', onSelectionButtonClick);

        placesDiv.appendChild(selectionButton);
    }

        if (selectedValue) {
        var cancelButton = document.createElement('button');
        cancelButton.classList.add('pbuttonaction');
        cancelButton.style.display = 'none';
        cancelButton.innerHTML = '<div class="selectaction">취소</div>';
        cancelButton.addEventListener('click', onCancelButtonClick);

        placesDiv.appendChild(cancelButton);
    }

        placeSearch.style.display = 'none';
        placeboxDiv.appendChild(placesDiv);


        searchInput.value = selectedValue;

        searchDropdown.innerHTML = ''; // 드롭다운 닫기
    });
    });

    } else {
            searchLocation();
        }
    }

    $.ajax({
        type: "POST",
        url: "/searchLocation",
        success: function (searchData, state, xhr) {
            var h2 = document.createElement('h2');
            h2.textContent = "인기검색어";
            h2.className='popul'
            var $searchList = $("<table class='table'></table>"); // 결과를 표시할 테이블
            var maxRows = 5; // 최대 행 수
            var maxColumns = 2; // 최대 열 수
            var itemCounter = 0; // 아이템 카운터

            for (var i = 0; i < maxRows; i++) {
                var $currentRow = $("<tr></tr>");

                for (var j = 0; j < maxColumns; j++) {
                    if (itemCounter >= searchData.length) {
                        break; // 검색 결과가 10개 미만인 경우에 대한 처리
                    }

                    var searchItem = searchData[itemCounter];
                    var $column = $("<td></td>");
                    var $item = $("<button class='dropdown-item'></button>");
                    var $countBadge = $("<span class='count-badge'></span>");
                    var $itemText = $("<span class='item-text'></span>");

                    // 카운팅 숫자 스타일 적용
                    $countBadge.text(itemCounter + 1);

                    // 아이템 텍스트 설정
                    $itemText.text(searchItem.search_keyword);

                    $item.append($countBadge);
                    $item.append($itemText);

                    // 클로저를 사용하여 searchItem 값을 전달
                    $item.on('click', (function (selectedItem) {
                        return function () {
                            var selectedValue = selectedItem.search_keyword;
                            // 선택한 아이템 조회하기
                            // 받아온 장소의 세부 정보를 사용하여 UI 업데이트
                            // ...

                            searchInput.value = selectedValue;
                            searchDropdown.innerHTML = ''; // 드롭다운 닫기
                        };
                    })(searchItem));

                    $column.append($item);
                    $currentRow.append($column);
                    itemCounter++;
                }

                $searchList.append($currentRow);
            }
            searchDropdown.appendChild(h2);
            searchDropdown.appendChild($searchList.get(0));
        },
        error: function (xhr, data) {
            // 오류 처리 로직 추가
        }
    });

</script>
<!-- /travel 페이지 HTML 코드 -->
</html>
