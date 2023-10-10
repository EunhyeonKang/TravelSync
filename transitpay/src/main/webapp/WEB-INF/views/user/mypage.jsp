<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/conacoount.css">
    <link rel="stylesheet" href="../../../resources/css/mypage.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script defer src="../../resources/js/mypage.js"></script>
    <style>
        /* 모달 스타일 */
        .custom-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .custom-modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            position: relative;
            border-radius: 10px;
        }

        .custom-close {
            position: absolute;
            top: 0;
            right: 0;
            padding: 10px;
            cursor: pointer;
        }
        /* 테이블 스타일 */
        .custom-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        /* 테이블 헤더 스타일 */
        .custom-table th {
            background-color: #4a6db4;
            padding: 14px;
            border: 1px solid #ddd;
            color: white;
        }

        /* 테이블 바디 스타일 */
        .custom-table td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }

        /* 테이블 줄 번갈아가며 색상 변경 */
        .custom-table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        /* 모임 수정 모달 스타일 */
        #updateModal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        #updateModal .update-modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }

        #updateModal .update-close {
            display: inline-block;
            float: right;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }

        #updateModal .update-close:hover {
            color: red;
        }

        #updateModal h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        #updateModal table {
            width: 100%;
        }

        #updateModal table td {
            padding: 10px;
        }

        #groupAutopay{
            width: 96% !important;
        }

        #updateModal table input[type="text"],
        #updateModal table input[type="password"],
        #updateModal table select {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
        }

        table, th, td {
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* 입력 필드 스타일 */
        input[type="text"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        /* 저장 버튼 스타일 */
        #updateButton {
            background-color: #008CBA;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 2px;
            cursor: pointer;
            border-radius: 3px;
            width: 100%;
        }

        #updateButton:hover {
            background-color: #005f79;
        }
        #enroll, #updateGroup{
            background: #009688;
        }
        #cancel, #deleteGroup{
            background: #b5b5b5;
        }
        #myChart{
            display: block;
            box-sizing: border-box;
            height: 250px;
            width: 250px;
            padding: 10px;
        }
        .saveImg{
            width: 70px;
            margin: 10px;
        }.menu1-1{
             text-align: center;
             padding-top: 30px;
             color: #008485;
             font-weight: 700;
             font-size: 20px;
         }
        menu1 a:hover {
            background-color: #008485;
            color: white;
        }
        .menu1 a {
            text-decoration: none;
            color: #333;
            padding: 8px 10px;
            text-align: center;
            margin: 0 auto;
            border-radius: 5px;
            transition: background-color 0.2s;
        }.menu1 {
             display: flex;
             flex-direction: column;
             width: 200px;
             border-radius: 0px;
             padding: 10px;
             float: left;
         }
        .menuhr hr{
            border: 2px solid #00968829;
        }
        .modal1 {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 반투명한 배경색 */
            z-index: 1;
        }

        /* 모달 내용을 감싸는 컨테이너 */
        .modal-content1 {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 700px;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* 모달 닫기 버튼 */
        .close1 {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            cursor: pointer;
        }

        /* 모달 내용 스크롤바 스타일 (필요시) */
        .modal-content {
            max-height: 80vh; /* 모달 내용의 최대 높이 조정 */
            overflow-y: auto; /* 세로 스크롤바 추가 */
        }
        .card-details{
            background: #009688;
            height: 150px;
            padding: 30px;
            border-radius: 10px;
        }
        .card-label{
            color: #ded7d7;
            text-align: center;
            margin: 10px;
            font-weight: 700;
        }
        .card-box{
            text-align: center;
            font-weight: 700;
            font-size: 34px;
        }
        .card-buttons{
            text-align: center;
            margin: 25px;
        }
        .card-button, .card-cashback-button{
            width: 170px;
            padding: 15px;
            border: 0;
            border-radius: 10px;
            background: #bbb9b69c;
            margin-right: 5px;
        }
        .card-cashback-button > .one{
            font-weight: 700;
        }
        .card-history{
            text-align: center;
        }
        .card-history {
            border-top: 1px solid #ddd;
            margin-top: 20px;
            padding-top: 20px;
        }

        .card-history-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .transaction-date,
        .transaction-description,
        .transaction-amount {
            flex-basis: 30%;
            text-align: center;
        }

        /* 반응형 스타일링 */
        @media screen and (max-width: 600px) {
            .modal-content {
                width: 90%;
            }
        }
        #cardHistoryTable_length, #cardHistoryTable_filter, #cardHistoryTable_info{
            display: none;
        }

        .date-search{
            text-align: center;
        }
        .date-search{
            padding: 10px;
            border: 0;
            border-radius: 10px;
            margin: 5px;
            font-weight: 700;
        }
        #selectedMonth{
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #939292;
            color: #333131;
            font-weight: 700;
        }
        table.dataTable.stripe tbody tr.odd, table.dataTable.display tbody tr.odd{
            background-color: #ffffff !important;
        }
        table.dataTable.display tbody tr.odd>.sorting_1, table.dataTable.order-column.stripe tbody tr.odd>.sorting_1{
            background-color: #ffffff !important;
        }
        table.dataTable tbody tr{
            background-color: #ffffff !important;
        }
        table.dataTable.display tbody tr.even>.sorting_1, table.dataTable.order-column.stripe tbody tr.even>.sorting_1{
            background-color: #ffffff !important;
        }
        .cardAndTransfer{
            text-align: center;
        }
        #myTextarea{
            border: 0;
            width: 100px;
            text-align: center;
            float: left;
        }
        #myButton{
            border: 0;
            background: 0;
            color: #6a6a6a;
            font-weight: 700;
        }
        .monthstate{
            color: #818181;
            text-align: center;
            font-size: 20px;
        }
        /* 모달 스타일 */
        #unpaidModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1;
            overflow: auto;
        }

        .unpaid-modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #000;
            max-width: 500px;
            position: relative;
            border-radius: 5px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }

        .unpaid-close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            cursor: pointer;
        }
        #travelreport{
            text-align: center;
            font-weight: 600;
            color: #696767;
            padding: 0;
            margin-bottom: 0px;
        }
        .category{
            display: flex;
            justify-content: center;
        }
        .percentage{
            display: flex;
            justify-content: center;
        }
        .category-숙박 , .category-음식 , .category-기타{
            color: #005CFF;
            margin: 0 5px;
            font-weight: 800;
        }
        .percent{
            color: #E91E63;
            font-weight: 800;
            padding: 0px 5px;
        }
        #travleLength:hover{
            color: #009688;
            font-weight: 700;
        }
    </style>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
