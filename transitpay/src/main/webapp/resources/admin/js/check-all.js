$(document).ready(function () {
    var allCheckBtn1 = $('input[name="exCheck1"].check-all'),
        allCheckBtn2 = $('input[name="exCheck2"].check-all'),
        allCheckBtn3 = $('input[name="exCheck3"].check-all'),
        inputCheckBox = $('input[type="checkbox"]'),
        inputCheckBoxDay = $('input[name="exCheck1"]'),
        inputCheckBoxMonth = $('input[name="exCheck2"]'),
        inputCheckBoxYear = $('input[name="exCheck3"]');


    //전체선택 check box (default) / 데이터검색 모달- 일별데이터 tab
    allCheckBtn1.on('click', function () {
        if (allCheckBtn1.prop('checked')) {
            if ($(this).prop('checked')) {
                $('input[name="exCheck1"]:not(:disabled)').prop('checked', true);
            } else {
                $('input[name="exCheck1"]:not(:disabled)').prop('checked', false);
            }
        } else {
            inputCheckBox.prop('checked', false);
        }
    });

    //데이터검색 모달- 월별데이터 tab 
    allCheckBtn2.on('click', function () {
        if (allCheckBtn2.prop('checked')) {
            if ($(this).prop('checked')) {
                $('input[name="exCheck2"]:not(:disabled)').prop('checked', true);
            } else {
                $('input[name="exCheck2"]:not(:disabled)').prop('checked', false);
            }
        } else {
            inputCheckBox.prop('checked', false);
        }
    });

    //데이터검색 모달- 년별데이터 tab 
    allCheckBtn3.on('click', function () {
        if (allCheckBtn3.prop('checked')) {
            if ($(this).prop('checked')) {
                $('input[name="exCheck3"]:not(:disabled)').prop('checked', true);
            } else {
                $('input[name="exCheck3"]:not(:disabled)').prop('checked', false);
            }
        } else {
            inputCheckBox.prop('checked', false);
        }
    });

    //전체선택 후 개별 체크 해제 시 전체선택 버튼 해제
    inputCheckBoxDay.not(allCheckBtn1).on('click', function () {
        if (allCheckBtn1.is(':checked')) {
            allCheckBtn1.prop('checked', false);
        }
    });

    inputCheckBoxMonth.not(allCheckBtn2).on('click', function () {
        if (allCheckBtn2.is(':checked')) {
            allCheckBtn2.prop('checked', false);
        }
    });

    inputCheckBoxYear.not(allCheckBtn3).on('click', function () {
        if (allCheckBtn3.is(':checked')) {
            allCheckBtn3.prop('checked', false);
        }
    });

});
