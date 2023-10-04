$(document).ready(function () {
  var modalOpen = {
    display: "block",
    "z-index": "1000",
    opacity: 1,
  };

  var modalClose = {
    display: "none",
    "z-index": "-1",
    opacity: 0,
  };

  function fixedBody() {
    //$('body').css({ 'overflow': 'hidden', 'padding-right': '15px' });
  }

  function nonfixedBody() {
    //$('body').css({ 'overflow': 'auto', 'padding-right': '' });
  }

  // 삭제 alert
  var deleteBtn = $(".js-delete-btn");

  deleteBtn.on("click", function () {
    var deleteModal = $('[data-layer="modal-delete"]'),
      alertCloseBtn = $('[data-role="layerClose"]');

    deleteModal.css(modalOpen);
    fixedBody();

    alertCloseBtn.on("click", function () {
      deleteModal.css(modalClose);
      nonfixedBody();
    });
  });

  // 사용자페이지 - 분석템플릿 목록 연장신청 버튼(template/list.html)
  var extendBtn = $(".btn-extend");

  extendBtn.on("click", function () {
    let idx = $(this).siblings('input[type="hidden"]').val();
    $("form.frmExtend").find("input[name=TP_IDX]").val(idx);

    var deleteModal = $('[data-layer="modal-extend"]'),
      alertCloseBtn = $('[data-role="layerClose"]');

    deleteModal.css(modalOpen);
    fixedBody();

    alertCloseBtn.on("click", function () {
      deleteModal.css(modalClose);
      nonfixedBody();
    });
  });

  // 사용자페이지 - 분석템플릿 목록 Tool tip(template/list.html)

  var toolTipBtn = $("a.tooltip-body");

  toolTipBtn.on("click", function () {
    var toolTipModal = $('[data-layer="modal-decline'),
      modalCloseBtn = $('[data-role="layerClose"]');

    var text = $(this).find(".tooltip-text").text();
    toolTipModal.find(".ui-layer__alert-text span").text(text);
    console.log(text);

    toolTipModal.css(modalOpen);
    fixedBody();

    modalCloseBtn.on("click", function () {
      toolTipModal.css(modalClose);
      nonfixedBody();
    });
  });

  // 사용자페이지 - 분석템플릿 신청서 비밀번호 오류 alert(template/write.html)

  var inputPassword = $(".password-key-in"),
    confirmPassword = $(".password-confirm"),
    passwordConfirmBtn = $(".js-password-confirm");

  passwordConfirmBtn.on("click", function () {
    var userPassword = inputPassword.val(),
      userPasswordConfirm = confirmPassword.val(),
      passwordAlertModal = $('[data-layer="modal-password-alert"]'),
      passwordConfirmModal = $('[data-layer="modal-password-confirm"]'),
      applyModal = $('[data-layer="modal-apply"]'),
      alertCloseBtn = $('[data-role="layerClose"]'),
      modalCancleBtn = $(".modal-cancel-btn");

    // 비밀번호 오류
    if (userPassword !== userPasswordConfirm) {
      passwordConfirmModal.css(modalOpen);
      fixedBody();

      alertCloseBtn.on("click", function () {
        passwordConfirmModal.css(modalClose);
        nonfixedBody();
      });
    }
    //비밀번호 미입력
    else if (userPassword == "" || userPasswordConfirm == "") {
      passwordAlertModal.css(modalOpen);
      fixedBody();

      alertCloseBtn.on("click", function () {
        passwordAlertModal.css(modalClose);
        nonfixedBody();
      });
    } else {
      applyModal.css(modalOpen);
      nonfixedBody();
      alertCloseBtn.on("click", function () {
        $(this).attr("href", "detail.html");
      });
      modalCancleBtn.on("click", function () {
        applyModal.css(modalClose);
        nonfixedBody();
      });
    }
  });

  // 사용자페이지 - 분석템플릿 신청서 신청버튼 (template/write)
  var applyBtn = $(".js-apply-btn");

  applyBtn.on("click", function () {
    var applyModal = $('[data-layer="modal-apply"]'),
      alertCloseBtn = $('[data-role="layerClose"]');
    if ($("#TP_startDate").val().trim() == "") {
      alert("사용기간을 선택해주세요");
      $("#TP_startDate").focus();
      return false;
    } else if ($(".password-key-in").val().trim() == "") {
      alert("비밀번호를 입력해주세요");
      $(".password-key-in").focus();
      return false;
    } else if ($("#TP_applyReason").val().trim() == "") {
      alert("신청사유를 입력해주세요");
      $("#TP_applyReason").focus();
      return false;
    } else {
      applyModal.css(modalOpen);
      fixedBody();
    }

    alertCloseBtn.on("click", function () {
      applyModal.css(modalClose);
      nonfixedBody();
      //$(this).attr('href', 'detail.html');
    });
  });

  // 사용자페이지 - 배치 등록 신청서 신청버튼 (/batch/write)
  var applyBtnbatch = $(".batch-js-apply-btn");

  applyBtnbatch.on("click", function () {
    var applyModal = $('[data-layer="modal-apply"]'),
      alertCloseBtn = $('[data-role="layerClose"]');
    if ($(".score-input").val().trim() == "") {
      alert("Score를 입력해주세요");
      $(".score-input").focus();
      return false;
    } else if ($("#BC_ORIGINNAME").val().trim() == "") {
      alert("파일을 첨부해주세요");
      return false;
    } else if ($("#BC_APPLYREASON").val().trim() == "") {
      alert("배치 등록 모델 설명을 입력해주세요");
      $("#BC_APPLYREASON").focus();
      return false;
    } else {
      applyModal.css(modalOpen);
      fixedBody();
    }

    alertCloseBtn.on("click", function () {
      applyModal.css(modalClose);
      nonfixedBody();
      //$(this).attr('href', 'detail.html');
    });
  });

  // 사용자페이지 - 결과물 반출 신청서 신청버튼 (/takeOut/write)
  var applyBtntake = $(".take-js-apply-btn");

  applyBtntake.on("click", function () {
    var applyModal = $('[data-layer="modal-apply"]'),
      alertCloseBtn = $('[data-role="layerClose"]');
    if ($("#EP_REASONEXPORT").val().trim() == "") {
      alert("반출사유를 입력해주세요");
      $("#EP_REASONEXPORT").focus();
      return false;
    } else {
      applyModal.css(modalOpen);
      fixedBody();
    }

    alertCloseBtn.on("click", function () {
      applyModal.css(modalClose);
      nonfixedBody();
      //$(this).attr('href', 'detail.html');
    });
  });

  // 사용자페이지 - 원본 데이터 요청서 작성 (dataset / write.html) 일/월/연 데이터검색 버튼

  var searchDataBtnDay = $(".search-data-btn-day"),
    searchDataBtnMonth = $(".search-data-btn-month"),
    searchDataBtnYear = $(".search-data-btn-year"),
    searchDataModalDay = $('[data-layer="modal-data-search-day"]'),
    searchDataModalMonth = $('[data-layer="modal-data-search-month"]'),
    searchDataModalYear = $('[data-layer="modal-data-search-year"]'),
    closeBtn = $('[data-role="layerClose"]');

  searchDataBtnDay.on("click", function () {
    searchDataModalDay.css(modalOpen);
    fixedBody();

    closeBtn.on("click", function () {
      searchDataModalDay.css(modalClose);
      nonfixedBody();
    });
  });

  searchDataBtnMonth.on("click", function () {
    searchDataModalMonth.css(modalOpen);
    fixedBody();

    closeBtn.on("click", function () {
      searchDataModalMonth.css(modalClose);
      nonfixedBody();
    });
  });

  searchDataBtnYear.on("click", function () {
    searchDataModalYear.css(modalOpen);
    fixedBody();

    closeBtn.on("click", function () {
      searchDataModalYear.css(modalClose);
      nonfixedBody();
    });
  });

  // 사용자페이지 - 원본 데이터 요청서 작성 (dataset / write.html) 요청 버튼
  var askBtn = $(".js-ask-btn");

  askBtn.on("click", function () {
    var askModal = $('[data-layer="modal-ask"]'),
      alertCloseBtn = $('[data-role="layerClose"]');

    askModal.css(modalOpen);
    fixedBody();

    alertCloseBtn.on("click", function () {
      askModal.css(modalClose);
      nonfixedBody();
      $(this).attr("href", "detail.html");
    });
  });
}); //document END

