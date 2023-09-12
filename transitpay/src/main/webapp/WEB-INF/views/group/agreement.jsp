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
    }

    .group71{
        display: grid;
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
        text-align: left;
    }
    h2{
        text-align: center;
    }
    form{
        margin: 0 auto;
    }
</style>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        모임통장 계좌 개설<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">약관동의</div>
            <div class="menuhr"><hr/></div>
            <a href="group">약관동의</a>
            <c:choose>
                <c:when test="${sessionScope.member != null}">
                    <a href="openedAccount">모임개설</a>
                    <a href="groupInvite">모임통장 초대</a>
                </c:when>
            </c:choose>
        </div>
        <div class="contents-1">
            <div class="section-1">
                <div class="contentsText">모임개설 전에 꼭 확인하세요</div>
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
                <div>실시간 커뮤니티</div>
                <div>회비 장부 관리</div>
            </div>
            <div class="section-3">
                <div class="newAccount">안심계좌번호부여</div>
                <div class="hanaClassBox">
                    <div class="hanaClass">하나 모여라 통장</div>
                </div>
                <div class="applyBox">
                    <button class="applyBtn" onclick="openModal()">신청하기</button>
                </div>
                <div class="modal" id="myModal">
                    <div class="modal-content">
                        <span class="close-btn" onclick="closeModal()">&times;</span>
                        <h2>모임통장 만들기</h2>
                        <div class="group71">
                            <form id="groupForm">
                                <br/>
                                <div class="flexClass">
                                    <span class="idbox">모임명</span>
                                    <input type="text" name="groupname" class="rec6" placeholder="모임명을 입력해주세요"/>
                                </div>
                                <br/>
                                <div class="flexClass">
                                    <span class="idbox">모임 카테고리 선택</span>
                                    <select name="grouptype" class="rec6">
                                        <option value="" selected>선택</option>
                                        <option value="여행">여행</option>
                                    </select>
                                </div>
                                <br/>
                                <div class="flexClass">
                                    <span class="idbox">계좌선택</span>
                                    <select name="accounts" class="rec6" id="selAccount">
                                        <option value="" selected/>선택</option>

                                    </select>
                                </div>
                                <br/>
                                <input type="hidden" name="roletype" value="user" class="rec6" id="gradio">
                            </form>
                            <button id="calculate" onclick="submitForm()">
                                <span>모임 만들기</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-4">
                <div class="classSection">
                    <div class="class-1">모임통장 안내</div>
                    <div class="plus"><button class="plusButton" data-target="agreeDetail1">&#43;</button></div>
                </div>
                <div class="agreeDetail" id="agreeDetail1">
                    <div class="g__pop-content">
                        <strong>서비스 개요</strong>
                        <p>카카오뱅크 입출금통장에 모임통장서비스를 신청하면 회비조회, 회비관리, 멤버관리가 가능한 모임통장으로 사용할 수 있는 서비스</p>
                        <strong>서비스 대상고객</strong>
                        <ul>
                            <li>• 모임주 : 카카오뱅크 입출금통장 보유 고객</li>
                            <li>• 모임멤버 : 카카오뱅크 회원 가입 고객 (만 14세 이상)</li>
                        </ul>
                        <strong>서비스 대상상품</strong>
                        <p>카카오뱅크 입출금통장</p>
                        <span>※ 입출금통장 1개당 모임통장서비스는 1개만 신청 가능 (입출금통장 1개에 복수의 모임통장서비스 신청은 불가)</span><br>
                        <span>※ 단, 마이너스통장 등의 한도 대출 이용 계좌, 대출 이자, 원리금 납부계좌 등 대출에 활용 중인 계좌나 압류, 질권, 금융사기 등 사고 신고된 계좌는 신청 불가</span>
                        <strong>서비스 신청 및 참여 한도</strong>
                        <ul>
                            <li>• (모임주) 신청 가능 수 : 인당 최대 100개 모임 개설 가능</li>
                            <li>• (모임멤버) 참여 가능 수 : 인당 최대 30개 모임 참여 가능</li>
                        </ul>
                        <span>※ 모임통장서비스 1개당 모임멤버는 최대 100명까지 참여 가능</span>

                        <strong>제공서비스 안내</strong>
                        <ul>
                            <li>• 모임멤버 초대 : 카카오톡 친구 또는 채팅방에 있는 모임멤버들을 빠르고 쉽게 초대 가능</li>
                            <li>• 모임통장 조회 : 모임주의 모임통장 회비내역을 멤버들도 함께 조회하고 확인</li>
                            <li>• 모임통장 관리 : 모임통장 회비납입 현황을 한눈에 확인하고, 메시지 카드를 통해 손쉽게 회비 요청</li>
                        </ul>
                    </div>
                </div>
                <hr>
                <div class="classSection">
                    <div class="class-1">모임통장 유의사항</div>
                    <div class="plus"><button class="plusButton" data-target="agreeDetail2">&#43;</button></div>
                </div>
                <div class="agreeDetail" id="agreeDetail2">
                    <div class="g__pop-content">
                        <strong>서비스 신청 제한 계좌</strong>
                        <ul>
                            <li>• 비상금대출, 마이너스 통장 등 한도 대출 이용 계좌</li>
                            <li>• 카카오뱅크 대출 이자 또는 원리금 납부 이용 계좌</li>
                            <li>• 카카오뱅크 개인사업자통장 가입 계좌</li>
                            <li>• 압류, 질권이 설정되었거나, 금융사기 등 사고신고 등록 계좌</li>
                        </ul>
                        <strong>서비스 이용 계좌 거래 제한</strong>
                        <ul>
                            <li>• 비상금대출, 마이너스 통장 등 한도 대출로 이용 불가</li>
                            <li>• 카카오뱅크 대출 이자 또는 원리금 납부계좌로 이용 불가</li>
                            <li>• 카카오뱅크 개인사업자통장으로 상품 전환 불가</li>
                        </ul>
                        <strong>서비스 이용 정지</strong>
                        <p>모임통장 또는 모임주가 다음에 해당되는 경우 모임통장서비스 이용이 일시적으로 중단됨 (단, 이용정지 사유가 해소된 경우 모임주는 모바일앱을 통해 즉시 이용정지해제 신청 가능)</p>
                        <ol>
                            <li>1. 모임통장을 장기간 사용하지 않는 경우 (1년간 로그인 또는 입출금이 없는 경우)</li>
                            <li>2. 모임통장에 압류 등이 설정되거나, 금융사기 등 사고신고가 등록된 경우</li>
                            <li>3. 모임주가 고객센터를 통해 직접 요청한 경우</li>
                        </ol>
                        <strong>서비스 유의사항</strong>
                        <ul>
                            <li>• 모임통장은 모임주 개인 명의의 통장으로 멤버들이 납입한 모임회비의 지급, 해지 권한은 모임주에게 있으며, 압류 등 모임주의 상태에 따라 모임회비 및 모임통장서비스 이용이 제한될 수 있음</li>
                            <li>• 모임통장서비스를 종료하려면 모임에 참여 중인 멤버를 모두 내보내기 한 이후에 가능하며, 해지 후 모임통장 내용 복원은 불가함</li>
                            <li>• 모임통장서비스는 카카오뱅크 입출금통장에 연계되어 제공되는 서비스로, 입출금통장에 대한 자세한 사항은 카카오뱅크 입출금통장 상품설명서 및 약관을 참고하시기 바랍니다.</li>
                        </ul>
                        <strong>서비스 관련 문의 및 민원 절차</strong>
                        <p>서비스에 대한 문의·민원 등 상담이 필요하실 경우 카카오뱅크 고객센터, 앱, 인터넷 홈페이지를 통해 상담이 가능합니다.</p>
                    </div>
                </div>
                <hr>
                <div class="classSection">
                    <div class="class-1">상품설명서 및 이용약관</div>
                    <div class="plus"><button class="plusButton" data-target="agreeDetail3">&#43;</button></div>
                </div>
                <div class="agreeDetail" id="agreeDetail3">
                    <div class="g__pop-content info_cont">
                        <strong>모임통장서비스 설명서
                            <a href="https://og.kakaobank.io/download/2ed43d04-96c0-493b-abbc-6a057991ba3b" target="_blank" class="link_download" title="모임통장서비스 설명서 다운로드" data-show-doc="true" data-html-url="https://og.kakaobank.io/view/48b56e95-2d94-43bb-a01e-8a3eb4fba227" data-txt-url="https://og.kakaobank.io/view/012b144f-f0b1-4f22-a8fb-6711e7c93c0a" data-doc-nm="모임통장서비스 설명서">
                                다운로드
                                <span class="img_kakaobank img_download"></span>
                            </a>
                        </strong>
                        <span class="line_g"></span>
                        <strong class="tit_g">상품 이용 약관<a href="https://og.kakaobank.io/download/36aebd05-2a5d-4f4c-b994-a310bc1aeb56" target="_blank" class="link_download" title="모임통장서비스 통합 약관 다운로드" data-show-doc="true" data-html-url="https://og.kakaobank.io/view/692ba316-0e50-4984-8c0a-8f692ad08790" data-txt-url="https://og.kakaobank.io/view/76f0fb34-03f5-41fd-aed2-0c4546bad33f" data-doc-nm="모임통장서비스 통합 약관">
                            다운로드<span class="img_kakaobank img_download"></span>
                        </a>
                        </strong>
                        <ul>
                            <li style="margin-bottom:4px;">•<a href="https://og.kakaobank.io/download/944aa98f-d706-4cfd-92a4-e22f0e94fa4f" target="_blank" style="text-decoration:underline;" title="모임통장서비스 이용약관 다운로드" data-show-doc="true" data-html-url="https://og.kakaobank.io/view/02693de8-1704-43f0-b2f0-b4a7b7bfe2dd" data-txt-url="https://og.kakaobank.io/view/d5b914d9-8533-435d-8a53-a19420b7463f" data-doc-nm="모임통장서비스 이용약관">
                                모임통장서비스 이용약관
                            </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</div>
