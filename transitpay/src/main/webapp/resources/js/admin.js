$.ajax({
    type: "POST",
    url: "/searchCount",
    success: function (data, state, xhr) {
        $("#searchCount").text(data+"건");
    },
    error: function (xhr, data) {

    }
});

$.ajax({
    type: "POST",
    url: "/searchLocation",
    success: function (jsonData, state, xhr) {
        // 테이블의 tbody를 가져옴
        var tbody = $("#searchResults tbody");
        var i = 1;
        // JSON 데이터를 반복하여 테이블 행으로 추가
        $.each(jsonData, function (index, item) {
            var row = $("<tr>");
            $("<td>").text(i).appendTo(row);
            $("<td>").text(item.search_keyword).appendTo(row);
            $("<td>").text(item.search_count).appendTo(row);
            row.appendTo(tbody);
            i++;
        });
    },
    error: function (xhr, data) {

    }
});

$.ajax({
    type: "POST",
    url: "/optionLocation",
    success: function (jsonData, state, xhr) {
        populateOptionDropdown(jsonData);
    },
    error: function (xhr, data) {

    }
});
function populateOptionDropdown(optionData) {
    var dropdown = $("#regionSelect");

    dropdown.empty();

    dropdown.append($("<option>").val("").text("지역 선택"));

    $.each(optionData, function (index, option) {
        dropdown.append($("<option>").val(option).text(option));
    });
}

var ctx = document.getElementById("myAreaChart");
var myBarChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: [],
        datasets: [{
            label: "Earnings",
            backgroundColor: "rgba(78, 115, 223, 0.2)",
            borderColor: "rgba(78, 115, 223, 1)",
            borderWidth: 1,
            data: [],
        }],
    },
    options: {
        maintainAspectRatio: false,
        responsive: true,
        title: {
            display: true,
            text: '지역별 검색 추이',
            fontSize: 18,
        },
        scales: {
            x: {
                title: {
                    display: true,
                    text: '날짜',
                },
            },
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: '검색 수',
                },
            },
        },
        legend: {
            display: false,
        },
        tooltips: {
            callbacks: {
                label: function (tooltipItem) {
                    return tooltipItem.yLabel.toLocaleString(); // 숫자 포맷을 지원하는 경우
                },
            },
        },
    },
});

$("#regionSelect").on("change", function () {
    var selectedOption = $(this).val();
    $.ajax({
        type: "POST",
        url: "/searchLocationByDate",
        data: { option: selectedOption },
        success: function (searchData, state, xhr) {
            console.log(searchData)
            var chartData = {};

            searchData.forEach(function (item) {
                if (!chartData[item.search_date]) {
                    chartData[item.search_date] = {};
                }
                chartData[item.search_date][item.search_keyword] = item.search_count;
            });

            var labels = Object.keys(chartData);
            var datasets = [];
            var keywords = Array.from(new Set(searchData.map(function (item) { return item.search_keyword; })));

            keywords.forEach(function (keyword) {
                var data = labels.map(function (date) {
                    return chartData[date][keyword] || 0;
                });

                datasets.push({
                    label: keyword,
                    data: data,
                    backgroundColor: "rgba(78, 115, 223, 0.2)",
                    borderColor: "rgba(78, 115, 223, 1)",
                    borderWidth: 1,
                });
            });

            myBarChart.data.labels = labels;
            myBarChart.data.datasets = datasets;
            myBarChart.update();
        },
        error: function (xhr, data) {

        },
    });
});
$.ajax({
    type: "POST",
    url: "/selectMember",
    success: function (jsonData, state, xhr) {
        document.getElementById('memberCount').textContent = jsonData.length + '명';
        var tableBody = document.querySelector("#memberTable");
        for (var i = 0; i < jsonData.length; i++) {
            var rowData = jsonData[i];
            var row = tableBody.insertRow();
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);
            var cell7 = row.insertCell(6);
            var cell8 = row.insertCell(7);
            cell1.innerHTML = rowData.member_id;
            cell2.innerHTML = rowData.name;
            cell3.innerHTML = rowData.email;
            cell4.innerHTML = rowData.phone;
            cell5.innerHTML = rowData.join_date;
            if (rowData.code != null) {
                cell6.innerHTML = rowData.code;
            } else {
                cell6.innerHTML = '-';
            }
            if (rowData.recode != null) {
                cell7.innerHTML = rowData.recode;
            } else {
                cell7.innerHTML = '-';
            }
            cell8.innerHTML = '<button class="sendEmail" onclick="cashback(\'' + rowData.code + '\', \'' + rowData.recode + '\');">캐시백 지급</button>';
        }


        var dataTable = $('#datatablesSimple').DataTable({
            autoWidth: false,
            searching: true,
            language: {
                paginate: {
                    previous: "이전",
                    next: "다음"
                },
                zeroRecords: "검색 결과가 없습니다.",
                info: "전체 거래내역 _TOTAL_개 중에서 _START_ 번부터 _END_ 번까지의 결과",
                lengthMenu: "_MENU_ 행까지 조회"
            },
            columnDefs: [
                {
                    targets: -1,
                    className: 'dt-body-center'
                }
            ]
        });
    },
    error: function (xhr, data) {
        $("#login_result").text('알 수 없는 에러가 발생했습니다.')
    }
});

