<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
    .agreeDetail {
        display: none;
    }
    .plusButton{
        border: 0;
        background: 0;
        font-size: 18px;
        font-weight: 600;
        color: #878787;
    }
    .agreeDetail{
        padding: 0 0 20px 20px;
    }

    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        z-index: 2;
    }

    .modal-content {
        background-color: #fff;
        margin: 150px auto;
        padding: 30px;
        width: 600px;
        border-radius: 5px;
    }

    /* 닫기 버튼 스타일 */
    .close-btn {
        float: right;
        cursor: pointer;
        display: none;
    }

    .rec6{
        padding: 15px;
        width: 100%;
        box-sizing: border-box;
        height: 50px;
        text-align: left;
        background: #FFFFFF;
        border: 1px solid #CDC9C9;
        border-radius: 10px;
    }
    .flexClass{
        display: inline-block;
        width: 500px;
        margin-bottom: 20px;
    }
    #calculate{
        box-sizing: border-box;
        width: 500px;
        height: 50px;
        background: rgba(0, 152, 153, 0.73);
        color: #FFFFFF;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 10px;
        text-align: center;
        margin: 30px auto;
    }
    .idbox{
        float: left;
    }
    h2{
        text-align: center;
    }
    .group71 {
        text-align: center;
    }


    input[type="checkbox"] {
        display: none;
    }

    /* Style for the custom checkbox container */
    .checkbox-cell {
        width: 20px;
        text-align: center;
    }

    /* Style for the custom checkbox */
    .checkbox-cell input[type="checkbox"] + label::before {
        content: '\2713'; /* Unicode checkmark symbol */
        font-size: 20px;
        display: inline-block;
        cursor: pointer;
        transition: color 0.3s;
    }

    /* Style for checked custom checkbox */
    .checkbox-cell input[type="checkbox"]:checked + label::before {
        color: #007bff;
    }

    /* Style for the agreement text and view terms */
    .text-cell {
        flex: 1;
        display: flex;
        align-items: center;
    }

    .agreement-text {
        padding-left: 10px;
    }

    /* Style for the link to view terms */
    .view-terms a {
        text-decoration: none;
        color: #007bff;
        transition: color 0.3s;
    }

    .view-terms a:hover {
        color: #0056b3;
    }

    /* Add some margin between rows */
    .agreement-row {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    .agreement-table{
        width: 80%;
        margin: 0 auto;
    }
</style>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        내 모임통장<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">내 모임통장</div>
            <div class="menuhr"><hr/></div>
            <a href="group">모임통장 내역</a>
        </div>
        <div class="contents-1">
            <div class="section-1">
                <div class="contentsText">내 계좌번호</div>
                <div class="stepper">
                    <div class="line"></div>
                    <div class="step">
                        <div class="circle active">1</div>
                    </div>
                    <div class="step">
                        <div class="circle">2</div>
                    </div>
                    <div class="step">
                        <div class="circle">3</div>
                    </div>
                </div>
            </div>
            <div class="section-2">
                <div>날짜별 회비 내역</div>
                <div>회원별 회비 내역</div>
            </div>
            <div class="section-3">
                <div class="newAccount">매월 1일, 10만원씩</div>
                <div class="hanaClassBox">
                    <div class="hanaClass">10,000,000</div>
                </div>
                <div class="applyBox">
                    <button class="applyBtn" onclick="openModal()">자세히보기</button>
                </div>
                <div class="modal" id="myModal">
                    <div class="modal-content">
                        <span class="close-btn" onclick="closeModal()">&times;</span>
                        <h2>비밀번호 입력</h2>
                        <div class="group71">
                            <div class="groupForm" id="groupForm">
                                <br/>
                                <div class="flexClass">
                                    <span class="idbox">비밀번호</span>
                                    <input type="password" name="groupPwd" class="rec6" placeholder="비밀번호를 입력해주세요"/>
                                </div>
                                <br/>
                                <div class="agreement-table">
                                    <div class="agreement-row">
                                        <div class="checkbox-cell">
                                            <input type="checkbox" id="selectAllCheckbox">
                                            <label for="selectAllCheckbox"></label>
                                        </div>
                                        <div class="text-cell">
                                            전체 선택
                                        </div>
                                    </div>
                                    <div class="agreement-row">
                                        <div class="checkbox-cell">
                                            <input type="checkbox" id="termsCheckbox" class="required-checkbox">
                                            <label for="termsCheckbox"></label>
                                        </div>
                                        <div class="text-cell">
                                            서비스 이용약관 동의(필수) <a href="#">약관보기</a>
                                        </div>
                                    </div>
                                    <div class="agreement-row">
                                        <div class="checkbox-cell">
                                            <input type="checkbox" id="privacyCheckbox" class="required-checkbox">
                                            <label for="privacyCheckbox"></label>
                                        </div>
                                        <div class="text-cell">
                                            개인정보처리방침 동의(필수) <a href="#">약관보기</a>
                                        </div>
                                    </div>
                                    <div class="agreement-row">
                                        <div class="checkbox-cell">
                                            <input type="checkbox" id="locationCheckbox" class="required-checkbox">
                                            <label for="locationCheckbox"></label>
                                        </div>
                                        <div class="text-cell">
                                            위치정보사업 약관 동의(필수) <a href="#">약관보기</a>
                                        </div>
                                    </div>
                                    <div class="agreement-row">
                                        <div class="checkbox-cell">
                                            <input type="checkbox" id="marketingCheckbox">
                                            <label for="marketingCheckbox"></label>
                                        </div>
                                        <div class="text-cell">
                                            마케팅 수집 동의(선택) <a href="#">약관보기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button id="calculate" onclick="submitForm()">
                                <span>접속하기</span>
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</div>
</body>
<script>
    function submitForm(){
        var modal = document.getElementById('myModal');
        modal.style.display = 'none';
        var groupId = "${groupId}";

        var groupPwdInputs = document.getElementsByName("groupPwd");
        var firstGroupPwdInput = groupPwdInputs[0];
        var groupPwdValue = firstGroupPwdInput.value;

        $.ajax({
            type: "POST",
            url: "/inputCheckPassword",
            data: { groupId : groupId },
            success: function(response) {
                //로그인이 안되어있으면 로그인 폼으로 이동
                if(groupPwdValue === response){
                    alert('접속완료')
                    //모임원이면 가입동의해야함
                    selectGroupMember();
                }else{
                    alert("비밀번호가 틀립니다");
                    openModal();
                }
            },
            error: function(error) {
            }
        });
    }
    function selectGroupMember(){
        var groupId = "${groupId}";
        $.ajax({
            type: "POST",
            url: "/selectGroupMember",
            data: { groupId : groupId },
            success: function(response) {
                //모임원추가
                console.log(response)
            },
            error: function(error) {
            }
        });
    }

    function openModal() {
        var modal = document.getElementById('myModal');
        modal.style.display = 'block';
    }

    $(document).ready(function() {
        var memberId = "${sessionScope.member.member_id}";
        if(memberId==""){
            alert('로그인을 하세요');
            location.href='/';
        }else {
            $.ajax({
                type: "POST",
                url: "/selectUseTypeAccount",
                data: {memberId: memberId},
                success: function (response) {
                    if (response != null) {
                        //비밀번호 입력
                        openModal();
                    } else {
                        console.log("모임통장을 개설하세요!");
                        location.href = 'group';
                    }
                },
                error: function (error) {
                }
            });
        }
    });

</script>

</html>