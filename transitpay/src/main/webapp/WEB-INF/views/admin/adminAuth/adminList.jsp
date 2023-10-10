<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>트래블싱크</title>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Custom fonts for this template-->
    <link href="../../../../resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../../../resources/admin/css/sb-admin-2.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
            <div class="sidebar-brand-text mx-3"><img src="../../../../resources/images/img-hana-symbol.png" style="width: 50px;"><sup>트래블싱크</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">
        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            log
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="/admin/template/list" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span>로그관리</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Custom Components:</h6>
                    <a class="collapse-item" href="/admin/template/list">Buttons</a>
                    <a class="collapse-item" href="/admin/template/list">Cards</a>
                </div>
            </div>
        </li>


        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            admin
        </div>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>여행관리</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="/admin/user/list">
                <i class="fas fa-fw fa-table"></i>
                <span>회원관리</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">



    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span>
                            <img class="img-profile rounded-circle"
                                 src="../../../../resources/admin/images/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Activity Log
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
            <div class="container-fluid">
<%--                <div class="row">--%>
<%--                    <div class="col-xl-3 col-md-6 mb-4">--%>
<%--                        <div class="card border-left-success shadow h-100 py-2">--%>
<%--                            <div class="card-body">--%>
<%--                                <div class="row no-gutters align-items-center">--%>
<%--                                    <div class="col mr-2">--%>
<%--                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">--%>
<%--                                            캐시백</div>--%>
<%--                                        <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-auto">--%>
<%--                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

                <!-- Content Row -->

                <div class="row">

                    <!-- Area Chart -->
                    <div class="col-xl-8 col-lg-7">
                        <div class="countbox">
                            <div class="col-md-4 mb-4" id="searchCountbox">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    전체 검색수</div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="searchCount"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-search fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-4" id="searchCountbox">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    사용자 수</div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="memberCount"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-search fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="regionSelect">지역별 검색 추이 </label>
                            <select id="regionSelect" class="form-control" style="택max-height: 150px; overflow-y: scroll">
                                <!-- 선택 옵션은 비워둡니다. -->
                            </select>
                        </div>
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">지역별 검색추이</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Dropdown Header:</div>
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="myAreaChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">최근 검색횟수가 높은 지역 TOP10</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="searchResults" width="100%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th>Top</th>
                                            <th>검색어</th>
                                            <th>검색 횟수</th>
                                        </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


                <!-- Content Row -->
                <div class="row">
                    <div class="col-lg-6 mb-4">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">추천코드 받을 사람들 (너도 나도 1000포인트)</h6>
                            </div>
                            <div class="card-body">
                                <c:forEach var="user" items="${recommendUser}">
                                    <h4 class="small font-weight-bold" id="recommenduser">${user.name}<span
                                            class="float-right">${user.count} 번</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: ${user.count+100}px"
                                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- Illustrations -->
                        <%--                        <div class="card shadow mb-4">--%>
                        <%--                            <div class="card-header py-3">--%>
                        <%--                                <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>--%>
                        <%--                            </div>--%>
                        <%--                            <div class="card-body">--%>
                        <%--                                <div class="text-center">--%>
                        <%--                                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"--%>
                        <%--                                         src="../../../../resources/admin/images/undraw_posting_photo.svg" alt="...">--%>
                        <%--                                </div>--%>
                        <%--                                <p>Add some quality, svg illustrations to your project courtesy of <a--%>
                        <%--                                        target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a--%>
                        <%--                                    constantly updated collection of beautiful svg images that you can use--%>
                        <%--                                    completely free and without attribution!</p>--%>
                        <%--                                <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on--%>
                        <%--                                    unDraw &rarr;</a>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                    </div>
                    <div class="container-fluid">
                        <h1 class="h3 mb-2 text-gray-800">사용자관리</h1>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">사용자관리</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="datatablesSimple" width="100%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>이름</th>
                                            <th>이메일</th>
                                            <th>핸드폰</th>
                                            <th>가입일자</th>
                                            <th>사용자코드</th>
                                            <th>추천인코드</th>
                                            <th>캐시백</th>
                                        </tr>
                                        </thead>
                                        <tbody id="memberTable">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2021</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="../../../../resources/admin/vendor/jquery/jquery.min.js"></script>

<script src="../../../../resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../../../../resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<%--<script src="../../../../resources/admin/js/sb-admin-2.min.js"></script>--%>

<!-- Page level plugins -->
<script src="../../../../resources/admin/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="../../../../resources/admin/js/demo/chart-area-demo.js"></script>
<!-- 새로운 DataTables 링크 추가 -->
<link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script>

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
        var dropdown = $("#regionSelect"); // select dropdown 선택

        // 기존 옵션 제거
        dropdown.empty();

        // 기본 선택 옵션 추가
        dropdown.append($("<option>").val("").text("지역 선택"));

        // 서버에서 가져온 데이터를 이용하여 옵션 추가
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
                // 오류 처리 로직 추가
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

                // DataTables 초기화 및 설정
                var dataTable = $('#datatablesSimple').DataTable({
                    autoWidth: false, // 열 너비 자동 조정 비활성화
                    searching: true, // 검색 기능 활성화
                    language: { // 언어 설정
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
                            className: 'dt-body-center' // 마지막 열의 셀 스타일 지정
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
            data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환
            contentType: "application/json", // 데이터 타입을 JSON으로 설정
            success: function (data) {
                // 성공 시 처리
            },
            error: function (xhr, data) {
                $("#login_result").text('알 수 없는 에러가 발생했습니다.');
            }
        });
    }

</script>
</body>


</html>