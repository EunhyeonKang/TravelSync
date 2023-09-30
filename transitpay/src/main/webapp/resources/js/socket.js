$(document).ready(function() {
    wsOpen();
})
var ws;

function wsOpen() {
    if (!ws) { // 이미 웹 소켓 연결이 열려있지 않은 경우에만 연결
        ws = new WebSocket("ws://" + location.host + "/websocket");
        wsEvt();
        loadChatHistory();
    }
}