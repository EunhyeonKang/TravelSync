<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main2box">
    <div class="main2-2">
        <div class="parent">
            <div class="first">
                <a href="">
                    <div class="img">
                        <img src="../../resources/images/groupicon.png" style="background: aliceblue" alt="">
                    </div>
                    <div class="t_wrap">
                        <p class="titlename">HANA모임통장</p>
                        <p class="name">둘이, 셋이, 여럿이 함께쓰고<br>같이 보는 모임통장을 사용하세요</p>
                    </div>
                </a>
            </div>
            <div class="first">
                <a href="">
                    <div class="img">
                        <img src="../../resources/images/travelSchedule.png" style="background: aliceblue" alt="">
                    </div>
                    <div class="t_wrap">
                        <p class="titlename">실시간 여행계획</p>
                        <p class="name">모임원들과 실시간 일정계획으로<br>효율적인 여행경비를 계산하세요</p>
                    </div>
                </a>
            </div>
            <div class="first">
                <a href="">
                    <div class="img">
                        <img src="../../resources/images/main2.png" style="background: aliceblue" alt="">
                    </div>
                    <div class="t_wrap">
                        <p class="titlename">여행경비 리포트</p>
                        <p class="name">여행예산을 1/N하고 회비통계로<br>나만의 여행비용패턴을 확인하세요</p>
                    </div>
                </a>
            </div>
            <div class="first">
                <a href="">
                    <div class="img">
                        <img src="../../resources/images/friendinvite.png" style="background: #f2f4f4" alt="">
                    </div>
                    <div class="t_wrap">
                        <p class="titlename">너도나도 포인트</p>
                        <p class="name">친구를 초대하고 모임통장에서<br>포인트를 사용하세요</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
<%--    <div class="populbox">--%>
<%--        <p class="populsearch">인기검색어</p>--%>
<%--        <div class="popul-2">--%>

<%--        </div>--%>
<%--        <div class="popul-1">--%>
<%--            <img class="populimg" src="../../resources/images/invite.png">--%>
<%--        </div>--%>
<%--    </div>--%>
</div>
<div class="main2">
    <img class="" src="../../resources/images/groupAccount1.png" style="width: 200px; margin : 0 auto; display: block">
    <div class="ttext">
        <div class="ctext1">총무님은 쉬세요</div><br>
        <div class="ctext1"><span class="t1"> 트래블싱크</span>가 대신할게요.</div>
    </div>
    <div class="mtext">
        <div class="ctext2">회비규칙으로</div><br>
        <div class="ctext2">회비관리를 더 편하게</div>
    </div>

    <div class="bbutton">
        <button type="submit" class="tbutton" onclick="location.href = 'group'">
            <div class="tTrable">모임통장 개설하기</div>
        </button>
    </div>
</div>
<div class="main3">
    <div class="exchangebox1">
        <button type="submit" class="exchgbutton">
            <div class="exchgtext">실시간여행계획</div>
        </button>
        <button type="submit" class="exchgbutton">
            <div class="exchgtext">여행리포트</div>
        </button>
    </div>
    <div class="exchangebox2">
        <img class="exchgimg" src="../../resources/images/travelmain.png">
        <div class="ctext2">친구와 함께 여행계획을 세우고</div><br>
        <div class="ctext2">모여라 회비를 통해 편리한 여행을 시작하세요</div>
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
    function searchLocation(){
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
    }
    $.ajax({
        type: "POST",
        url: "/searchLocation",
        success: function (searchData, state, xhr) {
            console.log(searchData);
            var h2 = document.createElement('h2');
            h2.textContent = "인기검색어";
            h2.className = 'popul';

            var $searchList = $("<table class='table'></table>"); // 결과를 표시할 테이블

            var itemCounter = 0; // 아이템 카운터

            // 테이블 헤더 추가
            var $thead = $("<thead><tr></tr></thead>");
            $searchList.append($thead);

            for (var i = 0; i < 10; i++) {
                var $currentRow = $("<tr class='popcountbox'></tr>");
                var searchResult = searchData[itemCounter];
                $currentRow.append("<td class='popcount'>" + (i + 1) + "</td>"); // 순위 추가
                $currentRow.append("<td class='popkeyword'>" + searchResult.search_keyword + "</td>");
                itemCounter++;
                $searchList.append($currentRow);
            }

            // 결과를 원하는 요소에 추가
            $("#resultContainer").append(h2);
            $("#resultContainer").append($searchList);

            // 검색 결과를 추가할 요소에도 추가
            $(".popul-2").html($searchList);
        },
        error: function (xhr, data) {
            // 오류 처리 로직 추가
        }
    });


</script>
