<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<legend id="anch6" class="">Niestandardowe atrakcje</legend>
<div id="mainAttractionType">
<div class="additionalAttraction-row">

    <div class="row">
     <label class="col-lg-1 control-label ">Rodzaj:</label>
        <!--Atrakcje: Główne atrakcje -->
        <div class="col-lg-5  guide-selector">

         <select id="additionalAttractionType" class="form-control" name="additionalAttractionType"
                    data-placeholder="Wybierz atrakcję...">
        <option></option>
        <option>Bunkier Wisła</option>
        <option>Dom Legend</option>
        <option>Katedra</option>
        <option>Mała chemia</option>
        <option>Manufaktura cukierków</option>
        <option>Motoarena</option>
        <option>Muzeum Etnograficzne</option>
        <option>Muzeum piśmiennictwa i druku w Grębocinie</option>
        <option>Muzeum zabawek</option>
        <option>Obserwatorium astronomiczne w Piwnicach</option>
        <option>Solec Kujawski</option>
        <option>ZOO</option>
        <option>Inna...</option>
            </select>
        </div>
    </div>
    <div class="row">
        <!-- Atrakcje niestandardowe: Data i godzina -->
        <label class="col-lg-1 control-label guide-selector"> Data:</label>
        <div class="col-lg-3 guide-selector"><input class="form-control" name="addAttractionDate" id="additional-attraction-date" data-toggle="datepicker" ></div>
        <label class="col-lg-1 control-label guide-selector"> Od:</label>
        <div class="col-lg-3 guide-selector"><input class="form-control time_element" name="addAttractionTimeStart" id="attraction-time-start" value="12:00"></div>
        <label class="col-lg-1 control-label guide-selector">Do:</label>
        <div class="col-lg-3 guide-selector"><input class="form-control time_element" name="addAttractionTimeEnd" id="attraction-time-end" value="12:00"></div>
    </div>
    <div class="row">
        <div class="col-lg-11 col-lg-offset-1 guide-selector">
            <textarea name="addAttractionRemarks" class="form-control" id="textarea" class="form-control input-md" placeholder="Uwagi..."></textarea>
        </div>
    </div>
    <hr>
    <!--end of attraction-->
    </div>

<div class="row">
    <div class="col-lg-12 text-right">
    <button class="btn btn-success" type="button" onclick="repeatAdditionalAttraction()"> <span class="glyphicon glyphicon-plus" aria-hidden="true">
    </span> Dodaj niestandardową atrakcję</button>

    <button class="btn btn-danger" type="button" onclick="removeAdditionalAttraction()"><span class="glyphicon glyphicon-minus" aria-hidden="true">
    </span> Usuń</button>
    </div>
</div>

</div>

<script src="resources/js/addAdditionalAttraction.js"></script>