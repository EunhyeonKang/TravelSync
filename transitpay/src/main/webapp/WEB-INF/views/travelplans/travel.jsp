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

</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
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
                    <input id="searchInput" type="text" placeholder="여행, 어디로 떠나시나요?" autocomplete="off"/>
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
                    <input type="text" class="title-text" name="title" placeholder="여행 제목을 입력해주세요" autocomplete="off">
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

    function removeSelectedPlace(button) {
        const placeselect2 = button.closest('.placeselect2');
        const categoryselect = document.createElement('button');
        placeselect2.removeChild(button);
        categoryselect.style.display = 'none';
    }

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
    function onSelectionButtonClick() {
        const region = searchInput.value;
        const placeInfo = {
            region: region,
        };
        ws.send(JSON.stringify({ type: 'addPlace', data: placeInfo }));
        const selectButton = this;
        const cancelButton = selectButton.nextElementSibling;
        selectButton.style.display = 'none';
        cancelButton.style.display = 'block';
        selectedPlaces.push(region);
    }
    function onCancelButtonClick() {
        const selectButton = document.querySelector('.pbutton');
        const cancelButton = document.querySelector('.pbuttonaction');
        const placeboxDiv = document.querySelector('.placebox');
        const categorybtn = document.querySelector('.categoryselect');
        const placesDiv = cancelButton.closest('.places');
        placeboxDiv.removeChild(placesDiv);
        categorybtn.style.display = 'none';
        selectButton.style.display = 'block';
        cancelButton.style.display = 'none';
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
        url: "/placeSearch",
        method: "GET",
        data: { searchText: searchValue },
        success: function(response) {
            showDropdown(response);
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
        searchDropdown.innerHTML = '';
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
            var $searchList = $("<table class='table'></table>");
            var maxRows = 5;
            var maxColumns = 2;
            var itemCounter = 0;

            for (var i = 0; i < maxRows; i++) {
                var $currentRow = $("<tr></tr>");

                for (var j = 0; j < maxColumns; j++) {
                    if (itemCounter >= searchData.length) {
                        break;
                    }

                    var searchItem = searchData[itemCounter];
                    var $column = $("<td></td>");
                    var $item = $("<button class='dropdown-item'></button>");
                    var $countBadge = $("<span class='count-badge'></span>");
                    var $itemText = $("<span class='item-text'></span>");


                    $countBadge.text(itemCounter + 1);


                    $itemText.text(searchItem.search_keyword);

                    $item.append($countBadge);
                    $item.append($itemText);


                    $item.on('click', (function (selectedItem) {
                        return function () {
                            var selectedValue = selectedItem.search_keyword;
                            searchInput.value = selectedValue;
                            searchDropdown.innerHTML = '';
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
        }
    });
</script>
</html>