</body>
<script>
    const classSection = document.querySelector('.classSection');
    const agreeDetail = document.querySelector('.agreeDetail');
    const plusButtons = document.querySelectorAll('.plusButton');
    let isExpanded = false;
    plusButtons.forEach((plusButton) => {
        plusButton.addEventListener('click', function () {
            const targetId = this.getAttribute('data-target');
            const agreeDetail = document.getElementById(targetId);

            if (agreeDetail.style.display === 'block') {
                agreeDetail.style.display = 'none';
                classSection.style.maxHeight = '1000px'; // 필요에 따라 조절
                plusButton.innerHTML = '&#43;';
                plusButton.classList.remove('active');
            } else {
                agreeDetail.style.display = 'block';
                agreeDetail.style.marginTop = '20px';
                classSection.style.maxHeight = classSection.scrollHeight + 'px';
                plusButton.innerHTML = '&#45;';
                plusButton.classList.add('active');
            }
        });
    });

    // 모달 열기
    function openModal() {
        var memberId = "${sessionScope.member.member_id}";
        if(memberId != ""){
            $.ajax({
                url:'/selectBackAccount',
                method: "POST",
                success: function(response) {
                    console.log(response)
                    var selAccount = document.getElementById('selAccount');
                    for (let i = 0; i < response.length; i++) {
                        var option = document.createElement('option');
                        option.value = response[i].account_num;
                        option.textContent = response[i].account_bank + " "+response[i].account_num;
                        selAccount.appendChild(option);

                    }
                }
            })
            var modal = document.getElementById('myModal');
            modal.style.display = 'block';
        }else{
            alert("로그인을 하세요!");
            location.href='/';
        }

    }
    // 모달 닫기
    function closeModal() {
        var modal = document.getElementById('myModal');
        modal.style.display = 'none';
    }

    function submitForm() {
        // form 요소 가져오기
        var form = document.getElementById('groupForm');

        // form 내의 값 가져오기
        var groupname = form.querySelector('input[name="groupname"]').value;
        var grouptype = form.querySelector('select[name="grouptype"]').value;
        var accounts = form.querySelector('select[name="accounts"]').value;

        // AJAX 요청을 위한 데이터 구성
        var data = {
            group_name: groupname,
            group_type: grouptype,
            account_num: accounts
        };
        // AJAX 요청 보내기 (GET 방식)
        $.ajax({
            url: '/insertGroupAccount',
            method: 'GET',
            data: data,
            success: function(response) {
                // 성공적으로 응답을 받았을 때 수행할 동작
                alert(response);
                location.href='/openedAccount?groupName='+encodeURIComponent(groupname) +
                    "&groupType=" + encodeURIComponent(grouptype);
            },
            error: function(error) {
                // 에러 처리
                console.error(error);
            }
        });
    }
</script>

</html>