function cashback(code, recode) {
    var data = {
        code: code,
        recode: recode
    };

    $.ajax({
        type: "POST",
        url: "/cashbackPayment",
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function (data) {
        },
        error: function (xhr, data) {
            $("#login_result").text('알 수 없는 에러가 발생했습니다.');
        }
    });
}

$.ajax({
    type: "POST",
    url: "/selectMember",
    success: function (jsonData, state, xhr) {
        console.log(jsonData)
        var tableBody = document.querySelector("tbody");
        for (var i = 0; i < jsonData.length; i++) {
            var rowData = jsonData[i];
            var row = tableBody.insertRow();
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);

            cell1.innerHTML = rowData.member_id;
            cell2.innerHTML = rowData.name;
            cell3.innerHTML = rowData.email;
            cell4.innerHTML = rowData.phone;
            cell5.innerHTML = rowData.join_date;
            cell6.innerHTML = '<button class="sendEmail" onclick="sendEmail(\'' + rowData.email + '\')">이메일전송</button>';
        }
    },
    error: function (xhr, data) {
        $("#login_result").text('알 수 없는 에러가 발생했습니다.')
    }
});
function sendEmail(email) {
    // Implement email sending logic here
    alert("Sending email to: " + email);
}

$.ajax({
    type: "POST",
    url: "/recommendOfMember",
    success: function (data) {
        console.log(data)
    },
    error: function (xhr, data) {
        $("#login_result").text('알 수 없는 에러가 발생했습니다.')
    }
});

$("#login_btn").click(function() {
    var admin = {
        name: "관리자",
        phone: "010-9366-0469",
        email: "admin@admin.com",
        join_date: "2023-09-12T04:17:16Z",
        kakao_img: "http://k.kakaocdn.net/dn/U9FRo/btst0zFhb4P/eh7HxK1ZBHtFqkGqC3CHRK/img_640x640.jpg",
        kakao_id: "3025165876"
    }


    $.ajax({
        type: "POST",
        url: "/insertKakaoAndPhoneMember",
        data: JSON.stringify(admin),
        contentType: "application/json",
        success : function(data, state, xhr) {
            location.href='/admin/template/list';
        },
        error : function(xhr, data) {
            $("#login_result").text('알 수 없는 에러가 발생했습니다.')
        }
    });
    if (username == null) {
        $("#login_result").text('아이디를 입력하세요.')
        return;
    } else if (password == null) {
        $("#login_result").text('비밀번호를 입력하세요.')
        return;
    }

    username = username.trim()
    password = password.trim()

    if (username == "") {
        $("#login_result").text('아이디를 입력하세요.')
        return;
    } else if (password == "") {
        $("#login_result").text('비밀번호를 입력하세요.')
        return;
    }
});
$.ajax({
    type: "POST",
    url: "/recommendOfMember",
    success: function (data) {

    },
    error: function (xhr, data) {
        $("#login_result").text('알 수 없는 에러가 발생했습니다.')
    }
});