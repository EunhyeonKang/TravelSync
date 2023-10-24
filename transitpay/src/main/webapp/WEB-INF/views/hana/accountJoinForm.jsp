<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="../../../resources/css/accountJoinForm.css">
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
            <div>
                <div>
                    <label for="accountName">계좌 이름:</label>
                    <input type="text" id="accountName" name="accountName" required>
                </div>
                <div>
                    <label for="accountNumber">계좌 번호:</label>
                    <input type="text" id="accountNumber" name="accountNumber" required>
                </div>
                <div>
                    <label for="balance">잔액:</label>
                    <input type="number" id="balance" name="balance" required>
                </div>
                <ul class="footBtwrap clearfix">
                    <li><button class="fpmgBt2">동의</button></li>
                </ul>
            </div>

        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</div>
</body>
<script>
    $(".fpmgBt2").click(function() {
        var accountNum = document.getElementById("accountNumber").value;
        var accountBank = document.getElementById("accountName").value;

        $.ajax({
            type: "POST",
            url: "/selectHanaAccount",
            data: {
                account_bank: accountBank,
                account_num: accountNum,
            },
            success: function (response) {
                console.log(response);
            },
            error: function (error) {
                console.error(error);
            },
        });
    })
</script>

</html>