<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main2box">
    <div class="main2-2">
        <div class="parent">
            <div class="first">
                <a href="">
                    <div class="img">
                        <img src="../../resources/images/groupicon.png" style="background: aliceblue" alt="">
                    </div>
                    <div class="t_wrap">
                        <p class="titlename">HANA모임통장</p>
                        <p class="name">둘이, 셋이, 여럿이 함께쓰고<br>같이 보는 모임통장을 사용하세요</p>
                    </div>
                </a>
            </div>
            <div class="first">
                <a href="">
                    <div class="img">
                        <img src="../../resources/images/travelSchedule.png" style="background: aliceblue" alt="">
                    </div>
                    <div class="t_wrap">
                        <p class="titlename">실시간 여행계획</p>
                        <p class="name">모임원들과 실시간 일정계획으로<br>효율적인 여행경비를 계산하세요</p>
                    </div>
                </a>
            </div>
            <div class="first">
                <a href="">
                    <div class="img">
                        <img src="../../resources/images/main2.png" style="background: aliceblue" alt="">
                    </div>
                    <div class="t_wrap">
                        <p class="titlename">여행경비 리포트</p>
                        <p class="name">여행예산을 1/N하고 회비통계로<br>나만의 여행비용패턴을 확인하세요</p>
                    </div>
                </a>
            </div>
            <div class="first">
                <a href="">
                    <div class="img">
                        <img src="../../resources/images/friendinvite.png" style="background: #f2f4f4" alt="">
                    </div>
                    <div class="t_wrap">
                        <p class="titlename">너도나도 포인트</p>
                        <p class="name">친구를 초대하고 모임통장에서<br>포인트를 사용하세요</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="main2">
    <img class="" src="../../resources/images/groupAccount1.png" style="width: 200px; margin : 0 auto; display: block">
    <div class="ttext">
        <div class="ctext1">총무님은 쉬세요</div><br>
        <div class="ctext1"><span class="t1"> 트래블싱크</span>가 대신할게요.</div>
    </div>
    <div class="mtext">
        <div class="ctext2">회비규칙으로</div><br>
        <div class="ctext2">회비관리를 더 편하게</div>
    </div>

    <div class="bbutton">
        <button type="submit" class="tbutton" onclick="location.href = 'group'">
            <div class="tTrable">모임통장 개설하기</div>
        </button>
    </div>
</div>
<div class="main3">
    <div class="exchangebox1">
        <button type="submit" class="exchgbutton">
            <div class="exchgtext">실시간여행계획</div>
        </button>
        <button type="submit" class="exchgbutton">
            <div class="exchgtext">여행리포트</div>
        </button>
    </div>
    <div class="exchangebox2">
        <img class="exchgimg" src="../../resources/images/travelmain.png">
        <div class="ctext2">친구와 함께 여행계획을 세우고</div><br>
        <div class="ctext2">모여라 회비를 통해 편리한 여행을 시작하세요</div>
    </div>

</div>
<%@ include file="include/footer.jsp" %>
<script>

</script>
