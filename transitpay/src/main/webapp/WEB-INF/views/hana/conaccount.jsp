<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/travel.css">
    <link rel="stylesheet" href="../../../resources/css/conacoount.css">
    <script defer src="../../resources/js/index.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        여행·일정 등록<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">연결계좌/카드관리</div>
            <div class="menuhr"><hr/></div>
            <a href="mypage">마이페이지</a>
            <a href="conaccount">연결계좌/카드관리</a>
            <a href="mytravel">내 여행</a>
            <!-- 추가 메뉴 항목들 -->
        </div>
        <div class="contents-1">
            <div class="exchange">
                <div class="exchange-1">
                    <div class="container2">
                        <div class="day">환전할 통화선택 및 금액을 입력해주세요</div>
                        <button class="addplace-1"><div class="addtext">원화로 입력</div></button>
                        <button class="addplace-2"><div class="addtext">외화로 입력</div></button>
                    </div>
                    <!-- 검색 화면 -->
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="searchForm" action="/controller/board/list" method="get">
                                <select name="type" class="selecttype">
                                    <option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>>미국 USD</option>
                                    <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':'' }"/>>제목</option>
                                    <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':'' }"/>>내용</option>
                                    <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':'' }"/>>작성자</option>
                                    <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':'' }"/>>제목 or 내용</option>
                                    <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':'' }"/>>제목 or 작성자</option>
                                    <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':'' }"/>>제목 or 내용 or 작성자</option>
                                </select>
                                <input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>" />
                                <input type="hidden" name="pageNum" value="<c:out value="${pageMaker.cri.pageNum}"/>" />
                                <input type="hidden" name="amount" value="<c:out value="${pageMaker.cri.amount}"/>" />
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="searchForm-1" action="/controller/board/list" method="get">
                                <select name="type" class="selecttype">
                                    <option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/> >--</option>
                                    <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':'' }"/> >제목</option>
                                    <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':'' }"/> >내용</option>
                                    <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':'' }"/> >작성자</option>
                                    <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':'' }"/> >제목 or 내용</option>
                                    <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':'' }"/> >제목 or 작성자</option>
                                    <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':'' }"/> >제목 or 내용 or 작성자</option>
                                </select>
                                <input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>" />
                                <input type="hidden" name="pageNum" value="<c:out value="${pageMaker.cri.pageNum}"/>" />
                                <input type="hidden" name="amount" value="<c:out value="${pageMaker.cri.amount}"/>" />
                                <button class="pbuttonaction" onclick="onCancelButtonClick()"><div class="selectaction">취소</div></button>
                            </form>
                        </div>
                    </div>
                    <div class="perrate">우대율 80%</div>
                </div>
            </div>
            <div class="exchangebox">
                <div class="exchangebox-1">
                트래블로그 서비스로 외화 환전 시 *무료환전 혜택(환율 100% 우대)을 제공합니다.<br>
                총 18종 통화로 4종(미국 USD, 일본 JPY, 유럽 EUR, 영국 GBP)을 제외한 14종 통화는 이벤트로 진행<br>
                - 10종[2023년 8월 31일까지] : 뉴질랜드 NZD, 베트남 VND, 스웨덴 SEK, 스위스 CHF, 인도네시아 IDR, 체코 CZK, 태국 THB, 필리핀 PHP, 헝가리 HUF, 홍콩 HKD<br>
                - 4종[2023년 12월 31일까지] : 싱가포르 SGD, 중국 CNY, 캐나다 CAD, 호주 AUD<br>
                외화 하나머니를 원화로 환급 시, 송금 받을 때(전신환 매입률)의 환율로 적용된 원화 환산 금액에서 환급수수료(1%)가 차감된 후 입금됩니다.<br>
                현금화 가능 하나머니만 외화 하나머니로 충전이 가능합니다.<br>
                무료환전으로 채울 수 있는 외화 하나머니의 연간 최대한도는 총 USD 100,000입니다. (USD 환산 금액 기준)<br>
                외화 하나머니 결제 한도는 USD 5,000/일, USD 10,000/월 입니다. (USD 환산 금액 기준)<br>
                외화 하나머니 ATM 인출 한도는 USD 6,000/일, USD 10,000/월 입니다. (USD 환산 금액 기준)<br>
                </div>
            </div>
            <div class="exchangebox2">
                <div class="payment-amount">
                    <div class="amount-label">결제금액(원)</div>
                    <div class="amount-value">98,912</div>
                </div>
                <div class="exchange-rate">
                    <div class="rate-section">
                        <span class="rate-label">적용환율</span>
                        <span class="rate-value">1336.66</span>
                    </div>
                    <div class="discount-section">
                        <span class="discount-label">우대율</span>
                        <span class="discount-value">80%</span>
                    </div>
                </div>
            </div>
            <div class="tvlbuttons">
                <button class="tvlbtn2">
                    <div>저장</div>
                </button>
            </div>
        </div>
    </div>

    <%@ include file="../include/footer.jsp" %>
</div>
</body>
<script>
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
        placeselect2.removeChild(button);
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
    }

    // 선택 버튼 클릭 시 실행할 함수
    function onSelectionButtonClick() {
        const region = "인천"; // 선택한 지역을 여기에 넣으세요
        addSelectedPlace(region);
        const selectButton = document.querySelector('.pbutton');
        const cancelButton = document.querySelector('.pbuttonaction');

        selectButton.style.display = 'none'; // 선택 버튼 숨기기
        cancelButton.style.display = 'block'; // 취소 버튼 보이기
    }

    // 취소 버튼을 누를 때 실행되는 함수
    function onCancelButtonClick() {
        const selectButton = document.querySelector('.pbutton');
        const cancelButton = document.querySelector('.pbuttonaction');

        selectButton.style.display = 'block'; // 선택 버튼 보이기
        cancelButton.style.display = 'none'; // 취소 버튼 숨기기
    }


    $(document).ready(function() {
        var searchForm = $("#searchForm");
        $("#searchForm button").on("click", function(e) {

            if (!searchForm.find("option:selected").val()) {
                alert("검색 종류를 선택하세요");
                return false;
            }

            if (!searchForm.find("input[name='keyword']").val()) {
                alert("키워드를 입력하세요");
                return false;
            }

            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();

            searchForm.submit();
        }); /* $("#searchForm button").on("click", function(e) { end*/
    });/* ready end function end */

</script>
</html>
