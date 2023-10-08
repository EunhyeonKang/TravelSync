<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
     }.menuhr hr{
          border: 2px solid #008485;
      }.contents-1{
           padding: 10px 0 20px 20px;
           border-radius: 50px;
           width: 800px;
           display: table;
       }
    .contentsBox{
        float: left;

    }
    .contentsText{
        font-weight: 600;
        font-size: 17px;
        color: #606060;
        float: left;
        padding-top: 7px;
    }
    .section-1 div:nth-child(2){
        margin-left: auto;
    }
    .section-1{
        display: flex;
        padding: 20px 0;
    }
    .section-2{
        display: flex;
        margin-bottom: 30px;
    }
    .section-2 div:nth-child(1), .section-2 div:nth-child(2){
        box-sizing: border-box;
        background: #FFFFFF;
        border: 2px solid #EBF1F1;
        font-weight: 600;
        font-size: 20px;
        text-align: center;
        align-items: center;
        color: #000000;
        padding: 30px 0;
        margin: 0 auto;
        width: 48%;
    }
    .section-2 div:nth-child(2){
        box-sizing: border-box;
        background: #FFFFFF;
        border: 2px solid #EBF1F1;
        font-weight: 600;
        font-size: 20px;
        text-align: center;
        align-items: center;
        color: #000000;
        padding: 30px 0;
        margin: 0 auto;
        width: 48%;
    }
    .section-3{
        box-sizing: border-box;
        background: #F7F9F9;
        border-width: 1px 0px;
        border-style: solid;
        border-color: #BEBABA;

    }
    .newAccount{
        width: 141px;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 5px;
        font-weight: 700;
        font-size: 15px;
        padding: 5px 0;
        text-align: center;
        color: #008485;
        margin: 30px auto;
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
    .plus{
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

    .group71{
        text-align: center;
    }


    .rec6{
        float: right;
        padding: 15px;
        width: 100%;
        box-sizing: border-box;
        height: 50px;
        text-align: left;
        background: #FFFFFF;
        border: 1px solid #CDC9C9;
        border-radius: 10px;
    }
    .pay1{
        width: 49%;
        height: 50px;
        padding: 15px;
        background: #FFFFFF;
        border: 1px solid #CDC9C9;
        border-radius: 10px;
        float: left;
    }
    .pay2{
        width: 49%;
        height: 50px;
        padding: 15px;
        background: #FFFFFF;
        border: 1px solid #CDC9C9;
        border-radius: 10px;
        margin-left: 0;
        float: right;
    }

    .gradio{
        padding: 15px;
        width: 10%;
    }
    .rec7{
        box-sizing: border-box;

        position: absolute;
        width: 141px;
        height: 50px;

        background: #FFFFFF;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 10px;

    }

    #signup{
        width: 69px;
        height: 30px;

        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 25px;
        line-height: 30px;
        text-align: center;

        color: #000000;
    }
    .idbox{
        padding: 10px;
        box-sizing: border-box;
        text-align: left;
        display: flex;

        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 15px;
        line-height: 18px;
        text-align: center;

        color: #000000;


    }

    #calculate{
        box-sizing: border-box;
        width: 800px;
        height: 50px;
        background: rgba(0, 152, 153, 0.73);
        color: #FFFFFF;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 10px;
        margin-top: 30px;
    }
    .box2 > button > span{
        width: 300.21px;
        height: 18px;
        font-family: 'Inter';
        font-style: normal;
        font-weight: 700;
        font-size: 15px;
        line-height: 18px;
        text-align: center;
        color: #008485;
    }

    .flexClass{
        display: inline-block;
        width: 800px;
    }
    .contentsText1{
        font-size: 14px;
    }
    .payBox{
        margin: 0 auto;
    }
    #selAccount{
        background-color: #f0f0f0;
    }
    .groupname{
        color: #008485;
        font-size: 20px;
        font-weight: 700;
    }
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background: #00000075;
    }

    .modal-content {
        background-color: #ffffff;
        margin: 15% auto;
        padding: 20px;
        width: 450px;
        height: 560px;
        border-radius: 20px;
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    .login{
        color: #000000;
        text-align: center;
        display: inline-block;
    }
    .login img{
        width: 150px;
        margin: 20px auto;
    }
    #phone-number, #auth-number{
        width: 70%;
        border-radius: 10px;
        height: 50px;
        float: left;
        display: flex;
        mix-blend-mode: normal;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        margin: 10px 0 5px 0;
        background: 0;
        border: 0;
        border-bottom: solid 3px #b1b1b1;
        color: black;
    }
    #phone-number::placeholder, #auth-number::placeholder{
        text-align: left;
        color: white;
        background: 0;
    }
    .confirm-button,  #auth-req-button{
        align-items: center;
        justify-content: center;
        width: 25%;
        float: right;
        border: 1px solid #a7a9a9;
        background-color: #a7a9a9;
        mix-blend-mode: normal;
        color: white;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 10px;
        margin: 10px 0 14px 0;
        color: #010101;
        font-weight: 700;
        padding: 15px 0;
        font-size: 15px;
    }
    .authbox{
        width: 100%;
    }

    .phone-container{
        width: 100%;
        text-align: center;
        margin-top: 30px;
    }
    /*input::placeholder{*/
    /*    text-align: center;*/
    /*}*/
    .button-container:hover{
        transform:scale(1.01);
        transition: transform .2s;
    }
