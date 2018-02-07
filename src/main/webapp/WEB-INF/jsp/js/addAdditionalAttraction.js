
function repeatAdditionalAttraction(){
   var i = 0;
   var original = $('.additionalAttraction-row').first();

 var clone = original.clone(true);
 clone.class = "additionalAttraction-row" + ++i;

 var parent = original.parent();
 parent.append(clone).append;

       $('.additionalAttraction-row:last-child [data-toggle="datepicker"]').datepicker({
              language: 'pl-PL',
              autoPick: 'true'
          }
          );

       $(".additionalAttraction-row:last-child input.time_element").timepicki({
            show_meridian:false,
      		min_hour_value:0,
      		max_hour_value:23,
      		step_size_minutes:15,
      		overflow_minutes:true,
      		increase_direction:'up',
      		disable_keyboard_mobile: false,
                      start_time: ["12", "00", "PM"]
           });
  }


function removeAdditionalAttraction(){
$( ".additionalAttraction-row:last-child" ).remove();
}





