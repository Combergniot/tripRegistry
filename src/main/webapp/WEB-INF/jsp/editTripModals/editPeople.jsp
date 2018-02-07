<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Group Type Modal -->
<div class="modal fade" id="peopleNoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">Liczba osób</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6">
                        <form action="/updatePeopleNumber/${trip.id}/${trip.group.id}" method="post">
                            Dzieci: <input name="children" type="number" value="${trip.group.childrenNo}"></input><br>
                            Dorośli: <input name="adults" type="number" value="${trip.group.adultsNo}"></input><br>
                            Obsługa:  <input name="staff" type="number" value="${trip.group.staffNo}"></input><br>
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
