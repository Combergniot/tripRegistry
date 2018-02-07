    /*Chosen*/
   
    
    
    
    
    
//     $('.chosen-search input').autocomplete({
//    minLength: 3,
//    source: function( request, response ) {
//        $.ajax({
//            url: "/some/autocomplete/url/"+request.term,
//            dataType: "json",
//            beforeSend: function(){ $('ul.chosen-results').empty(); $("#CHOSEN_INPUT_FIELDID").empty(); }
//        }).done(function( data ) {
//                response( $.map( data, function( item ) {
//                    $('#CHOSEN_INPUT_FIELDID').append('<option value="blah">' + item.name + '</option>');
//                }));
//
//               $("#CHOSEN_INPUT_FIELDID").trigger("chosen:updated");
//        });
//    }
//});