<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../../../resources/css/taffic.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        <span>교통편 보기</span>
        <hr/>
    </div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">여행 일정 추가</div>
            <div class="menuhr"><hr/></div>
            <a href="/travel">여행 장소 선택</a>
            <a href="map">여행 일정 추가</a>
            <a href="traffic">교통편 보기</a>
            <a href="/">TOP 여행지</a>
            <a href="/">여행 기록</a>
        </div>
        <div class="contents-1">
            <div class="trafficContainerBox">
                <span>${param.title}</span>
                <div class="traffic-modal-content">
                    <div class="startEnd">
                        <h3>이동경로 정보</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</body>
<script>

</script>
</html>
