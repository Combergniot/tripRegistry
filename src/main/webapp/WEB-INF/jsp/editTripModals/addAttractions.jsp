<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Group Type Modal -->
<div class="modal fade" id="attractionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">Dodawanie atrakcji</h4>
            </div>
            <div class="modal-body">






           <div class="modal-footer">
                  <form:input type="hidden" value="${trip.id}" path="trip.id"/>
                  <button type="submit" class="btn btn-primary">Zapisz</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">Precz</button>
                  </form:form>
          </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->