<%--    <div class="traveltitle">--%>
<%--        마이페이지<hr/></div>--%>
    <div class="backgroundbox">
        <div class="topbox">
            <div class="contents">
                <div class="contents-1">
                    <div class="accountbox">
                        <div class="mypage-user">
                            <div class="user-detail">
                                <div class="mypage-box">
                                    <c:choose>
                                        <c:when test="${sessionScope.member.kakao_id == 0}">
                                            <!-- 조건이 true일 때 출력할 내용 -->
                                            <img style="width: 50px; margin: 20px;border-radius: 50%" src="../../resources/upload/profile/${sessionScope.member.kakao_img}">
                                        </c:when>
                                        <c:otherwise>
                                            <img style="width: 50px;margin: 20px;border-radius: 50%" src="${sessionScope.member.kakao_img}">
                                        </c:otherwise>
                                    </c:choose>
                                    <p><strong>${sessionScope.member.name}</strong>님 환영합니다</p>
                                </div>
                                <div id="myTextarea">${sessionScope.member.code}</div>
                                <button id="myButton">복사</button>
                                <script>
                                    const myTextarea = document.getElementById("myTextarea");
                                    document.getElementById("myButton").onclick = () => {
                                        window.navigator.clipboard.writeText(myTextarea.value).then(() => {
                                            alert("복사완료");
                                        });
                                    };
                                </script>
                                <div class="mypage_logout">로그아웃</div>
                            </div>
                            <div class="menu1">
                                <div class="menu1-1">마이페이지</div>
                                <div class="menuhr"><hr/></div>
                                <a href="group">내정보수정</a>
                                <div class="menu1-1">여행관리</div>
                                <div class="menuhr"><hr/></div>
                                <a href="/saveTravel">저장된여행</a>
                                <a href="/afterTravel">모여라여행</a>
                                <div class="menu1-1">모임/계좌 관리</div>
                                <div class="menuhr"><hr/></div>
                                <a href="group">모임내역</a>
                                <a href="group">계좌내역</a>
                            </div>
                        </div>
                    </div>
                    <div class="accountbox">
                        <h2>여행 관리</h2>
                        <div class="travelbox">
                            <div class="travelbox-1">
                                <div>
                                    <div>
                                        <div class="travelsavebox">
                                            <img class="saveImg" src="../../../resources/images/save-time.svg" style="width: 70px;">
                                            <div>저장된 여행</div>
                                            <div class="saveboxcnt"><strong><a href="/saveTravel" id="travleLength"></a></strong></div>
                                        </div>
                                    </div>
                                    <button>여행 | 찜🩷</button>
                                </div>
                            </div>
                            <div class="travelbox-2">
                                <div>
                                    <div>
                                        <div class="travelsavebox">
                                            <img class="saveImg" src="../../../resources/images/save-hassle.svg" style="width: 70px;">
                                            <div>여행회비</div>
                                            <div class="saveboxcnt"><strong><a href="/afterTravel" id="completeTravelLength"></a></strong></div>
                                        </div>
                                    </div>
                                    <button>모여라회비💰</button>
                                </div>
                            </div>
                            <div class="travelbox-3">
                                <div class="chartbox">
                                    <canvas id="myChart"></canvas>
                                </div>
                                </p>
                                <div>
                                    <button>내 여행 리포트📈</button>
                                </div>
                            </div>
                            <p id="travelreport">
                        </div>
                        <h2>계좌 관리</h2>
                        <div class="account-box-1">
                            <div class="account-details">
                                <a href="/accountDetail">
                                    <button class="account-button">연결계좌</button>
                                </a>
                                <div class="bank"></div>
                                <div class="account-info">
                                    <span class="account-number" name="account_num"></span>
                                    <input type="hidden" name="accountId" value="">
                                    <button class="change-account" id="change-account">연결계좌 변경</button>
                                </div>
                            </div>
                            <div class="account-box">
                                <div class="account-box-2">
                                    <img src="../../resources/images/new_2204_my_login_ico001.png" alt="">
                                    <button class="account-month" id="custom-account-month">이번달 이용내역 > </button>
                                    <div class="account-cnt">
                                        <div class="cnt-1-1" id="month-cnt"></div><span class="cnt-1">건</span>
                                        <div class="cnt-1-1" id="month-balance"></div><span class="cnt-1">원</span>
                                    </div>
                                </div>
                                <div class="account-box-2">
                                    <img src="../../resources/images/new_2204_my_login_ico004.png" alt="">
                                    <button onclick="openModal()" class="account-month" id="non-payment-account">미납 회비 현황 > </button>
                                    <div class="account-cnt">
                                        <div class="cnt-1-2" id="payment-cnt"></div><span class="cnt-1">건</span>
                                        <div class="cnt-1-2" id="payment-balance"></div><span class="cnt-1">원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h2>모임 관리</h2>
                        <div class="card-1">
                            <div class="account2">
                                <div class="auto-charge-box">
                                    <div class="new-account-details">
                                        <div class="slider-2">
                                            <div class="side-btns">
                                                <div><span><i class="fas fa-caret-left"></i></span></div>
                                                <div><span><i class="fas fa-caret-right"></i></span></div>
                                            </div>
                                            <div class="slides">
                                                <div class="slide2-1 active">
