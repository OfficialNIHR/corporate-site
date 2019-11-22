$('#checkbox-price input:checkbox').change(function () {
    if (!$(this).is(':checked')) {
        $('.btn').css('text-decoration', 'line-through')
    } else {
        $('.btn').css('text-decoration', 'none')
    }
})