</style>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        모임통장 계좌 개설<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">모임통장 개설</div>
            <div class="menuhr"><hr/></div>
            <a href="group">모임약관동의</a>
            <c:choose>
                <c:when test="${sessionScope.member != null}">
                    <a href="openedAccount">모임통장 개설</a>
                    <a href="groupInvite">모임통장 초대</a>
                </c:when>
            </c:choose>
        </div>
        <div class="contents-1">
            <div class="section-1">
                <div class="contentsBox">
                    <span class="contentsText">모임 개설</span><br>
                    <span class="contentsText1">맞춤정보입력</span>
                </div>
                <div class="stepper">
                    <div class="line"></div>
                    <div class="step">
                        <div class="circle">1</div>
                    </div>
                    <div class="step">
                        <div class="circle active">2</div>
                    </div>
                    <div class="step">
                        <div class="circle">3</div>
                    </div>
                </div>
            </div>
            <div class="group71">
                <form id="groupForm">
                    <br/>
                    <div class="flexClass">
                        <span class="idbox"><span class="groupname" name="group_name">${sessionScope.groupAccount.group_name}</span>&#32;의 모임[<span name="group_type">${sessionScope.groupAccount.group_type}</span>]</span>
                    </div>
                    <br/>

                    <br/>
                    <div class="flexClass">
                        <span class="idbox">연결 계좌번호</span>
                        <input class="rec6" id="group_account" name="group_account" value="${sessionScope.groupAccount.account_num}" readonly/>
                    </div>
                    <br/>
                    <div class="flexClass">
                        <span class="idbox">납부일</span>
                        <div class="payBox">
                            <select name="g_month" class="pay1">
                                <option value="" selected>선택</option>
                                <option value="매달">매달</option>
                            </select>
                        </div>

                        <select name="g_day" class="pay2">
                            <option value="" selected>선택</option>
                            <option value="">일 선택</option>
                            <option value="1">1일</option>
                            <option value="2">2일</option>
                            <option value="3">3일</option>
                            <option value="4">4일</option>
                            <option value="5">5일</option>
                            <option value="6">6일</option>
                            <option value="7">7일</option>
                            <option value="8">8일</option>
                            <option value="9">9일</option>
                            <option value="10">10일</option>
                            <option value="11">11일</option>
                            <option value="12">12일</option>
                            <option value="13">13일</option>
                            <option value="14">14일</option>
                            <option value="15">15일</option>
                            <option value="16">16일</option>
                            <option value="17">17일</option>
                            <option value="18">18일</option>
                            <option value="19">19일</option>
                            <option value="20">20일</option>
                            <option value="21">21일</option>
                            <option value="22">22일</option>
                            <option value="23">23일</option>
                            <option value="24">24일</option>
                            <option value="25">25일</option>
                            <option value="26">26일</option>
                            <option value="27">27일</option>
                            <option value="28">28일</option>
                            <option value="29">29일</option>
                            <option value="30">30일</option>
                            <option value="31">31일</option>
                        </select>
                    </div>
                    <br/>
                    <div class="flexClass">
                        <span class="idbox">회비</span>
                        <input type="text" name="g_dues" class="rec6" placeholder="회비를 입력해주세요"/>
                    </div>
                    <div class="flexClass">
                        <span class="idbox">자동이체 여부</span>
                        <select name="g_autopay" class="rec6">
                            <option value="" selected>선택</option>
                            <option value="N">N</option>
                            <option value="Y">Y</option>

                        </select>
                    </div>
                    <br/>
                    <div class="flexClass">
                        <span class="idbox">비밀번호</span>
                        <input type="password" name="group_pw" class="rec6" placeholder="비밀번호를 입력해주세요"/>
                    </div>
                </form>