<%--                                                <button class="account-button" onclick="location.href='/mygroup/${groupAccount.group_id}'">모임통장</button>--%>
<%--                                                <div class="bank">${groupAccount.group_name}</div>--%>
<%--                                                <div class="account-info">--%>
<%--                                                    <span class="account-number">${groupAccount.group_account}</span>--%>
<%--                                                    <input type="hidden" name="accountId" value="">--%>
<%--                                                    <button class="change-account" onclick="location.href='/groupAccountDetail'">모임통장 내역</button>--%>
<%--                                                </div>--%>
                                                </div>
                                                <div class="slide2-1"></div>
                                                <div class="slide2-1"></div>
                                            </div>

                                            <div class="page-nav">
                                                <div class="active"></div>
                                                <div></div>
                                                <div></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="auto-charge-box-2">
                                    <div class="auto-charge-box-1">
                                        <div class="auto-charge">
                                            <span class="charge-info">자동이체</span>
                                        </div>
                                        <div class="auto-charge2">
                                            <div class="chargebtn">
                                                <button class="charge-save-button" id="enroll">신청</button>
                                            </div>
                                            <div class="chargebtn">
                                                <button class="charge-save-button" id="cancel">해지</button>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="auto-charge-box-1">
                                        <div class="auto-charge">
                                            <span class="charge-info">모임수정 및 탈퇴</span>
                                        </div>
                                        <div class="auto-charge2">
                                            <div class="chargebtn">
                                                    <button class="charge-save-button" id="updateGroup">수정</button>
                                            </div>
                                            <div class="chargebtn">
                                                <button class="charge-save-button" id="deleteGroup">탈퇴</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="notificationbox">
                                <div class="notification">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="customModal" class="custom-modal">
        <div class="custom-modal-content">
            <span class="custom-close">&times;</span>
            <h2 class="monthstate">이번달 이용내역</h2>
        </div>
    </div>
    <div id="unpaidModal" class="modal">
        <div class="unpaid-modal-content">
            <span class="unpaid-close-btn" onclick="closeModal()">&times;</span>
            <h2 class="monthstate">미납 회비 안내</h2>
            <p>미납된 회비 정보를 여기에 표시합니다.</p>
            <!-- 미납 회비 내용 추가 -->
        </div>
    </div>
    <div id="updateModal" class="update-modal">
        <div class="update-modal-content">
            <span class="update-close">&times;</span>
            <h2>모임수정</h2>
            <table>
                <tr>
                    <td>그룹 이름:</td>
                    <td id="groupName"></td>
                </tr>
                <tr>
                    <td>그룹 계좌:</td>
                    <td id="groupAccount"></td>
                </tr>
                <tr>
                    <td>그룹 잔액:</td>
                    <td id="groupBalance"></td>
                </tr>
                <tr>
                    <td>(매달)월 납부일:</td>
                    <td><input type="text" id="groupDay"></td>
                </tr>
                <tr>
                    <td>월 회비:</td>
                    <td><input type="text" id="groupDues"></td>
                </tr>
                <tr>
                    <td>자동 납부:</td>
                    <td>
                        <select name="g_autopay" class="rec6" id="groupAutopay">
                            <option value="" selected>선택</option>
                            <option value="N">N</option>
                            <option value="Y">Y</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호:</td>
                    <td><input type="password" id="groupPassword"></td>
                </tr>
            </table>
            <button id="updateButton">저장</button>
        </div>
    </div>
    <div id="accountModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="account-container">
                <div class="account-hana">
                    <h3>트래블싱크</h3>
                    <h2>연결계좌 정보예요</h2>
                    <p>주계좌를 변경할 수 있습니다.</p>
                    <div>
                        <div id="searchForm" action="/controller/board/list" method="get">
                            <select name="type" class="selecttype" id="selecttype">
                            </select>
                            <input type="text" name="accountNum" value="">
                            <input type="hidden" name="amount" value="">
                            <button type="button" class="account-change-btn" id ="auth-res-button">연결계좌 변경</button>
                        </div>
                    </div>
                    <div class="account-total">
                        <div class="openbanking">
                            하나카드 오픈뱅킹
                        </div>
                        <button class="selectbtn">
                            계좌한번에 조회하기
                        </button>
                    </div>
                    <div class="acc-box">
                        <div class="add-acc-box">
                            <h3>하나트렌지페이</h3>
                            <h2>계좌가 없으신가요?</h2>
                            <a href="">계좌개설하기</a>
                            <img src="../../../resources/images/account.png">
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="cardModal" class="modal1">
        <div class="modal-content1 card-modal-content">
            <span class="close1" onclick="closeCardModal()">&times;</span>
            <h2 class="card-title">모여라 체크카드(1394)</h2>
            <div class="date-search">
                <label for="selectedMonth">날짜 선택:</label>
                <select id="selectedMonth">
                    <option value="2023-01">2023년 1월</option>
                    <option value="2023-02">2023년 2월</option>
                    <!-- 다른 월도 추가 -->
                </select>
                <button class="date-search" onclick="searchByMonth()">검색</button>
            </div>
            <div class="card-details">
                <div class="card-label">10월 사용금액</div>
                <div class="card-usage">
                    <div class="card-box">
                        <div class="card-value">415,000원</div>
                    </div>
                    <div class="card-buttons">
                        <button class="card-button">이번달 카드실적</button>
                        <button class="card-button card-cashback-button">
                            <span>받은 캐시백</span>
                            <span class="one">0원</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="card-history">
                <table id="cardHistoryTable" class="display" style="width:100%">
                    <thead>
                    <tr>
                        <th>거래일자</th>
                        <th>거래내용</th>
                        <th>거래금액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>2023-11-04</td>
                        <td>도톰카츠 청라점</td>
                        <td>-253,000원</td>
                    </tr>
                    <tr>
                        <td>2023-11-04</td>
                        <td>베스트웨스턴 하버파크호텔</td>
                        <td>-32,000원</td>
                    </tr>카
                    <tr>
                        <td>2023-11-05</td>
                        <td>파라다이스 씨티 씨메르(인천)</td>
                        <td>-60,000원</td>
                    </tr>
                    <tr>
                        <td>2023-11-05</td>
                        <td>손커피연구소 영종하늘도시점</td>
                        <td>-10,000원</td>
                    </tr>
                    <tr>
                        <td>2023-11-05</td>
                        <td>탕후루</td>
                        <td>-12,000원</td>
                    </tr>
                    <tr>
                        <td>2023-11-06</td>
                        <td>청라왕아구</td>
                        <td>-28,000원</td>
                    </tr>
                    <tr>
                        <td>2023-11-06</td>
                        <td>하나로마트</td>
                        <td>-20,000원</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%--    <%@ include file="../include/footer.jsp" %>--%>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>

