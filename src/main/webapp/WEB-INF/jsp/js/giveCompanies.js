$(document).ready(function () {
    updateCompanySelect();

    $('#saveNewCompany').click(function (e) {
        e.preventDefault();
      //  console.log($('form[name=addCompanyForm]').serialize());

        $.post({
            url: '/company/add',
            data: $('form[name=addCompanyForm]').serialize(),
            success: function (res) {
                // console.log('data '+data);

                if (res.validated) {
                    //Set response
                  //  console.log(JSON.stringify(res.company));
                    updateCompanySelect();
                    
                    $('#newCompanyFormWrapper input').val("");
                    $('#companyAddSuccess').slideDown().delay(1500).slideUp('slow');


                } else {
                    //Set error messages
                    $('#companyAddFail').empty();
                    var errors = "";
                    $.each(res.errorMessages, function (key, value) {
              
                        errors += value +'<br>';
                   
                    });
                    $('#companyAddFail').append(errors);
                    $('#companyAddFail').slideDown();
                    $('#companyAddFail').slideDown().delay(2500).slideUp('slow');
                     
                }
            }
        });
    });
    
    
     $('#saveCompany').click(function (e) {
        e.preventDefault();
       // console.log($('form[name=editCompanyForm]').serialize());

        $.post({
            url: '/company/add',
            data: $('form[name=editCompanyForm]').serialize(),
            success: function (res) {
                // console.log('data '+data);

                if (res.validated) {
                    //Set response
                   // console.log(JSON.stringify(res.company));
                    updateCompanySelect();
                    // $('#newCompanyFormWrapper input').val("");
                    $('#companyEditSuccess').slideDown().delay(1500).slideUp('slow');

                } else {
                    $('#companyEditFail').empty();
                    //Set error messages
                     var errors = "";
                    $.each(res.errorMessages, function (key, value) {
                      errors += value +'<br>';
                    });
                    
                     $('#companyEditFail').append(errors);
                    $('#companyEditFail').slideDown();
                    
                    $('#companyEditFail').slideDown().delay(2500).slideUp('slow');
                   
                    
                }
            }
        });
    });




    function updateCompanySelect() {
        giveCompaniesAjax();

    }

    function giveCompaniesAjax() {
       // console.log('Daje firmy!');
        var companies = null;
        var options;
        var companySelector = $('#companySelect');
        
        companySelector.empty();
        $.ajax({
            url: 'company',
            dataType: 'json',

            success: function (json) {
                jQuery.each(json, function (i, ob) {
                   // console.log(i + "  " + ob.name);
                    options += '<option value="' + ob.id + '">' + ob.name + '</option>';
                    companySelector.append(new Option(ob.name, ob.id));
                });
               // console.log("Liczba firm: " + options.length);
                $('.chosen-select').chosen(
                        {
                            allow_single_deselect: true

                        });                       
                        companySelector.trigger("chosen:updated");
            },

            error: function () {
                $('#result').html("Error!");
            }
        });
    }

    $('#but').click(function () {
        //console.log('klik!');
        giveCompaniesAjax();
    })
    
    
    
    
    
    
    
    
    


});


