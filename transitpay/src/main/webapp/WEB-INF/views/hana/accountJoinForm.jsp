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
    #logo {
        width: 240px;
        height: 44px;
        cursor: pointer;
    }

    #header {
        padding-top: 62px;
        padding-bottom: 20px;
        text-align: center;
    }

    /* 입력폼 */


    h3 {
        margin: 19px 0 8px;
        font-size: 14px;
        font-weight: 700;
    }


    .box {
        display: block;
        width: 100%;
        height: 51px;
        border: solid 1px #dadada;
        padding: 10px 14px 10px 14px;
        box-sizing: border-box;
        background: #fff;
        position: relative;
    }

    .int {
        display: block;
        position: relative;
        width: 100%;
        height: 29px;
        border: none;
        background: #fff;
        font-size: 15px;
    }

    input {
        font-family: Dotum,'돋움',Helvetica,sans-serif;
    }

    .box.int_id {
        padding-right: 110px;
    }

    .box.int_pass {
        padding-right: 40px;
    }

    .box.int_pass_check {
        padding-right: 40px;
    }

    .step_url {
        /*@naver.com*/
        position: absolute;
        top: 16px;
        right: 13px;
        font-size: 15px;
        color: #8e8e8e;
    }

    .pswdImg {
        width: 18px;
        height: 20px;
        display: inline-block;
        position: absolute;
        top: 50%;
        right: 16px;
        margin-top: -10px;
        cursor: pointer;
    }

    #bir_wrap {
        display: table;
        width: 100%;
    }

    #bir_yy {
        display: table-cell;
        width: 147px;

    }

    #bir_mm {
        display: table-cell;
        width: 147px;
        vertical-align: middle;
    }

    #bir_dd {
        display: table-cell;
        width: 147px;
    }

    #bir_mm, #bir_dd {
        padding-left: 10px;
    }

    select {
        width: 100%;
        height: 29px;
        font-size: 15px;
        background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
        background-size: 20px 8px;
        -webkit-appearance: none;
        display: inline-block;
        text-align: start;
        border: none;
        cursor: default;
        font-family: Dotum,'돋움',Helvetica,sans-serif;
    }
    #btnJoin {
        width: 100%;
        padding: 21px 0 17px;
        border: 0;
        cursor: pointer;
        color: #fff;
        background-color: #08a600;
        font-size: 20px;
        font-weight: 400;
        font-family: Dotum,'돋움',Helvetica,sans-serif;
