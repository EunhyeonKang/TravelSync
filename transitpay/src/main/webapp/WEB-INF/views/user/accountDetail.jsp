<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/hanamoney.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
    .prev{
        font-size: 100px;
        position: absolute;
        bottom: 63%;
        left: 100px;
        color: #949494;
        cursor: pointer;
    }
    .next-1{
        position: absolute;
        font-size: 100px;
        bottom: 63%;
        right: 0px;
        color: #949494;
        cursor: pointer;
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
    .accountbox{
        width: 800px;
        margin: 0 auto;
    }
    .accountbox1{
        margin: 20px;
    }
    #accountSelect, #memberSelect{
        border: 1px solid #a4a4a4;
        padding: 10px;
        width: 205px;
        border-bottom-left-radius: 10px;
        border-top-left-radius: 10px;
    }
    .accountBtn, .memberBtn{
        padding: 10px;
        border: 1px solid #5e83aafc;
        background: #5e83aafc;
        color: white;
        border-bottom-right-radius: 10px;
        border-top-right-radius: 10px;
    }
    #example_filter{
        display: none;
    }
    #example_length{
        display: none;
    }
    #example_info{
        display: none;
    }
    .accountconnect{
        margin-top: 5px;
        margin-left: 5px;
        color: #727272;
    }
    .mainaccount{
        color: #E91E63;
    }
    .usePoint{
        font-weight: 700;
        color: cornflowerblue;
        font-size: 18px;
        margin-left: 5px;
    }
</style>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
       <div class="mainBox1">
<%--           <a class="prev" onclick="plusSlides(-1)">&#10094;</a>--%>
           <c:forEach var="account" items="${sessionScope.account}">
                <div class="hanacontainer-1">
                    <table>
                        <tr>
                            <td>
                                <div class="hanatitle">${account.account_bank}<span class="mainaccount">(주계좌)</span></div>
                                <div class="connectact"><a href="mypage" class="accountconnect">${account.account_num}</a></div>
                                <div class="hanabutton">
                                    <button class="atomic" onclick="location.href='mypage'">
                                        <span>연결계좌</span>
                                    </button>
                                </div>

                            </td>

                        </tr>
                        <tr>
                            <c:set var="formattedBalance" value="${account.balance}" />
                            <fmt:formatNumber var="formattedBalance" value="${formattedBalance}" type="number" pattern="#,##0" />
                            <td class="hanamoney"> <span><c:out value="${formattedBalance}" /></span><span>원</span></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="hanamoneybox">
                                    <div class="hanabtn">
                                        <button class="charge">
                                            <span>사용가능한포인트</span>
<%--                                            <div class="usePoint"></div>--%>
                                        </button>
                                        <span></span>
                                        <button class="remit" onclick="location.href='/transfer'">
                                            <span>무료송금</span>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
           </c:forEach>
<%--           <a class="next-1" onclick="plusSlides(1)">&#10095;</a>--%>
    </div>
    <div class="accountbox">
        <div class="accountbox1">
            <table id="example" class="display" style="width:100%">
                <select id="accountSelect">
                    <c:forEach var="account" items="${sessionScope.account}">
                        <option value="${account.account_num}">${account.account_bank} (${account.account_num})</option>
                    </c:forEach>
                </select>
                <button class="accountBtn" onclick="getTransactionsByMyAccount()">계좌별 조회</button>
                <thead>
                <tr>
                    <th>번호</th>
                    <th>모임계좌</th>
                    <th>입금자</th>
                    <th>거래유형</th>
                    <th>잔액</th>
                    <th>입금금액</th>
                    <th>입금날짜</th>
                    <th>입금내용</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>

        </div>
    </div>

<%--
            <table>
                <tr>
                    <td class="total"><span class="totaltext">전체</span></td>
                </tr>
                <tr>
                    <td class="date"><span class="datetext">8월6일(일)</span></td>
                </tr>
                <tr>
                    <td class="acntdetail"><span class="detailinfo">잠금화면</span></td>
                    <td class="detailwon">2원</td>
                </tr>
                <tr>
                    <td class="acntdetail">
                        <div class="detailinfo-1">
                            <span>15:52</span> | <span>무료적립</span>
                        </div>
                    </td>
                    <td>
                        <div class="detailinfo-1">649원
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="acntdetail"><span class="detailinfo">잠금화면</span></td>
                    <td class="detailwon">2원</td>
                </tr>
            </table>
       </div>--%>

</div>
<%@ include file="../include/footer.jsp" %>
</body>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
<script>
    $.ajax({
        url: "/selectPoint",
        type: "POST",
        success: function (data) {
            document.querySelector('.usePoint').textContent = Intl.NumberFormat('ko-KR').format(data) +" 원";
        },
        error: function (request, status, error) {

        }
    });
    var currentIteration = 0; // Initialize the counter
    var iterations = document.querySelectorAll('.hanacontainer-1'); // Get all iterations
    var totalIterations = iterations.length;

    function showIteration(index) {
        // Hide all iterations
        for (var i = 0; i < totalIterations; i++) {
            iterations[i].style.display = 'none';
        }

        // Show the specific iteration
        iterations[index].style.display = 'block';
    }

    function plusSlides(step) {
        currentIteration += step; // Increment or decrement the counter
        if (currentIteration >= totalIterations) {
            currentIteration = 0; // Reset to the beginning
        } else if (currentIteration < 0) {
            currentIteration = totalIterations - 1; // Set to the end
        }
        showIteration(currentIteration);
    }

    // Initialize by showing the first iteration
    showIteration(currentIteration);
    $(document).ready(function() {
        var table = $('#example').DataTable({
            autoWidth: false,
            language: { //언어 설정
                paginate: {
                    previous: "이전",
                    next: "다음"
                },
                zeroRecords: "검색 결과가 없습니다.",
                info: "전체 거래내역 _TOTAL_개 중에서 _START_ 번부터 _END_ 번까지의 결과",
                lengthMenu: "_MENU_ 행까지 조회"
            }
            , columnDefs: [
                {
                    targets: -1,
                    className: 'dt-body-center'
                },

            ],
            buttons: [ 'copy', 'excel', 'pdf', 'colvis' ],
            columns: [
                { data: 'account_tid' },
                { data: 'account_num' },
                { data: 'name' },
                { data: 'transaction_type' },
                {
                    data: 'amount',
                    render: function(data) {
                        return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
                    }
                },
                {
                    data: 'balance',
                    render: function(data) {
                        return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
                    }
                },
                { data: 'transaction_date' },
                { data: 'transaction_content' },
            ]
        });
        $.ajax({
            url: "/selectMyAccountStatement",
            type: "POST",
            success: function (data) {
                table.rows.add(data).draw();
            },
            error: function (request, status, error) {

            }
        });
    })

    function getTransactionsByMyAccount(){
        var selectedAccount = $("#accountSelect").val();
        $.ajax({
            url:'/getTransactionsByAccount',
            method: "POST",
            data : {accountNum : selectedAccount},
            success: function(response) {
                var table = $('#example').DataTable();
                table.clear().draw();
                table.rows.add(response).draw();
            },
            error: function(error) {
                console.error("Error occurred:", error);
            }
        });
    }
</script>
</html>
