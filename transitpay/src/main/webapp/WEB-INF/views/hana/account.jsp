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

    ul>li{list-style: none}
    a{text-decoration: none;}
    .clearfix::after{content: "";display: block;clear: both;}
    #joinForm{width: 500px;margin: 0 auto;}
    ul.join_box{border: 1px solid #ddd;background-color: #fff;padding: 30px;}
    .checkBox,.checkBox>ul{position: relative;}
    .checkBox>ul>li{float: left;}
    .checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
    .checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
    .checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
    .footBtwrap{margin-top: 15px; padding: 30px;}
    .footBtwrap>li{height: 60px;width: 50%;height: 60px;margin: 0 auto;}
    .footBtwrap>li>button{
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
    .fpmgBt1{background-color: #fff;color:#888}
    .fpmgBt2{background-color: lightsalmon;color: #fff}

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
            <form action="/accountJoinForm" id="joinForm">
                <ul class="join_box">
                    <li class="checkBox check01">
                        <ul class="clearfix">
                            <li>이용약관, 개인정보 수집 및 이용,
                                위치정보 이용약관(선택), 프로모션 안내
                                메일 수신(선택)에 모두 동의합니다.</li>
                            <li class="checkAllBtn">
                                <input type="checkbox" name="chkAll" id="chk" class="chkAll">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>이용약관 동의(필수)</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk">
                            </li>
                        </ul>
                        <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                    </li>
                    <li class="checkBox check03">
                        <ul class="clearfix">
                            <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk">
                            </li>
                        </ul>

                        <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                    </li>
                    <li class="checkBox check03">
                        <ul class="clearfix">
                            <li>위치정보 이용약관 동의(선택)</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk">
                            </li>
                        </ul>

                        <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                    </li>
                    <li class="checkBox check04">
                        <ul class="clearfix">
                            <li>이벤트 등 프로모션 알림 메일 수신(선택</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk">
                            </li>
                        </ul>

                    </li>
                </ul>
                <ul class="footBtwrap clearfix">
                    <li><button class="fpmgBt2" type="submit">동의</button></li>
                </ul>
            </form>


        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</div>
</body>
<script>
    const agreeChkAll = document.querySelector('input[name=chkAll]');
    agreeChkAll.addEventListener('change', (e) => {
        let agreeChk = document.querySelectorAll('input[name=chk]');
        for(let i = 0; i < agreeChk.length; i++){
            agreeChk[i].checked = e.target.checked;
        }
    });

</script>

</html>