<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--    Group    -->
<legend id="anch3" class="">Grupa</legend>
<div id="group_fields">
    <div class="pola-grupy">
        <div class="row">
            <!--Grupa:Ile dzieci -->
            <div class="col-lg-3 col-lg-offset-1  group-size-selector">
                <input name="childrenNr" type="text" class="form-control" id="ChildrenNr" placeholder="Ile dzieci?">
            </div>
            <!--Grupa: Ilu dorosłych? -->
            <div class="col-lg-3 group-size-selector">
                <input name="AdultsNr" type="text" class="form-control" id="AdultsNr" placeholder="Ilu dorosłych?">
            </div>
            <!--Grupa: Obsługa -->
            <div class="col-lg-3 group-size-selector">
                <input name="StaffNr" type="text" class="form-control" id="StaffNr" placeholder="Obsługa:">
            </div>
            <!--Grupa: typ grupy-->
            <div class="col-md-2  group-size-selector">         
                <select name="groupType" class="chosen-select form-control" id="groupType">
                    <option selected disabled value>Typ grupy</option>
                    <option>Przedszkolna</option>
                    <option>Dzieci I-III</option>
                    <option>Dzieci IV-VI</option>
                    <option>Młodzież</option>
                    <option>Dorośli</option>
                    <option>Seniorzy</option>
                    <option>Rodzina</option>
                </select>                        
            </div>
        </div>
        <div class="row">
            <!-- Text area-->
            <div class="col-lg-11 col-lg-offset-1">
                <textarea name="groupTypeRemarks" class="form-control" id="groupTextarea" class="form-control input-md" placeholder="Uwagi"></textarea>
            </div>
        </div>
    </div>
</div> 
<!--    End of group    -->




