<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="main2-2">
    <div class="parent">
        <div class="first">
            <a href="">
                <div class="img">
                    <img src="../../resources/images/pay.png" style="" alt="">
                </div>
                <div class="t_wrap">
                    <p class="name">모임통장</p>
                </div>
            </a>
        </div>
        <div class="first">
            <a href="">
                <div class="img">
                    <img src="../../resources/images/pay.png" style="" alt="">
                </div>
                <div class="t_wrap">
                    <p class="name">모임통장</p>
                </div>
            </a>
        </div>
        <div class="first">
            <a href="">
                <div class="img">
                    <img src="../../resources/images/img-hana-symbol.png" style="" alt="">
                </div>
                <div class="t_wrap">
                    <p class="name">정산하기</p>
                </div>
            </a>
        </div>
    </div>
</div>
<div class="main2">
    <div class="ttext">
        <div class="ctext1">총무님은 쉬세요</div><br>
        <div class="ctext1"><span class="t1"> 트래블싱크</span>가 대신할게요.</div>
    </div>
    <div class="mtext">
        <div class="ctext2">회비 낼 때 알림으로 알려주고</div><br>
        <div class="ctext2">회비가 밀려 알아서 관리할게요.</div>
    </div>
    <div class="bbutton">
        <button type="submit" class="tbutton" onclick="location.href = 'group'">
            <div class="tTrable">모임통장 개설하기</div>
        </button>
    </div>s
</div>
<div class="main3">
    <div class="exchangebox1">
        <button type="submit" class="exchgbutton">
            <div class="exchgtext">정산</div>
        </button>
        <button type="submit" class="exchgbutton">
            <div class="exchgtext">알림</div>
        </button>
    </div>
    <div class="exchangebox2">
        <img class="exchgimg" src="../../resources/images/exchange.png">
        <div class="ctext2">나의 여행 기반으로 제공되는</div><br>
        <div class="ctext2">환율, 길찾기 정보로 더 쉬운 여행을 경험하세요.</div>
    </div>

</div>
<%@ include file="include/footer.jsp" %>
<script>
    // let currentIndex = 0;
    // const slides = document.querySelectorAll('.exchange-slide');
    //
    // function showSlide(index) {
    //     slides.forEach(slide => {
    //         slide.style.display = 'none';
    //     });
    //     slides[index].style.display = 'block';
    // }
    //
    // function nextSlide() {
    //     currentIndex = (currentIndex + 1) % slides.length;
    //     showSlide(currentIndex);
    // }
    //
    // setInterval(nextSlide, 3000); // Change slide every 3 seconds

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
