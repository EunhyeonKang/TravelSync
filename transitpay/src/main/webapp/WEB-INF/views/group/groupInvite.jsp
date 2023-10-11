<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
            integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
            crossorigin="anonymous"></script>
</head>
<style>

    .main {
        width: 100%;
        height: 850px;
    }.menu1-1{
         text-align: center;
         padding-top: 10px;
         color: #008485;
         font-weight: 700;
         font-size: 20px;
     }.traveltitle{
          text-align: left;
          left: 10px;
          color: #7a7d7d;
          font-size: 29px;
          width: 1155px;
          margin: 30px auto;
          font-weight: 600;
      }
    .traveltitle hr{
        border: 1px solid #929292;
    }
    .contents{
        width: 1200px;
        display: flex;
        height: 100%;
        margin: 30px auto;
     }.menu1 a:hover {
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
         margin: 20px;
     }
    .menuhr hr{
          border: 2px solid #008485;
    }
    .contents-1{
           padding: 10px 0 20px 20px;
           border-radius: 50px;
           width: 800px;
           display: table;
    }
    /*살짝다름*/
    .contentsText{
        font-weight: 600;
        font-size: 17px;
        color: #606060;
        float: left;
        padding: 13px 0;
    }
    .section-1 div:nth-child(2){
        margin-left: auto;
    }
    .section-1{
        display: flex;
        padding: 20px 0;
    }


    .success{
        box-sizing: border-box;
        background: #FFFFFF;
        border-width: 0px 0px 3px 0;
        border-style: solid;
        border-color: #b4b2b2;
    }
    .hanaClassText{
        color: #7d7d7d;
        text-align: center;
        padding-bottom: 60px;
    }

    .hanaClassBox{
        width: 511px;
        padding: 15px 0;
        margin: 0 auto;
        background: #FFFFFF;
        border-radius: 5px;
    }
    .hanaClass{
        font-weight: 600;
        font-size: 20px;
        text-align: center;
        color: #000000;
    }
    .applyBox{
        width: 358px;
        height: 50px;
        margin: 20px auto;
        background: rgba(0, 152, 153, 0.73);
        border: 1px solid #FFFFFF;
        border-radius: 5px;
    }
    .applyBtn{
        font-weight: 700;
        font-size: 18px;
        text-align: center;
        color: #FFFFFF;
        background: rgba(0, 152, 153, 0.73);
        border: 0;
        text-align: center;
        margin: 0 auto;
        width: 100%;
        padding: 15px 0;
    }
    .classSection{
        display: flex;
        padding: 10px;
        margin: 10px 0;
    }
    .class-1{
        width: 50%;
        font-weight: 600;
        font-size: 18px;
        color: #878787;
        float: left;
    }

    .accountBox{
        display: grid;
        width: 50%;
        text-align: right;
        margin-left: 0;
        justify-items: end;
    }
    .accountBox>.account{

        float: right;
        text-align: right;
    }
    .account{
        width: 50%;
        float: right;
        text-align: right;
    }
    /* 스테퍼 컨테이너 */
    .stepper {
        display: flex;
        align-items: center;
    }

    /* 각 스탭 */
    .step {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-left: 50px;
        z-index: 1;
    }

    /* 원 형태 스타일 */
    .circle {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        text-align: center;
        line-height: 31px;
        background-color: #FFFFFF;
        border: 2px solid #089b9c;
        color: #089b9c;
        font-family: 'Inter';
        font-weight: 700;
        font-size: 15px;
        margin-bottom: 5px;
    }

    /* 활성 스탭 스타일 */
    .active {
        background-color: #089b9c;
        color: #FFFFFF;
    }

    /* 가로선 스타일 */
    .line {
        width: 170px;
        height: 3px;
        background-color: #DCDCDC;
        position: relative;
        left: 180px;
    }

    /* 라벨 스타일 */
    .label {
        font-family: 'Inter';
        font-weight: 600;
        font-size: 15px;
        color: #089b9c;
    }
    .newAccountImg{
        text-align: center;
        margin: 0 auto;
        width: 60px;
        display: block;
    }
    .section-4 > hr{
        border: 1.5px solid #b4b2b2;
    }
    .actBottomText{
        width: 106px;
        height: 18px;
        font-weight: 600;
        font-size: 15px;
        text-align: center;
        color: rgba(0, 152, 153, 0.73);
    }
    .bottomText-1{
        font-weight: 600;
        font-size: 15px;
        color: #B0B0B0;
    }
    .textBox{
        padding: 10px 0;
    }
    #kakaotalk-sharing-btn{
        box-sizing: border-box;
        width: 800px;
        height: 50px;
        background: rgba(0, 152, 153, 0.73);
        color: #FFFFFF;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 10px;
        margin-top: 30px;
    }
    #kakaotalk-sharing-btn:hover{
        transform: scale(1.009);
        transition: transform 0.1s ease-in-out;
    }
</style>
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
    <%--alert("${sessionScope.groupAccountDetail}")--%>
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
                                title: 'HANA-TRAVELSYNC 모임통장 초대',
                                description: response.group_name+'에 초대되었습니다. 초대 코드는 ${sessionScope.member.code}입니다.',
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