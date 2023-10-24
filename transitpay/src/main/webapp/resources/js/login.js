$("#login2").click(function() {
    var idInput = document.querySelector('input[name="id"]').value;
    var pwInput = document.querySelector('input[name="pw"]').value;

    var member = {
        email : idInput,
        pw : pwInput
    }

    $.ajax({
        type: "POST",
        url: "/loginMember",
        data: JSON.stringify(member),
        contentType: "application/json",
        success: function(response) {
            location.href = '/';
        },
        error: function(error) {
            console.error("로그인 실패 : ", error);
        }
    });
});