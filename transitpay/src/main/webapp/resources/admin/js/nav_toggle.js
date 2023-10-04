$(document).ready(function () {
    var toggleNavClass = 'is-open',
        openNavWidth = 300,
        closeNavWidth = 120,
        header = $('.header'),
        topTitle = $('.contents-header'),
        contents = $('.contents'),
        toggleNavBtn = $('.gnb-toggle-btn');

    toggleNavBtn.on('click', function () {
        if (header.hasClass(toggleNavClass)) {
            header.removeClass(toggleNavClass);
            contents.stop().animate({ 'margin-left': closeNavWidth }, 250);
            topTitle.stop().animate({ 'padding-left': closeNavWidth + 20 }, 250);
        } else {
            header.addClass(toggleNavClass);
            contents.stop().animate({ 'margin-left': openNavWidth }, 250);
            topTitle.stop().animate({ 'padding-left': openNavWidth + 20 }, 250);
        }
    });
});


