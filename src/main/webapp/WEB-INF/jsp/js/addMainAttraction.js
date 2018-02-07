
    var mainAttractions = $('.mainAttractionSelector:first-child option');
    var detailedAttractions = $('.mainAttractionChained:first-child option');
    var i = 0;
    console.log('reload!');

    function repeatAttraction() {


//alert(myOpts[1].value) //=> Value of the first option

        i++;
        console.log('current id is ' + i);
        var original = $('.attraction-row').first();
        console.log('klonuje atrakcje');
        //  console.log(original);

        var clone = original.clone(true);

        clone.find('select.mainAttractionSelector').attr("id", "mainAttractionSelector" + i)
        clone.find('select.mainAttractionChained').attr("id", "mainAttractionChained" + i);


        var parent = original.parent();
        //console.log(parent);
        parent.append(clone).append;

        $('#mainAttractionChained' + i).find('option').remove();

        $.each(detailedAttractions, function (val, text) {
            $('#mainAttractionChained' + i).append(text);

        });

        $('#mainAttractionChained' + i).hide().show();

        $("#mainAttractionChained" + i).chainedTo($("#mainAttractionSelector" + i));



    }

    function removeAttraction() {
        $(".attraction-row:last-child").remove();
    }