var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
    element_layer.style.display = 'none';
}

function findAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }

                document.getElementById("sample2_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample2_extraAddress").value = '';
            }


            document.getElementById("address").value = addr;

            document.getElementById("detailAddress").focus();

            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%',
        maxSuggestItems : 5
    }).embed(element_layer);


    element_layer.style.display = 'block';


    initLayerPosition();
}

function initLayerPosition(){
    var width = 300;
    var height = 400;
    var borderWidth = 5;


    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}
function previewImage(f){

    var file = f.files;

    // 확장자 체크
    if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
        alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

        // 선택한 파일 초기화
        f.outerHTML = f.outerHTML;

        document.getElementById('imagePreview').innerHTML = '';

    }
    else {
        var reader = new FileReader();

        reader.onload = function(rst){
            document.getElementById('imagePreview').innerHTML = '<img class="targetimg" src="' + rst.target.result + '">';
        }

        reader.readAsDataURL(file[0]);

    }
}


$(function(){
    $(".step").eq(0).show();
})
$(".next").click(function(){
    if($(".requiredAgree:checked").length == 3) {
        $(".step").hide();
        $(".step").eq(1).show();
        $(".tab").eq(0).css("color","#009688");
        $(".tab").eq(0).css("background-color","#fff");
        $(".tab").eq(1).css("color","#fff");
        $(".tab").eq(1).css("background-color","#009688");
    }else{
        alert("필수항목을 체크해주세요");
    }
})
$("#allAgree").change(function(){
    $(".requiredAgree").prop("checked",$(this).prop("checked"));
    $(".agree").prop("checked",$(this).prop("checked"));
})

var passwordInput = document.getElementById("password");
var confirmPasswordInput = document.getElementById("confirmPassword");
var messageElement = document.getElementById("message");

passwordInput.addEventListener("keyup", function() {
    checkPassword();
});

confirmPasswordInput.addEventListener("keyup", function() {
    checkPassword();
});

function checkPassword() {
    var password = passwordInput.value;
    var confirmPassword = confirmPasswordInput.value;

    if (password === confirmPassword) {
        messageElement.textContent = "비밀번호가 일치합니다.";
        messageElement.style.color = "green";
    } else {
        messageElement.textContent = "비밀번호가 일치하지 않습니다.";
        messageElement.style.color = "red";
    }
}