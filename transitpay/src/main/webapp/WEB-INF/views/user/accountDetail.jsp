<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/hanamoney.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>

</style>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
       <div class="mainBox1">
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
                                            <div class="usePoint"></div>
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
    var currentIteration = 0;
    var iterations = document.querySelectorAll('.hanacontainer-1');
    var totalIterations = iterations.length;

    function showIteration(index) {
        // Hide all iterations
        for (var i = 0; i < totalIterations; i++) {
            iterations[i].style.display = 'none';
        }


        iterations[index].style.display = 'block';
    }

    function plusSlides(step) {
        currentIteration += step;
        if (currentIteration >= totalIterations) {
            currentIteration = 0;
        } else if (currentIteration < 0) {
            currentIteration = totalIterations - 1;
        }
        showIteration(currentIteration);
    }


    showIteration(currentIteration);
    $(document).ready(function() {
        var table = $('#example').DataTable({
            autoWidth: false,
            language: {
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
