 jQuery(document).ready(function ($) {
     
     $('#cloneMealsButton').click(repeatMeals);
     $('#removeMealsButton').click(removeMeals);



      function repeatMeals(){

       var i = 0;
       var original = $('.dinner-row').first();

      var clone = original.clone(true);
      clone.class = "dinner_row" + ++i;

      var parent = original.parent();
      //console.log(parent);
      parent.append(clone).append;


      $('.dinner-row:last-child [data-toggle="datepicker"]').datepicker({
             language: 'pl-PL',
             autoPick: 'true'
         }
         );

      $('.dinner-row:last-child input.time_element').timepicki({
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

     function removeMeals(){
     $( ".dinner-row:last-child" ).remove();
     }

     });




