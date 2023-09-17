<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/index.css">
    <link rel="stylesheet" href="../../resources/css/main2.css">

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <style>
        .top3{
            padding: 30px 30px 0 50px;
            display: flex;
            font-size: larger;
            font-weight: 700;
        }
    </style>
</head>
<body>
<div class="main1">
    <%@ include file="../include/header.jsp" %>
    <div class="main2-2">
        <span class="top3">TOP3</span>
        <div class="parent">
        </div>
    </div>
    <div class="main2-2">
        <span class="top3">즐겨찾기</span>
        <div class="parent-1">
        </div>
    </div>
</div>



    <%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>

<script>
    $(document).ready(function() {
        $.ajax({
            type: "GET",
            url: "/selectTop3Travel",
            success: function(response) {
                travleBoxList(response,1)
            },
            error: function(error) {
            }
        });
    })


    $(document).ready(function() {
        $.ajax({
            type: "GET",
            url: "/selectStarTravel",
            success: function(response) {
                travleBoxList(response,2)
            },
            error: function(error) {
            }
        });
    })

    function travleBoxList(response,index){
        var parent = ".parent";
        if(index===2){
            parent = parent+"-1";
        }
        const parentElement = document.querySelector(parent);

        for(let i=0;i<response.length;i++){
            var itemContent = response[i].content;
            var itemTags = response[i].tags;
            var originalURL =response[i].photo;
            var idMatch = originalURL.match(/id=([^&]+)/);
            var id = idMatch ? idMatch[1] : null;
            var modifiedURL = id ? originalURL.replace(idMatch[0], "&" + "id=" + id) : originalURL;

            const newTravelElement = document.createElement('div');
            newTravelElement.className = 'first';
            const newTravelA = document.createElement('a');
            const newTravelDivImg = document.createElement('div');
            const newTravelImg = document.createElement('img');
            newTravelImg.src = modifiedURL;
            newTravelDivImg.appendChild(newTravelImg);
            const newTravelTWrap = document.createElement('div');
            newTravelTWrap.className= 't_wrap';
            const newTravelP = document.createElement('p');
            newTravelP.className= 'name';
            newTravelP.textContent = itemContent;
            newTravelTWrap.appendChild(newTravelP);
            newTravelA.appendChild(newTravelDivImg);
            newTravelA.appendChild(newTravelTWrap);
            newTravelElement.appendChild(newTravelA);
            // 부모 요소에 생성한 요소를 추가합니다.
            parentElement.appendChild(newTravelElement);
        }
    }

    // 요소들을 찾습니다.
    const ttext = document.querySelector('.ttext');
    const mtext = document.querySelector('.mtext');
    const bbutton = document.querySelector('.bbutton');

    // Intersection Observer 생성
    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('show');
                observer.unobserve(entry.target); // 관찰 중지
            }
        });
    });
    // 요소들을 관찰
    observer.observe(ttext);
    observer.observe(mtext);
    observer.observe(bbutton);

    // 환율데이터
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
    // 소켓통신이 끝났을 때
    function onClose(event){
        alert(event);
    }
    function onMessage(event){
        alert(event.data);
    }*/
</script>
