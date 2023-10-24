<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="../../../resources/css/groupInvite.css">
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
            integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        모임통장 계좌 개설<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">모임통장 초대</div>
            <div class="menuhr"><hr/></div>
            <a href="group">약관동의</a>
            <a href="openedAccount">모임통장 개설</a>
            <a href="groupInvite">모임통장 초대</a>
        </div>
        <div class="contents-1">
            <div class="section-1">
                <div class="contentsText">개설 완료</div>
                <div class="stepper">
                    <div class="line"></div>
                    <div class="step">
                        <div class="circle">1</div>
                    </div>
                    <div class="step">
                        <div class="circle">2</div>
                    </div>
                    <div class="step">
                        <div class="circle active">3</div>
                    </div>
                </div>
            </div>

            <div class="success">
                <div class="newAccount1"><img class="newAccountImg" src="../../resources/images/check.webp"></div>
                <div class="hanaClassBox">
                    <div class="hanaClass">모임통장 신청 완료</div>
                </div>
                <div class="hanaClassText">이제 모임통장에 친구를 초대해보세요</div>
            </div>
            <div class="section-4">
                <div class="classSection">
                    <div class="class-1">모임장 연결계좌</div>
                    <div class="accountBox">
                        <c:forEach var="account" items="${sessionScope.account}">
                            <c:if test="${account.account_num eq sessionScope.groupAccount.account_num}">
                                <div class="account" id="account">${account.account_num}</div>
                                <div class="account" id="bank">${account.account_bank}</div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <hr>
                <div class="classSection">
                    <div class="class-1" >모임통장 계좌번호</div>
                    <div class="account" id="groupAccount">${sessionScope.groupAccountDetail.group_account}</div>
                </div>
                <hr>
                <div class="classSection">
                    <div class="class-1" >회비 정보</div>
                    <div class="account" id="groupInfo">${sessionScope.groupAccountDetail.g_month} / ${sessionScope.groupAccountDetail.g_day}일 / ${sessionScope.groupAccountDetail.g_dues} 원</div>
                </div>
                <hr>
                <div class="classSection">
                    <div class="class-1">모임통장 신청일</div>
                    <div class="account" id="groupDate">
                        <c:set var="ymd" value="<%=new java.util.Date()%>" />
                        <fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />
                    </div>
                </div>
                <hr>
            </div>
            <div>
                <div class="textBox">
                    <span class="actBottomText">&#183; 모임통장 계좌번호</span><span class="bottomText-1">란 예금주의 계좌 정보 보호를 위해 멤버들에게</span><br>
                    <span class="bottomText-1">보여지는 계좌번호입니다.</span>
                </div>
                <div class="textBox">
                    <span class="actBottomText">&#183; 모임통장 신청일 이후 내역</span><span class="bottomText-1">부터 멤버들에게 보여집니다.</span><br>
                </div>
            </div>
            <button id="kakaotalk-sharing-btn" href="javascript:;" onclick="send()">
                <span>친구 초대하기</span>
            </button>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</div>
</body>
<script>
    function send() {
        $.ajax({
            url:'/selectVirtureAccountNumber',
            method: "POST",
            success: function(response) {
                if(response!=""){
                    var groupId = "${groupId}";
                    if(groupId!=""){
                        Kakao.Share.createDefaultButton({
                            container: '#kakaotalk-sharing-btn',
                            objectType: 'feed',
                            content: {
                                title: 'HANA-TRAVELSYNC 초대 이벤트',
                                description: response.group_name+'모임에 초대되었습니다. 초대 코드는 ${sessionScope.member.code}입니다.',
                                imageUrl: 'https://api.card-gorilla.com:8080/storage/post/2549/contents/29162/card_1272_1.jpg',
                                link: {
                                    mobileWebUrl: 'http://localhost:8080',
                                    webUrl: 'http://localhost:8080',
                                },
                            },
                            buttons: [
                                {
                                    title: '모임통장 참여하기',
                                    link: {
                                        mobileWebUrl: 'http://localhost:8080/mygroup/'+groupId,
                                        webUrl: 'http://localhost:8080/mygroup/'+groupId
                                    },
                                }
                            ],
                            serverCallbackArgs: '{"key" : "value"}',
                        });
                    }else{
                        var modal = document.getElementById('myModal');
                        modal.style.display = 'block';
                    }
                }
            }
        })
    }
    Kakao.init('aa75059f83f9e745604b52cb811450f4'); // 사용하려는 앱의 JavaScript 키 입력
</script>
</html>