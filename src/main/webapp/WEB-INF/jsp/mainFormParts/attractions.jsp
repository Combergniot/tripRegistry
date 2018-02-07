<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<legend id="anch5" class="">Atrakcje</legend>

<script type="text/javascript">
    $(document).ready(function () {

        $(".mainAttractionChained:first-child").chainedTo(".mainAttractionSelector:first-child");
    });
</script>
<div id="mainAttractionType">
    <div class="attraction-row">
        <div class="row">
         <label class="col-lg-1 control-label mainAttractionSelector">Rodzaj:</label>
            <!--Atrakcje: Główne atrakcje -->
            <div class="col-lg-5  guide-selector">
                <select class="form-control mainAttractionSelector" name="mainAttractionType"
                        data-placeholder="Wybierz atrakcję...">
                    <option value=""></option>
                    <option value="planetarium">Planetarium</option>
                    <option value="piernikarnia">Piernikarnia</option>
                    <option value="rejs">Rejs po Wiśle</option>
                    <option value="fort">Fort</option>
                    <option value="mlyny">Młyny Wiedzy</option>
                    <option value="muzeum">Muzeum</option>
                    <option value="olbracht">Olbracht</option>
                    <option value="zamek">Zamek Krzyżacki</option>
                </select>
            </div>
            <!-- Atrakcje: szzcegóły -->
            <div class="col-lg-5 col-lg-offset-1">
                <select id="mainAttractionChained" class="form-control mainAttractionChained" name="mainAttractionChained"
                        data-placeholder="Wybierz...">
                    <option value="0" selected disabled>Szczegóły atrakcji</option>
                    <option value="1" class="planetarium">Planetarium - seans</option>
                    <option value="2" class="planetarium">Geodium</option>
                    <option value="3" class="planetarium">Orbitarium</option>
                    <option value="4" class="piernikarnia">Piernikarnia Doroty</option>
                    <option value="5" class="piernikarnia">Muzeum Toruńskiego Piernika</option>
                    <option value="6" class="piernikarnia">Żywe Muzeum Piernika</option>
                    <option value="7" class="rejs">Wanda</option>
                    <option value="8" class="rejs">Katarzynka</option>
                    <option value="9" class="rejs">Łodzie Flisacze</option>
                    <option value="10" class="fort">Zwiedzanie - strój</option>
                    <option value="11" class="fort">Zwiedzanie - cywil</option>
                    <option value="12" class="fort">Zwiedzanie z duchami</option>
                    <option value="13" class="fort">Ognisko z kiełbaskami</option>
                    <option value="14" class="fort">Podchody</option>
                    <option value="15" class="fort">Gry i zabawy</option>
                    <option value="16" class="mlyny">Zwiedzanie</option>
                    <option value="17" class="mlyny">Warsztaty</option>
                    <option value="18" class="muzeum">Ratusz</option>
                    <option value="19" class="muzeum">Dom Mikołaja Kopernika</option>
                    <option value="20" class="muzeum">Dom Eskenów</option>
                    <option value="21" class="muzeum">Kamienica pod Gwiazdą</option>
                    <option value="22" class="muzeum">Muzeum Podróżników im. T.Halika</option>
                    <option value="23" class="muzeum">Muzeum Toruńskiego Piernika</option>
                    <option value="24" class="zamek">Zwiedzanie</option>
                    <option value="25" class="zamek">Komturia</option>
                    <option value="26" class="zamek">Pokaz walk</option>
                    <option value="27" class="olbracht">Degustacja</option>
                    <option value="28" class="olbracht">Zwiedzanie</option>
                    <option value="29" class="olbracht">Zakąski</option>
                </select>
            </div>
        </div>
        <div class="row">
            <!-- Atrakcje: Data i godzina -->
            <label class="col-lg-1 control-label guide-selector"> Data:</label>
            <div class="col-lg-3 guide-selector"><input class="form-control" name="mainAttractionDate" id="attraction-date" data-toggle="datepicker" ></div>
            <label class="col-lg-1 control-label guide-selector"> Od:</label>
            <div class="col-lg-3 guide-selector"><input class="form-control time_element" name="mainAttractionTimeStart" id="attraction-time-start" value="12:00"></div>
            <label class="col-lg-1 control-label guide-selector">Do:</label>
            <div class="col-lg-3 guide-selector"><input class="form-control time_element" name="mainAttractionTimeEnd" id="attraction-time-end" value="12:00"></div>
        </div>
        <div class="row">
            <div class="col-lg-11 col-lg-offset-1 guide-selector">
                <textarea name="mainAttractionRemarks" class="form-control" id="textarea" class="form-control input-md" placeholder="Uwagi..."></textarea>
            </div>
        </div>
        <hr>
    </div>
    <div class="row">
        <div class="col-lg-12 text-right">
            <button class="btn btn-success" type="button" onclick="repeatAttraction()"> <span class="glyphicon glyphicon-plus" aria-hidden="true">
                </span> Dodaj atrakcję</button>
            <button class="btn btn-danger" type="button" onclick="removeAttraction()"><span class="glyphicon glyphicon-minus"aria-hidden="true">
                </span> Usuń</button>
        </div>
    </div>
    <hr>
</div>

<script src="resources/js/addMainAttraction.js"></script>