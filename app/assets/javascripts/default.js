$( document ).ready(function() {

    $('.ui.sticky.one').sticky({
        context: '#context',
    });

    //---------------------------------------

    $('.ui.sticky.two').sticky({
        context: '#context',
        offset:140,
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
    $('.tabular.menu .item').tab({
        alwaysRefresh : true
    });

    // //---------------------------------------

    //$('.hourglass').transition('looping').transition({animation:'flash',duration:3000,interval:200});
    $('.hourglass').transition('flash',8000)




});