<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!-- Group Type Modal -->
<div class="modal fade" id="sightseeingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">Dodawanie usług przewodnickich</h4>
            </div>
            <div class="modal-body">
            <form:form action="addSightseeingToTrip/${trip.id}" method="POST" modelAttribute="sightseeing" commandName="sightseeing">

      <div class="row">
      <label class="col-lg-1 control-label guide-selector">Program:</label>
                <div class="col-lg-4 guide-selector">
                <form:select path="name" name="tourType" class="form-control" id="tourType" data-placeholder="Program...">
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
                </form:select>
            </div>
            <div class="col-lg-4 guide-selector">
                <form:select path="guides" id="guides" name="pilotname[0]" multiple="multiple" class="form-control"
                        data-placeholder="Przewodnicy...">
                    <option value="0"></option>
                    <c:forEach var="guide" items="${guides}">
                        <option value="${guide.id}">${guide.lastName} ${guide.firstName}</option>
                    </c:forEach>
                </form:select>
            </div>
            <div class="col-lg-3 guide-selector">
                <form:select path="addition" name="attractions[0]" multiple="multiple" class="form-control" id="additionalAttraction"
                        data-placeholder="Dodatki...">
                    <option selected value="Brak"></option>
                    <option>Poczęstunek piernikami</option>
                    <option>Degustacja nalewek </option>
                    <option>Spotkanie z katem</option>
                    <option>Spotkanie z Kopernikiem</option>
                    <option>Inne...</option>
                </form:select>
            </div>
        </div>
        <!--end of row-->

        <div class="row">
            <label class="col-lg-1 control-label guide-selector">Data:</label>
            <div class="col-lg-3 guide-selector"><form:input path="date" class="form-control" name="serviceDate" id="registration-date" data-toggle="datepicker" /></div>
            <label class="col-lg-1 control-label guide-selector"> Od:</label>
            <div class="col-lg-3 guide-selector"><form:input path="hourFrom" class="form-control time_element" name="attractionTimeStart" id="registration-time-start" value="12:00"/></div>
            <label class="col-lg-1 control-label guide-selector">Do:</label>
            <div class="col-lg-3 guide-selector"><form:input path="hourTo" class="form-control time_element" name="attractionTimeEnd" id="regisration-time-end" value="12:00"/></div>
        </div>
        <div class="row">
        <label class="col-lg-1 control-label">Język:</label>
        <div class="col-lg-3">
                 <form:select path="language" name="languages[0]" multiple="multiple" class="form-control" id="language" data-placeholder="Język...">
                            <option selected value="Nieokreślono"></option>
                            <option>polski</option>
                            <option>angielski</option>
                            <option>niemiecki</option>
                            <option>rosyjski</option>
                            <option>włoski</option>
                            <option>francuski</option>
                            <option>hiszpański</option>
                            <option>inny...</option>
              </form:select>
           </div>
           <div class="col-lg-7 col-lg-offset-1 guide-selector">
                <form:textarea path="remarks" name="tourRemarks" id="textarea" placeholder="Uwagi..." class="form-control input-md"></form:textarea>
            </div>
        </div>
        <hr>
    </div>
           <div class="modal-footer">
                  <form:input type="hidden" value="${trip.id}" path="trip.id"/>
                  <button type="submit" class="btn btn-primary">Zapisz</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">Precz</button>
                  </form:form>

          </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->