<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Contact section--> 
<legend id="anch2">Kontakt</legend>
<div class="row">
    <div class="col-sm-12 col-lg-5 col-lg-offset-1 company-selector">
        <select name="company" class="chosen-select form-control"  id="companySelect" data-placeholder="Wybór firmy"></select>
        </div>
    <div class="col-sm-12  col-lg-5 col-lg-offset-1">
    <button type="button" id="addCompanyButton" class="btn btn-primary" data-toggle="modal" data-target="#companyModal">Dodaj nową firmę</button>
    <button type="button" id="showCompany" class="btn btn-primary" data-toggle="modal" data-dismiss="modal"  data-target="#previewCompany" onclick="giveOneCompany($('#companySelect').val())">Podgląd i edycja danych</button>
</div>
</div>

<script>
    function giveOneCompany(companyId){
        console.log('company id = ' + companyId);
            $.ajax({
            url: 'singleCompany?id='+companyId,
            dataType: 'json',

            success: function (company) {
                console.log(company.name);
             
                $('#prevCompInputName').val(company.name);
                $('#prevCompInputPersonName').val(company.personName);
                $('#prevCompInputEmail').val(company.email);
                $('#prevCompInputPhone').val(company.phone);
                $('#prevCompInputNip').val(company.nip);
                $('#prevCompInputId').val(company.id);
              
            },

            error: function () {
                $('#result').html("Error!");
            }
        });
        
    }
</script>

<!-- End of contact section--> 




