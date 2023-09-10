<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>환율데이터</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<h1>환율데이터</h1>
<div id="exchange-rate-container"></div>

<script type="text/javascript">
    /*
    $(function(){
        getConnection();

    })
    function getConnection(){
        ws = new WebSocket("ws://localhost:8080" + '<%=request.getContextPath()%>/exchange-rate');
        // 서버 시작할 때 동작
        ws.onopen = function(event){
        }
        // 서버로부터 메세지를 전달 받을 때 동작하는 메소드

        // 아래에 선언 할 onMessage로 event가 전달된다.
        ws.onmessage = function(event){
            onMessage(event);
        }

        // 서버에서 에러가 발생할 경우 동작할 메소드
        ws.onerror = function(event){
            onError(event);
        }

        // 서버와의 연결이 종료될 경우 동작하는 메소드
        ws.onclose = function(event){
            onClose(event);
        }
    }
    // 전달할 String형 msg를 ws.send를 통해서 소켓으로 전달한다.

    function send(msg){
        ws.send(msg);
    }
    // 소켓통신 에러 발생 시
    function onError(event){
        alert(event.data);
    }
    // 소켓통신이 끝낫을 때
    function onClose(event){
        alert(event);
    }
    function onMessage(event){
        alert(event.data);
    }*/
</script>
</body>
</html>
