$( document ).ready(function() {

    $('.ui.form')
         .form({
             fields:{
                 first_name: {
                     identifier: 'first_name',
                     rules: [
                        {
                             type   : 'empty',
                             prompt : 'Please enter a first name'
                         }
                    ]
                 },
                 password:{
                     identifier:'password',
                     rules:[

                         {
                             type   : 'empty',
                             prompt : 'Please enter a password'
                         },
                     ]
                 },
                 confirm_password:{
                     identifier:'confirm_password',
                     rules:[

                         {
                             type   : 'empty',
                             prompt : 'Please confirm the new password'
                         },
                         {
                             type   : 'match[password]',
                             prompt : 'Passwords do not match'
                         },
                     ]
                 },
                 current_password:{
                     identifier:'current_password',
                     rules:[

                         {
                             type   : 'empty',
                             prompt : 'Please enter your current password'
                         },
                     ]
                 },
                 new_password:{
                     identifier:'new_password',
                     rules:[

                         {
                             type   : 'empty',
                             prompt : 'Please enter your new password'
                         },
                     ]
                 },

                 confirm_new_password:{
                     identifier:'confirm_new_password',
                     rules:[

                         {
                             type   : 'empty',
                             prompt : 'Please confirm your current password'
                         },
                         {
                             type   : 'match[new_password]',
                             prompt : 'Passwords do not match'
                         },
                     ]
                 },
                last_name: {
                    identifier: 'last_name',
                    rules: [
                        {
                            type   : 'empty',
                            prompt : 'Please enter a last name'
                        }
                    ]
                },
                email: {
                    identifier: 'email',
                    rules: [
                        {
                            type   : 'empty',
                            prompt : 'Please enter an email address'
                        },
                        {
                            type   : 'email',
                            prompt : 'Please enter a valid email'
                        }
                    ]
                },
                uin: {
                    identifier: 'uin',
                    rules: [
                        {
                            type   : 'empty',
                            prompt : 'Please enter your UIN'
                        },
                        {
                            type   : 'regExp[/^[0-9_-]{9,9}$/]',
                            prompt : 'UIN must exactly be 9 digits'
                        }
                    ]
                },
                gpa: {
                    identifier: 'gpa',
                    rules: [
                        {
                            type   : 'empty',
                            prompt : 'Please enter your GPA'
                        },
                        {
                            type   : 'decimal',
                            prompt : 'Please enter a valid decimal GPA'
                        }
                    ]
                },
                phone_number: {
                    identifier: 'phone_number',
                    rules: [
                        {
                            type   : 'empty',
                            prompt : 'Please enter your phone number'
                        },
                        {
                            type   : 'regExp[/^[0-9_-]{10,10}$/]',
                            prompt : 'Phone number must be exactly 10 digits'

                        }
                    ]
                },
                graduation_date: {
                    identifier: 'graduation_date',
                    rules: [
                        {
                            type   : 'empty',
                            prompt : 'Please enter your graduation year'
                        },
                        {
                            type   : 'regExp[/^[0-9_-]{4,4}$/]',
                            prompt : 'Graduation date must be exactly 4 digits'
                        }
                    ]
                },
                csce_classes: {
                    identifier  : 'csce_class[]',
                    rules: [
                        {
                            type   : 'minCount[1]',
                            prompt : 'Please select at least 1 class you can peer teach for'
                        }
                    ]
                },
                picture: {
                    identifier: 'picture',
                    rules: [
                        {

                            type   : 'url',
                            prompt : 'Please enter a valid url for your picture'

                        },
                        {
                            type   : 'contains[https://drive.google.com/file/d/]',
                            prompt : 'Your url  is not a valid google drive sharing link for your picture'

                        },
                        {
                            type   : 'contains[/view?usp=sharing]',
                            prompt : 'Your url is still not a valid google drive sharing link for your picture'

                        }
                    ]
                },
                schedule: {
                    identifier: 'schedule',
                    rules: [
                        {
                            type   : 'url',
                            prompt : 'Please enter a valid url for your schedule'

                        },
                        {
                            type   : 'contains[https://drive.google.com/file/d/]',
                            prompt : 'Your url  is not a valid google drive sharing link for your schedule'

                        },
                        {
                            type   : 'contains[/view?usp=sharing]',
                            prompt : 'Your url is still not a valid google drive sharing link for your schedule'

                        }
                    ]
                },transcript: {
                    identifier: 'transcript',
                    rules: [
                        {
                            type   : 'url',
                            prompt : 'Please enter a valid url for your transcript'

                        },
                        {
                            type   : 'contains[https://drive.google.com/file/d/]',
                            prompt : 'Your url  is not a valid google drive sharing link for your transcript'

                        },
                        {
                            type   : 'contains[/view?usp=sharing]',
                            prompt : 'Your url is still not a valid google drive sharing link for your transcript'

                        }
                    ]
                },resume: {
                    identifier: 'resume',
                    rules: [
                        {
                            type   : 'url',
                            prompt : 'Please enter a valid url for your resume'

                        },
                        {
                            type   : 'contains[https://drive.google.com/file/d/]',
                            prompt : 'Your url  is not a valid google drive sharing link for your resume'

                        },
                        {
                            type   : 'contains[/view?usp=sharing]',
                            prompt : 'Your url is still not a valid google drive sharing link for your resume'

                        }
                    ]
                },

             }
         });


    //---------------------------------------


    $('.jiggleMessage')
        .transition('jiggle')
    ;
    //---------------------------------------

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