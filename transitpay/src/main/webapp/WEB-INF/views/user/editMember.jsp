<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="../../resources/css/editInfo.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        마이페이지<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">계좌·모임 관리</div>
            <div class="menuhr"><hr/></div>
            <a href="mypage">계좌·모임 관리</a>
            <a href="editMember">회원정보수정</a>
            <a href="mytravel">여행 관리</a>
            <!-- 추가 메뉴 항목들 -->
        </div>
        <div class="contents-1">
            <div class="group71">
                <div class="group31">
                    <form action="JoinOk" method="post">
                        <span id="signup">회원정보수정</span>
                        <br/>
                        <div class="flexSignup">
                            <span class="idbox">이메일</span>
                            <input type="text" name="id" class="id" placeholder="아이디를 입력해주세요" value="${sessionScope.member.email}"/>
                        </div>
                        <br/>
                        <div class="flexSignup">
                            <span class="idbox">비밀번호</span>
                            <input type="password" name="pw" class="pw" placeholder="비밀번호를 입력해주세요"/>
                        </div>
                        <br/>
                        <div class="flexSignup">
                            <span class="idbox">이름</span>
                            <input type="text" name="name" class="name" placeholder="이름을 입력해주세요" value="${sessionScope.member.name}"/>
                        </div>
                        <br/>
                        <div class="flexSignup">
                            <span class="idbox">핸드폰</span>
                            <input type="text" name="phone" class="phone" placeholder="핸드폰을 입력해주세요" value="${sessionScope.member.phone}"/>
                        </div>
                        <br/>
                        <input type="hidden" name="roletype" value="user" class="gradio" id="gradio">
                        <button id="join2">
                            <span>회원정보 수정하기</span>
                        </button>

                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</body>
<script type="text/javascript">
    function validatePassword() {
        var password = document.getElementsByName("pw")[0].value;
        console.log(password);
        var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
        if (!passwordPattern.test(password)) {
            alert("비밀번호는 영문과 숫자의 조합으로 최소 4글자 이상이어야 합니다.");
            return false;
        }

        return true;
    }

    document.getElementById("join2").addEventListener("click", function(event) {
        if (!validatePassword()) {
            event.preventDefault();
        }
    });
</script>

</html>
