fetchNotifications();

function fetchNotifications() {
    $.ajax({
        type: "POST",
        url: "/selectNotification",
        success: function (response) {
            if(response.length==0){
                return;
            }else {
                response.forEach(function(item){
                    var hananoti = document.getElementById('noti');
                    var noti = document.createElement('span');
                    noti.className = 'notification';
                    noti.textContent = response.length;
                    hananoti.appendChild(noti);
                    var dataToSend = {
                        groupId : item.group_id,
                        travelId : item.travel_id
                    };
                    $.ajax({
                        url: '/selectTravelNoti',
                        method: "POST",
                        data: JSON.stringify(dataToSend),
                        contentType: "application/json; charset=UTF-8",
                        success: function (response) {
                            console.log(response);
                        },
                        error: function (error) {
                            console.error("Error occurred:", error);
                        }
                    });
                })
            }
        },
        error: function (error) {
            console.error(error);
        },
    });
}

const modal = document.getElementById('myModal');
const openModalBtn = document.getElementById('openModalBtn');
const closeModalBtn = document.querySelector('.close');

function openModal() {
    modal.style.display = 'block';
}

function closeModal() {
    modal.style.display = 'none';
}

closeModalBtn.addEventListener('click', closeModal);
window.addEventListener('click', (e) => {
    if (e.target === modal) {
        closeModal();
    }
});

function performLogout() {
    var kakaoLogoutUrl = "https://kauth.kakao.com/oauth/logout?client_id=951e0627da48ee51855b252517b6352d&logout_redirect_uri=http://localhost:8080/logout";
    window.location.href = kakaoLogoutUrl;
};
function performLogin() {
    window.location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=951e0627da48ee51855b252517b6352d&redirect_uri=http://localhost:8080/api/social/login/kakao&response_type=code';
};

const ttext = document.querySelector('.ttext');
const mtext = document.querySelector('.mtext');
const bbutton = document.querySelector('.bbutton');

const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('show');
            observer.unobserve(entry.target);
        }
    });
});

observer.observe(ttext);
observer.observe(mtext);
observer.observe(bbutton);


