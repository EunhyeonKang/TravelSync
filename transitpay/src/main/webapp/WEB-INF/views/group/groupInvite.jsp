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
    }.contents{
         width: 1200px;
         display: flex;
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
    #invite{
        box-sizing: border-box;
        width: 800px;
        height: 50px;
        background: rgba(0, 152, 153, 0.73);
        color: #FFFFFF;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 10px;
        margin-top: 30px;
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
            <a href="openedAccount">모임개설</a>
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
                    <div class="class-1">계좌/계좌은행</div>
                    <div class="accountBox">
                        <div class="account" id="account"></div>
                        <div class="account" id="bank"></div>
                    </div>
                </div>
                <hr>
                <div class="classSection">
                    <div class="class-1" >안심계좌번호</div>
                    <div class="account" id="groupAccount"></div>
                </div>
                <hr>
                <div class="classSection">
                    <div class="class-1">모임통장 신청일</div>
                    <div class="account" id="groupDate"></div>
                </div>
                <hr>
            </div>
            <div>
                <div class="textBox">
                    <span class="actBottomText">&#183; 안심계좌번호</span><span class="bottomText-1">란 예금주의 계좌 정보 보호를 위해 멤버들에게</span><br>
                    <span class="bottomText-1">보여지는 계좌번호입니다.</span>
                </div>
                <div class="textBox">
                    <span class="actBottomText">&#183; 모임통장 신청일 이후 내역</span><span class="bottomText-1">부터 멤버들에게 보여집니다.</span><br>
                </div>
            </div>
            <button id="invite">
                <span>친구 초대하기</span>
            </button>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</div>
</body>
<script>
    window.onload = function() {
        var memberId = "${sessionScope.member.member_id}";

        $.ajax({
            url:'/selectGroupAccountInfo',
            data: { memberId : memberId },
            method: "POST",
            success: function(response) {
                var account = document.getElementById('account');
                account.textContent = response.account_num;

                var bank = document.getElementById('bank');
                bank.textContent = response.account_bank + '계좌';

                var groupAccount = document.getElementById('groupAccount');
                groupAccount.textContent = response.group_account;

                var groupDate = document.getElementById('groupDate');
                groupDate.textContent = response.g_date;

            }
        })
    }
</script>

</html>