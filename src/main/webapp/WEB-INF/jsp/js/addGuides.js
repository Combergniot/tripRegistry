
    var i = 0;
    function repeatTour() {
        var original = $('.tour-row').first();
        //original.find('select[name="pilotname[0]"]').addClass('selectpicker');
        var clone = original.clone(true);
        var parent = original.parent();
        i++;
        parent.append(clone).append;
        clone.find('#guides').attr("id", "guides" + i);
        clone.find('select[name="pilotname[0]"]').attr('name', "pilotname[" + i + "]");
        clone.find('#additionalAttraction').attr("id", "attractions" + i);
        clone.find('select[name="attractions[0]"]').attr('name', "attractions[" + i + "]");
    }
    function removeTour() {
        $(".tour-row:last-child").remove();
    }
