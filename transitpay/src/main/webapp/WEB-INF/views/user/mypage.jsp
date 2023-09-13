<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/travel.css">
    <link rel="stylesheet" href="../../../resources/css/conacoount.css">
    <link rel="stylesheet" href="../../../resources/css/mypage.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script defer src="../../resources/js/mypage.js"></script>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        마이페이지<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">계좌·모임 관리</div>
            <div class="menuhr"><hr/></div>
            <a href="mypage">계좌·모임 관리</a>
            <a href="editMember">회원정보수정</a>
            <a href="mytravel">여행 관리</a>
            <!-- 추가 메뉴 항목들 -->
        </div>
        <div class="contents-1">
            <div class="accountbox">
                <div class="account">
                    <div class="account-details">
                        <button class="account-button">연결계좌</button>
                        <div class="bank"></div>
                        <div class="account-info">
                            <span class="account-number"></span>
                            <input type="hidden" name="accountId" value="">
                            <button class="change-account" id="change-account">연결계좌 변경</button>
                        </div>
                    </div>
                </div>
                <div class="notification">
                    <span class="charge-type">알림관리</span>
                    <div class="auto-charge">
                        <span class="charge-info">모임통장 알림</span>
                        <button class="charge-status">ON</button>
                    </div>

                    <div class="auto-charge-1">
                        <div class="charge-info-1">회비 및 정산 알림</div>
                        <div class="charge-condition">
                            <div class="condition-title">회비 알림</div>
                            <span class="condition-value">25일</span>
                            <span class="condition-unit">18시</span>
                        </div>
                        <div class="charge-amount">
                            <div class="charge-title">정산 알림</div>
                            <span class ="condition-value">3일마다</span>
                            <span class="charge-unit">알림</span>
                        </div>
                        <div class="chargebtn">
                            <button class="charge-save-button">저장</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-1">
                <div class="account2">
                    <div class="new-account-details">
                        <button class="account-button">안심계좌</button>
                        <div class="bank">트래블싱크</div>
                        <div class="account-info">
                            <span class="account-number">7979-1235-1234567</span>
                            <input type="hidden" name="accountId" value="">
                            <button class="change-account" onclick="location.href='groupAccountDetail'">모임통장 내역</button>
                        </div>
                    </div>
                </div>
                <span class="tvl-card">여행 모임통장 관리</span>
                <div class="auto-charge">
                    <span class="charge-info">자동이체 여부</span>
                    <button class="charge-status">ON</button>
                </div>
                <div class="auto-charge">
                    <span class="charge-info">내 회비 내역</span>
                    <button class="charge-status">ON</button>
                </div>
                <div class="auto-charge">
                    <span class="charge-info">내 여행 분석</span>
                    <button class="charge-status">ON</button>
                </div>
                <div class="auto-charge">
                    <span class="charge-info">모임통장 탈퇴</span>
                    <button class="charge-status">ON</button>
                </div>
            </div>
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
    <%@ include file="../include/footer.jsp" %>
</div>
</body>
<script>

</script>
</html>
