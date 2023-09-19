<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
    .contentsBox{
        float: left;

    }
    .contentsText{
        font-weight: 600;
        font-size: 17px;
        color: #606060;
        float: left;
        padding-top: 7px;
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

    .group71{
        text-align: center;
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
    .pay1{
        width: 49%;
        height: 50px;
        padding: 15px;
        background: #FFFFFF;
        border: 1px solid #CDC9C9;
        border-radius: 10px;
        float: left;
    }
    .pay2{
        width: 49%;
        height: 50px;
        padding: 15px;
        background: #FFFFFF;
        border: 1px solid #CDC9C9;
        border-radius: 10px;
        margin-left: 0;
        float: right;
    }

    .gradio{
        padding: 15px;
        width: 10%;
    }
    .rec7{
        box-sizing: border-box;

        position: absolute;
        width: 141px;
        height: 50px;

        background: #FFFFFF;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 10px;

    }

    #signup{
        width: 69px;
        height: 30px;

        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 25px;
        line-height: 30px;
        text-align: center;

        color: #000000;
    }
    .idbox{
        padding: 10px;
        box-sizing: border-box;
        text-align: left;
        display: flex;

        font-family: 'Inter';
        font-style: normal;
        font-weight: 400;
        font-size: 15px;
        line-height: 18px;
        text-align: center;

        color: #000000;


    }

    #calculate{
        box-sizing: border-box;
        width: 800px;
        height: 50px;
        background: rgba(0, 152, 153, 0.73);
        color: #FFFFFF;
        border: 1px solid rgba(0, 152, 153, 0.73);
        border-radius: 10px;
        margin-top: 30px;
    }
    .box2 > button > span{
        width: 300.21px;
        height: 18px;
        font-family: 'Inter';
        font-style: normal;
        font-weight: 700;
        font-size: 15px;
        line-height: 18px;
        text-align: center;
        color: #008485;
    }

    .flexClass{
        display: inline-block;
        width: 800px;
    }
    .contentsText1{
        font-size: 14px;
    }
    .payBox{
        margin: 0 auto;
    }
    #selAccount{
        background-color: #f0f0f0;
    }
    .groupname{
        color: #008485;
        font-size: 20px;
        font-weight: 700;
    }


    .cont{
        padding: 15px 15px;
        overflow-y: auto;
    }
    .searchArea{
        background: #eef2fb;
        border: solid 1px #c5d4e9;
        border-radius: 5px;
        padding: 10px 15px;
        margin-bottom: 15px;
        clear: both;
    }
    .searchArea .searchIn p:first-child{
        padding-top: 0px;
    }
    .searchArea .searchIn p{
        padding-top: 7px;
    }
    .searchArea .searchIn span{
        margin-right: 40px;
    }

    .searchArea .searchIn span label{
        padding-right: 7px;
        color: #05090c;
        vertical-align: middle;
    }
    .bt{
        display: inline-block;
        padding: 1px 10px;
        border: solid 1px #94a2b9;
        background: #f9fafe;
        border-radius: 2px;
        box-shadow: inset 0 0 1px 1px #d7dfeb;
        color: #404144;
        font-size: 12px;
    }
    .stit{
        text-align: right;
        margin-bottom: 10px;
        position: relative;
    }
    .stit h3{
        float: left;
        color: #1d1d1d;
        margin-top: 8px;
        font-size: 14px;
        padding-left: 18px;
        font-weight: bold;
        background-size: 15px auto;
    }
    .stit .s_search em{
        margin-right: 10px;
    }
    .list{
        border-top: solid 1px #3758a7;
        border-bottom: solid 1px #8393b4;
    }
    .list table{
        width: 100%;
        border-collapse: collapse;
    }
