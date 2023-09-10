<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/hanamoney.css">
    <script defer src="../../resources/js/index.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
        body{
            margin: 0;
            padding: 0;
        }
        .mainBox1 {
            width: 100%;
            height: 432px;
            display: grid;
            background: linear-gradient(180deg, rgba(255, 184, 0, 0.37) 0%, rgba(0, 152, 153, 0.222) 100%);
        }
        .hanacontainer-1{
            text-align: center;
            height: 293px;
            margin: 69px auto;
            background: rgba(255, 251, 251, 0.68);
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 15px;
        }
        .hanacontainer-1 table {
            padding: 40px;
        }
        .hanatitle{
            font-weight: 700;
            font-size: 30px;
            display: inline-grid;
            align-items: center;
            text-align: center;
            color: #616161;
            float: left;
        }
        .connectact{
            font-weight: 700;
            font-size: 20px;
            display: inline-grid;
            align-items: center;
            text-align: center;
            text-decoration-line: underline;
            float: left;
            color: #616161;
        }
        .atomic{
            width: 107px;
            height: 47px;
            background: #FFFFFF;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 40px;
            border: 1px solid #ffffff;
        }
        .atomic span{
            font-weight: 700;
            font-size: 20px;
            align-items: center;
            text-align: center;
            color: #008485;
        }
        .hanamoney{
            font-weight: 700;
            font-size: 40px;
            align-items: center;
            text-align: center;
            display: flex;
            right: 10px;
            margin: 20px;
        }
        .hanamoneybox{
            width: 662px;
            height: 59px;
            background: rgba(255, 255, 255, 0.42);
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 30px;
        }
        .hanabutton{
            display: inline-grid;
            float: right;
        }
        .charge{
            width: 200px;
            height: 37px;
            border: 1px solid #FFFBFB;
            background-color: #FFFBFB;
            margin: 10px;
        }
        .charge span{
            font-weight: 700;
            font-size: 30px;
            align-items: center;
            text-align: center;
            color: #393333;
        }
        .remit{
            width: 200px;
            height: 37px;
            border: 1px solid #FFFBFB;
            background-color: #FFFBFB;
            margin: 10px;
        }
        .remit span{
            font-weight: 700;
            font-size: 30px;
            align-items: center;
            text-align: center;
            color: #008485;
        }
        .hanabtn > span{
            border: 1.5px solid #B3B3B3;
            margin: 50px;
        }
        .accountinfo{
            width: 745px;
            /*height: 400px;*/
            background: #F8F8F8;
            display: grid;
            margin: 0 auto;
        }

        .accountinfo table tr .total{
            height: 10px;
            padding: 20px 0px 4px 30px;
        }
        .totaltext{
            font-weight: 700;
            font-size: 15px;
            align-items: center;
            text-align: center;
            color: #000000;
        }
        .accountinfo table tr .date{
            height: 10px;
            padding: 10px 0px 10px 30px;
        }
        .datetext{
            font-weight: 700;
            font-size: 15px;
            align-items: center;
            text-align: center;
            color: #616161;
        }
        .acntdetail{
            padding-left:30px;
            float: left;
        }
        .detailinfo{
            font-weight: 700;
            font-size: 15px;
            align-items: center;
            text-align: center;
            color: #000000;
        }
        .detailinfo-1{
            font-weight: 700;
            font-size: 12px;
            color: #616161;
            float: right;
            padding-right: 30px;
        }
        .detailwon{
            font-weight: 700;
            font-size: 15px;
            color: #008485;
            text-align: right;
            padding-right: 30px;
        }
        .hnmwon{
            font-weight: 700;
            font-size: 25px;
            align-items: center;
            text-align: center;
            color: #616161;
        }
    </style>
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
