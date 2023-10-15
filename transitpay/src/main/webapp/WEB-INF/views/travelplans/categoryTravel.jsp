<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
            justify-content: center;
        }

        .item {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px;
            width: 300px;
            border-radius: 10px;
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
            display: inline-block;
            width: 100%;
        }
        .item-img{
            width: 100%;
            height: 200px;
            border-radius: 10px;
        }
        .like-button, .bookmark-button{
            border: 0;
            background: 0;
            cursor: pointer;
            padding: 0;
        }
        .bookmark-button img{
            width: 36px;
            height: 35px;
            margin-bottom: 6px;
        }
        .like-button img{
            width: 45px;
            position: relative;
        }
        .contents{
            margin: 30px auto;
            text-align: center;
            /*width: 80%;*/
        }
        .traveltitle{
            color: #7a7d7d;
            font-size: 25px;
            width: 90%;
            margin: 30px auto;
            font-weight: 600;
        }.main {
             width: 100%;
             height: 850px;
         }
         .like-count, .bookmark-count{
             font-size: 13px;
             color: #000000;
             font-weight: 700;
             position: absolute;
             transform: translate(-28px,100%);
         }
         .itemHeading{
             color: #585858;
             font-size: 18px;
             width: 170px;
             margin: 5px auto;
             height: 70px;
         }
        .search{
            position: relative;
            margin: 5px auto;
            width: 300px;
        }
        #searchInput {

            border-radius: 10px;
            width: 95%;
            border: 1px solid #bbb;
            padding: 15px 15px;
        }
        .searchimg{
            top: 0;
            position: absolute;
            padding: 13px 0 13px 0;
            right: 0;;
            margin-right: 0;
        }

    </style>
</head>
<body>
<div class="main">
    <%@ include file="../include/header.jsp" %>
    <div class="traveltitle">
        <span>여행지 보기</span>
        <hr/>
    </div>
    <div class="contents">

        <div class="contents-1">
            <div class="header">
                <h1>여행 키워드를 선택하세요🗺</h1>
            </div>
            <div class="search">
                <input id="searchInput" type="text" placeholder="여행, 어디로 떠나시나요?" autocomplete="off">
                <img class="searchimg" src="../../resources/images/search.png" style="width: 50px;" >
                <div id="searchDropdown" class="dropdown-content"></div>
            </div>
            <div class="category-list">
                <button data-category="" onclick="filterItems('')">전체</button>
                <button data-category="숙박" onclick="filterItems('숙박')">숙박</button>
                <button data-category="음식" onclick="filterItems('음식')">음식</button>
                <button data-category="관광" onclick="filterItems('관광')">관광</button>
                <button data-category="추천" onclick="filterItems('추천')">추천</button>
                <button data-category="가성비" onclick="filterItems('가성비')">가성비</button>
                <button data-category="인기" onclick="filterItems('인기')">인기</button>
            </div>
            <div class="item-list">

            </div>

        </div>
    </div>