/////////////////////////////////////////////////// data modal
function to_date(date_str) {
  var yyyyMMdd = String(date_str);
  var sYear = yyyyMMdd.substring(0, 4);
  var sMonth = yyyyMMdd.substring(4, 6);
  var sDate = yyyyMMdd.substring(6, 8);
  return new Date(Number(sYear), Number(sMonth) - 1, Number(sDate));
}

function get_date_str(date) {
  var sYear = date.getFullYear();
  var sMonth = date.getMonth() + 1;
  var sDate = date.getDate();

  sMonth = sMonth > 9 ? sMonth : "0" + sMonth;
  sDate = sDate > 9 ? sDate : "0" + sDate;
  return sYear + sMonth + sDate;
}

function to_MB(bytes) {
  bytes = (bytes / 1073741824).toFixed(2);
  return bytes;
}

$(".data-table-search").on("click", function () {
  // 입력값을 변수에 담고 문자열 형태로 변환
  let data = {
    text: $(".data-table-searchText").val(),
    //startDate: $("input[name=StartingDate]").val(),
    //endDate: $("input[name=EndingDate]").val(),
  };
  console.log(data);
  data = JSON.stringify(data);

  // content-type을 설정하고 데이터 송신
  var xhr = new XMLHttpRequest();
  // xhr.open("POST", "http://localhost:8081/dataset/searchTable");
  xhr.open("POST", "http://172.31.32.151:8081/dataset/searchTable");
  xhr.setRequestHeader("Content-type", "application/json");
  xhr.send(data);

  // 데이터 수신이 완료되면 표시
  xhr.addEventListener("load", function () {
    console.table(xhr.responseText);

    var jsonobj = JSON.parse(this.responseText);
    var rsLength = jsonobj.rsLength;
    var html = "";
    //Math.ceil((end.getTime()-start.getTime())/(1000*3600*24))

    if (rsLength > 0) {
      $.each(jsonobj, function (key, value) {
        for (i in value) {
          var TBL_KOR_NM = value[i].TBL_KOR_NM;
          var PRTT_MIN_VAL = value[i].PRTT_MIN_VAL;
          var PRTT_MAX_VAL = value[i].PRTT_MAX_VAL;
          var TBL_SIZE = value[i].TBL_SIZE;
          var PRTT_SE = value[i].PRTT_SE;
          var PRTT_QTY = value[i].PRTT_QTY;
          var PRTT_NM = value[i].PRTT_NM;
          var TBL_NM = value[i].TBL_NM;
          var CAL_START = "";
          var CAL_END = "";
          var selday = "";

          /* D-day */
          if (PRTT_SE == "일") {
            CAL_START = to_date(value[i].PRTT_MIN_VAL);
            CAL_END = to_date(value[i].PRTT_MAX_VAL);
            selday = Math.ceil((CAL_END.getTime() - CAL_START.getTime()) / (1000 * 3600 * 24));
          } else if (PRTT_SE == "월") {
            M_MIX = PRTT_MIN_VAL + "01";
            M_MAX = PRTT_MAX_VAL + "01";
            CAL_START = to_date(M_MIX);
            CAL_END = to_date(M_MAX);
            selday = Math.ceil((CAL_END.getTime() - CAL_START.getTime()) / (1000 * 3600 * 24 * 30));
          } else if (PRTT_SE == "년") {
            selday = PRTT_MAX_VAL - PRTT_MIN_VAL + 1;
          } else {
            selday = 1;
          }

          /* 용량 */
          if (PRTT_SE == "전체") {
            size = to_MB(TBL_SIZE);
          } else {
            size = to_MB((TBL_SIZE / PRTT_QTY) * selday);
          }

          if (size == "0.00") {
            size = 0.01;
          }

          console.log("PRTT_NM:PRTT_NM:PRTT_NM:PRTT_NM:PRTT_NM:은요 ??? " + PRTT_NM);
          console.log("TBL_NM:TBL_NM:TBL_NM:TBL_NM:TBL_NM:은요 ??? " + TBL_NM);
          html += "<tr>";
          html += "<td><div class='item-check item-check-single'>";
          html += "<input class='checkTBL" + i + "' type='radio' name='Checkdata' id='exCheckModal-" + i + "'>";
          html += "<label for='exCheckModal-" + i + "'><span class='check-ico'></span></label>";
          html += "</div></td>";
          html += "<td class='checkTBL" + i + "'>" + TBL_KOR_NM + "</td>";
          html += "<td class='checkTBL" + i + "'>" + PRTT_SE + "<input type='hidden' name='pQty' value='" + PRTT_QTY + "'><input type='hidden' name='tSize' value='" + TBL_SIZE + "'></td>";
          html += "<td class='checkTBL" + i + "'><span>" + PRTT_MIN_VAL + "</span></td>";
          html += "<td class='checkTBL" + i + "'><span>" + PRTT_MAX_VAL + "</span></td>";
          html += "<td class='checkTBL" + i + "'>" + size + "MB" + "</td>";
          html += "<input class='checkTBL" + i + "' type='hidden' name='PRTT_NM' value='" + PRTT_NM + "'>";
          html += "<input class='checkTBL" + i + "' type='hidden' name='TBL_NM' value='" + TBL_NM + "'>";
          html += "</tr>";
        }
      });
    } else if (rsLength == "0") {
      html += "<tr><td colspan='6'>검색결과가 없습니다</td></tr>";
    }

    $("#dataSearchResultModal").empty();
    $("#dataSearchResultModal").append(html);

    // dataset calendar ******************************
    $(".item-check-single input[type=radio]").on("click", function () {
      // 선택 된 라디오 버튼 행 단위 찾기
      let prtt_se_td = $(this).parent("div").parent("td").parent("tr").find("td:nth-child(3)");
      let prtt_se = $(this).parent("div").parent("td").parent("tr").find("td:nth-child(3)").text();
      //alert(prtt_se);

      let td_stDate = $(this).parent("div").parent("td").parent("tr").find("td:nth-child(4)");
      let td_edDate = $(this).parent("div").parent("td").parent("tr").find("td:nth-child(5)");

      let cal_min = td_stDate.find("span").text();
      let cal_max = td_edDate.find("span").text();

      let size_td = $(this).parent("div").parent("td").parent("tr").find("td:nth-child(6)");

      $("#dataSearchResultModal").find("span").show();

      if (prtt_se == "전체") {
        $(".data-cal").remove();
        $(".data-cal").remove();
        return;
      }

      // 기존 텍스트 안보이게
      td_stDate.find("span").hide();
      td_edDate.find("span").hide();

      //alert(prtt_se + " 날짜 수정 " + " 시작일 " + cal_min + " 종료일 " + cal_max);

      tSize = prtt_se_td.find("input[name=tSize]").val();
      pQty = prtt_se_td.find("input[name=pQty]").val();
      let gb_size_qty = Math.ceil(tSize / pQty);
      //alert("tSize: " + tSize + "  pQty: " + pQty + "   gb_size_qty: " + gb_size_qty)
      //alert("t size" + tSize + " pQty " + pQty + "  gb_size_qty  " + gb_size_qty);

      // 일 ***********************************************
      if (prtt_se == "일") {
        $(".data-cal").remove();
        $(".data-cal").remove();

        td_stDate.append('<div class="item-input item-input-date form-flexible data-cal"><input type="text" class="StartingDate" name="StartingDate" readonly></div>');
        td_edDate.append('<div class="item-input item-input-date form-flexible data-cal"><input type="text" class="EndingDate" name="EndingDate" readonly></div>');

        let minDT = cal_min.substring(0, 4) + "-" + cal_min.substring(4, 6) + "-" + cal_min.substring(6, 8);
        let maxDT = cal_max.substring(0, 4) + "-" + cal_max.substring(4, 6) + "-" + cal_max.substring(6, 8);

        //alert(minDT);

        $(".StartingDate").datepicker({
          dateFormat: "yymmdd",
          maxDate: new Date(maxDT),
          minDate: new Date(minDT),
          onSelect: function (date) {
            var TP_datepickerEnd = $(".EndingDate");
            var minDate = $(this).datepicker("getDate");

            //alert('mindate ' + date)

            td_stDate.find("span").text(date);
            td_edDate.find("span").text(date);

            // 용량 계산
            let selMax = td_edDate.find("span").text();
            let selMin = td_stDate.find("span").text();
            let selday_ = Math.ceil((to_date(selMax).getTime() - to_date(selMin).getTime()) / (1000 * 3600 * 24));
            //alert("selday_ :" + selday_);

            let size_ = to_MB(gb_size_qty * selday_);
            //alert("size_ :" + size_);

            // 용량 뿌리기
            if (size_ == "0.00") {
              size_td.text("0.01MB");
            } else {
              size_td.text(size_ + "MB");
            }

            TP_datepickerEnd.datepicker("setDate", new Date(minDate));
            TP_datepickerEnd.datepicker("option", "minDate", minDate);
          },
        });

        $(".StartingDate").datepicker("setDate", new Date(minDT));

        $(".EndingDate").datepicker({
          dateFormat: "yymmdd",
          maxDate: new Date(maxDT),
          minDate: new Date(minDT),
          onSelect: function (date) {
            //alert('mindate ' + date)
            td_edDate.find("span").text(date);

            // 용량 계산
            let selMax = td_edDate.find("span").text();
            let selMin = td_stDate.find("span").text();
            let selday_ = Math.ceil((to_date(selMax).getTime() - to_date(selMin).getTime()) / (1000 * 3600 * 24));
            //alert("selday_ :" + selday_);

            let size_ = to_MB(gb_size_qty * selday_);
            //alert("size_ :" + size_);

            // 용량 뿌리기
            if (size_ == "0.00") {
              size_td.text("0.01MB");
            } else {
              size_td.text(size_ + "MB");
            }
          },
        });

        $(".EndingDate").datepicker("setDate", new Date(maxDT));
      } else if (prtt_se == "월") {
        //alert('월');

        $(".data-cal").remove();
        $(".data-cal").remove();

        td_stDate.append('<div class="item-input input-date form-flexible data-cal monthStart"><input type="text" class="StartingDate" name="StartingDate" readonly></div>');
        td_edDate.append('<div class="item-input input-date form-flexible data-cal monthEnd"><input type="text" class="EndingDate" name="EndingDate" readonly></div>');

        let minDT = cal_min.substring(0, 4) + "-" + cal_min.substring(4, 6);
        let maxDT = cal_max.substring(0, 4) + "-" + cal_max.substring(4, 6);

        $(".monthStart").calendar("set date", new Date(minDT));
        $(".monthEnd").calendar("set date", new Date(maxDT));

        $(".monthStart").calendar({
          type: "month",
          minDate: new Date(minDT),
          maxDate: new Date(maxDT),
          formatter: {
            date: function (date, settings) {
              if (!date) return "";
              let month = date.getMonth() + 1 + "";
              if (month.length < 2) {
                month = "0" + month;
              }
              let year = date.getFullYear();
              return year + month;
            },
          },
          onShow: function () {
            // 좌표 구하기
            var popX = $(".monthStart").offset().left;
            $(".monthStart").find(".ui.popup").css({
              background: "red",
              color: "red",
              position: "fixed",
              bottom: "auto",
              left: popX,
              "margin-top": "30px",
            });
          },
          onChange: function (date, text, mode) {
            if (!date) return "";
            let month = date.getMonth() + 1 + "";
            if (month.length < 2) {
              month = "0" + month;
            }
            let year = date.getFullYear();
            date = year + month;
            //alert('mindate ' + date)
            td_stDate.find("span").text(date.substring(0, 6));
            td_edDate.find("span").text(date.substring(0, 6));

            // 용량 계산
            let selMax = td_edDate.find("span").text().substring(0, 6) + "01";
            let selMin = td_stDate.find("span").text().substring(0, 6) + "01";

            let selday_ = Math.ceil((to_date(selMax).getTime() - to_date(selMin).getTime()) / (1000 * 3600 * 24 * 30));
            //alert("selday_ :" + selday_);

            let size_ = to_MB(gb_size_qty * selday_);
            // alert("size_ :" + size_);

            // 용량 뿌리기
            if (size_ == "0.00") {
              size_td.text("0.01MB");
            } else {
              size_td.text(size_ + "MB");
            }

            let setStartdate = selMin.substring(0, 4) + "-" + selMin.substring(4, 6);
            $(".monthEnd").calendar("set date", new Date(setStartdate));
            $(".monthEnd").calendar("setting", {
              minDate: new Date(setStartdate),
            });
          },
        });

        $(".monthEnd").calendar({
          type: "month",
          minDate: new Date(minDT),
          maxDate: new Date(maxDT),
          formatter: {
            date: function (date, settings) {
              if (!date) return "";
              let month = date.getMonth() + 1 + "";
              if (month.length < 2) {
                month = "0" + month;
              }
              let year = date.getFullYear();
              return year + month;
            },
          },
          onShow: function () {
            var popX = $(".monthEnd").offset().left;
            $(".monthEnd").find(".ui.popup").css({
              background: "red",
              color: "red",
              position: "fixed",
              bottom: "auto",
              left: popX,
              "margin-top": "30px",
            });
          },
          onChange: function (date, text, mode) {
            if (!date) return "";
            let month = date.getMonth() + 1 + "";
            if (month.length < 2) {
              month = "0" + month;
            }
            let year = date.getFullYear();
            date = year + month;

            //alert('maxdate ' + date)
            td_edDate.find("span").text(date.substring(0, 6));

            // 용량 계산
            let selMax = td_edDate.find("span").text().substring(0, 6) + "01";
            let selMin = td_stDate.find("span").text().substring(0, 6) + "01";
            //alert(' selMax ' + selMax + ' selMin ' + selMin);

            let selday_ = Math.ceil((to_date(selMax).getTime() - to_date(selMin).getTime()) / (1000 * 3600 * 24 * 30));
            //alert("selday_ :" + selday_);

            // alert("gb_size_qty" + gb_size_qty)

            let size_ = to_MB(gb_size_qty * selday_);
            //alert("size_ :" + size_);
            if (size_ == "0.00") {
              size_td.text("0.01MB");
            } else {
              // 용량 뿌리기
              size_td.text(size_ + "MB");
            }
          },
        });
      } else if (prtt_se == "년") {
        //alert('년');

        $(".data-cal").remove();
        $(".data-cal").remove();

        td_stDate.append('<div class="item-input input-date form-flexible data-cal yearStart"><input type="text" class="StartingDate" name="StartingDate" readonly></div>');
        td_edDate.append('<div class="item-input input-date form-flexible data-cal yearEnd"><input type="text" class="EndingDate" name="EndingDate" readonly></div>');

        let minDT = cal_min.substring(0, 4);
        let maxDT = cal_max.substring(0, 4);

        $(".yearStart").calendar("set date", new Date(minDT));
        $(".yearEnd").calendar("set date", new Date(maxDT));

        $(".yearStart").calendar({
          type: "year",
          minDate: new Date(minDT),
          maxDate: new Date(maxDT),
          formatter: {
            date: function (date, settings) {
              if (!date) return "";
              let year = date.getFullYear();
              return year;
            },
          },
          onShow: function () {
            // 좌표 구하기
            var popX = $(".yearStart").offset().left;
            $(".yearStart").find(".ui.popup").css({
              background: "red",
              color: "red",
              position: "fixed",
              bottom: "auto",
              left: popX,
              "margin-top": "30px",
            });
          },
          onChange: function (date, text, mode) {
            let year = date.getFullYear();
            date = year;
            //alert('mindate ' + date)
            td_stDate.find("span").text(date);
            td_edDate.find("span").text(date);

            // 용량 계산
            let selMax = td_edDate.find("span").text().substring(0, 4);
            let selMin = td_stDate.find("span").text().substring(0, 4);
            //alert('selMin' + selMin + 'selMax' + selMax);
            let selday_ = selMax - selMin + 1;
            //alert("selday_ :" + selday_);

            let size_ = to_MB(gb_size_qty * selday_);
            //alert("size_ :" + size_);

            // 용량 뿌리기
            if (size_ == "0.00") {
              size_td.text("0.01MB");
            } else {
              size_td.text(size_ + "MB");
            }

            $(".yearEnd").calendar("set date", new Date(selMin));
            $(".yearEnd").calendar("setting", { minDate: new Date(selMin) });
          },
        });

        $(".yearEnd").calendar({
          type: "year",
          minDate: new Date(minDT),
          maxDate: new Date(maxDT),
          formatter: {
            date: function (date, settings) {
              if (!date) return "";
              let year = date.getFullYear();
              return year;
            },
          },
          onShow: function () {
            // 좌표 구하기
            var popX = $(".yearEnd").offset().left;
            $(".yearEnd").find(".ui.popup").css({
              background: "red",
              color: "red",
              position: "fixed",
              bottom: "auto",
              left: popX,
              "margin-top": "30px",
            });
          },
          onChange: function (date, text, mode) {
            let year = date.getFullYear();
            date = year;
            //alert('maxndate ' + date)
            td_edDate.find("span").text(date);

            // 용량 계산
            let selMax = td_edDate.find("span").text().substring(0, 4);
            let selMin = td_stDate.find("span").text().substring(0, 4);
            //alert('selMin' + selMin + 'selMax' + selMax);
            let selday_ = selMax - selMin + 1;
            //alert("selday_ :" + selday_);

            let size_ = to_MB(gb_size_qty * selday_);
            //alert("size_ :" + size_);

            // 용량 뿌리기
            if (size_ == "0.00") {
              size_td.text("0.01MB");
            } else {
              size_td.text(size_ + "MB");
            }
          },
        });
      }
    });
  });
});

