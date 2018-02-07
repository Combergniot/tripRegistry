<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Modal -->
<div id="previewCompany" class="modal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edytuj firmę</h4>
            </div>
            <div class="modal-body">
                <div id="companyEditSuccess" class="alert alert-success" style="display:none; width:80%; margin:0;">
                    <strong>O tak!</strong> Poprawnie zapisano firmę.
                </div>
                <div id="companyEditFail" class="alert alert-danger" style="display:none;">
                    <strong>Oj oj oj</strong> Nie udało się zapisać firmy. Spróbuj ponownie po przeładowaniu strony. <br>
                </div>
                <div id="newCompanyFormWrapper">
                    <form name="editCompanyForm" method="POST">
                        <input id="prevCompInputId" type="hidden" name="id" value="">
                        <div class="form-group">
                            <label class="control-label">Firma</label>  
                            <div>
                                <input id="prevCompInputName" name="name" class="form-control input-md" placeholder="Wprowadź nazwę firmy" type="text" >
                            </div>
                        </div>
                        <!-- Kontakt: Imie i nazwisko-->
                        <div class="form-group">
                            <label class="control-label">Imię i nazwisko</label>
                            <div>
                                <input id="prevCompInputPersonName" name="prevCompInputPersonName" class="form-control input-md" placeholder="Imię i nazwisko" type="text" >
                            </div>
                        </div>
                        <!-- Kontakt: telefon-->
                        <div class="form-group">
                            <label class="control-label" for="textinput">Telefon</label>  
                            <div>
                                <input id="prevCompInputPhone" name="phone" class="form-control input-md" placeholder="Telefon" type="text" >
                            </div>
                        </div>
                        <!-- Kontakt: email-->
                        <div class="form-group">
                            <label class="control-label" for="textinput">E-mail</label>  
                            <div>
                                <input id="prevCompInputEmail" name="email" class="form-control input-md" placeholder="E-mail" type="text" >
                            </div>
                        </div>
                        <!-- Kontakt: nip-->
                        <div class="form-group">
                            <label class="control-label" for="textinput">NIP</label>  
                            <div>
                                <input id="prevCompInputNip" name="nip" class="form-control input-md" placeholder="NIP" type="text" >
                            </div>
                        </div>
                        <div class="text-center">
                            <div class="btn-group" role="group" aria-label="...">
                                <button id="saveCompany" type="button" class="btn btn-success">Zapisz</button>
                            </div>
                        </div>
                    </form>
                </div> <!--end of new company-->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Zamknij</button>
            </div>
        </div>
    </div>
</div>