</style>
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
                <div id="wrapper">
                    <!-- content-->
                    <div id="content">
                        <!-- ID -->
                        <div>
                            <h3 class="join_title">
                                <label for="id">계좌번호</label>
                            </h3>
                            <span class="box int_id">
                                            <input type="text" id="id" class="int" maxlength="20">
                                            <span class="step_url">@naver.com</span>
                                        </span>
                            <span class="error_next_box"></span>
                        </div>

                        <!-- PW1 -->
                        <div>
                            <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                            <span class="box int_pass">
                                            <input type="text" id="pswd1" class="int" maxlength="20">

                                            <img src="m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                                        </span>
                            <span class="error_next_box"></span>
                        </div>

                        <!-- PW2 -->
                        <div>
                            <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                            <span class="box int_pass_check">
                                            <input type="text" id="pswd2" class="int" maxlength="20">
                                            <img src="m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                                        </span>
                            <span class="error_next_box"></span>
                        </div>

                        <!-- NAME -->
                        <div>
                            <h3 class="join_title"><label for="name">이름</label></h3>
                            <span class="box int_name">
                                            <input type="text" id="name" class="int" maxlength="20">
                                        </span>
                            <span class="error_next_box"></span>
                        </div>

                        <!-- BIRTH -->
                        <div>
                            <h3 class="join_title"><label for="yy">생년월일</label></h3>

                            <div id="bir_wrap">
                                <!-- BIRTH_YY -->
                                <div id="bir_yy">
                                                <span class="box">
                                                    <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                                                </span>
                                </div>

                                <!-- BIRTH_MM -->
                                <div id="bir_mm">
                                                <span class="box">
                                                    <select id="mm" class="sel">
                                                        <option>월</option>
                                                        <option value="01">1</option>
                                                        <option value="02">2</option>
                                                        <option value="03">3</option>
                                                        <option value="04">4</option>
                                                        <option value="05">5</option>
                                                        <option value="06">6</option>
                                                        <option value="07">7</option>
                                                        <option value="08">8</option>
                                                        <option value="09">9</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                    </select>
                                                </span>
                                </div>

                                <!-- BIRTH_DD -->
                                <div id="bir_dd">
                                                <span class="box">
                                                    <input type="text" id="dd" class="int" maxlength="2" placeholder="일">
                                                </span>
                                </div>

                            </div>
                            <span class="error_next_box"></span>
                        </div>

                        <!-- GENDER -->
                        <div>
                            <h3 class="join_title"><label for="gender">성별</label></h3>
                            <span class="box gender_code">
                                            <select id="gender" class="sel">
                                                <option>성별</option>
                                                <option value="M">남자</option>
                                                <option value="F">여자</option>
                                            </select>
                                        </span>
                            <span class="error_next_box">필수 정보입니다.</span>
                        </div>

                        <!-- EMAIL -->
                        <div>
                            <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(선택)</span></label></h3>
                            <span class="box int_email">
                                            <input type="text" id="email" class="int" maxlength="100" placeholder="선택입력">
                                        </span>
                            <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
                        </div>

                        <!-- MOBILE -->
                        <div>
                            <h3 class="join_title"><label>휴대전화</label></h3>
                            <span class="box int_mobile">
                                            <input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
                                        </span>
                            <span class="error_next_box"></span>
                        </div>


                        <!-- JOIN BTN-->
                        <div class="btn_area">
                            <button type="button" id="btnJoin">
                                <span>가입하기</span>
                            </button>
                        </div>
                    </div>
                    <!-- content-->
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
<!-- JavaScript 코드를 추가 -->
<script>
    $(document).ready(function() {
        // "가입하기" 버튼 클릭 시
        $("#btnJoin").click(function() {
            // 입력된 정보 가져오기
            var id = $("#id").val();
            var pswd1 = $("#pswd1").val();
            var pswd2 = $("#pswd2").val();
            var name = $("#name").val();
            var yy = $("#yy").val();
            var mm = $("#mm").val();
            var dd = $("#dd").val();
            var gender = $("#gender").val();
            var email = $("#email").val();
            var mobile = $("#mobile").val();
            //ACCOUNT (account_id,account_num, balance, account_bank, account_pwd, account_main, account_phone)
            // 데이터를 JSON 형식으로 만들기
            var userData = {
                id: id,
                pswd1: pswd1,
                pswd2: pswd2,
                name: name,
                yy: yy,
                mm: mm,
                dd: dd,
                gender: gender,
                email: email,
                mobile: mobile,

            };

            // AJAX 요청 보내기
            $.ajax({
                type: "POST", // 또는 "GET" 등 요청 유형 선택
                url: "/accountJoinForm", // 서버 엔드포인트 URL 설정
                // data: JSON.stringify(userData), // JSON 데이터를 문자열로 변환하여 보냅니다.
                contentType: "application/json; charset=utf-8", // 데이터 유형 설정
                success: function(response) {
                    // 서버 응답 성공 시 처리
                    alert("가입 성공!");
                    // 추가적인 처리나 리다이렉션을 여기에 추가할 수 있습니다.
                },
                error: function(xhr, status, error) {
                    // 서버 응답 실패 시 처리
                    alert("가입 실패: " + error);
                    // 오류 처리나 다른 작업을 여기에 추가할 수 있습니다.
                }
            });
        });
    });
</script>

</body>
</html>