<%--                <button id="calculate" onclick="phoneAuth()"/>--%>
                <button id="calculate" onclick="submitForm()"/>
                    <span>개설하기</span>
                </button>

            </div>

        </div>
    </div>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="phone-container">
                <div class="login">
                    <h2>휴대폰 인증</h2>
                    <p>안전하고 간편하게 로그인하세요.</p>
                    <p><c:out value="${member.name}"/>님의 휴대폰 인증</p>
                    <img src="../../../resources/images/phone-call.svg" alt="">

                    <input type ="tel" id ="phone-number" name="phone" placeholder="전화번호를 입력해주세요">
                    <button type ="button" id ="auth-req-button">인증요청</button>
                    <p id="ViewTimer"></p>
                    <div class="authbox">
                        <input type ="password" id ="auth-number" placeholder="인증번호를 입력해주세요">
                        <button type="button" class="confirm-button" id ="auth-res-button" onclick="submitForm()">확인</button>
                    </div>
                    <%--                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=951e0627da48ee51855b252517b6352d--%>
                    <%--&redirect_uri=http://localhost:8080/api/social/login/kakao&response_type=code" class="kakaoa"><img class="kakao_btn" src="../../resources/images/kakaologin.png" width="30"></a>--%>
                    <%--                    <a href="https://kauth.kakao.com/oauth/logout?client_id=951e0627da48ee51855b252517b6352d&logout_redirect_uri=http://localhost:8080/logout" class="kakaoa">logout</a>--%>
                </div>

            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</div>
</body>
<script>
    // 모달창 열기
   function phoneAuth(){
       var modal = $("#myModal");
       modal.css("display", "block");
    };
    var span = $(".close").eq(0);
    span.click(function(){
        var modal = $("#myModal");
        modal.css("display", "none");
    })

    // "인증확인" 버튼 클릭 시 AJAX 요청
    $("#auth-req-button").click(function() {
        var member = {
            phone: $("#phone-number").val(),
            groupName: "${sessionScope.groupAccount.group_name}",
        };
        // AJAX 요청
        $.ajax({
            type: "POST",
            url: "/checkPhone",
            data: JSON.stringify(member),
            contentType: "application/json",
            success: function(response) {
                $("#auth-number").val(response);
            },
            error: function(error) {
                console.error("로그인 실패 : ", error);
            }
        });
    });

    function submitForm() {
        // serialize 함수를 사용하여 문자열로 직렬화
        var formData = $("#groupForm").serialize();

        // 폼 데이터를 파싱하여 JSON 객체로 변환
        var formDataObj = {};
        formData.split('&').forEach(function(item) {
            var pair = item.split('=');
            formDataObj[pair[0]] = decodeURIComponent(pair[1] || '');
        });

        $.ajax({
            url: "/insertGroupDetail", // 실제 서버 URL로 변경
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(formDataObj), // JSON 형식으로 데이터 전송
            success: function(response) {
                alert(response);
                location.href='groupInvite'
            },
            error: function(error) {
                console.error("에러 발생:", error);
            }
        });
    }
</script>

</html>