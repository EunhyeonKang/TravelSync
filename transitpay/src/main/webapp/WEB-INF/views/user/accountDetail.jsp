<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        bottom: 50%;
        left: 100px;
        color: #949494;
        cursor: pointer;
    }
    .next{
        position: absolute;
        font-size: 100px;
        bottom: 50%;
        right: 0px;
        color: #949494;
        cursor: pointer;
    }

    /* Fold table */
    table.fold-table {
        width: 100%;
        background: white;
        color: #555;
    }

    table.fold-table > tbody > tr.view {
        color: #494949;
        background: rgb(233 226 226 / 73%);
        text-align: center;
        font-weight: 700;
    }

    table.fold-table td,
    table.fold-table th {
        cursor: pointer;
    }

    table.fold-table td:first-child,
    table.fold-table th:first-child {
        position: relative;
        padding-left: 20px;
    }

    table.fold-table td:first-child:before,
    table.fold-table th:first-child:before {
        position: absolute;
        top: 50%;
        left: 5px;
        width: 9px;
        height: 16px;
        margin-top: -8px;
        font-size: 20px;
        content: "^";
        transition: all .3s ease;
        font-weight: 900;
        color: white;
    }

    table.fold-table tr:nth-child(4n-1) {
        background: #eee;
    }

    table.fold-table tr:hover {
        background: #ddd;
    }

    table.fold-table tr.open {
        background: rgba(0, 152, 153, 0.73);
        color: white;
    }

    table.fold-table tr.open td:first-child:before,
    table.fold-table tr.open th:first-child:before {
        transform: rotate(-180deg);
        color: white;
    }

    /* Fold segment */
    table.fold-table > tbody > tr.fold {
        display: none;
    }

    table.fold-table > tbody > tr.fold.open {
        display: table-row;
    }

    /* Fold content */
    .fold-content {
        padding: .5em;
    }

    .fold-content h3 {
        margin-top: 0;
    }

    .fold-content > table {
        background: white;
        color: #555;
        box-shadow: 0 2px 8px 0 rgba(0, 0, 0, .2);
    }

    .fold-content > table > tbody > tr:nth-child(even) {
        background: #eee;
    }

    .fold-content > table > tbody > tr:hover {
        background: #ddd;
    }

    /* Media Queries */
    .visible-small {
        display: none;
    }

    .visible-big {
        display: block;
    }

    @media (max-width: 700px) {

        table th,
        table td {
            padding: 1em .2em;
        }

        table th {
            vertical-align: bottom;
            padding-bottom: 0;
        }

        table.small-friendly > thead {
            display: none;
        }

        table.small-friendly > tbody > tr > td,
        table.small-friendly > tbody > tr > th {
            position: relative;
            padding: 0;
            padding-left: 50%;
            display: block;
            vertical-align: top;
            border-bottom: 1px solid rgba(0, 0, 0, .05);
        }

        table.small-friendly > tbody > tr > td:before,
        table.small-friendly > tbody > tr > th:before {
            position: absolute;
            top: 0;
            left: .5em;
            max-width: 50%;
            content: attr(data-th)": ";
            display: block;
            font-weight: bold;
        }

        table.small-friendly > tbody > tr > td:first-child {
            margin-top: 1em;
        }

        table.small-friendly > tbody > tr > td:last-child {
            margin-bottom: 1em;
            border: 0;
        }

        .visible-small {
            display: block;
        }

        .visible-big {
            display: none;
        }
    }
    label {
        display: block;
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
</style>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
       <div class="mainBox1">
           <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
           <c:forEach var="account" items="${sessionScope.account}">
                <div class="hanacontainer-1">
                    <table>
                        <tr>
                            <td>
                                <div class="hanatitle">${account.account_bank}</div>
                                <div class="connectact"><a href="mypage">연결계좌관리</a></div>
                                <div class="hanabutton">
                                    <button class="atomic" onclick="location.href='mypage'">
                                        <span>자동충전</span>
                                    </button>
                                </div>

                            </td>

                        </tr>
                        <tr>
                            <td class="hanamoney"> <span>${account.balance}</span><span>원</span></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="hanamoneybox">
                                    <div class="hanabtn">
                                        <button class="charge">
                                            <span>자동충전</span>
                                        </button>
                                        <span></span>
                                        <button class="remit">
                                            <span>무료송금</span>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
           </c:forEach>
           <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
        <div class="accountinfo">
            <table class="fold-table">
                <div class="section-2">
                    <div>날짜별 회비 내역</div>
                    <div>회원별 회비 내역</div>
                </div>
                <thead>
                <tr>
                    <th>거래내용</th>
                    <th>날짜</th>
                    <th>총금액</th>
                    <th><span class="visible-small" title="Premiumns">Prem.</span><span class="visible-big">입금</span></th>
                    <th><span class="visible-small" title="Strategy A">Str. A</span><span class="visible-big">출금</span></th>
                    <th><span class="visible-small" title="Strategy B">Str. B</span><span class="visible-big">금액</span></th>
                    <th><span class="visible-small" title="Strategy C">Str. C</span><span class="visible-big">정상여부</span></th>
                </tr>
                </thead>
                <tbody>
                <tr class="view">
                    <td>회비(서태지와아이들)</td>
                    <td class="pcs">2023-09-18</td>
                    <td class="cur">357,000</td>
                    <td>-</td>
                    <td class="per">-</td>
                    <td class="per">35,000</td>
                    <td class="per">Y</td>
                </tr>
                <tr class="fold">
                    <td colspan="7">
                        <div class="fold-content">
                            <h3>회비(트래블싱크)</h3>
                            <p>거래내역 조회</p>
                            <table class="small-friendly">
                                <thead>
                                <tr>
                                    <th><span class="visible-small" title="Company name">Comp. name</span><span class="visible-big">카테고리</span></th>
                                    <th><span class="visible-small" title="Customer number">Cust.#</span><span class="visible-big">메모</span></th>
                                    <th><span class="visible-small" title="Customer name">Cust. name</span><span class="visible-big">입금처</span></th>
                                    <th><span class="visible-small" title="Insurance number">Ins.#</span><span class="visible-big">출금처</span></th>
                                    <th><span class="visible-small" title="Strategy">Str.</span><span class="visible-big">이체일시</span></th>
                                    <th><span class="visible-small" title="Current">Cur.</span><span class="visible-big">받는 분 통장표시</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td data-th="Company name">이체</td>
                                    <td data-th="Customer no">메모</td>
                                    <td data-th="Customer name">내신한 110498076166</td>
                                    <td data-th="Insurance no">내국민 23270104530981</td>
                                    <td data-th="Strategy">2023년 9월 18일 15:49</td>
                                    <td data-th="Current"><span class="cur">강은현</span></td>
                                </tr>
                                <tr>
                                    <td data-th="Company name">이체</td>
                                    <td data-th="Customer no">메모</td>
                                    <td data-th="Customer name">내신한 110498076166</td>
                                    <td data-th="Insurance no">내국민 23270104530981</td>
                                    <td data-th="Strategy">2023년 9월 18일 15:49</td>
                                    <td data-th="Current"><span class="cur">강은현</span></td>
                                </tr>
                                <tr>
                                    <td data-th="Company name">이체</td>
                                    <td data-th="Customer no">메모</td>
                                    <td data-th="Customer name">내신한 110498076166</td>
                                    <td data-th="Insurance no">내국민 23270104530981</td>
                                    <td data-th="Strategy">2023년 9월 18일 15:49</td>
                                    <td data-th="Current"><span class="cur">강은현</span></td>
                                </tr>
                                <tr>
                                    <td data-th="Company name">이체</td>
                                    <td data-th="Customer no">메모</td>
                                    <td data-th="Customer name">내신한 110498076166</td>
                                    <td data-th="Insurance no">내국민 23270104530981</td>
                                    <td data-th="Strategy">2023년 9월 18일 15:49</td>
                                    <td data-th="Current"><span class="cur">강은현</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>

                <tr class="view">
                    <td>회비(서태지와아이들)</td>
                    <td class="pcs">2023-09-18</td>
                    <td class="cur">357,000</td>
                    <td>-</td>
                    <td class="per">-</td>
                    <td class="per">35,000</td>
                    <td class="per">Y</td>
                </tr>
                <tr class="fold">
                    <td colspan="7">
                        <div class="fold-content">
                            <h3>회비(트래블싱크)</h3>
                            <p>거래내역 조회</p>
                            <table class="small-friendly">
                                <thead>
                                <tr>
                                    <th><span class="visible-small" title="Company name">Comp. name</span><span class="visible-big">카테고리</span></th>
                                    <th><span class="visible-small" title="Customer number">Cust.#</span><span class="visible-big">메모</span></th>
                                    <th><span class="visible-small" title="Customer name">Cust. name</span><span class="visible-big">입금처</span></th>
                                    <th><span class="visible-small" title="Insurance number">Ins.#</span><span class="visible-big">출금처</span></th>
                                    <th><span class="visible-small" title="Strategy">Str.</span><span class="visible-big">이체일시</span></th>
                                    <th><span class="visible-small" title="Current">Cur.</span><span class="visible-big">받는 분 통장표시</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td data-th="Company name">이체</td>
                                    <td data-th="Customer no">메모</td>
                                    <td data-th="Customer name">내신한 110498076166</td>
                                    <td data-th="Insurance no">내국민 23270104530981</td>
                                    <td data-th="Strategy">2023년 9월 18일 15:49</td>
                                    <td data-th="Current"><span class="cur">강은현</span></td>
                                </tr>
                                <tr>
                                    <td data-th="Company name">이체</td>
                                    <td data-th="Customer no">메모</td>
                                    <td data-th="Customer name">내신한 110498076166</td>
                                    <td data-th="Insurance no">내국민 23270104530981</td>
                                    <td data-th="Strategy">2023년 9월 18일 15:49</td>
                                    <td data-th="Current"><span class="cur">강은현</span></td>
                                </tr>
                                <tr>
                                    <td data-th="Company name">이체</td>
                                    <td data-th="Customer no">메모</td>
                                    <td data-th="Customer name">내신한 110498076166</td>
                                    <td data-th="Insurance no">내국민 23270104530981</td>
                                    <td data-th="Strategy">2023년 9월 18일 15:49</td>
                                    <td data-th="Current"><span class="cur">강은현</span></td>
                                </tr>
                                <tr>
                                    <td data-th="Company name">이체</td>
                                    <td data-th="Customer no">메모</td>
                                    <td data-th="Customer name">내신한 110498076166</td>
                                    <td data-th="Insurance no">내국민 23270104530981</td>
                                    <td data-th="Strategy">2023년 9월 18일 15:49</td>
                                    <td data-th="Current"><span class="cur">강은현</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>

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
                    <td class="date"><span class="datetext">8월7일(월)</span></td>
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
            </table>
        </div>

</div>
<%@ include file="../include/footer.jsp" %>
</body>
<script>
    $(function(){
        $(".fold-table tr.view").on("click", function(){
            $(this).toggleClass("open").next(".fold").toggleClass("open");
            // if($(this).hasClass("open")) {
            //     $(this).removeClass("open").next(".fold").removeClass("open");
            // } else {
            //     $(".fold-table tr.view").removeClass("open").next(".fold").removeClass("open");
            //     $(this).addClass("open").next(".fold").addClass("open");
            // }
        });
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

</script>
</html>
