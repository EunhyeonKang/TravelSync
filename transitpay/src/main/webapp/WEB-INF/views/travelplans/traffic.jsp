<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../../../resources/css/taffic.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <div class="main">
        <%@ include file="../include/header.jsp" %>
            <div class="traveltitle">
                <span>교통편 보기</span>
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
                    <div class="trafficContainerBox">
                        <span>${param.title}</span>
                        <div class="traffic-modal-content">
                            <div class="startEnd">
                                <h3>이동경로 정보</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
<script>
    var title = "${param.title}"
    window.onload = function() {
        $.ajax({
            url:'/travelplans/traffic',  // 수정된 부분
            data: { title: title },
            method: "GET",
            success: function(response) {
                for(var i =0; i<response.length;i++){
                    odsayTraffic(response[i].startPlaceX,
                        response[i].startPlaceY,
                        response[i].endPlaceX,
                        response[i].endPlaceY,
                        response[i].travelTitle,
                        response[i].travelTitle1);
                }
            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });
    };


    function odsayTraffic(SX, SY, EX, EY,startPlace,arrivalPlace) {
        var apiUrl = `https://api.odsay.com/v1/api/searchPubTransPathT?apiKey=qlyEa3nfaGVGFhl1LrJG6nmn%2B7MQgg3EblfWZ%2BXEips&lang=1&SX=` + SX + `&SY=` + SY + `&EX=` + EX + `&EY=` + EY + `&OPT=0&SearchType=0&SearchPathType=0`;
        $.ajax({
            url: apiUrl,
            method: "GET",
            dataType: "json",
            success: function (response) {
                console.log(response);
                var startEnd = document.querySelector('.startEnd');

                const startPlaceSpan = document.createElement('span');
                startPlaceSpan.className = 'startPlace';
                startPlaceSpan.textContent = `출발지 : ` + startPlace;
                startEnd.appendChild(startPlaceSpan);

                const endPlaceSpan = document.createElement('span');
                endPlaceSpan.className = 'endPlace';
                endPlaceSpan.textContent = `도착지 : ` + arrivalPlace;
                startEnd.appendChild(endPlaceSpan);

                for (var i = 0; i < response.result.path.length; i++) {

                    const pathInfo = response.result.path[i].info;
                    // travelInfoBox 생성
                    const travelInfoBox = document.createElement('div');
                    travelInfoBox.classList.add('travel-info-box');

                    // travelInfo1 생성
                    const travelInfo1 = document.createElement('div');
                    travelInfo1.classList.add('travel-info-1');

                    // 체크박스 생성
                    const checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    checkbox.className = 'checkbox'; // 스타일 적용을 위한 클래스 추가

                    // 체크박스가 클릭되었을 때 이벤트 처리
                    checkbox.addEventListener('click', function() {
                        // 여기에 체크박스 클릭 시 처리할 내용을 작성합니다.
                        if (checkbox.checked) {
                            // 체크박스가 체크되었을 때 처리할 내용
                            console.log('체크박스가 체크되었습니다.');
                            // 추가적인 동작을 원하면 이 부분에 코드를 추가하세요.
                        } else {
                            // 체크박스가 해제되었을 때 처리할 내용
                            console.log('체크박스가 해제되었습니다.');
                            // 추가적인 동작을 원하면 이 부분에 코드를 추가하세요.
                        }
                    });
                    travelInfo1.appendChild(checkbox);

                    // 총 시간 정보 추가
                    const totalTime = document.createElement('div');
                    totalTime.className = 'travel-time';
                    const totalTimeSpan = document.createElement('span');
                    totalTimeSpan.textContent = convertMinutesToHoursAndMinutes(pathInfo.totalTime);
                    totalTime.appendChild(totalTimeSpan);
                    travelInfo1.appendChild(totalTime);

                    // 출발지 정보 추가
                    const firstStartStation = document.createElement('div');
                    firstStartStation.textContent = `출발지 : ` + pathInfo.firstStartStation;
                    firstStartStation.className = 'firstStartStation';
                    travelInfo1.appendChild(firstStartStation);

                    // 도착지 정보 추가
                    const lastEndStation = document.createElement('div');
                    lastEndStation.textContent = `도착지 : ` + pathInfo.lastEndStation;
                    lastEndStation.className = 'lastEndStation';
                    travelInfo1.appendChild(lastEndStation);

                    // 도보 정보 추가
                    const totalWalk = document.createElement('div');
                    totalWalk.className = 'travel-mode';
                    const totalWalkSpan = document.createElement('span');
                    totalWalkSpan.className = 'totalWalk';
                    totalWalkSpan.textContent = '도보' + pathInfo.totalWalk + 'km';
                    totalWalk.appendChild(totalWalkSpan);
                    travelInfo1.appendChild(totalWalk);

                    // 버스 환승 정보 추가
                    const busTransitCount = document.createElement('div');
                    busTransitCount.className = 'transfers';
                    const busTransitSpan = document.createElement('span');
                    busTransitSpan.className = 'busTransitCount';
                    busTransitSpan.textContent = '환승' + pathInfo.busTransitCount + '회';
                    busTransitCount.appendChild(busTransitSpan);
                    travelInfo1.appendChild(busTransitCount);

                    // 요금 정보 추가
                    const payment = document.createElement('div');
                    payment.className = 'fare';
                    const paymentSpan = document.createElement('span');
                    paymentSpan.className = 'payment';
                    paymentSpan.textContent = '요금' + pathInfo.payment + '원';
                    payment.appendChild(paymentSpan);
                    travelInfo1.appendChild(payment);

                    // 총 거리 정보 추가
                    const totalDistance = document.createElement('div');
                    totalDistance.className = 'distance';
                    const totalDistanceSpan = document.createElement('span');
                    totalDistanceSpan.className = 'totalDistance';
                    totalDistanceSpan.textContent = pathInfo.totalDistance + 'km';
                    totalDistance.appendChild(totalDistanceSpan);
                    travelInfo1.appendChild(totalDistance);


                    // openClose
                    const openClose = document.createElement('div');
                    openClose.className = 'openClose';
                    const expandButton = document.createElement('button');
                    expandButton.className = 'expand-button';
                    const expendSpan = document.createElement('span');
                    expendSpan.className = 'expand-icon';
                    expendSpan.textContent = '▼';
                    travelInfo1.appendChild(openClose);
                    expandButton.appendChild(expendSpan);
                    openClose.appendChild(expandButton);



                    // travelInfo1을 travelInfoBox에 추가
                    travelInfoBox.appendChild(travelInfo1);


                    // route-details 요소 생성
                    const routeDetails = document.createElement('div');
                    routeDetails.className = 'route-details';
                    routeDetails.id = 'route-details';

                    let isExpanded = false;
                    expandButton.addEventListener('click', function () {
                        // 버튼 클릭 시 이벤트 핸들러
                        if (isExpanded) {
                            // 현재 확장된 상태라면 route-details를 숨기고 travel-info-1의 max-height를 줄임
                            routeDetails.style.display = 'none';
                            travelInfoBox.style.maxHeight = '1000px'; // 필요에 따라 조절
                            expandButton.innerHTML = '&#x25BC;';
                            expandButton.classList.remove('active');
                        } else {
                            // 현재 축소된 상태라면 route-details를 표시하고 travel-info-1의 max-height를 설정
                            routeDetails.style.display = 'block';
                            routeDetails.style.marginTop = '20px';
                            travelInfoBox.style.maxHeight = travelInfoBox.scrollHeight + 'px';
                            expandButton.innerHTML = '&#x25B2;';
                            expandButton.classList.add('active');
                        }
                        // 버튼 상태 업데이트
                        isExpanded = !isExpanded;
                    });

                    // stop 요소 생성
                    const stop = document.createElement('div');
                    stop.className = 'stop';

                    for (var j = 0; j < response.result.path[i].subPath.length; j++) {
                        const subPathInfo = response.result.path[i].subPath[j];

                        if (subPathInfo.distance === 0 && subPathInfo.sectionTime === 0) {
                            continue; // 다음 반복으로 넘어감
                        }
                        // stop-info 요소 생성 (1번째 정류장)
                        const stopInfo1 = document.createElement('div');
                        stopInfo1.className = 'stop-info';

                        const distance = document.createElement('span');
                        distance.className = 'distance';
                        distance.textContent = "distance : "+subPathInfo.distance+"km";

                        const sectionTime = document.createElement('span');
                        sectionTime.className = 'sectionTime';
                        sectionTime.textContent = "sectionTime : "+subPathInfo.sectionTime+"분";

                        const trafficType = document.createElement('span');
                        trafficType.className = 'trafficType';
                        // trafficType 값에 따라 다른 문자열 출력
                        if (subPathInfo.trafficType === 1) {
                            trafficType.textContent = "지하철";
                            const startName = document.createElement('div');
                            startName.textContent = "startName: " + subPathInfo.startName;
                            const endName = document.createElement('div');
                            endName.textContent = "endName: " + subPathInfo.endName;
                            const endLocalStationID = document.createElement('div');
                            endLocalStationID.textContent = "endLocalStationID: " + subPathInfo.endLocalStationID;
                            const subwayName = document.createElement('div');
                            subwayName.textContent = "subwayName: " + subPathInfo.lane[0].name;
                            const passStopList = document.createElement('div');
                            for(var p =0;p<subPathInfo.passStopList.stations.length;p++){
                                passStopList.textContent = "passStopList: " + subPathInfo.passStopList.stations[p];
                            }
                            const stationCount = document.createElement('div');
                            stationCount.textContent = "stationCount: " + subPathInfo.stationCount;
                            stopInfo1.appendChild(startName);
                            stopInfo1.appendChild(endName);
                            stopInfo1.appendChild(stationCount);
                        } else if (subPathInfo.trafficType === 2) {
                            trafficType.textContent = "버스";
                            const startName = document.createElement('div');
                            startName.textContent = "startName: " + subPathInfo.startName;
                            const endName = document.createElement('div');
                            endName.textContent = "endName: " + subPathInfo.endName;
                            const endLocalStationID = document.createElement('div');
                            endLocalStationID.textContent = "endLocalStationID: " + subPathInfo.endLocalStationID;
                            const laneBusId = document.createElement('div');
                            laneBusId.textContent = "busID: " + subPathInfo.lane[0].busID;
                            const busNo = document.createElement('div');
                            busNo.textContent = "busNo: " + subPathInfo.lane[0].busNo;
                            const passStopList = document.createElement('div');
                            for(var p =0;p<subPathInfo.passStopList.stations.length;p++){
                                passStopList.textContent = "passStopList: " + subPathInfo.passStopList.stations[p];
                            }
                            const stationCount = document.createElement('div');
                            stationCount.textContent = "stationCount: " + subPathInfo.stationCount;
                            stopInfo1.appendChild(startName);
                            stopInfo1.appendChild(endName);
                            stopInfo1.appendChild(stationCount);
                        } else if (subPathInfo.trafficType === 3) {
                            trafficType.textContent = "도보";
                        }
                        stopInfo1.appendChild(distance);
                        stopInfo1.appendChild(sectionTime);
                        stopInfo1.appendChild(trafficType);

                        // stop-info를 stop에 추가
                        stop.appendChild(stopInfo1);
                    }

                    // stop을 route-details에 추가
                    routeDetails.appendChild(stop);

                    // travel-info-box에 route-details 추가
                    travelInfoBox.appendChild(routeDetails);

                    // travelInfoBox를 문서에 추가
                    document.querySelector('.traffic-modal-content').appendChild(travelInfoBox);
                }
                const trafficBtnBox = document.createElement('div');
                trafficBtnBox.className = 'trafficBtnBox'
                const trafficBtn = document.createElement('div');
                trafficBtn.className = 'trafficBtn'
                trafficBtn.textContent = '버튼';
                trafficBtnBox.appendChild(trafficBtn);
                document.querySelector('.traffic-modal-content').appendChild(trafficBtnBox);
            },
            error: function (xhr, status, error) {
                // 에러가 발생한 경우 처리할 코드를 작성합니다.
                console.error("Error:", error);
            }
        });
    }
    function convertMinutesToHoursAndMinutes(minutes) {
        const hours = Math.floor(minutes / 60);
        const remainingMinutes = minutes % 60;
        return hours+`시`+ remainingMinutes+`분`;
    }
</script>
</html>
