<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!-- Wyżywienie -->
<legend id="anch7" class="">Wyżywienie</legend>      
<div id="dinner_fields">
    <div class="dinner-row">
        <div class="row">
         <label class="col-lg-1 control-label ">Rodzaj:</label>
            <!--Wyżywienie: typ posiłku -->
            <div class="col-lg-4  guide-selector">
                <select name="mealsType" class="form-control" id="mealsType" placeholder="Typ posiłku...">
                    <option value="0" disabled selected>Typ posiłku...</option>
                    <option value="śniadanie">Śniadanie</option>
                    <option value="obiad">Obiad</option>
                    <option value="kolacja">Kolacja</option>
                </select>
            </div>
            <div class="col-md-4 guide-selector">
                <select name="feedingPlace" class="form-control" id="restaurants" data-placeholder="Wybierz
                        miejsce...">
                    <option value="0"></option>
                    <option>Chleb i wino</option>
                    <option>Ciasna</option>
                    <option>Ciżemka</option>
                    <option>Fort IV</option>
                    <option>Gessler "U Kucharzy"</option>
                    <option>Gęsia Szyja</option>
                    <option>Jan Olbracht Browar Staromiejski</option>
                    <option>Jimmy's Steakhouse</option>
                    <option>Karczma Spichrz</option>
                    <option>Kuranty</option>
                    <option>Luizjana</option>
                    <option>Manekin</option>
                    <option>MCSM</option>
                    <option>Metropolis</option>
                    <option>Mistrz i Małgorzata</option>
                    <option>Oberża</option>
                    <option>Odessa</option>
                    <option>Osetia</option>
                    <option>Piąta Klepka</option>
                    <option>Prowansja</option>
                    <option>Pueblo</option>
                    <option>Róża i Zen</option>
                    <option>Sowa</option>
                    <option>Staromiejska</option>
                    <option>Szeroka No 9</option>
                    <option>Inne...</option>
                </select>
            </div>
        </div>
        <div class="row">
            <!-- Posilek: Data i godzina -->
            <label class="col-lg-1 control-label guide-selector"> Data:</label>
            <div class="col-lg-3 guide-selector"><input class="form-control" name="feedDate" id="feed-date" data-toggle="datepicker" ></div>
            <label class="col-lg-1 control-label guide-selector"> Od:</label>
            <div class="col-lg-3 guide-selector"><input class="form-control time_element" name="feedHourStart" id="attraction-time-start" value="12:00"></div>
            <label class="col-lg-1 control-label guide-selector">Do:</label>
            <div class="col-lg-3 guide-selector"><input class="form-control time_element" name="feedHourEnd" id="attraction-time-end" value="12:00"></div>
        </div>
        <div class="row">
            <div class="col-lg-11 col-lg-offset-1 guide-selector">
                <textarea name="feedRemarks" class="form-control" id="textarea" class="form-control input-md" placeholder="Uwagi..."></textarea>
            </div>
        </div>
        <hr>
    </div> <!-- end of dinner-row-->
    <div class="row dodaj-obiad-button">
        <div class="col-lg-12 text-right">
            <button id="cloneMealsButton" class="btn btn-success" type="button" >
            <span class="glyphicon glyphicon-plus"aria-hidden="true"></span> Dodaj posiłek</button>
            <button id="removeMealsButton" class="btn btn-danger" type="button">
            <span class="glyphicon glyphicon-minus"aria-hidden="true"></span> Usuń</button>
        </div>
    </div>

</div> <!-- end of dinner-fields-->