<%--    <%@ include file="../include/footer.jsp" %>--%>
</div>
</body>
<script>
    let page = 1; // 현재 페이지 번호
    const itemsPerPage = 10; // 페이지당 아이템 수
    let isLoading = false; // 데이터 로딩 중 여부
    const selectedCategories = [];
    let selectedCategory = ''; // 선택한 카테고리
    var isLiked = false;
    const items = document.querySelectorAll('.item');
    var itemContainer = document.querySelector('.item-list');

    function appendNewData(response) {
        if (response.length > 0) {
            // 새로운 데이터를 화면에 추가
            response.forEach(function (data) {
                var itemDiv = document.createElement('div');
                itemDiv.className = 'item';
                var itemImage = document.createElement('img');
                var originalURL = data.photo;
                var idMatch = originalURL.match(/id=([^&]+)/);
                var id = idMatch ? idMatch[1] : null;
                var modifiedURL = id ? originalURL.replace(idMatch[0], "&" + "id=" + id) : originalURL;
                itemImage.src = modifiedURL;
                itemImage.className = 'item-img';
                itemImage.alt = data.content;
                itemDiv.appendChild(itemImage);

                var itemHeading = document.createElement('h2');
                itemHeading.className = 'itemHeading';
                itemHeading.textContent = data.content;
                itemDiv.appendChild(itemHeading);

                var paragraphlocation = document.createElement('p');
                paragraphlocation.className = 'paragraphlocation';
                paragraphlocation.textContent = data.location;
                itemDiv.appendChild(paragraphlocation);

                // 좋아요 버튼 추가
                var likeButton = document.createElement('button');
                likeButton.className = 'like-button';
                var likeimg = document.createElement('img');
                likeimg.src = isLiked ? '../../../resources/images/hart1.png' : '../../../resources/images/hart.png';
                likeButton.dataset.itemId = data.t_num; // 아이템 ID 저장
                likeButton.dataset.liked = isLiked ? 'true' : 'false'; // 좋아요 초기 상태

                var paragraphlike = document.createElement('span');
                paragraphlike.className = 'like-count';
                paragraphlike.textContent = data.likeCount;

                likeButton.append(likeimg);
                likeButton.appendChild(paragraphlike);

                itemDiv.appendChild(likeButton);

                // 즐겨찾기 버튼 추가
                var bookmarkButton = document.createElement('button');
                bookmarkButton.className = 'bookmark-button';
                var bookmarkimg = document.createElement('img');
                bookmarkimg.src = '../../../resources/images/bookmark.png';
                bookmarkButton.dataset.itemId = data.t_num; // 아이템 ID 저장
                bookmarkButton.append(bookmarkimg);
                var paragraphbookmark = document.createElement('span');
                paragraphbookmark.className='bookmark-count';
                // paragraphbookmark.textContent = data.starCount;
                bookmarkButton.appendChild(paragraphbookmark);
                itemDiv.appendChild(bookmarkButton);
                itemContainer.appendChild(itemDiv);
            });
            page++; // 다음 페이지로 이동
        } else {
            // 더 이상 데이터가 없을 경우 처리
        }
    }

    $(document).on('click', '.like-button', function () {
        var likeButton = $(this);
        var itemId = likeButton.data("item-id");
        var isLiked = likeButton.data("liked");

        // 서버로 좋아요 토글 이벤트 전달
        $.ajax({
            url: '/toggleLikeTraveling',
            method: 'POST',
            data: {
                itemId: itemId,
                isLiked: !isLiked, // 클릭 시 상태 반전
            },
            success: function (response) {
                console.log(response);
                if (response.updated) {
                    // 클라이언트에서 좋아요 상태 업데이트
                    likeButton.data("liked", !isLiked);

                    // 좋아요 수 업데이트
                    var likeCountElement = likeButton.find(".like-count");
                    var likeCount = parseInt(likeCountElement.text());

                    if (isLiked) {
                        // 클릭 전 상태가 좋아요일 때
                        likeCount--; // 좋아요 제거
                    } else {
                        // 클릭 전 상태가 좋아요가 아닐 때
                        likeCount++; // 좋아요 추가
                    }

                    likeCountElement.text(likeCount); // 좋아요 수 업데이트

                    // 이미지 업데이트
                    updateLikeButtonImage(likeButton, !isLiked);
                }
            },
            error: function () {
                // 에러 처리
            },
        });
    });

    // 이미지를 업데이트하는 함수
    function updateLikeButtonImage(likeButton, isLiked) {
        var likeImgSrc = isLiked ? 'hart1.png' : 'hart.png';
        likeButton.find("img").attr("src", "../../../resources/images/" + likeImgSrc);
    }


    $(document).on('click', '.bookmark-button', function () {
        var itemId = $(this).data("item-id");
        // 서버로 좋아요 토글 이벤트 전달
        $.ajax({
            url: '/insertBookmarkTraveling',
            method: 'POST',
            data: {
                itemId: itemId
            },
            success: function (response) {
                alert(response);
            },
            error: function () {
                // 에러 처리
            },
        });
    })

    // 데이터 필터링 함수
    function filterItems(category) {
        // console.log(category)
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

            // 로딩 스피너를 보이게 할 수 있음
            $('.loading-spinner').show();

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
                    // 로딩 스피너를 숨김
                    $('.loading-spinner').hide();
                    appendNewData(response);
                },
                error: function () {
                    isLoading = false;
                    // 에러 처리
                    // 로딩 스피너를 숨기는 코드는 여기에도 추가 가능
                },
            });
        }
    });


    // 초기 데이터 로드 여부를 확인할 변수
    let isInitialDataLoaded = false;

    // 스크롤 이벤트를 감지하여 무한 스크롤 동작
    $(window).on('scroll', function () {
        // 스크롤이 아래로 내려갔을 때 추가 데이터를 로드
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100 && !isLoading && isInitialDataLoaded) {
            // ... (이하 동일한 코드)
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

                // 초기 데이터가 로드되었음을 표시
                isInitialDataLoaded = true;
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
