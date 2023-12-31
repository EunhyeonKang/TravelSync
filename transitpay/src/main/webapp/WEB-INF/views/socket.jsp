<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .sendbtnbox{
            width: 100%;
            z-index: 1;
            text-align: right;
        }
        #chatting{
            border-radius: 50px;
        }
    </style>
    <script>
        function scrollToBottom() {
            var chatContainer = document.getElementById("chating");
            chatContainer.scrollTop = chatContainer.scrollHeight;
        }

        // 맨 처음 페이지 로드 시 스크롤을 맨 아래로 이동
        window.onload = function() {
            scrollToBottom();
            // document.getElementById("chatting").addEventListener("keyup", function(event) {
            //     if (event.key === "Enter") {
            //         send(); // Call the send function when Enter key is pressed
            //     }
            // });
        }

        function wsEvt() {
            ws.onopen = function (event) {
                console.log("웹 소켓 연결이 열렸습니다.");
                sessionStorage.setItem('socketOpen', 'true');
            };

            // 웹 소켓 서버로부터 메시지 수신 시 실행
            ws.onmessage = function (event) {
                //e 파라미터는 websocket이 보내준 데이터
                var msg = event.data; // 전달 받은 데이터
                if (msg != null && msg.trim() != '') {
                    var d = JSON.parse(msg);
                    //socket 연결시 sessionId 셋팅
                    if (d.type == "getId") {
                        var si = d.sessionId != null ? d.sessionId : "";
                        if (si != '') {
                            $("#sessionId").val(si);
                            var message = {
                                type: "open",
                                sessionId: "${sessionScope.member.member_id}",
                                userName: "${sessionScope.member.name}",
                                memberImg : "${sessionScope.member.kakao_img}"
                            }
                            //서버에 데이터 전송
                            ws.send(JSON.stringify(message))
                        }
                    }
                    //채팅 메시지를 전달받은 경우
                    else if (d.type == "message") {
                        if (d.sessionId == "${sessionScope.member.member_id}") {
                            $("#chating").append("<p class='me'>" + d.msg + "</p>");
                        } else {
                            $("#chating").append("<p class='others'><span class='user-name'>" + d.userName + " 님</span><span class='other-msg'>" + d.msg + "</span></p>");

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
                                "&dDay=" + encodeURIComponent(d.data.dday) +
                                "&groupId=" + encodeURIComponent(d.data.groupId);;
                            link.click();
                        }
                    }
                    else if(d.type=="displayPlaceMarker"){
                        displayPlaces(d.data.places, d.data.details)

                    }
                    else if(d.type=="selectDateList"){
                        addPlaced(d.data.dateList,d.data.selectedDate);
                    }
                    else if(d.type=='openModal'){
                        openModal();
                    }
                    else if(d.type=='totalPriceForThisPlace'){
                        totalPriceFunc(d.data);
                    }
                    else if(d.type=='selectedDates'){

                    }else if(d.type=='foodModal'){
                        foodModal();
                    }else if(d.type=='discountValue'){
                        updateDiscountValue(d.data.tags, d.data.newDiscountValue);
                    }else if(d.type =='amountValue'){
                        updateAmountValue(d.data);
                    }else if(d.type =='saveTravel'){
                        alert("여행저장 완료!");
                        location.href='/mypage';
                    }else if(d.type=='calculate'){

                    }

                    //새로운 유저가 입장하였을 경우
                    else if (d.type == "open") {

                        if (d.sessionId == $("#sessionId").val()) {
                            $("#chating").append("<p class='start'>[채팅에 참가하였습니다.]</p>");
                        } else {
                            console.log(d.userimg+"zzz")
                            var httpPattern = /^(http|):\/\//;

                            if (httpPattern.test(d.userimg)) {
                                $("#member-img").append("<img src='"+ d.userimg +"'/>");
                            } else {
                                $("#member-img").append("<img src='../../../resources/upload/profile/"+ d.userimg +"'/>");
                            }

                            $("#member-name").append("<p class='start'>" + d.userName + "" + "</p>");

                            var $userImageContainer = $("<div>").addClass("user-image-container");

                            $("#userImagesContainer").append($userImageContainer);
                        }
                    }

                    //유저가 퇴장하였을 경우
                    else if (d.type == "close") {
                        $("#chating").append("<p class='exit'>[" +d.userName  + "]님이 퇴장하였습니다." + "</p>");
                        console.log("퇴장하셨음");
                    } else {
                        console.warn("unknown type!")
                    }
                }

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

        function chatName(){
            var userName = $("#userName").val();
            if(userName == null || userName.trim() == ""){
                alert("사용자 이름을 입력해주세요.");
                $("#userName").focus();
            }else{
                wsOpen();
                $("#yourName").hide();
                $("#yourMsg").show();
            }
        }
        var isSending = false; // 중복 전송 방지 변수 추가

        function onEnterKey(event) {
            if (event.key === "Enter") {
                if (!isSending) {
                    send();
                }
            }
        }
        var isScrolling = false;

        function startScroll() {
            isScrolling = true;
        }

        function endScroll() {
            isScrolling = false;
        }

        function send() {
            if (isScrolling) {
                return;
            }

            isSending = true;
            var obj ={
                type: "message",
                sessionId : "${sessionScope.member.member_id}",
                userName : "${sessionScope.member.name}",
                msg : $("#chatting").val()
            }

            $.ajax({
                type: "POST",
                url: "/saveChat",
                contentType: "application/json",
                data: JSON.stringify(obj),
                success: function (response) {
                    $('#chatting').val("");
                    // 메시지를 전송한 후 스크롤을 맨 아래로 이동
                    scrollToBottom();
                    isSending = false; // 전송 완료 후 다시 false로 설정
                },
                error: function (error) {
                    console.error("Error:", error);
                }
            });

            ws.send(JSON.stringify(obj))
            $('#chatting').val("");
        }
        // 채팅 내용을 불러와서 채팅창에 표시하는 함수
        function loadChatHistory() {
            $.ajax({
                type: "GET",
                url: "/loadChat",
                success: function (chatHistory) {
                    if (chatHistory && chatHistory.length > 0) {
                        var chatingDiv = $("#chating");
                        chatHistory.forEach(function (message) {
                            if (message.sessionId === "${sessionScope.member.member_id}") {
                                $("#chating").append("<p class='me'>" + message.msg + "</p>");
                            } else {
                                $("#chating").append("<p class='others'><span class='user-name'>" + message.userName + " 님</span><span class='other-msg'>" + message.msg + "</span></p>");
                            }
                        });
                    }
                },
                error: function (error) {
                    console.error("Error:", error);
                }
            });
        }


    </script>
</head>
<body>
<div id="container" class="container">
    <div id="member">
        <span id="member-img"></span>
        <span id="member-name"></span>
    </div>
    <input type="hidden" id="sessionId" value="">

    <div id="chating" class="chating">
    </div>

    <div id="yourMsg">
        <table class="inputTable">
            <tr>
                <th class="sendth">
                    <input id="chatting" placeholder="보내실 메시지를 입력하세요." onkeydown="onEnterKey(event)">
                    <button onclick="send()" id="sendBtn">
                        <div class="sendbtnbox">
                            <img class="sendimg" src="../../../resources/images/send1.webp">
                        </div>
                    </button>
                </th>
            </tr>
        </table>
    </div>
</div>
</body>

</html>