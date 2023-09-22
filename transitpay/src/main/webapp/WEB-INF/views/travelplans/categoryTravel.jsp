<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../../../resources/css/taffic.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <style>

        .category-list {
            justify-content: center;
            margin: 20px 0;
        }

        .category-list button {
            background-color: #03a9f4;
            color: white;
            border: none;
            border-radius: 20px;
            margin: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s, color 0.3s;
        }

        .category-list button:hover {
            background-color: #005050;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .category-list button.selected-category {
            background-color: #005050;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            color: black;
        }

        .item-list {
            display: flex;
            flex-wrap: wrap;
            margin: 20px;
            height: 100%;
        }

        .item {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px;
            width: 200px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .category1-text {
            color: red; /* 카테고리 1 텍스트 색상 */
        }

        .category2-text {
            color: blue; /* 카테고리 2 텍스트 색상 */
        }

        .contents-1 {
            padding: 10px 0 20px 20px;
            border-radius: 50px;
            width: 800px;
            display: table;
        }
        .item-img{
            width: 100%;
            height: 200px;
        }
    </style>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        <span>교통편 보기</span>
        <hr/>
    </div>
    <div class="contents">
        <div class="menu1">
            <div class="menu1-1">여행 일정 추가</div>
            <div class="menuhr"><hr/></div>
            <a href="/travel">여행 장소 선택</a>
            <a href="map">여행 일정 추가</a>
            <a href="traffic">교통편 보기</a>
            <a href="/">TOP 여행지</a>
            <a href="/">여행 기록</a>
        </div>
        <div class="contents-1">
            <div class="header">
                <h1>여행키워드를 선택하슈</h1>
            </div>
            <div class="category-list">
                <button data-category="" onclick="filterItems('')">전체</button>
                <button data-category="숙박" onclick="filterItems('숙박')">숙박</button>
                <button data-category="음식" onclick="filterItems('음식')">음식</button>
                <button data-category="관광" onclick="filterItems('관광')">관광</button>
                <button data-category="추천" onclick="filterItems('추천')">추천</button>
                <button data-category="가성비" onclick="filterItems('가성비')">가성비</button>
                <button data-category="슈하스코" onclick="filterItems('슈하스코')">슈하스코</button>
            </div>
            <div class="item-list">

            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
</body>
<script>
    let page = 1; // 현재 페이지 번호
    const itemsPerPage = 10; // 페이지당 아이템 수
    let isLoading = false; // 데이터 로딩 중 여부
    const selectedCategories = [];
    let selectedCategory = ''; // 선택한 카테고리

    const items = document.querySelectorAll('.item');
    var itemContainer = document.querySelector('.item-list');

    function appendNewData(response) {
        console.log(response)
        if (response.length > 0) {
                // 새로운 데이터를 화면에 추가
                response.forEach(function (data) {
                    console.log(data);
                    var itemDiv = document.createElement('div');
                    itemDiv.className = 'item';
                    var itemImage = document.createElement('img');
                    var originalURL =data.photo;
                    var idMatch = originalURL.match(/id=([^&]+)/);
                    var id = idMatch ? idMatch[1] : null;
                    var modifiedURL = id ? originalURL.replace(idMatch[0], "&" + "id=" + id) : originalURL;
                    itemImage.src = modifiedURL;
                    itemImage.className='item-img'
                    itemImage.alt = data.content;
                    itemDiv.appendChild(itemImage);

                    var itemHeading = document.createElement('h2');
                    itemHeading.textContent = data.content;
                    itemDiv.appendChild(itemHeading);

                    var itemParagraphs = [
                        "위치: " + data.location,
                        "태그: " + data.tags,
                        "여행 유형: " + data.travel_type,
                        "좋아요 수: " + data.likeCount,
                        "별점: " + data.starCount
                    ];

                    itemParagraphs.forEach(function (text) {
                        var paragraph = document.createElement('p');
                        paragraph.textContent = text;
                        itemDiv.appendChild(paragraph);
                    });

                    itemContainer.appendChild(itemDiv);
                });
            page++; // 다음 페이지로 이동
        } else {
            // 더 이상 데이터가 없을 경우 처리
        }
    }


    // 데이터 필터링 함수
    function filterItems(category) {
        console.log(category)
        selectedCategory = category;

        // 모든 아이템 숨기기
        items.forEach(item => {
            item.style.display = 'none';
        });

        // 선택한 카테고리에 해당하는 아이템만 표시
        items.forEach(item => {
            const itemCategory = item.classList.item(1); // 클래스 리스트에서 두 번째 클래스를 가져옴
            if (selectedCategory === '' || itemCategory === selectedCategory) {
                item.style.display = 'block';
            }
        });
        page = 1; // 페이지 초기화
        itemContainer.innerHTML = ''; // 현재 아이템 삭제
        loadItems(); // 새로운 데이터 로드

    }

    // 스크롤 이벤트를 감지하여 무한 스크롤 동작
    $(window).on('scroll', function () {
        // 스크롤이 아래로 내려갔을 때 추가 데이터를 로드
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100 && !isLoading) {
            isLoading = true;
            // 서버로부터 추가 데이터를 가져오는 AJAX 요청
            $.ajax({
                url: '/selectCategoryTravel',
                method: 'GET',
                data: {
                    page: page,
                    itemsPerPage: itemsPerPage,
                    category: selectedCategory
                },
                success: function (response) {
                    isLoading = false;
                    appendNewData(response);
                },
                error: function () {
                    isLoading = false;
                    // 에러 처리
                },
            });
        }
    });

    // 페이지 로딩 시 초기 데이터 로드
    function loadItems() {
        $.ajax({
            url: '/selectCategoryTravel',
            method: 'GET',
            data: {
                page: page,
                itemsPerPage: itemsPerPage,
                category: selectedCategory
            },
            success: function (response) {
                appendNewData(response);
            },
            error: function () {
                // 에러 처리
            },
        });
    }

    // 초기 페이지 로딩 시 "전체" 카테고리 데이터 로드
    loadItems();

    // 카테고리 버튼 클릭 이벤트 처리
    $('.category-list button').on('click', function () {
        const category = $(this).data('category');
        filterItems(category);
    })

</script>
</html>
