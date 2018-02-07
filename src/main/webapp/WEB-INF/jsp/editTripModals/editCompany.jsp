<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Group Type Modal -->
<div class="modal fade" id="editCompany" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">Wybór firmy</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6">
                        <form action="/updateCompany/${trip.id}" method="post">
                            <select name="company" class="chosen-select form-control"  id="companySelect" data-placeholder="Wybór firmy" style="width:200px;"></select>
                            <button type="submit" class="btn btn-primary">Zapisz</button>
                        </form>
                    </div>

                </div>
                <div class="row">
                    <div class="alert alert-info">
                        <strong>Info!</strong> Aby dodać nową firmę skorzystaj z formularza dodawania wycieczki
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Precz</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
