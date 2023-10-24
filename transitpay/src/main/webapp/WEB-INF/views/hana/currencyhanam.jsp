<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/hanamoney.css">
    <script defer src="../../resources/js/index.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="../../../resources/css/account.css">
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="mainBox1">
        <div class="hanacontainer-1">
            <table>
                <tr>
                    <td>
                        <div class="hanatitle">미국USD</div>
                        <div class="connectact"><a>연결계좌관리</a></div>
                        <div class="hanabutton">
                            <button class="atomic">
                                <span>자동충전</span>
                            </button>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td class="hanamoney"> <span>1.00</span><span class="hnmwon">USD1 = 1,308원</span></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <div class="hanamoneybox">
                            <div class="hanabtn">
                                <button class="charge">
                                    <span>환급</span>
                                </button>
                                <span></span>
                                <button class="remit">
                                    <span>무료환전</span>
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="accountinfo">
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
</html>
