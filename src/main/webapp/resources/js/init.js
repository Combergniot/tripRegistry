jQuery(document).ready(function ($) {

    // populate add guide to trip modal on trip details page
    $("a[data-toggle=modal]#showAddGuide").click(function(){
        var sightseeingId = $(this).data('id');
        $("#sightseeingId").val(sightseeingId);

    });

    // initailize datepicker
    $('[data-toggle="datepicker"]').datepicker({
        language: 'pl-PL',
        autoPick: 'true'
    }
    );

    // initailize timepicki
     $('.time_element').timepicki({
         show_meridian:false,
		min_hour_value:00,
		max_hour_value:23,
		step_size_minutes:15,
		overflow_minutes:true,
		increase_direction:'up',
		disable_keyboard_mobile: false,
                start_time: ["12", "00", "PM"]
     });


    // set value of other pickers with first picker
    $("#tripStartDate").change(function () {
        var dateToSet = $("#tripStartDate").val();

        $('#tripEndDate').datepicker('setDate', dateToSet);
        $('#registration-date').datepicker('setDate', dateToSet);
        $('#attractionDate').datepicker('setDate', dateToSet);
        $('#additional-attraction-date').datepicker('setDate', dateToSet);
        $('#accomodation-date-start').datepicker('setDate', dateToSet);
        $('#accomodation-date-end').datepicker('setDate', dateToSet);
        $('#feed-date').datepicker('setDate', dateToSet);
        $('#attraction-date').datepicker('setDate', dateToSet);


        // chuj wie po co to było, precz
 $("#groupType").on("invalid", function(e) {
     e.prventDefault();
        //find tab id           
       // var element = $(this).closest('.ui-tabs-panel').index();
         //goto tab id
       // $('#yourTabs').tabs('option', 'active', element)
       console.log('invalid!');
 });

    });

     $("#tripEndDate").change(function () {
     var dateToSet = $("#tripEndDate").val();
     $('#accomodation-date-end').datepicker('setDate', dateToSet);
    });

});