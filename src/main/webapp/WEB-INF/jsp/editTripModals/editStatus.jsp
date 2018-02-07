<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Group Type Modal -->
<div class="modal fade" id="statusModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">Status wycieczki ${advance}</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6">
                        <form action="/updateTripStatus/${trip.id}" method="post">
                            <select name="status" class="chosen-select form-control" id="status-selector">
                               <c:set var="advance" value="${trip.advance}"/>
                               <c:set var="confirmed" value="${trip.confirmed}"/>
                               <c:set var="cancelled" value="${trip.cancelled}"/>
                               
                                <c:if test="${advance && confirmed}"> <option selected  value="0">Potwierdzona i zapłacona</option></c:if>
                                <c:if test="${!advance && !confirmed}"><option selected  value="2">Niepotwierdzona i niezapłacona</option></c:if>
                                <c:if test="${!advance && confirmed}"><option selected  value="1">Potwierdzona i niezapłacona</option></c:if>
                                <c:if test="${cancelled}"><option selected  value="3">Anulowana</option></c:if>

                                <option class="alert alert-success" value="0">Potwierdzona i zapłacona</option>
                                <option class="alert alert-warning" value="1">Potwierdzona i niezapłacona</option>
                                <option class="alert alert-danger"  value="2">Niepotwierdzona i niezapłacona</option>
                                <option value="3">Wycieczka anulowana</option>

                            </select>
                            <button type="submit" class="btn btn-primary">Zapisz</button>
                        </form>
                    </div>

                </div>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Precz</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
