// 모달창 열기
$(document).ready(function() {
    var modal = $("#accountModal");
    var accountA = $("#change-account");
    var span = $(".close").eq(0);

    accountA.click(function() {
        modal.css("display", "block");
    });

    span.click(function() {
        modal.css("display", "none");
    });

    $(window).click(function(event) {
        if (event.target === modal[0]) {
            modal.css("display", "none");
        }
    });
});
window.onload = function() {
    $.ajax({
        url:'/selectBackAccount',
        method: "POST",
        success: function(response) {
            var select = document.getElementById('selecttype');
            var inputAccountNum = $('input[name=accountNum]'); // input 엘리먼트를 변수로 저장

            // 데이터를 옵션으로 추가
            response.forEach(function (item) {
                var option = document.createElement('option');
                option.value = item.account_id;
                option.text = item.account_bank;
                option.setAttribute('data-account-num', item.account_num); // 각 옵션에 account_num을 저장
                select.appendChild(option);

                if (item.account_main === '1') {
                    const bank = document.querySelector('.bank');
                    var main = document.createElement('div');
                    document.querySelector('input[name=accountId]').value = item.account_id;
                    main.style.color = '#E91E63';
                    main.style.marginLeft = '5px';
                    main.textContent = '(주계좌)';
                    bank.textContent = item.account_bank;
                    bank.appendChild(main);
                    const accountNumber = document.querySelector('.account-number');
                    accountNumber.textContent = item.account_num;
                    option.selected = true;
                    inputAccountNum.val(item.account_num);
                }
            });
            // select 요소의 변경 이벤트 리스너 추가
            select.addEventListener('change', function () {
                var selectedOption = select.options[select.selectedIndex];
                const bank = document.querySelector('.bank');
                bank.textContent = selectedOption.text;
                const accountNum = selectedOption.getAttribute('data-account-num'); // 선택한 옵션의 account_num 가져오기
                inputAccountNum.val(accountNum); // input에 account_num 설정
            });
        },
        error: function(error) {
            console.error("Error occurred:", error);
        }
    });
}
$('#auth-res-button').click(function () {
    var selectedOption = $('#selecttype option:selected');

    var accountIdList = [];
    accountIdList.push($('input[name=accountId]').val());
    accountIdList.push($('span[name=account_num]').text());
    accountIdList.push(selectedOption.attr('data-account-num'));

    // AJAX 요청을 보냅니다.
    $.ajax({
        url: '/updateMainAccount', // 변경을 처리하는 서버 엔드포인트 URL
        method: 'POST',
        data: JSON.stringify(accountIdList),
        contentType: "application/json",
        headers: {
            'Content-Type': 'application/json'
        },
        success: function (response) {
            alert(response);
            location.reload();
        },
        error: function (error) {
            // 오류 처리
            console.error('Error occurred:', error);
        }
    });
});