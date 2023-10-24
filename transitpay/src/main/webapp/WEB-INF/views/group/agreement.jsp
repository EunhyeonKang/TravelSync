<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="../../../resources/css/agreement.css">
    <script defer src="../../../resources/js/agreement.js"></script>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        모임통장 계좌 개설<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">모임약관동의</div>
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
                <div>실시간 여행 커뮤니티</div>
                <div>회비 장부 관리</div>
            </div>
            <div class="section-3">
                <div class="newAccount">안심계좌번호부여</div>
                <div class="hanaClassBox">
                    <div class="hanaClass">하나 모여라 통장</div>
                </div>
                <div class="applyBox">
                    <button class="applyBtn" onclick="openModal();">신청하기</button>
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
                                    <input type="text" name="groupname" class="rec6" placeholder="모임명을 입력해주세요" autocomplete="off"/>
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
                    <div class="class-1" onclick="toggleAgreement('agreeDetail1')">모임통장 안내</div>
                    <div class="plus"><button class="plusButton" data-target="agreeDetail1">&#43;</button></div>
                </div>
                <div class="agreeDetail" id="agreeDetail1">
                    <div class="g__pop-content">
                        <strong>서비스 개요</strong>
                        <p>하나 트래블싱크 입출금통장에 모임통장서비스를 신청하면 회비조회, 회비관리, 멤버관리가 가능한 모임통장으로 사용할 수 있는 서비스</p>
                        <strong>서비스 대상고객</strong>
                        <ul>
                            <li>• 모임주 : 하나 트래블싱크 입출금통장 보유 고객</li>
                            <li>• 모임멤버 : 하나 트래블싱크 회원 가입 고객 (만 14세 이상)</li>
                        </ul>
                        <strong>서비스 대상상품</strong>
                        <p>하나 트래블싱크 입출금통장</p>
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
                    <div class="class-1" onclick="toggleAgreement('agreeDetail2')">모임통장 유의사항</div>
                    <div class="plus"><button class="plusButton" data-target="agreeDetail2">&#43;</button></div>
                </div>
                <div class="agreeDetail" id="agreeDetail2">
                    <div class="g__pop-content">
                        <strong>서비스 신청 제한 계좌</strong>
                        <ul>
                            <li>• 비상금대출, 마이너스 통장 등 한도 대출 이용 계좌</li>
                            <li>• 하나 트래블싱크 대출 이자 또는 원리금 납부 이용 계좌</li>
                            <li>• 하나 트래블싱크 개인사업자통장 가입 계좌</li>
                            <li>• 압류, 질권이 설정되었거나, 금융사기 등 사고신고 등록 계좌</li>
                        </ul>
                        <strong>서비스 이용 계좌 거래 제한</strong>
                        <ul>
                            <li>• 비상금대출, 마이너스 통장 등 한도 대출로 이용 불가</li>
                            <li>• 하나 트래블싱크 대출 이자 또는 원리금 납부계좌로 이용 불가</li>
                            <li>• 하나 트래블싱크 개인사업자통장으로 상품 전환 불가</li>
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
                            <li>• 모임통장서비스는 하나 트래블싱크 입출금통장에 연계되어 제공되는 서비스로, 입출금통장에 대한 자세한 사항은 하나 트래블싱크 입출금통장 상품설명서 및 약관을 참고하시기 바랍니다.</li>
                        </ul>
                        <strong>서비스 관련 문의 및 민원 절차</strong>
                        <p>서비스에 대한 문의·민원 등 상담이 필요하실 경우 하나 트래블싱크 고객센터, 앱, 인터넷 홈페이지를 통해 상담이 가능합니다.</p>
                    </div>
                </div>
                <hr>
                <div class="classSection">
                    <div class="class-1" onclick="toggleAgreement('agreeDetail13')">상품설명서 및 이용약관</div>
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
                <div class="modal" id="agreeModal">
                    <div id="joinForm">
                        <ul class="join_box">
                            <h2>약관동의</h2>
                            <li class="checkBox check01">
                                <ul class="clearfix">
                                    <li>이용약관, 입출금 예금약관,
                                        계좌간 자동이체 이용약관(필수)에 모두 동의합니다.</li>
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
                                <textarea name="" id="">
                                    <jsp:include page="../form/form01.jsp"/>
                                </textarea>
                            </li>
                            <li class="checkBox check03">
                                <ul class="clearfix">
                                    <li>입출금 예금약관 동의(필수)</li>
                                    <li class="checkBtn">
                                        <input type="checkbox" name="chk">
                                    </li>
                                </ul>

                                <textarea name="" id="">
                                    <jsp:include page="../form/form02.jsp"/>
                                </textarea>
                            </li>
                            <li class="checkBox check03">
                                <ul class="clearfix">
                                    <li>계좌간 자동이체약관 동의(필수)</li>
                                    <li class="checkBtn">
                                        <input type="checkbox" name="chk">
                                    </li>
                                </ul>

                                <textarea name="" id="">
                                     <jsp:include page="../form/form03.jsp"/>
                                </textarea>
                            </li>

                            <li style="text-align: center;"><button onclick="groupFunc()" class="fpmgBt2" type="submit">약관동의</button></li>

                        </ul>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</div>
<script>
    function openModal() {
        var groupId = "${sessionScope.groupAccount.group_id}";
        if(groupId!=""){
            closeModal();
            alert("이미 모임통장을 개설했습니다.");
            location.href='/mygroup/'+groupId;
        }else{
            var modal = document.getElementById('agreeModal');
            modal.style.display = 'block';
        }

    }

    function submitForm() {
        var form = document.getElementById('groupForm');
        var memberId = "${sessionScope.member.member_id}";

        var groupname = form.querySelector('input[name="groupname"]').value;
        var grouptype = form.querySelector('select[name="grouptype"]').value;
        var accounts = form.querySelector('select[name="accounts"]').value;

        var data = {
            group_name: groupname,
            group_type: grouptype,
            account_num: accounts,
            group_leader : memberId
        };

        $.ajax({
            url: '/insertGroupAccount',
            method: 'GET',
            data: data,
            success: function(response) {
                alert(response);
                location.href='/openedAccount';
            },
            error: function(error) {
                console.error(error);
            }
        });
    }

    function groupFunc(){
        var memberId = "${sessionScope.member.member_id}";
        var modal = document.getElementById('agreeModal');
        modal.style.display = 'none';
        var modal = document.getElementById('myModal');
        modal.style.display = 'block';
        if(memberId != ""){
            $.ajax({
                url:'/selectBackAccount',
                method: "POST",
                success: function(response) {
                    var selAccount = document.getElementById('selAccount');
                    for (let i = 0; i < response.length; i++) {
                        var option = document.createElement('option');
                        option.value = response[i].account_num;
                        option.textContent = response[i].account_bank + " "+response[i].account_num;
                        selAccount.appendChild(option);

                    }
                }
            })

        }else{
            alert("로그인을 하세요!");
            location.href='/';
        }
    }

</script>
</body>
</html>