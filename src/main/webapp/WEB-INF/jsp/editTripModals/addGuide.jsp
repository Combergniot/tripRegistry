<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Group Type Modal -->
<div class="modal fade" id="guideModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">Status wycieczki ${advance}</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6">
                        <form action="addGuideToService/${trip.id}" method="POST">
                            <select name="guideId" class="chosen-select form-control" id="guideIdSelect" placeholder="Wybór przewodnika...">
                                <option value="0" disabled selected>Przewodnik</option>
                                <c:forEach var="guide" items="${guides}">
                                    <option value="${guide.id}">${guide.lastName} ${guide.firstName}</option>
                                </c:forEach>
                            </select>
                    <input id="sightseeingId" type="hidden" value="" name="serviceId"/>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Zapisz</button>
                     <button type="button" class="btn btn-default" data-dismiss="modal">Precz</button>
                 </div>
                </form>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
    </div> </div>