$("#radioButton").click(function () {
  var radioVal = $('input[name="Checkdata"]:checked').attr("class");
  var checkItem = $("." + radioVal);

  console.log($('input[name="Checkdata"]:checked').attr("class")); //checkTBL[i]
  console.log("checkItem : " + checkItem);
  //console.log(checkItem.val);

  let data = {};
  $.each(checkItem, function (key, value) {
    console.log($(this));
    console.log("key : " + key);
    console.log("this.text : " + $(this).text());
    if (key == 1) {
      data.TBL_KOR_NM = $(this).text();
      console.log(data.TBL_KOR_NM);
    } else if (key == 3) {
      data.DT_STARTDATE = $(this).children("span").text();
      console.log(data.DT_STARTDATE);
    } else if (key == 4) {
      data.DT_ENDDATE = $(this).children("span").text();
      console.log(data.DT_ENDDATE);
    } else if (key == 5) {
      let size = $(this).text();
      size = $(this)
        .text()
        .substr(0, size.length - 2);
      data.DT_DATASIZE = size;
      console.log(data.DT_DATASIZE);
    } else if (key == 6) {
      let PRTT_NM = $(this).val();
      data.PRTT_NM = PRTT_NM;
    } else if (key == 7) {
      let TBL_NM = $(this).val();
      data.TBL_NM = TBL_NM;
    }
  });
  data = JSON.stringify(data);
  //console.log(data);

  var xhr = new XMLHttpRequest();
  // xhr.open("POST", "http://localhost:8081/dataset/searchData");
  xhr.open("POST", "http://172.31.32.151:8081/dataset/searchData");
  xhr.setRequestHeader("Content-type", "application/json");
  xhr.send(data);

  // 송신 완료 reload
  xhr.addEventListener("load", function () {
    location.reload();
  });
});
