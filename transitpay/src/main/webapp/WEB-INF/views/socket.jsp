<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>DevLog Chating</title>
    <style>
        *{
            margin:0;
            padding:0;
        }
        .container{
            width: 500px;
            margin: 0 auto;
            padding: 25px
        }
        .container h1{
            text-align: left;
            padding: 5px 5px 5px 15px;
            color: #FFBB00;
            border-left: 3px solid #FFBB00;
            margin-bottom: 20px;
        }
        .chating{
            background-color: #000;
            width: 500px;
            height: 500px;
            overflow: auto;
        }
        .chating .me{
            color: #F6F6F6;
            text-align: right;
        }
        .chating .others{
            color: #FFE400;
            text-align: left;
        }
        .chating .start{
            color: #AAAAAA;
            text-align: center;
        }
        .chating .exit{
            color: red;
            text-align: center;
        }
        input{
            width: 330px;
            height: 25px;
        }
        #yourMsg{
            display: none;
        }
    </style>
    <script>
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
                //e 파라미터는 websocket이 보내준 데이터
                var msg = event.data; // 전달 받은 데이터
                if (msg != null && msg.trim() != '') {
                    var d = JSON.parse(msg);

                    //socket 연결시 sessionId 셋팅
                    if (d.type == "getId") {
                        var si = d.sessionId != null ? d.sessionId : "";
                        if (si != '') {
                            $("#sessionId").val(si);

                            var obj = {
                                type: "open",
                                sessionId: $("#sessionId").val(),
                                userName: $("#userName").val()
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
                    //새로운 유저가 입장하였을 경우
                    else if (d.type == "open") {
                        if (d.sessionId == $("#sessionId").val()) {
                            $("#chating").append("<p class='start'>[채팅에 참가하였습니다.]</p>");
                        } else {
                            $("#chating").append("<p class='start'>[" + d.userName + "]님이 입장하였습니다." + "</p>");
                        }
                    }
                    //유저가 퇴장하였을 경우
                    else if (d.type == "close") {
                        $("#chating").append("<p class='exit'>[" + d.userName + "]님이 퇴장하였습니다." + "</p>");

                    } else {
                        console.warn("unknown type!")
                    }
                }
                document.addEventListener("keypress", function (e) {
                    if (e.keyCode == 13) { //enter press
                        send();
                    }
                });

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
        function send() {
            var obj ={
                type: "message",
                sessionId : $("#sessionId").val(),
                userName : $("#userName").val(),
                msg : $("#chatting").val()
            }
            //서버에 데이터 전송
            ws.send(JSON.stringify(obj))
            $('#chatting').val("");
        }
    </script>
</head>
<body>
    <div id="container" class="container">
        <h1>DevLog Chat</h1>
        <input type="hidden" id="sessionId" value="">

            <div id="chating" class="chating">
            </div>

            <div id="yourName">
                <table class="inputTable">
                    <tr>
                        <th>닉네임</th>
                        <th><input type="text" name="userName" id="userName"></th>
                        <th><button onclick="chatName()" id="startBtn">채팅 참가</button></th>
                    </tr>
                </table>
            </div>
            <div id="yourMsg">
                <table class="inputTable">
                    <tr>
                        <th>메시지</th>
                        <th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
                        <th><button onclick="send()" id="sendBtn">보내기</button></th>
                    </tr>
                </table>
            </div>
    </div>
</body>

</html>
