
//3자리 단위마다 dot 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

//모든 dot 제거
function removeCommas(x) {
    if (!x || x.length == 0) return "";
    else return x.split(".").join("");
}


$("input.score-input").on("focus", function () {
    var x = $(this).val();
    x = removeCommas(x);
    $(this).val(x);
}).on("focusout", function () {
    var x = $(this).val();
    if (x && x.length > 0) {
        if (!$.isNumeric(x)) {
            x = x.replace(/[^0-9]/g, "");
        }
        x = addCommas(x);
        $(this).val(x);
    }
}).on("keyup", function () {
    $(this).val($(this).val().replace(/[^0-9]/g, ""));
});
