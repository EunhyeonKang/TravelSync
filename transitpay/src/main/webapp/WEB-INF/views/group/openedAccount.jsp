<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="../../../resources/css/openedAccount.css">
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        모임통장 계좌 개설<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">모임통장 개설</div>
            <div class="menuhr"><hr/></div>
            <c:choose>
                <c:when test="${sessionScope.member != null}">
                    <a href="group">모임약관동의</a>
                    <a href="openedAccount">모임통장 개설</a>
                    <a href="groupInvite">모임통장 초대</a>
                </c:when>
                <c:otherwise>
                    <a href="openedAccount">모임통장 개설</a>
                </c:otherwise>
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
                        <input type="text" name="g_dues" class="rec6" placeholder="회비를 입력해주세요" autocomplete="off"/>
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
                <button id="calculate" onclick="phoneAuth()"/>
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

                    <input type ="tel" id ="phone-number" name="phone" placeholder="전화번호를 입력해주세요" autocomplete="off">
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
   function phoneAuth(){
       var modal = $("#myModal");
       modal.css("display", "block");
    };

    var span = $(".close").eq(0);
    span.click(function(){
        var modal = $("#myModal");
        modal.css("display", "none");
    })


    $("#auth-req-button").click(function() {
        var member = {
            phone: $("#phone-number").val(),
            groupName: "${sessionScope.groupAccount.group_name}",
        };
        $.ajax({
            type: "POST",
            url: "/checkPhone",
            data: JSON.stringify(member),
            contentType: "application/json",
            success: function(response) {
                alert(response)
            },
            error: function(error) {
                console.error("로그인 실패 : ", error);
            }
        });
    });

    function submitForm() {
        var formData = $("#groupForm").serialize();

        var formDataObj = {};
        formData.split('&').forEach(function(item) {
            var pair = item.split('=');
            formDataObj[pair[0]] = decodeURIComponent(pair[1] || '');
        });

        $.ajax({
            url: "/insertGroupDetail",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(formDataObj),
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