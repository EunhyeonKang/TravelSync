<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="../../../resources/css/account.css">
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