<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Group Type Modal -->
<div class="modal fade" id="mealModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">Dodawanie posiłku</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <label class="col-lg-1 control-label guide-selector">Rodzaj:</label>
                    <div class="col-lg-4">
                        <form:form action="addMealToTrip/${trip.id}" method="POST" modelAttribute="meal" commandName="meal">
                            <form:select path="mealType" name="mealsType" class="form-control" id="mealsType" placeholder="Typ posiłku...">
                                <option value="0" disabled selected>Typ posiłku...</option>
                                <option value="śniadanie">Śniadanie</option>
                                <option value="obiad">Obiad</option>
                                <option value="kolacja">Kolacja</option>
                            </form:select>
                        </div>
                        <label class="col-lg-2 control-label guide-selector">Miejsce:</label>
                        <div class="col-md-5 guide-selector">
                            <form:select path="place" name="feedingPlace" class="form-control" id="restaurants" data-placeholder="Wybierz miejsce...">
                                <option></option>
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
                            </form:select>
                        </div>
                    </div>
                    <div class="row">
                        <!-- Posilek: Data i godzina -->
                        <label class="col-lg-1 control-label guide-selector"> Data:</label>
                        <div class="col-lg-3 guide-selector"><form:input path="date" class="form-control" name="feedDate" id="additional-attraction-date" data-toggle="datepicker" /></div>
                        <label class="col-lg-1 control-label guide-selector"> Od:</label>
                        <div class="col-lg-3 guide-selector"><form:input path="hourFrom" class="form-control time_element" name="feedHourStart" id="attraction-time-start" value="12:00"/></div>
                        <label class="col-lg-1 control-label guide-selector">Do:</label>
                        <div class="col-lg-3 guide-selector"><form:input path="hourTo" class="form-control time_element" name="feedHourEnd" id="attraction-time-end" value="12:00"/></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-11 col-lg-offset-1 guide-selector">
                            <form:textarea path="remarks" name="feedRemarks" class="form-control input-md" id="mealremarks" placeholder="Uwagi..."></form:textarea>
                            </div>
                        </div>
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

