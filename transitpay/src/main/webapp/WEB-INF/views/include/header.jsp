<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../../../resources/css/common.css">
</head>
<body>
<div class="main-1">
    <header>
        <div class="nav">
            <a class="title" href="/">
                <img src="../../resources/images/img-hana-symbol.png" style="width: 40px">
                <p>하나 트래블싱크</p>
            </a>
            <ul class="menu">
                <c:choose>
                    <c:when test="${sessionScope.member != null}">
                        <li><a href="/categoryTravel">여행정보 보기</a></li>
                        <li><a href="/group">모임통장 개설</a></li>
                        <li><a href="/travel">여행계획</a></li>
                        <li><a href="/travel">게시판</a></li>
                    </c:when>
                    <c:otherwise>
<%--                        <li><a href="/categoryTravel">여행정보 보기</a></li>--%>
<%--                        <li><a href="/group">모임통장 개설</a></li>--%>
<%--                        <li><a href="/travel">여행계획</a></li>--%>
<%--                        <li><a href="/travel">게시판</a></li>--%>
<%--                        <li><a href="/mypage">마이페이지</a></li>--%>
                    </c:otherwise>
                </c:choose>
            </ul>
            <i class="totalmenu"></i>
        </div>
    </header>
    <div class="navbar-fixed">
        <div class="title"><a href="/">TRAVELSYNC</a></div>
        <ul id="menu">
            <li><a href="travelplans">TOP 여행지</a></li>
            <li><a href="mypage">내예약</a></li>
            <li><a href="login">로그인</a></li>
        </ul>
    </div>
    <hr class="navhr">
</div>
</body>
<script>
    function updateGroupAccount() {
        var memberId = "${sessionScope.member.member_id}";
        var groupId = "${sessionScope.groupAccount.group_id}";
        if(groupId!=""){
            window.location.href = "mygroup/"+groupId;
        }else{
            window.location.href = "group";
        }
    }
</script>
</html>
