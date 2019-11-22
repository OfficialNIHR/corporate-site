var ToC =
    "<nav role='navigation' class='table-of-contents' id='contents'>" +
    "<h2>Contents</h2>" +
    "<ol>";

var newLine, el, title, link;

$("article h3").each(function () {

    el = $(this);
    title = el.text();
    link = "#" + el.attr("id");

    newLine =
        "<li>" +
        "<span><a href='" + link + "'>" +
        title +
        "</a></span>" +
        "</li>";

    ToC += newLine;

});

ToC +=
    "</ol>" +
    "<div class='back-to-top'><button id='myBtn'><i class='arr-up'></i><span class='back-label'><a href='#contents'>Back to contents</a></span></button></div>" +
    "</nav>";

$(".html-document-body").prepend(ToC);