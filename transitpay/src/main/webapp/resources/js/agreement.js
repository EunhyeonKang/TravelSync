const agreeChkAll = document.querySelector('input[name=chkAll]');
agreeChkAll.addEventListener('change', (e) => {
    let agreeChk = document.querySelectorAll('input[name=chk]');
    for(let i = 0; i < agreeChk.length; i++){
        agreeChk[i].checked = e.target.checked;
    }
});
function toggleAgreement(targetId) {
    const agreements = document.querySelectorAll('.agreeDetail');의
    for (let agreement of agreements) {
        agreement.style.display = 'none';
    }
    const targetAgreement = document.getElementById(targetId);
    targetAgreement.style.display = 'block';
}

const plusButtons = document.querySelectorAll('.plusButton');
plusButtons.forEach((plusButton) => {
    plusButton.addEventListener('click', function () {
        const targetId = this.getAttribute('data-target');
        const agreeDetail = document.getElementById(targetId);

        if (agreeDetail.style.display === 'block') {
            agreeDetail.style.display = 'none';
            plusButton.innerHTML = '&#43;';
        } else {
            agreeDetail.style.display = 'block';
            plusButton.innerHTML = '&#45;';
        }
    });
});

function closeModal() {
    var modal = document.getElementById('myModal');
    modal.style.display = 'none';
}