</style>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        모임통장 계좌 개설<hr/></div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">모임개설</div>
            <div class="menuhr"><hr/></div>
            <a href="group">약관동의</a>
            <a href="openedAccount">모임개설</a>
            <a href="groupInvite">모임통장 초대</a>
        </div>
        <div class="contents-1">
            <div class="section-1">
                <div class="contentsBox">
                    <span class="contentsText">모임 개설</span><br>
                    <span class="contentsText1">맞춤정보입력</span>
                </div>
                <div class="stepper">
                    <div class="line"></div>
                    <div class="step">
                        <div class="circle">1</div>
                    </div>
                    <div class="step">
                        <div class="circle active">2</div>
                    </div>
                    <div class="step">
                        <div class="circle">3</div>
                    </div>
                </div>
            </div>
            <div class="cont sub01" style="height: 621px;">
                <div class="searchArea">
                    <div class="searchIn">
                        <p>
								<span>
									<label>조회계좌 (총 6 계좌)</label>
									<a href="#" class="bt" id="evt_sub01_bank_select">계좌선택</a>
									</span></p><div class="popLayer type02 bankSelectLayer hide">
                        <div class="bankTypeCont">

                            <div class="searchArea">
                                <div class="searchIn">
                                    <em class="mgR10">
                                        관리그룹  <select id="" style="width:150px;" class="disable"><option value="전체">-전체-</option></select>
                                    </em>
                                    <em class="mgR10">
                                        은행  <select id="" style="width:100px;" class="disable"><option value="전체">-전체-</option></select>
                                    </em>
                                    <em class="mgR10">
                                        <label class="disable"><input type="checkbox" class="disable" disabled="false"> 전체계좌</label>
                                    </em>
                                    <a href="#" class="bt btn_close">닫기</a>
                                </div>
                            </div>

                            <div class="tabArea">
                                <ul>
                                    <li class="current"><a href="#">자유입출예금</a></li>
                                    <li><a href="#">외화예금</a></li>
                                </ul>
                            </div>

                            <div class="tabCont">
                                <div class="list">
                                    <table>
                                        <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th><input type="checkbox" class="list_check all" value=""></th>
                                            <th>계좌종류</th>
                                            <th>은행</th>
                                            <th>계좌번호</th>
                                            <th>계좌별칭</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>
                                                <input type="checkbox" class="list_check">
                                            </td>
                                            <td>일반예금</td>
                                            <td>신한</td>
                                            <td class="left">000-000-000000</td>
                                            <td class="left">김신한계좌</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>
                                                <input type="checkbox" class="list_check">
                                            </td>
                                            <td>일반예금</td>
                                            <td>국민</td>
                                            <td class="left">000-000-000000</td>
                                            <td class="left">김신한계좌</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tabCont hide">
                                <div class="list">
                                    <table>
                                        <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th><input type="checkbox" class="list_check all" value=""></th>
                                            <th>계좌종류</th>
                                            <th>은행</th>
                                            <th>계좌번호</th>
                                            <th>계좌별칭</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>
                                                <input type="checkbox" class="list_check">
                                            </td>
                                            <td>외화예금</td>
                                            <td>기업</td>
                                            <td class="left">000-000-000000</td>
                                            <td class="left">김신한계좌</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>


                        <p></p>
                        <p>
								<span>
									<label>조회기간</label>
									<input type="text" style="width:70px" value="2023/8/19" id="search_date_start"> ~
									<input type="text" style="width:70px" value="2023/9/18" id="search_date_last"> <a href="#" class="cal"></a>
								</span>
                            <span class="terms">
									<label><input type="radio" name="s_date" id="day_before_0"> 당일</label>
									<label><input type="radio" name="s_date" id="day_before_1"> 전일</label>
									<label><input type="radio" name="s_date" id="day_before_3"> 3일 </label>
									<label><input type="radio" name="s_date" id="day_before_7"> 7일 </label>
									<label><input type="radio" name="s_date" id="day_before_15"> 15일</label>
									<label><input type="radio" name="s_date" id="day_before_30" checked="checked"> 1개월</label>
								</span>
                        </p>
                        <p>
								<span>
									<label>조회순서</label>
									<em class="terms">
										<label><input type="radio" name="s_sort" checked="checked" disabled="false"> 은행/계좌별</label>
										<label><input type="radio" name="s_sort" disabled="false"> 거래일자별</label>
									</em>

								</span>

                            <span>
									<label>상세검색조건</label>
									<select style="width:100px" id="evt_sub01_detail_sort">
											<option value="00">-전체-</option>
											<option value="01">계좌번호</option>
											<option value="02">입금액</option>
											<option value="03">출금액</option>
											<option value="04">거래 후 잔액</option>
											<option value="05">적요</option>
											<option value="06">내용</option>
											<option value="07">조회시간</option>
									</select>
									<em><em></em></em>

									<a href="#modal_loding_only" class="modal_open bt">DB조회</a>

									<label class="mgL10"><input type="checkbox" id="evt_sub01_bank_total_num"> 소계포함</label>
								</span>

                        </p>

                    </div>
                </div>

                <div class="">
                    <div class="stit">
                        <h3>은행계좌별 조회내역</h3>
                        <span class="s_search">
								<em>
								<label>거래구분 </label>
								<select style="width:65px" id="evt_sub01_ok_gubun">
										<option value="전체">-전체-</option>
										<option value="입금">입금</option>
										<option value="지급">지급</option>
								</select>
								</em>

								<em>
								<label>정렬순서 </label>
								<select style="width:100px" class="disable">
										<option value="">최근내역순</option>
										<option value="">과거내역순</option>
								</select>
								</em>

								<em>
								<label class="point"><input type="checkbox" id="evt_sub01_ok_time"> 거래일시보기</label>
								</em>
							</span>

                        <span class="bts">
								<a href="#" class="disable">크게보기</a>
								<a href="#" class="disable">조회결과</a>
                            <!--<a href="#" class="disable">전표발행</a>
                            <a href="#" class="disable">전표발행취소</a>-->
							</span>
                    </div>

                    <div class="list">
                        <table>
                            <colgroup>
                                <col width="30px">
                                <col width="45px">
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th><span>NO</span></th>
                                <th><span>은행</span></th>
                                <th><span>계좌번호</span></th>
                                <th><span>계좌별칭</span></th>
                                <th><span>통화</span></th>
                                <th><span>거래일자</span></th>
                                <th><span>적요</span></th>
                                <th><span>입금</span></th>
                                <th><span>지급</span></th>
                                <th><span>잔액</span></th>
                                <th><span>내용</span></th>
                                <th><span>거래점</span></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="type01 bank_type_01">
                                <td class="center">1</td>
                                <td rowspan="2"><span class="bank">신한</span></td>
                                <td rowspan="2"><span>000-000-000000</span></td>
                                <td rowspan="2" class="left"><span>김신한계좌</span></td>
                                <td><span>KRW</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>CD입금</span></td>
                                <td class="right"><span class="number total">560,000</span></td>
                                <td class="right"><span class="number able">0</span></td>
                                <td class="right"><span class="number">10,083,500</span></td>
                                <td class="left"><span>관계사자금집금</span></td>
                                <td class="left"><span>광교MC</span></td>
                            </tr>
                            <tr class="type01 bank_type_01">
                                <td class="center">2</td>
                                <td><span>KRW</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>BZ뱅크</span></td>
                                <td class="right"><span class="number total">0</span></td>
                                <td class="right"><span class="number able">130,000</span></td>
                                <td class="right"><span class="number">9,523,500</span></td>
                                <td class="left"><span>관계사자금집금</span></td>
                                <td class="left"><span>광교MC</span></td>
                            </tr>
                            <tr class="type02 hide bank_type_01">
                                <td class="center">1</td>
                                <td><span class="bank">신한</span></td>
                                <td><span>000-000-000000</span></td>
                                <td class="left"><span>김신한계좌</span></td>
                                <td><span>KRW</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>CD입금</span></td>
                                <td class="right"><span class="number total">560,000</span></td>
                                <td class="right"><span class="number able">0</span></td>
                                <td class="right"><span class="number">12,239,500</span></td>
                                <td class="left"><span>관계사자금집금</span></td>
                                <td class="left"><span>광교MC</span></td>
                            </tr>
                            <tr class="type02 hide bank_type_01">
                                <td class="center">2</td>
                                <td><span class="bank">신한</span></td>
                                <td><span>000-000-000000</span></td>
                                <td class="left"><span>김신한계좌</span></td>
                                <td><span>KRW</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>BZ뱅크</span></td>
                                <td class="right"><span class="number total">0</span></td>
                                <td class="right"><span class="number able">130,000</span></td>
                                <td class="right"><span class="number">9,523,500</span></td>
                                <td class="left"><span>관계사자금집금</span></td>
                                <td class="left"><span>광교MC</span></td>
                            </tr>
                            <tr class="tr_total bank_type_01">
                                <td class="center"></td>
                                <td class="center"></td>
                                <td class="center"></td>
                                <td class="center"></td>
                                <td><span>KRW</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>[소계]</span></td>
                                <td class="right"><span class="number total">560,000</span></td>
                                <td class="right"><span class="number able">130,000</span></td>
                                <td class="right"><span class="number">10,083,500</span></td>
                                <td class="left"><span></span></td>
                                <td class="left"><span></span></td>
                            </tr>
                            <tr class="bank_type_02">
                                <td class="center">3</td>
                                <td rowspan="2"><span class="bank">국민</span></td>
                                <td rowspan="2"><span>000-000-000000</span></td>
                                <td rowspan="2" class="left"><span>김신한계좌</span></td>
                                <td><span>KRW</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>CD입금</span></td>
                                <td class="right"><span class="number total">800,000</span></td>
                                <td class="right"><span class="number able">0</span></td>
                                <td class="right"><span class="number">13,039,500</span></td>
                                <td class="left"><span></span></td>
                                <td class="left"><span>광교MC</span></td>
                            </tr>
                            <tr class="bank_type_02">
                                <td class="center">4</td>
                                <td><span>KRW</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>BZ뱅크</span></td>
                                <td class="right"><span class="number total">1,700,000</span></td>
                                <td class="right"><span class="number able">0</span></td>
                                <td class="right"><span class="number">12,239,500</span></td>
                                <td class="left"><span></span></td>
                                <td class="left"><span>광교MC</span></td>
                            </tr>
                            <tr class="tr_total bank_type_02">
                                <td class="center"></td>
                                <td class="center"></td>
                                <td class="center"></td>
                                <td class="center"></td>
                                <td><span>KRW</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>[소계]</span></td>
                                <td class="right"><span class="number total">2,500,000</span></td>
                                <td class="right"><span class="number able">0</span></td>
                                <td class="right"><span class="number">13,039,500</span></td>
                                <td class="left"><span></span></td>
                                <td class="left"><span></span></td>
                            </tr>
                            <tr class="bank_type_03">
                                <td class="center">5</td>
                                <td rowspan="2"><span class="bank">기업</span></td>
                                <td rowspan="2"><span>000-000-000000</span></td>
                                <td rowspan="2" class="left"><span>김신한계좌</span></td>
                                <td><span>USD</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>CD입금</span></td>
                                <td class="right"><span class=" total">100.00</span></td>
                                <td class="right"><span class=" able">0.00</span></td>
                                <td class="right"><span class="">950.00</span></td>
                                <td class="left"><span></span></td>
                                <td class="left"><span>광교MC</span></td>
                            </tr>
                            <tr class="bank_type_03">
                                <td class="center">6</td>
                                <td><span>USD</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>BZ뱅크</span></td>
                                <td class="right"><span class=" total">100.00</span></td>
                                <td class="right"><span class=" able">0.00</span></td>
                                <td class="right"><span class="">850.00</span></td>
                                <td class="left"><span></span></td>
                                <td class="left"><span>광교MC</span></td>
                            </tr>
                            <tr class="tr_total bank_type_03">
                                <td class="center"></td>
                                <td class="center"></td>
                                <td class="center"></td>
                                <td class="center"></td>
                                <td><span>USD</span></td>
                                <td><span class="date_info">2016/01/08 <em class="time">09:53:43</em></span></td>
                                <td class="left"><span>[소계]</span></td>
                                <td class="right"><span class=" total">200.00</span></td>
                                <td class="right"><span class=" able">0.00</span></td>
                                <td class="right"><span class="">950.00</span></td>
                                <td class="left"><span></span></td>
                                <td class="left"><span></span></td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="2" class="center">합계</td>
                                <td><span></span></td>
                                <td><span></span></td>
                                <td><span>KRW</span></td>
                                <td><span></span></td>
                                <td><span class="total_num">4건</span></td>
                                <td class="right"><span class="number ">3,060,000</span></td>
                                <td class="right"><span class="number ">130,000</span></td>
                                <td class="right"><span class="number ">23,123,000</span></td>
                                <td><span></span></td>
                                <td><span></span></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="center">합계</td>
                                <td><span></span></td>
                                <td><span></span></td>
                                <td><span>USD</span></td>
                                <td><span></span></td>
                                <td><span class="total_num">2건</span></td>
                                <td class="right"><span class="">200.00</span></td>
                                <td class="right"><span class=" ">0.00</span></td>
                                <td class="right"><span class="">950.00</span></td>
                                <td><span></span></td>
                                <td><span></span></td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <!--tabCont//-->


            </div>

        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</div>
</body>
<script>
    window.onload = function() {
        $.ajax({
            url:'/selectVirtureAccountNumber',
            method: "POST",
            success: function(response) {
                $('#group_account').val(response);
            }
        })
    }
    function submitForm() {
        // serialize 함수를 사용하여 문자열로 직렬화
        var formData = $("#groupForm").serialize();

        // 폼 데이터를 파싱하여 JSON 객체로 변환
        var formDataObj = {};
        formData.split('&').forEach(function(item) {
            var pair = item.split('=');
            formDataObj[pair[0]] = decodeURIComponent(pair[1] || '');
        });

        $.ajax({
            url: "/insertGroupDetail", // 실제 서버 URL로 변경
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(formDataObj), // JSON 형식으로 데이터 전송
            success: function(response) {
                alert(response);
                location.href='groupInvite'
            },
            error: function(error) {
                console.error("에러 발생:", error);
            }
        });
    }
</script>

</html>