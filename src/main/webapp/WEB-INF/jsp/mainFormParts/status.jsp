<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!-- Status -->
<legend id="anch9" class="">Status wycieczki</legend>
<div class="row">
    <div class="col-lg-5 col-lg-offset-1 status-selector">
        <select name="status-selector" class="chosen-select form-control" id="status-selector" required>
            <option disabled>Ustaw status wycieczki...</option>
            <option class="alert alert-success" value="0">Potwierdzona i zapłacona</option>
            <option class="alert alert-warning" value="1">Potwierdzona i niezapłacona</option>
            <option class="alert alert-danger"  value="2">Niepotwierdzona i niezapłacona</option>
        </select>
    </div>
</div>