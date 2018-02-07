<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Guides-->
<legend id="anch4" class="">Usługi przewodnickie i pilockie</legend>
<div id="tour_fields">
    <div class="tour-row">
        <div class="row">
      <label class="col-lg-1 control-label guide-selector">Program:</label>
              <div class="col-lg-4 guide-selector">
                <select name="tourType" class="form-control" id="tourType" data-placeholder="Program...">
                    <option value="Nie wybrano"></option>
                    <optgroup label="Zwiedzanie tradycyjne">
                        <option value="Tradycyjne 2h">2h</option>
                        <option value="Tradycyjne 3h">3h</option>
                        <option value="Tradycyjne 4h">4h</option>
                        <option value="Tradycyjne 5h">5h</option>
                    </optgroup>
                    <optgroup label="Strój historyczny">
                        <option value="Strój: Toruń szlakiem legend">Toruń szlakiem legend</option>
                        <option value="Strój: Krzyżacki patrol">Krzyżacki patrol</option>
                        <option value="Strój: Katowskie opowieści">Katowskie opowieści</option>
                        <option value="Strój: Toruński niezbędnik">Toruński niezbędnik</option>
                        <option value="Strój: Kopernik pełen tajemnic">Kopernik pełen tajemnic</option>
                        <option value="Strój: Frywolny">Frywolny</option>
                        <option value="Strój: Toruń w pigułce">Toruń w pigułce</option>
                        <option value="Strój: Rodzinny weekend w Toruniu">Rodzinny weekend w Toruniu</option>
                        <option value="Strój: Zakochani w Toruniu">Zakochani w Toruniu</option>
                    </optgroup>
                    <optgroup label="Gra miejska - firmy">
                        <option value="Gra miejska - firmy">Eliksir</option>
                        <option value="Gra miejska - firmy">Róża Kopernika</option>
                        <option value="Gra miejska - firmy">Szpieg</option>
                    </optgroup>
                    <optgroup label="Gra miejska - szkolna">
                        <option value="Gra miejska - szkolna: zwykła">Zwykła</option>
                    </optgroup>
                    <optgroup label="Usługi pilockie">
                      <option value="Pilotaż">Pilotaż</option>
                    </optgroup>
                </select>
            </div>
            <div class="col-lg-4 guide-selector">
                <select id="guides" name="pilotname[0]" multiple class="form-control"
                        data-placeholder="Przewodnicy...">
                    <option value="0"></option>
                    <c:forEach var="guide" items="${guides}">
                        <option value="${guide.id}">${guide.lastName} ${guide.firstName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-lg-3 guide-selector">
                <select name="attractions[0]" multiple class="form-control" id="additionalAttraction"
                        data-placeholder="Dodatki...">
                    <option selected value="Brak"></option>
                    <option>Poczęstunek piernikami</option>
                    <option>Degustacja nalewek </option>
                    <option>Spotkanie z katem</option>
                    <option>Spotkanie z Kopernikiem</option>
                    <option>Inne...</option>
                </select>
            </div>
        </div> 
        <!--end of row-->

        <div class="row">
            <label class="col-lg-1 control-label guide-selector">Data:</label>
            <div class="col-lg-3 guide-selector"><input class="form-control" name="serviceDate" id="registration-date" data-toggle="datepicker" ></div>
            <label class="col-lg-1 control-label guide-selector"> Od:</label>
            <div class="col-lg-3 guide-selector"><input class="form-control time_element" name="attractionTimeStart" id="registration-time-start" value="12:00"></div>
            <label class="col-lg-1 control-label guide-selector">Do:</label>
            <div class="col-lg-3 guide-selector"><input class="form-control time_element" name="attractionTimeEnd" id="regisration-time-end" value="12:00"></div>
        </div>
        <div class="row">
        <label class="col-lg-1 control-label">Język:</label>
        <div class="col-lg-3">
                 <select name="languages[0]" multiple class="form-control" id="language" data-placeholder="Język...">
                            <option selected value="Nieokreślono"></option>
                            <option>polski</option>
                            <option>angielski</option>
                            <option>niemiecki</option>
                            <option>rosyjski</option>
                            <option>włoski</option>
                            <option>francuski</option>
                            <option>hiszpański</option>
                            <option>inny...</option>
              </select>
           </div>
           <div class="col-lg-7 col-lg-offset-1 guide-selector">
                <textarea name="tourRemarks" class="form-control" id="textarea" placeholder="Uwagi..." class="form-control input-md"></textarea>     
            </div> 
        </div>
        <hr>
    </div>
    <div class="row">
        <div class="col-lg-12 text-right">
            <button class="btn btn-success" type="button" onclick="repeatTour()"> <span class="glyphicon glyphicon-plus" aria-hidden="true">
                </span> Dodaj usługę</button>
            <button class="btn btn-danger" type="button" onclick="removeTour()"><span class="glyphicon glyphicon-minus"aria-hidden="true">
                </span> Usuń</button>
            <hr>
        </div>
    </div>
</div> <!-- End of guides-->

<script src="resources/js/addGuides.js"></script>
