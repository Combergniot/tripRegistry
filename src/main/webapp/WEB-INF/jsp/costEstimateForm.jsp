<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Kosztorys wycieczki</title>
    <jsp:include page="stylesheets.jsp"></jsp:include>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/chosen.css">
    <link rel="stylesheet" href="resources/css/datepicker.css">
    <link rel="stylesheet" type="text/css" href="resources/css/timepicki.css">
    <script src="resources/js/datepicker.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            // initailize datepicker
            $('[data-toggle="datepicker"]').datepicker({
                    language: 'pl-PL',
                    autoPick: 'false',
                    format: 'dd/mm/yyyy'

                }
            );
        });
    </script>

</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<c:set var="companyName" value="${trip.company.name}"/>
<c:set var="cleanCompanyName" value="${fn:replace(companyName, ' ', '_')}"/>
<div class="container mainContainer">
    <h2>Kosztorys wycieczki</h2>
    <h4>Przed wygenerowanianiem pdf zapisz zmiany! </h4>

    <%--Format dates for datepicker--%>
    <fmt:parseDate value="${costEstimate.wholeAmountBefore}" type="date" var="wholeAmountBefore" pattern="yyyy-MM-dd"/>
    <fmt:parseDate value="${costEstimate.advanceBefore}" type="date" var="advanceBefore" pattern="yyyy-MM-dd"/>
    <fmt:formatDate var="fmt_wholeAmountBefore" value="${wholeAmountBefore}" pattern="dd/MM/yyyy"/>
    <fmt:formatDate var="fmt_advanceBefore" value="${advanceBefore}" pattern="dd/MM/yyyy"/>



    <form:form class="form-horizontal" modelAttribute="costEstimate" commandName="costEstimate" name="tripCostEstimate"
               action="/costEstimateForm" method="POST">
        <fieldset>

            <!-- Form Name -->
            <legend>Szczegóły kosztorysu</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Miejsce spotkania</label>
                <div class="col-md-4">
                    <form:input value="${costEstimate.meetingPlace}" path="meetingPlace" id="efvrvg" name="textinput"
                                type="text" placeholder="np. Rynek w Bydgoszczy" class="form-control input-md"/>

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Kwota zaliczki</label>
                <div class="col-md-4">
                    <form:input path="advance" id="textinput" name="textinput" type="number" placeholder="np. 150.50"
                                class="form-control input-md" step="0.1"/>

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Kwota całkowita</label>
                <div class="col-md-4">
                    <form:input value="${costEstimate.price}" path="price" name="textinput" type="number"
                                placeholder="np. 200.2" class="form-control input-md" step="0.1"/>

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Zaliczka do dnia</label>
                <div class="col-md-4">
                    <form:input data-toggle="datepicker" value="${fmt_advanceBefore}" path="advanceBefore"
                                name="textinput" type="text" placeholder="" class="form-control input-md"/>

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Całość do dnia</label>
                <div class="col-md-4">
                    <form:input path="wholeAmountBefore" data-toggle="datepicker"
                                value="${fmt_wholeAmountBefore}" name="textinput" type="text" placeholder=""
                                class="form-control input-md"/>

                </div>
            </div>


            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectbasic">Forma płatności</label>
                <div class="col-md-4">
                    <form:select path="paymentType" id="selectbasic" name="selectbasic" class="form-control">
                        <option selected value="${costEstimate.paymentType}">${costEstimate.paymentType}</option>
                        <option value="Przelew">Przelew</option>
                        <option value="Gotówka">Gotówka</option>
                    </form:select>
                </div>
            </div>

            <!-- Hidden inputs -->
            <form:input path="trip.id" name="tripId" class="form-control input-md" type="hidden" value="${trip.id}"/>
            <form:input path="id" name="tripId" class="form-control input-md" type="hidden" value="${costEstimate.id}"/>
            <form:input path="createdAt" name="createdAt" class="form-control input-md" type="hidden" value=""/>

            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="singlebutton"></label>
                <div class="col-md-4">
                    <button type="submit" id="singlebutton" name="singlebutton" class="btn btn-primary">Zapisz</button>
                </div>
            </div>

        </fieldset>
    </form:form>

    <a class="btn btn-default"
       href="http://www.html2pdf.it/?url=https://copernicana.herokuapp.com/generatePdf?tripId=${trip.id}&download=true&filename=kosztorys_${cleanCompanyName}">Pobierz
        kosztorys pdf</a>


    <div class="well">
        <h2>Dane zgłoszenia</h2>
        <p>Data wycieczki: od ${trip.dateFrom} do ${trip.dateTo}</p>
        <c:set var="advance" value="${seeing.trip.advance}"/>
        <c:set var="confirmed" value="${seeing.trip.confirmed}"/>
        <c:if test="${advance && confirmed}"><span class="label label-success">Potwierdzona i zapłacona</span></c:if>
        <c:if test="${!advance && !confirmed}"><span
                class="label label-danger">Niepotwierdzona i niezapłacona</span></c:if>
        <c:if test="${!advance && confirmed}"><span
                class="label label-warning">Potwierdzona i niezapłacona</span></c:if>
        <hr>

        <p>Firma: ${trip.company.name}</p>
        <p>Grupa: ${trip.group.age} w tym ${trip.group.adultsNo} dorosłych, ${trip.group.childrenNo}
            i ${trip.group.staffNo} obslugi.</p>

        <p>Posiłki:</p>


    </div>


</div> <!--  end of container-->
<jsp:include page="scriptLinks.jsp"></jsp:include>
</body>

</html>