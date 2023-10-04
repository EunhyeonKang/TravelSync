/*$(document).ready(function () {
  var modalOpen = {
      'display': 'block',
      'z-index': '1000',
      'opacity': 1
  }

  var modalClose = {
      'display': 'none',
      'z-index': '-1',
      'opacity': 0
  }

  function fixedBody() {
      //$('body').css({ 'overflow': 'hidden', 'padding-right': '15px' });
  }

  function nonfixedBody() {
      //$('body').css({ 'overflow': 'auto', 'padding-right': '' });
  }
  
  // 관리자페이지 - 분석템플릿 목록 (admin/template/list.html)
  
  //관리 버튼 클릭
  var adminBtn = $(`.template-admin`);
  
  adminBtn.on('click',  function () {
        var templateAdminModal = $('[data-layer="modal-template-admin"]'),
        closeBtn = $('[data-role="layerClose"]');

        let tp_userid = $(this).siblings(`input[name=tp_userid]`).val(); // port check
        let tpidx = $(this).siblings(`input[name=tp_idx]`).val();
        let tpstatus = $(this).siblings(`input[name=tp_status]`).val();
        let tpenddate = $(this).siblings(`input[name=tp_enddate]`).val();
        $(`form.frm_TP`).find(`input[name=idx]`).val(tpidx);
        $(`form.frm_TP`).find(`input[name=userid]`).val(tp_userid);
        $(`form.frm_TP`).find(`input[name=status]`).val(tpstatus);
        $(`form.frm_TP`).find(`input[name=enddate]`).val(tpenddate);
        $(`#exRadio1-1`).val(`승인`);
        $(`#exRadio1-2`).val(`반려`);
        $(`#exRadio1-3`).val(`관리자 만료`);
        $(`.modal-alert-text.extend`).text(`승인하시겠습니까?`);

        //console.log('상태: ' + tpstatus);
        //console.log('user id: ' + tp_userid);
        //console.log('enddate: ' + tpenddate);
    
        //alert(tp_userid);

        if(tpstatus == '대기') {
            // 승인, 반려만 선택 가능
            $("input#exRadio1-3").attr("disabled", true); // 만료
        } else if(tpstatus == '승인'){
            // 만료만 선택 가능 
            $("input#exRadio1-1").attr("disabled", true); // 승인
            $("input#exRadio1-2").attr("disabled", true); // 반려
        } else if(tpstatus == '연장대기'){
            // 연장승인, 연장만료만 선택 가능
            $("input#exRadio1-3").attr("disabled", true); // 연장만료

        } else if(tpstatus == '연장승인'){
            // 만료만 선택 가능
            $("input#exRadio1-1").attr("disabled", true); // 연장승인
            $("input#exRadio1-2").attr("disabled", true); // 연장반려
        } else if (tpstatus == '반려'){
            //alert("반려");
            return;
        } else if (tpstatus == '만료' || tpstatus == '관리자 만료'){
            //alert("만료");
            return;
        }

        closeBtn.on('click', function () {
            templateAdminModal.css(modalClose);
            templateAdminModal.find('.modal-alert > div').removeClass('is-selected');
            $("input#exRadio1-1").removeAttr("disabled");
            $("input#exRadio1-2").removeAttr("disabled");
            $("input#exRadio1-3").removeAttr("disabled");
            $('.item-radio input').prop('checked', false);
            nonfixedBody();
        });


        $.ajax({
            url:"/admin/template/portCheck",
            type:"post",
            dataType: "json",      
            data:{'userid':tp_userid},
            error : function(error) {
                //alert("Error!" );
                console.log(error)
            },
            success : function(data) {

                //alert("success!" + data.data);
                $('form.frm_EP').find('input[name=portCheck]').val(data.data);
                if(data.data == 1) { // 이미 포트가 할당 된 사용자
                    templateAdminModal.css(modalOpen);
                    fixedBody();
                    
                    if(tpstatus == '연장대기' || tpstatus == '만료' || tpstatus == '반려' || tpstatus == '연장만료' || tpstatus == '반려'){
                        //alert('연장대기');
                        $('button.portCheck').off('click').on('click', function(){
                            $('form.frm_TP').submit();                          
                        });

                    }else {
                        $('button.portCheck').off('click').on('click', function(){
                            alert("이미 포트가 할당 된 사용자입니다");     

                            templateAdminModal.css(modalClose);
                            templateAdminModal.find('.modal-alert > div').removeClass('is-selected');
                            $("input#exRadio1-1").removeAttr("disabled");
                            $("input#exRadio1-2").removeAttr("disabled");
                            $("input#exRadio1-3").removeAttr("disabled");
                            $('.item-radio input').prop('checked', false);
                            nonfixedBody();                    
                            
                            return;
                        });                       
                    }              

                

                } else if (data.data == 0){ // 포트 할당 가능
                    templateAdminModal.css(modalOpen);
                    fixedBody();

                    $('button.portCheck').click(function(e){
                        $('form.frm_TP').submit();
                    });                   
                } 
                           
            },  
        });      
  });   

    

  var adminBtnClean = $(`button.js-admin-btn.clean`);  
  adminBtnClean.on(`click`, function () {
  $(`textarea[name=reason]`).val(``);
  });

  
  $(`.template-admin.extend`).click(function () {
    $(`#exRadio1-1`).val(`연장승인`);
    $(`#exRadio1-2`).val(`연장반려`);
    $(`#exRadio1-3`).val(`연장만료`);
    $(`.modal-alert-text.extend`).text(`연장하시겠습니까?`);
  });
  

    //관리자페이지 - 결과물 반출 신청서 (admin/takeout/list)
    //관리 버튼 클릭
    var adminBtnTakeOut = $('.takeout-admin');

    adminBtnTakeOut.on('click', function () {
        var takeoutAdminModal = $('[data-layer="modal-takeout-admin"]'),
            closeBtn = $('[data-role="layerClose"]');
        let epidx = $(this).siblings('input[name=ep_idx]').val();
        let epuserid = $(this).siblings('input[name=ep_userid]').val();
        let epstatus= $(this).siblings(`input[name=ep_status]`).val();
        $('form.frm_EP').find('input[name=idx]').val(epidx);
        $('form.frm_EP').find('input[name=userid]').val(epuserid);

        if(epstatus == '대기') {
            // 승인, 반려만 선택 가능
            $("input#exRadio1-3").attr("disabled", true); // 만료
        } else if(epstatus == '승인'){
            // 만료만 선택 가능 
            $("input#exRadio1-1").attr("disabled", true); // 승인
            $("input#exRadio1-2").attr("disabled", true); // 반려
        } else if(epstatus == '연장대기'){
            // 연장승인, 연장만료만 선택 가능
            $("input#exRadio1-3").attr("disabled", true); // 연장만료

        } else if(epstatus == '연장승인'){
            // 만료만 선택 가능
            $("input#exRadio1-1").attr("disabled", true); // 연장승인
            $("input#exRadio1-2").attr("disabled", true); // 연장반려
        } else if (epstatus == '반려'){
            //alert("반려");
            return;
        } else if (epstatus == '만료'){
            //alert("만료");
            return;
        }

        takeoutAdminModal.css(modalOpen);
        fixedBody();

        closeBtn.on('click', function () {
            takeoutAdminModal.css(modalClose);
            takeoutAdminModal.find('.modal-alert > div').removeClass('is-selected');
            $("input#exRadio1-1").removeAttr("disabled");
            $("input#exRadio1-2").removeAttr("disabled");
            $("input#exRadio1-3").removeAttr("disabled");
            $('.item-radio input').prop('checked', false);
            nonfixedBody();
        });
    });   

    //관리자페이지 - 데이터 신청서 (admin/batch/list)
    //관리 버튼 클릭
    var adminBtnData = $('.dataset-admin');

    adminBtnData.on('click', function () {
        var dataAdminModal = $('[data-layer="modal-dataset-admin"]'),
            closeBtn = $('[data-role="layerClose"]');

        let dtidx = $(this).siblings('input[name=dt_idx]').val();
        let dtuserid = $(this).siblings('input[name=dt_userid]').val();        
        let dtstatus= $(this).siblings('input[name=dt_status]').val();

        console.log("dtstatus : "+dtstatus);
        $('form.frm_DT').find('input[name=idx]').val(dtidx);
        $('form.frm_DT').find('input[name=userid]').val(dtuserid);

        if(dtstatus == '승인'){
            // 만료만 선택 가능 
            $("input#exRadio1-1").attr("disabled", true); // 승인
            $("input#exRadio1-2").attr("disabled", true); // 반려
        }else if (dtstatus == '만료' || dtstatus == '삭제'){
            return;
        }
        
        dataAdminModal.css(modalOpen);
        fixedBody();

        closeBtn.on('click', function () {
            dataAdminModal.css(modalClose);
            dataAdminModal.find('.modal-alert > div').removeClass('is-selected');
            $("input#exRadio1-1").removeAttr("disabled");
            $("input#exRadio1-2").removeAttr("disabled");
            $("input#exRadio1-3").removeAttr("disabled");
            $('.item-radio input').prop('checked', false);
            nonfixedBody();
        });
    });   

    //관리자페이지 - 결과물 배치 신청서 (admin/batch/list)
    //관리 버튼 클릭
    var adminBtnBatch = $('.batch-admin');

    adminBtnBatch.on('click', function () {
        var batchAdminModal = $('[data-layer="modal-batch-admin"]'),
            closeBtn = $('[data-role="layerClose"]');

        let bcidx = $(this).siblings('input[name=bc_idx]').val();
        let bcuserid = $(this).siblings('input[name=bc_userid]').val();        
        let bcstatus= $(this).siblings(`input[name=bc_status]`).val();

        $('form.frm_BC').find('input[name=idx]').val(bcidx);
        $('form.frm_BC').find('input[name=userid]').val(bcuserid);

        if(bcstatus == '대기') {
            // 승인, 반려만 선택 가능
            $("input#exRadio1-3").attr("disabled", true); // 만료
        } else if(bcstatus == '승인'){
            // 만료만 선택 가능 
            $("input#exRadio1-1").attr("disabled", true); // 승인
            $("input#exRadio1-2").attr("disabled", true); // 반려
        } else if(bcstatus == '연장대기'){
            // 연장승인, 연장만료만 선택 가능
            $("input#exRadio1-3").attr("disabled", true); // 연장만료

        } else if(bcstatus == '연장승인'){
            // 만료만 선택 가능
            $("input#exRadio1-1").attr("disabled", true); // 연장승인
            $("input#exRadio1-2").attr("disabled", true); // 연장반려
        } else if (bcstatus == '반려'){
            //alert("반려");
            return;
        } else if (bcstatus == '만료'){
            //alert("만료");
            return;
        }
        
        batchAdminModal.css(modalOpen);
        fixedBody();

        closeBtn.on('click', function () {
            batchAdminModal.css(modalClose);
            batchAdminModal.find('.modal-alert > div').removeClass('is-selected');
            $("input#exRadio1-1").removeAttr("disabled");
            $("input#exRadio1-2").removeAttr("disabled");
            $("input#exRadio1-3").removeAttr("disabled");
            $('.item-radio input').prop('checked', false);
            nonfixedBody();
        });
    });   


    //관리모드 modal 선택
    var alertMsg = $(`.modal-alert-box`),
    radioBtn = $(`.item-radio input`),
    selectedMsg = `is-selected`,
    adminBtn = $(`.js-admin-btn`);

    radioBtn.on(`click`, function () {
    var radioIndex = $("input[type='radio']:checked").parent().index();
    //확인 메세지
    alertMsg.removeClass(selectedMsg);
    alertMsg.eq(radioIndex).addClass(selectedMsg);
    adminBtn.hide();
    adminBtn.eq(radioIndex).show();
    });

    // dataset / detail.html 데이터검색 버튼
    var searchDataBtn = $('.search-data-btn');
    searchDataBtn.on('click', function () {
        var searchDataModal = $('[data-layer="modal-data-search"]'),
            closeBtn = $('[data-role="layerClose"]');

        searchDataModal.css(modalOpen);
        fixedBody();

        closeBtn.on('click', function () {
            searchDataModal.css(modalClose);
            nonfixedBody();
        });
    });

    // 승인 버튼
    var confirmBtn = $('.js-confirm-btn');

    confirmBtn.on('click', function () {
        var confirmModal = $('[data-layer="modal-confirm"]'),
            closeBtn = $('[data-role="layerClose"]');

        confirmModal.css(modalOpen);
        fixedBody();

        closeBtn.on('click', function () {
            confirmModal.css(modalClose);
            nonfixedBody();
            $(this).attr('href', 'list.html');
        });
    });


    // 반려 버튼
    var declineBtn = $('.js-decline-btn');

    declineBtn.on('click', function () {
        var declineModal = $('[data-layer="modal-decline-admin"]'),
            closeBtn = $('[data-role="layerClose"]');

        declineModal.css(modalOpen);
        fixedBody();

        closeBtn.on('click', function () {
            declineModal.css(modalClose);
            nonfixedBody();
        });
    });


});
      */