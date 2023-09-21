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
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

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
            <a href="traffic">교통편 보기</a>
            <a href="/">TOP 여행지</a>
            <a href="/">여행 기록</a>
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
                    <img class="searchimg" src="../../resources/images/search.png" onclick="searchBtn()" >
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

        <div class="scheduleShare">
            <div class="sessionId" id="sessionId">
                <div id="chating"></div>
            </div>
        </div>
<%--        </form>--%>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</body>
<script>
    const titleInput = document.querySelector('.title-text');
    titleInput.addEventListener('keypress', function(event) {
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
            // 다른 필요한 정보도 추가할 수 있음
        };
        ws.send(JSON.stringify({ type: 'datetimes', data: datetimes }));
    });


    $(document).ready(function() {
        wsOpen();
    })
    var ws;

    function wsOpen(){
        //websocket을 지정한 URL로 연결
        ws = new WebSocket("ws://" + location.host + "/websocket");
        wsEvt();
    }
    // 웹 소켓 연결이 열렸을 때 실행
    function wsEvt() {
        ws.onopen = function (event) {
            console.log("웹 소켓 연결이 열렸습니다.");
        };

        // 웹 소켓 서버로부터 메시지 수신 시 실행
        ws.onmessage = function (event) {
            console.log(event)
            //e 파라미터는 websocket이 보내준 데이터
            var msg = event.data; // 전달 받은 데이터
            console.log(msg)
            if (msg != null && msg.trim() != '') {
                var d = JSON.parse(msg);
                //socket 연결시 sessionId 셋팅
                if (d.type == "getId") {
                    var si = d.sessionId != null ? d.sessionId : "";
                    if (si != '') {
                        $("#sessionId").val(si);
                        var obj = {
                            type: "open",
                            sessionId: "${sessionScope.member.member_id}",
                            userName: "${sessionScope.member.name}",
                            memberImg : "${sessionScope.member.kakao_img}"
                        }
                        //서버에 데이터 전송
                        ws.send(JSON.stringify(obj))
                    }
                }
                //채팅 메시지를 전달받은 경우
                else if (d.type == "message") {
                    if (d.sessionId == $("#sessionId").val()) {
                        $("#chating").append("<p class='me'>" + d.msg + "</p>");
                    } else {
                        $("#chating").append("<p class='others'>" + d.userName + " : " + d.msg + "</p>");
                    }

                }
                else if(d.type == "addPlace"){
                    addSelectedPlace(d.data.region);
                    $('.place-search-result').css('display', 'none');
                }
                else if(d.type == "travelTitle"){
                    $('input[name="title"]').val(d.data);
                }
                else if(d.type == "datetimes"){
                    $('input[name="datetimes"]').val(d.data.start + " - "+d.data.end);
                }
                else if(d.type == 'travelSubmit'){
                    if (d.data === "세션이 존재하지 않음") {

                    } else if (d.data === "여행 장소 데이터 처리 중 오류가 발생") {

                    } else if (d.data  === "요청 처리 중에 오류가 발생") {

                    } else {
                        var link = document.createElement("a");
                        link.href = "/map?travelTitle=" + encodeURIComponent(d.data.travelTitle) +
                            "&travelStart=" + encodeURIComponent(d.data.travelStart) +
                            "&travelEnd=" + encodeURIComponent(d.data.travelEnd) +
                            "&travelPlaceJson=" + encodeURIComponent(d.data.travelPlaceJson) +
                            "&daysLeft=" + encodeURIComponent(d.data.daysLeft) +
                            "&dDay=" + encodeURIComponent(d.data.dday);
                        link.click();
                    }
                }
                //새로운 유저가 입장하였을 경우
                else if (d.type == "open") {

                    if (d.sessionId == $("#sessionId").val()) {
                        console.log("dsf")
                        $("#chating").append("<p class='start'>[채팅에 참가하였습니다.]</p>");
                    } else {
                        $("#chating").append("<img/>");
                        $("#chating").append("<p class='start'>[" + d.userName + "]님이 입장하였습니다." + "</p>");
                        // Create a container for the image with a unique class or ID
                        var $userImageContainer = $("<div>").addClass("user-image-container");

                        // Append the image to the container

                        // Append the container to a specific location in your HTML (e.g., where you want the image to appear)
                        $("#userImagesContainer").append($userImageContainer);
                    }
                }

                //유저가 퇴장하였을 경우
                else if (d.type == "close") {
                    $("#chating").append("<p class='exit'>[" + d.userName + "]님이 퇴장하였습니다." + "</p>");

                } else {
                    console.warn("unknown type!")
                }
            }
            // document.addEventListener("keypress", function (e) {
            //     if (e.keyCode == 13) { //enter press
            //         send();
            //     }
            // });

        };
        // 웹 소켓 연결이 닫혔을 때 실행
        ws.onclose = function(event) {
            if (event.wasClean) {
                console.log("웹 소켓 연결이 정상적으로 닫혔습니다.");
            } else {
                console.error("웹 소켓 연결이 비정상적으로 닫혔습니다.");
            }
        };

        // 웹 소켓 오류 발생 시 실행
        ws.onerror = function(error) {
            console.error("웹 소켓 오류 발생: " + error.message);
        };

    }

    function send() {
        var obj ={
            type: "message",
            sessionId : "${sessionScope.member.member_id}",
            userName : "${sessionScope.member.name}",
            msg : $("#chatting").val()
        }
        //서버에 데이터 전송
        ws.send(JSON.stringify(obj))
        $('#chatting').val("");
    }

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
        var travelInfoData = {
            travelPlaceList: travelPlaceList,
            travelStart: goingDate,
            travelEnd: returningDate,
            travelTitle: travelTitle
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
    searchInput.addEventListener('input', function() {
    var searchValue = searchInput.value;

    if (searchValue.trim() === '') {
        searchDropdown.innerHTML = '';
        return;
    }

    $.ajax({
        url: "placeSearch", // 실제 서버 URL로 변경
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
        var dropdownItem = document.createElement('div');
        dropdownItem.textContent = "검색 결과 없음";
        dropdownItem.classList.add('dropdown-item');
        searchDropdown.appendChild(dropdownItem);
    }
    }
</script>
<!-- /travel 페이지 HTML 코드 -->
</html>
