$( document ).ready(function() {

    $('.ui.sticky.one').sticky({
        context: '#context',
    });

    //---------------------------------------

    $('.ui.sticky.two').sticky({
        context: '#context',
        offset:100,
        jitter:0
    });

    //---------------------------------------

    $('.message .close')
        .on('click', function() {
            $(this)
                .closest('.message')
                .transition('fade');
        });
    //---------------------------------------
    $('.ui.accordion')
        .accordion({
            selector: {
                trigger: '.title '
            }
        });
    //---------------------------------------
    $('.ui.radio.checkbox').checkbox();
    //---------------------------------------

    $('select.dropdown').dropdown();
    //---------------------------------------


    //---------------------------------------

});