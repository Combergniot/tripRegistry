<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Group Type Modal -->
<div class="modal fade" id="accommodationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">Dodawanie noclegu</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form:form action="addAccommodationToTrip/${trip.id}" method="POST" modelAttribute="accomodation" commandName="accomodation">

                        <label class="col-lg-1 control-label guide-selector">Od:</label>
                        <div class="col-md-3 guide-selector">
                            <form:input path="dateFrom"  class="form-control" name="accomodationDateStart"  data-toggle="datepicker"/>
                        </div>
                         <label class="col-lg-1 control-label guide-selector">Do:</label>
                        <div class="col-md-3 guide-selector">
                            <form:input path="dateTo" class="form-control"  name="accomodationDateEnd"  data-toggle="datepicker"/>
                        </div>

                        <div class="col-lg-4">
                            <form:select path="hotelName" name="acomHotel" class="chosen-select form-control" id="hotels" data-placeholder="Wybierz hotel">
                                <option></option>
                                <option>1231</option>
                                <option>Akropol</option>
                                <option>Ambasada</option>
                                <option>Ange Hostel</option>
                                <option>Atena</option>
                                <option>Barbarka</option>
                                <option>B&amp;B</option>
                                <option>Bulwar</option>
                                <option>Camping Tramp</option>
                                <option>Copernicus</option>
                                <option>Czarna Róża</option>
                                <option>Daglezja</option>
                                <option>Dom Pielgrzyma</option>
                                <option>Dwa Księżyce</option>
                                <option>Filmar</option>
                                <option>Fort IV</option>
                                <option>Freedom</option>
                                <option>Gościniec Silver</option>
                                <option>Gotyk</option>
                                <option>Green Hostel</option>
                                <option>Gromada</option>
                                <option>Heban</option>
                                <option>Hotelik w centrum</option>
                                <option>Ibis</option>
                                <option>Imbir</option>
                                <option>jaPierniczę</option>
                                <option>Kopernik</option>
                                <option>MCSM</option>
                                <option>Mercure</option>
                                <option>Miłosz</option>
                                <option>Nicolaus</option>
                                <option>Olender</option>
                                <option>Orange</option>
                                <option>Pałac Romantyczny</option>
                                <option>Petite Fleur</option>
                                <option>Pod Orłem</option>
                                <option>Polonia</option>
                                <option>Przystanek</option>
                                <option>Reflex</option>
                                <option>Retman</option>
                                <option>Rubbens&amp;Monet</option>
                                <option>Solaris</option>
                                <option>Spichrz</option>
                                <option>Toruń Główny</option>
                                <option>Inne...</option>
                            </form:select>
                        </div>

                        <div class="col-lg-11 col-lg-offset-1">
                            <form:textarea path="remarks" name="acomRemarks"  id="textarea" class="form-control input-md" placeholder="Uwagi..."></form:textarea>
                         </div>
                         </div>

                    <div class="modal-footer">
                          <form:input type="hidden" value="${id}" path="id"/>
                                            <form:input type="hidden" value="${trip.id}" path="trip.id"/>
                                            <button type="submit" class="btn btn-primary">Zapisz</button>
                                           <button type="button" class="btn btn-default" data-dismiss="modal">Precz</button>
                          </form:form>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

