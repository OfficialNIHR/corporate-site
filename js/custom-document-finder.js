//REFERRER
function docFinderTestReferrer() {
    var refVal = document.referrer;
    var op = ''
    if (refVal.match('search=')) {
        op = refVal.substr(refVal.indexOf('search=') + 7);
        if (op.indexOf('&') != -1) {
            op = op.substr(0, op.indexOf('&'));
        }
        op = op.replace(/%20/g, ' ');
        op = op.replace(/%27/g, '\'');
        $('.docFinderSearchHeaderWrapper input').val(op);
    }
    docFinderSearch();
}

//SEARCH
function docFinderClearSearch(clearVal) {
    if (clearVal == 1) {
        $('.docFinderSearchHeaderWrapper input').val('');
    }
    $('.docFinderSearchResultsWrapper').slideUp(200, function () {
        $('.docFinderSearchResultsWrapper').html('');
        $('.docFinderSearchResultsWrapper').css('display', 'block');
    });
    $('div#docFinderClearSearch').animate({
        top: -26 + 'px'
    }, 200);
}

function docFinderSearch() {
    var inputVal = $('.docFinderSearchHeaderWrapper input').val();
    var OP = '';
    var testString = new Array();
    if (inputVal.length > 2) {
        $('.docFinderSearchResultsWrapper').html('');
        $('div#docFinderClearSearch').animate({
            top: 0 + 'px'
        }, 200);
        inputVal = inputVal.toLowerCase();
        $('.fileItemRight').each(function () {
            testString[0] = $(this).children('h3').children('a').text().toLowerCase();
            testString[1] = $(this).children('p:eq(0)').text().toLowerCase();
            testString[2] = $(this).children('p:eq(1)').text().toLowerCase();
            if (testString[0].match(inputVal)) {
                OP = OP + '<div class="docFinderSearchResultItem">' + $(this).parent().html() + '</div>';
            } else
            if (testString[1].match(inputVal)) {
                OP = OP + '<div class="docFinderSearchResultItem">' + $(this).parent().html() + '</div>';
            } else
            if (testString[2].match(inputVal)) {
                OP = OP + '<div class="docFinderSearchResultItem">' + $(this).parent().html() + '</div>';
            }
        });
        if (OP == '') {
            OP = '<div class="docFinderSearchResultItem"><div class="docFinderSearchNoResults"><p>no results found</p></div></div>';
        }
        $('.docFinderSearchResultsWrapper').html(OP);
    } else {
        docFinderClearSearch();
    }
}

//TABS
var docFinderCurTab = -1;

function docFinderChangeTab(sender) {
    if (sender != docFinderCurTab) {
        docFinderCurTab = sender;
        $('.docFinderTabItemInner').slideUp(400);
        $('.docFinderTabSelected').removeClass('docFinderTabSelected');
        $('.docFinderTabItemInner:eq(' + sender + ')').slideDown(400, function () {
            $('.docFinderTabItem h2:eq(' + sender + ')').addClass('docFinderTabSelected');
        });
    } else {
        docFinderCurTab = -1;
        $('.docFinderTabSelected').removeClass('docFinderTabSelected');
        $('.docFinderTabItemInner').slideUp(400);
    }
}

//SETUP
function docFinderSetup() {
    $('.docFinderSearchWrapper').css('display', 'block');
    $('.docFinderTabItemInner').css('display', 'none');
    $('.docFinderTabItem h2').css('cursor', 'pointer');
    $('.docFinderTabItem h2').click(function () {
        docFinderChangeTab($(this).parent().index());
    });
    $('.docFinderSearchHeaderWrapper input').keyup(function (event) {
        docFinderSearch();
    });
    $('div#docFinderClearSearch').click(function () {
        docFinderClearSearch(1);
    });
    docFinderTestReferrer();
}
$(document).ready(function () {
    docFinderSetup();
});