<script>
    // 모달 열기 함수
    function openModal() {
        var modal = document.getElementById("unpaidModal");
        modal.style.display = "block";
    }

    // 모달 닫기 함수
    function closeModal() {
        var modal = document.getElementById("unpaidModal");
        modal.style.display = "none";
    }

    function searchByMonth() {
        // 선택한 월 가져오기
        var selectedMonth = document.getElementById("selectedMonth").value;

        // 데이터 필터링 또는 계산
        // 여기에서는 선택한 월을 사용하여 해당 월의 사용 금액을 계산하는 예시를 제공합니다.
        // 실제 데이터와 데이터 구조에 따라 코드를 수정해야 할 수 있습니다.

        // 예시: 데이터를 가져와서 선택한 월에 해당하는 데이터 필터링 및 계산
        var filteredData = yourData.filter(function(item) {
            var transactionDate = new Date(item.transactionDate); // 데이터에서 날짜 필드에 따라 수정
            var transactionMonth = transactionDate.getFullYear() + "-" + (transactionDate.getMonth() + 1).toString().padStart(2, '0'); // "YYYY-MM" 형식으로 변환
            return transactionMonth === selectedMonth;
        });

        // 선택한 월의 사용 금액 계산
        var totalAmount = 0;
        filteredData.forEach(function(item) {
            // 실제 데이터에서 금액 필드에 따라 수정
            totalAmount += item.amount;
        });

        // 검색 결과를 화면에 업데이트
        updateMonthUsage(selectedMonth, totalAmount);
    }

    function updateMonthUsage(selectedMonth, totalAmount) {
        // 선택한 월과 해당 월의 사용 금액을 화면에 업데이트하는 코드를 여기에 추가
        // 예를 들어, 선택한 월과 사용 금액을 출력하는 등의 방식으로 업데이트할 수 있습니다.
        document.querySelector(".card-value").textContent = selectedMonth + " 사용금액: " + totalAmount.toLocaleString() + "원";
    }

    $(document).ready(function() {
        // DataTables 초기화 및 페이징 설정
        $('#cardHistoryTable').DataTable();
    });
    // 모달 열기
    function openCardModal() {
        var modal = document.getElementById("cardModal");
        modal.style.display = "block";
    }

    // 모달 닫기
    function closeCardModal() {
        var modal = document.getElementById("cardModal");
        modal.style.display = "none";
    }


    $.ajax({
        type: "GET",
        url: "/completeCalculateTravel",
        success: function (response) {
            document.querySelector('#completeTravelLength').textContent=response+"개";
        },
        error: function (error) {
            console.error(error);
        },
    });
    $.ajax({
        type: "GET",
        url: "/selectMemberNotificationHistory",
        success: function (response) {
            var chartCanvas = document.getElementById('myChart');
            var ctx = chartCanvas.getContext('2d');

            if (response.length === 0) {
                // 데이터가 없을 경우 "데이터 없음" 메시지를 렌더링
                ctx.font = 'bold 13px Verdana';
                ctx.fillText('여행 데이터를 추가하세요', chartCanvas.width / 2 - 80, chartCanvas.height / 2);
                return; // 데이터가 없으므로 그 이후 코드 실행을 중지
            }
            if (response.length === 0) {
                // 데이터가 없을 경우 "데이터 없음" 메시지를 표시
                var travelreport = document.querySelector('.chartbox');
                var noDataMessage = document.createElement('div');
                noDataMessage.textContent = '';
                travelreport.appendChild(noDataMessage);
                return; // 데이터가 없으므로 그 이후 코드 실행을 중지
            }
            var food = 0;
            var etc =0;
            var accommodation =0;
            response.forEach(function(item){
                food +=item.food_expenses;
                etc += item.etc_expenses;
                accommodation +=item.accommodation_expenses;

            })

            var totalcategory = food + etc + accommodation;
            var manyCategory = "";
            var percent;
            if (accommodation > food && accommodation > etc) {
                manyCategory = "숙박";
                percent = (accommodation / totalcategory) * 100;
            } else if (food > accommodation && food > etc) {
                manyCategory = "음식";
                percent = (food / totalcategory) * 100;
            } else {
                manyCategory = "기타·문화";
                percent = (etc / totalcategory) * 100;
            }

            var travelreport = document.querySelector('#travelreport');
            var cdiv = document.createElement('div');
            cdiv.innerHTML = '여행·일정에서 가장 많은 항목은 <div class="manyCategory category-' + manyCategory + '">' + manyCategory + '</div> 입니다.';
            cdiv.classList.add('category'); // 'category' 클래스 추가
            travelreport.appendChild(cdiv);

            var total = document.createElement('div');
            total.innerHTML = '총 여행·일정(모여라회비) 금액의 <div class="percent">' + percent.toFixed(2) + '%</div>를 차지합니다.';
            total.classList.add('percentage'); // 'percentage' 클래스 추가
            travelreport.appendChild(total);

            // 고정된 색상 배열
            const fixedColors = [
                // 'rgb(255, 99, 132)',
                // 'rgb(54, 162, 235)',
                // 'rgb(255, 205, 86)'
                'rgb(211, 211, 211)',
                'rgb(241, 241, 241)',
                'rgb(0, 92, 255)'
            ];
            // 데이터 가공
            const data = [
                {
                    label: '음식',
                    data: food,
                    backgroundColor: fixedColors[0]
                },
                {
                    label: '기타·문화',
                    data: etc,
                    backgroundColor: fixedColors[1]
                },
                {
                    label: '숙박',
                    data: accommodation,
                    backgroundColor: fixedColors[2]
                }
            ];

            // 데이터 총합 계산
            const total1 = data.reduce((acc, item) => acc + item.data, 0);

            // 퍼센티지 계산 및 라벨 설정
            data.forEach(item => {
                const percentage = ((item.data / total1) * 100).toFixed(1); // 소수점 1자리까지 표시
                item.label += '(' +percentage+'%)';
            });

            // 차트 설정
            const chartData = {
                labels: data.map(item => item.label),
                datasets: [
                    {
                        data: data.map(item => item.data),
                        backgroundColor: data.map(item => item.backgroundColor),
                        hoverOffset: 4,
                    },
                ],
            };

            const chartConfig = {
                type: 'doughnut',
                data: chartData,
                options: {
                    plugins: {
                        legend: {
                            display: true, // 레전드 숨김
                        },
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    const label = context.label || '';
                                    if (label) {
                                        return label + ' : ' + context.formattedValue+'원';
                                    }
                                    return '';
                                },
                            },
                        },
                    },
                },
            };

            // 차트 생성
            const myChart = new Chart(
                document.getElementById('myChart'),
                chartConfig
            );

        },
        error: function (error) {
            console.error(error);
        },
    });
    // 모달 요소와 버튼 요소 가져오기
    var updateModal = document.getElementById("updateModal");
    var updateBtn = document.getElementById("updateGroup");
    var updateCloseBtn = document.getElementsByClassName("update-close")[0];

    // 버튼을 클릭하면 모달을 보이게 함
    updateBtn.addEventListener("click", function() {
        updateModal.style.display = "block";
    });

    // 모달 바깥 영역이나 닫기 버튼을 클릭하면 모달을 숨김
    window.addEventListener("click", function(event) {
        if (event.target == updateModal || event.target == updateCloseBtn) {
            updateModal.style.display = "none";
        }
    });
    $("#enroll").click(function(){
        var groupId = "${sessionScope.groupAccountDetail.group_id}";
        $.ajax({
            type: "POST",
            url: "/selectGroupAutopay",
            data: { groupId : groupId},
            success: function (response) {
               if(response==="Y"){
                   alert("자동이체 신청이 되었습니다.")
               }else{

               }
            }
        });
    })
    $("#cancel").click(function(){
        var groupId = "${sessionScope.groupAccountDetail.group_id}";
        $.ajax({
            type: "POST",
            url: "/deleteGroupAutopay",
            data: { groupId : groupId},
            success: function (response) {
                alert(response)
            }
        });
    })
    $('#updateButton').click(function(){
        var groupAccount = document.getElementById("groupAccount").textContent;
        var groupDay = document.getElementById("groupDay").value;
        var groupDues = document.getElementById("groupDues").value;
        var groupAutopay = document.getElementById("groupAutopay").value;
        var groupPassword = document.getElementById("groupPassword").value;

        var dataToSend = {
            groupAccount: groupAccount,
            groupDay: groupDay,
            groupDues: groupDues,
            groupAutopay: groupAutopay,
            groupPassword: groupPassword
        };

        $.ajax({
            type: "POST",
            url: "/updateGroupInfo",
            contentType: "application/json",
            data: JSON.stringify(dataToSend),
            success: function (response) {
                alert(response)
            }
        });
    })

    $.ajax({
        type: "POST",
        url: "/selectGroupInfo",
        data: { groupId : "${sessionScope.groupAccountDetail.group_id}" },
        success: function (response) {
            document.getElementById("groupName").textContent = response[0].group_name;
            document.getElementById("groupAccount").textContent = response[0].group_account;
            var gBalance = response[0].g_balance;
            var formattedGBalance = gBalance.toLocaleString();
            document.getElementById("groupBalance").textContent = formattedGBalance + "원";
            document.getElementById("groupDay").value = response[0].g_day;
            document.getElementById("groupDues").value = response[0].g_dues;
            document.getElementById("groupAutopay").value = response[0].g_autopay;
            var autopayValue = response[0].g_autopay;
            var groupAutopaySelect = document.getElementById("groupAutopay");

            var options = groupAutopaySelect.options;

            for (var i = 0; i < options.length; i++) {
                if (options[i].value === autopayValue) {
                    options[i].selected = i;
                    break;
                }
            }
            document.getElementById("groupPassword").value = response[0].group_pw;
            console.log(response);
        }
    });

    $.ajax({
        type: "POST",
        url: "/selectNotification",
        success: function (response) {
            console.log(response)
            var total=0;
            var paymentCnt = document.querySelector('#payment-cnt');
            var paymentBalance = document.querySelector('#payment-balance');
            if(response.length==0){
                paymentCnt.textContent=0;
                paymentBalance.textContent=0;
            }else{
                paymentCnt.textContent=response.length;
                response.forEach(function(val){
                    total += val.amount;
                })
                paymentBalance.textContent=total;
            }
        }
    });
    // 모달 요소와 버튼 요소 가져오기
    var customModal = document.getElementById("customModal");
    var customBtn = document.querySelector("#custom-account-month");
    var customCloseBtn = document.querySelector(".custom-close");

    // 버튼을 클릭하면 모달을 보이게 함
    customBtn.addEventListener("click", function() {
        customModal.style.display = "block";
    });

    // 모달 바깥 영역이나 닫기 버튼을 클릭하면 모달을 숨김
    window.addEventListener("click", function(event) {
        if (event.target == customModal || event.target == customCloseBtn) {
            customModal.style.display = "none";
        }
    });

    $("#non-payment-account").click(function(){

    })

    $.ajax({
        type: "POST",
        url: "/selectMyAccountMonthStatement",
        success: function (response) {
            var total = 0;
            var monthCnt = document.querySelector('#month-cnt');
            var monthBalance = document.querySelector('#month-balance');

            // 모달 내용을 추가할 부분
            var modalContent = document.querySelector('.custom-modal-content');
            var table = document.createElement('table');
            table.className = 'custom-table';

            // 테이블 헤더 생성
            var thead = document.createElement('thead');
            var headerRow = document.createElement('tr');
            var headers = ['날짜', '내용', '금액'];

            headers.forEach(function (headerText) {
                var th = document.createElement('th');
                th.style.textAlign='center';
                th.textContent = headerText;
                headerRow.appendChild(th);
            });

            thead.appendChild(headerRow);
            table.appendChild(thead);

            // 테이블 바디 생성
            var tbody = document.createElement('tbody');
            response.forEach(function (transaction) {
                var row = document.createElement('tr');
                var cell1 = document.createElement('td');
                var cell2 = document.createElement('td');
                var cell3 = document.createElement('td');

                cell1.textContent = transaction.transaction_date;
                cell2.textContent = transaction.transaction_content;
                cell3.textContent = transaction.balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                cell3.style.textAlign = 'right';
                row.appendChild(cell1);
                row.appendChild(cell2);
                row.appendChild(cell3);
                tbody.appendChild(row);

                total += transaction.balance;
            });

            table.appendChild(tbody);
            modalContent.appendChild(table);

            monthCnt.textContent = response.length;
            monthBalance.textContent = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        },
        error: function (error) {
            console.error(error);
        },
    });


    $.ajax({
        type: "POST",
        url: "/selectMygroupTravelList",
        success: function (response) {
            $("#travleLength").text(response.length + "개");
        },
        error: function (error) {
            console.error(error);
        },
    });
    if ("${sessionScope.member}" !== "") {
        var memberId = "${sessionScope.member.member_id}";
        $.ajax({
            type: "POST",
            url: "/JoinGroupAccountAndMemberAccount",
            success: function (response) {
                if (response.length > 0) {
                    for (let index = 0; index < response.length; index++) {
                        const groupId = response[index].group_id;
                        $.ajax({
                            type: "POST",
                            url: "/selectGroupAccountInfo",
                            data: { memberId: memberId, groupId: groupId },
                            success: function (groupResponse) {
                                var slide2 = document.querySelector('.slides .slide2-1:nth-child('+(index+1)+')');
                                var accountGroup = document.createElement('div');
                                accountGroup.className='account-group';
                                if (groupResponse !== null) {
                                    var groupAccountButton = document.createElement("button");
                                    groupAccountButton.classList.add("account-button");
                                    groupAccountButton.textContent = "모임통장";
                                    groupAccountButton.onclick = function() {
                                        location.href = "/mygroup/" + groupResponse.group_id;
                                    };

                                    var cardButton = document.createElement("button");
                                    cardButton.classList.add("account-button");
                                    cardButton.addEventListener("click", function(){
                                        openCardModal();
                                    });
                                    cardButton.textContent = "카드내역";


                                    var groupAccountBankDiv = document.createElement("div");
                                    groupAccountBankDiv.classList.add("bank");
                                    groupAccountBankDiv.textContent = groupResponse.group_name;

                                    var groupAccountInfoDiv = document.createElement("div");
                                    groupAccountInfoDiv.classList.add("account-info");

                                    var groupAccountInfoSpan = document.createElement("span");
                                    groupAccountInfoSpan.classList.add("account-number");
                                    groupAccountInfoSpan.textContent = groupResponse.group_account;

                                    var groupAccountInfoInput = document.createElement("input");
                                    groupAccountInfoInput.type = "hidden";
                                    groupAccountInfoInput.name = "accountId";
                                    groupAccountInfoInput.value = "";

                                    var groupAccountInfoButton = document.createElement("button");
                                    groupAccountInfoButton.classList.add("change-account");
                                    groupAccountInfoButton.textContent = "모임통장 내역";
                                    groupAccountInfoButton.onclick = function() {
                                        location.href = "/groupAccountDetail";
                                    };

                                    // Append elements to the parent container (slide2)
                                    groupAccountInfoDiv.appendChild(groupAccountInfoSpan);
                                    groupAccountInfoDiv.appendChild(groupAccountInfoInput);
                                    groupAccountInfoDiv.appendChild(groupAccountInfoButton);

                                    accountGroup.appendChild(groupAccountButton);
                                    accountGroup.appendChild(cardButton);
                                    accountGroup.appendChild(groupAccountBankDiv);
                                    accountGroup.appendChild(groupAccountInfoDiv);
                                    slide2.appendChild(accountGroup)
                                } else {
                                    // Handle the case when groupResponse is null or empty
                                }
                            },
                            error: function (error) {
                                // Handle errors for the inner AJAX call
                            }
                        });
                    }
                } else {
                    // Handle the case when response is an empty array
                }
            },
            error: function (error) {
                // Handle errors for the outer AJAX call
            },
        });
    }


    $('#deleteGroup').click( function() {
        var groupId = "${sessionScope.groupAccount.group_id}";
        $.ajax({
            type: "POST",
            url: "/deleteGroups",
            data: { groupId : groupId },
            success: function(response) {
                location.href="/";
            },
            error: function(error) {
            }
        });
    } );


    $('.slider-2 .page-nav > div').click(function() {

        var $this = $(this);
        var $pagenav = $this.parent()
        var $current = $pagenav.find('.active');

        $current.removeClass('active');
        $this.addClass('active');

        var index = $this.index();
        var $slider = $this.closest('.slider-2');

        $slider.find('.slides > div.active').removeClass('active');
        $slider.find('.slides > div').eq(index).addClass('active');


    });

    $('.slider-2 > .side-btns > div:first-child').click(function() {
        var $this = $(this);
        var $slider = $this.closest('.slider-2');

        var $current = $slider.find('.page-nav > div.active');
        var $post = $current.prev();

        if ( $post.length == 0 ) {
            $post = $slider.find('.page-nav > div:last-child');
        }

        $post.click();
    });

    $('.slider-2 > .side-btns > div:last-child').click(function() {
        var $this = $(this);
        var $slider = $this.closest('.slider-2');

        var $current = $slider.find('.page-nav > div.active');
        var $post = $current.next();

        if ( $post.length == 0 ) {
            $post = $slider.find('.page-nav > div:first-child');
        }

        $post.click();
    });


</script>
</html>
