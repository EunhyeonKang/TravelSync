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

    $.ajax({
        url: '/updateMainAccount',
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


function openModal() {
    var modal = document.getElementById("unpaidModal");
    modal.style.display = "block";
}

function closeModal() {
    var modal = document.getElementById("unpaidModal");
    modal.style.display = "none";
}

function searchByMonth() {
    var selectedMonth = document.getElementById("selectedMonth").value;

    var filteredData = yourData.filter(function(item) {
        var transactionDate = new Date(item.transactionDate);
        var transactionMonth = transactionDate.getFullYear() + "-" + (transactionDate.getMonth() + 1).toString().padStart(2, '0'); // "YYYY-MM" 형식으로 변환
        return transactionMonth === selectedMonth;
    });

    var totalAmount = 0;
    filteredData.forEach(function(item) {
        totalAmount += item.amount;
    });

    updateMonthUsage(selectedMonth, totalAmount);
}

function updateMonthUsage(selectedMonth, totalAmount) {
    document.querySelector(".card-value").textContent = selectedMonth + " 사용금액: " + totalAmount.toLocaleString() + "원";
}

$(document).ready(function() {
    $('#cardHistoryTable').DataTable();
});

function openCardModal() {
    var modal = document.getElementById("cardModal");
    modal.style.display = "block";
}


function closeCardModal() {
    var modal = document.getElementById("cardModal");
    modal.style.display = "none";
}


$.ajax({
    type: "GET",
    url: "/completeCalculateTravel",
    success: function (response) {
        document.querySelector('#completeTravelLength').textContent=response+"개";
    },
    error: function (error) {
        console.error(error);
    },
});
$.ajax({
    type: "GET",
    url: "/selectMemberNotificationHistory",
    success: function (response) {
        var chartCanvas = document.getElementById('myChart');
        var ctx = chartCanvas.getContext('2d');

        if (response.length === 0) {
            ctx.font = 'bold 13px Verdana';
            ctx.fillText('여행 데이터를 추가하세요', chartCanvas.width / 2 - 80, chartCanvas.height / 2);
            return;
        }
        if (response.length === 0) {
            var travelreport = document.querySelector('.chartbox');
            var noDataMessage = document.createElement('div');
            noDataMessage.textContent = '';
            travelreport.appendChild(noDataMessage);
            return;
        }
        var food = 0;
        var etc =0;
        var accommodation =0;
        response.forEach(function(item){
            food +=item.food_expenses;
            etc += item.etc_expenses;
            accommodation +=item.accommodation_expenses;

        })

        var totalcategory = food + etc + accommodation;
        var manyCategory = "";
        var percent;
        if (accommodation > food && accommodation > etc) {
            manyCategory = "숙박";
            percent = (accommodation / totalcategory) * 100;
        } else if (food > accommodation && food > etc) {
            manyCategory = "음식";
            percent = (food / totalcategory) * 100;
        } else {
            manyCategory = "기타·문화";
            percent = (etc / totalcategory) * 100;
        }

        var travelreport = document.querySelector('#travelreport');
        var cdiv = document.createElement('div');
        cdiv.innerHTML = '여행·일정에서 가장 많은 항목은 <div class="manyCategory category-' + manyCategory + '">' + manyCategory + '</div> 입니다.';
        cdiv.classList.add('category');
        travelreport.appendChild(cdiv);

        var total = document.createElement('div');
        total.innerHTML = '총 여행·일정(모여라회비) 금액의 <div class="percent">' + percent.toFixed(2) + '%</div>를 차지합니다.';
        total.classList.add('percentage');
        travelreport.appendChild(total);


        const fixedColors = [
            'rgb(211, 211, 211)',
            'rgb(241, 241, 241)',
            'rgb(0, 92, 255)'
        ];
        const data = [
            {
                label: '음식',
                data: food,
                backgroundColor: fixedColors[0]
            },
            {
                label: '기타·문화',
                data: etc,
                backgroundColor: fixedColors[1]
            },
            {
                label: '숙박',
                data: accommodation,
                backgroundColor: fixedColors[2]
            }
        ];

        const total1 = data.reduce((acc, item) => acc + item.data, 0);


        data.forEach(item => {
            const percentage = ((item.data / total1) * 100).toFixed(1); // 소수점 1자리까지 표시
            item.label += '(' +percentage+'%)';
        });


        const chartData = {
            labels: data.map(item => item.label),
            datasets: [
                {
                    data: data.map(item => item.data),
                    backgroundColor: data.map(item => item.backgroundColor),
                    hoverOffset: 4,
                },
            ],
        };

        const chartConfig = {
            type: 'doughnut',
            data: chartData,
            options: {
                plugins: {
                    legend: {
                        display: true,
                    },
                    tooltip: {
                        callbacks: {
                            label: function (context) {
                                const label = context.label || '';
                                if (label) {
                                    return label + ' : ' + context.formattedValue+'원';
                                }
                                return '';
                            },
                        },
                    },
                },
            },
        };


        const myChart = new Chart(
            document.getElementById('myChart'),
            chartConfig
        );

    },
    error: function (error) {
        console.error(error);
    },
});

var updateModal = document.getElementById("updateModal");
var updateBtn = document.getElementById("updateGroup");
var updateCloseBtn = document.getElementsByClassName("update-close")[0];


updateBtn.addEventListener("click", function() {
    updateModal.style.display = "block";
});


window.addEventListener("click", function(event) {
    if (event.target == updateModal || event.target == updateCloseBtn) {
        updateModal.style.display = "none";
    }
});

$('#updateButton').click(function(){
    var groupAccount = document.getElementById("groupAccount").textContent;
    var groupDay = document.getElementById("groupDay").value;
    var groupDues = document.getElementById("groupDues").value;
    var groupAutopay = document.getElementById("groupAutopay").value;
    var groupPassword = document.getElementById("groupPassword").value;

    var dataToSend = {
        groupAccount: groupAccount,
        groupDay: groupDay,
        groupDues: groupDues,
        groupAutopay: groupAutopay,
        groupPassword: groupPassword
    };

    $.ajax({
        type: "POST",
        url: "/updateGroupInfo",
        contentType: "application/json",
        data: JSON.stringify(dataToSend),
        success: function (response) {
            alert(response)
        }
    });
})
$.ajax({
    type: "POST",
    url: "/selectNotification",
    success: function (response) {
        var total=0;
        var paymentCnt = document.querySelector('#payment-cnt');
        var paymentBalance = document.querySelector('#payment-balance');
        if(response.length==0){
            paymentCnt.textContent=0;
            paymentBalance.textContent=0;
        }else{
            paymentCnt.textContent=response.length;
            response.forEach(function(val){
                total += val.amount;
            })
            paymentBalance.textContent=total;
        }
    }
});
// 모달 요소와 버튼 요소 가져오기
var customModal = document.getElementById("customModal");
var customBtn = document.querySelector("#custom-account-month");
var customCloseBtn = document.querySelector(".custom-close");

// 버튼을 클릭하면 모달을 보이게 함
customBtn.addEventListener("click", function() {
    customModal.style.display = "block";
});

// 모달 바깥 영역이나 닫기 버튼을 클릭하면 모달을 숨김
window.addEventListener("click", function(event) {
    if (event.target == customModal || event.target == customCloseBtn) {
        customModal.style.display = "none";
    }
});

$("#non-payment-account").click(function(){

})

$.ajax({
    type: "POST",
    url: "/selectMyAccountMonthStatement",
    success: function (response) {
        var total = 0;
        var monthCnt = document.querySelector('#month-cnt');
        var monthBalance = document.querySelector('#month-balance');

        // 모달 내용을 추가할 부분
        var modalContent = document.querySelector('.custom-modal-content');
        var table = document.createElement('table');
        table.className = 'custom-table';

        // 테이블 헤더 생성
        var thead = document.createElement('thead');
        var headerRow = document.createElement('tr');
        var headers = ['날짜', '내용', '금액'];

        headers.forEach(function (headerText) {
            var th = document.createElement('th');
            th.style.textAlign='center';
            th.textContent = headerText;
            headerRow.appendChild(th);
        });

        thead.appendChild(headerRow);
        table.appendChild(thead);

        // 테이블 바디 생성
        var tbody = document.createElement('tbody');
        response.forEach(function (transaction) {
            var row = document.createElement('tr');
            var cell1 = document.createElement('td');
            var cell2 = document.createElement('td');
            var cell3 = document.createElement('td');

            cell1.textContent = transaction.transaction_date;
            cell2.textContent = transaction.transaction_content;
            cell3.textContent = transaction.balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            cell3.style.textAlign = 'right';
            row.appendChild(cell1);
            row.appendChild(cell2);
            row.appendChild(cell3);
            tbody.appendChild(row);

            total += transaction.balance;
        });

        table.appendChild(tbody);
        modalContent.appendChild(table);

        monthCnt.textContent = response.length;
        monthBalance.textContent = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
    error: function (error) {
        console.error(error);
    },
});


$.ajax({
    type: "POST",
    url: "/selectMygroupTravelList",
    success: function (response) {
        $("#travleLength").text(response.length + "개");
    },
    error: function (error) {
        console.error(error);
    },
});


$('#deleteGroup').click(function() {
    // 모달 열기
    $('#deletemodal').show();

    // "x" 버튼 클릭 시 모달 닫기
    $('#closeModal').click(function() {
        $('#deletemodal').hide();
    });

    // "삭제" 버튼 클릭 시
    $('#confirmDelete').click(function() {
        phoneModal();
    });
});


$('.slider-2 .page-nav > div').click(function() {

    var $this = $(this);
    var $pagenav = $this.parent()
    var $current = $pagenav.find('.active');

    $current.removeClass('active');
    $this.addClass('active');

    var index = $this.index();
    var $slider = $this.closest('.slider-2');

    $slider.find('.slides > div.active').removeClass('active');
    $slider.find('.slides > div').eq(index).addClass('active');


});

$('.slider-2 > .side-btns > div:first-child').click(function() {
    var $this = $(this);
    var $slider = $this.closest('.slider-2');

    var $current = $slider.find('.page-nav > div.active');
    var $post = $current.prev();

    if ( $post.length == 0 ) {
        $post = $slider.find('.page-nav > div:last-child');
    }

    $post.click();
});

$('.slider-2 > .side-btns > div:last-child').click(function() {
    var $this = $(this);
    var $slider = $this.closest('.slider-2');

    var $current = $slider.find('.page-nav > div.active');
    var $post = $current.next();

    if ( $post.length == 0 ) {
        $post = $slider.find('.page-nav > div:first-child');
    }

    $post.click();
});
