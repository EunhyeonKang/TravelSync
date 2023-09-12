// 페이지가 로드되면 애니메이션 및 메뉴바 처리 시작
window.onload = function() {
    // rightContent 요소를 찾습니다.
    const rightContent = document.querySelector('.rightContent');

    // rightContent 요소에 show 클래스를 추가하여 천천히 나타나는 애니메이션을 시작합니다.
    rightContent.classList.add('show');
    // 왼쪽 컨텐츠들에 대한 애니메이션 적용
    var contents = document.querySelectorAll('.leftContent, .leftContent-2, .mytravel');
    var animationDelay = 150; // 애니메이션 간격 (0.5초)

    for (var i = 0; i < contents.length; i++) {
        contents[i].style.transition = "left 1.0s cubic-bezier(.39, .575, .565, 1.000)";
        contents[i].style.left = "0";
        contents[i].style.padding = "3px";
        contents[i].style.fontWeight = 'bolder';
        contents[i].style.opacity = "1";
        contents[i].style.transitionDelay = animationDelay * i + "ms";
    }

    // 스크롤 이벤트를 감지하여 메뉴바를 추가/제거하는 함수
    var navbarFixed = document.querySelector('.navbar-fixed');
    function handleScroll() {
        if (window.pageYOffset >= 600) {
            navbarFixed.style.display = 'flex'; // 메뉴바를 보이도록 설정
        } else {
            navbarFixed.style.display = 'none'; // 메뉴바를 숨기도록 설정
        }
    }

    // 스크롤 이벤트를 바인딩
    window.addEventListener('scroll', handleScroll);

    // 페이지 로딩 시 한 번 실행하여 초기 상태를 설정
    // handleScroll();
    // tid = setInterval(msg_time, 1000);
};



// 타이머
/*
var SetTime = 120; // 최초 설정 시간(기본 : 초)

function msg_time() {
    var targetElement = document.getElementById('ViewTimer');

    if (!targetElement) {
        console.error("Element with ID 'ViewTimer' not found.");
        return;
    }

    m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";
    var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
    targetElement.innerHTML = msg;

    SetTime--;

    if (SetTime < 0) {
        clearInterval(setInterval(msg_time, 1000));
        //alrt('종료')
    }
}*/