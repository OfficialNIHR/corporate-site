function detectIE() {
    if (navigator.userAgent.match(/Trident.*rv:11\./)) {
        $('body').addClass('ie11');
    }
}

detectIE();