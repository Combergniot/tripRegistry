<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <title>Rejestracja grup</title>
        <jsp:include page="stylesheets.jsp"></jsp:include>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <link rel="stylesheet" href="resources/css/style.css">
            <link rel="stylesheet" href="resources/css/jquery-ui.css">
            <link rel="stylesheet" href="resources/css/chosen.css"> 
            <link rel="stylesheet" href="resources/css/datepicker.css"> 
            <link rel="stylesheet" type="text/css" href="resources/css/timepicki.css">
            <script src="resources/js/datepicker.js"></script>  
            <script src="resources/js/timepicki.js"></script>
            <script src="resources/js/init.js"></script>   
            <script src="resources/js/addDinner.js"></script>
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
        </head>
        <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container mainContainer">
                <h1>Dodaj zgłoszenie</h1>
            <spring:hasBindErrors name="userForm">
                <c:forEach var="error" items="${errors.allErrors}">
                    <b><spring:message message="${error}" /></b>
                    <br />
                </c:forEach>
            </spring:hasBindErrors>
            <c:if test="${param.addSuccess == 'true'}">
                <div class="alert alert-success alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Udało się!</strong> Dodano nową wycieczkę
                </div>
            </c:if>
            <c:if test="${param.addSuccess == 'false'}">
                <div class="alert alert-danger alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Oj oj oj!</strong> Nie udało się dodać wycieczki. Sorki! <br>
                    ${param.errorMessage} <br>
                    ${param.causedBy}
                </div>
            </c:if>
            <div class="col-md-12 well">
                <form class="form-horizontal" action="addTrip"  method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <jsp:include page="mainFormParts/dateFromDateTo.jsp"></jsp:include>
                    <jsp:include page="mainFormParts/company.jsp"></jsp:include>
                    <jsp:include page="mainFormParts/group.jsp"></jsp:include>
                    <jsp:include page="mainFormParts/guides.jsp"></jsp:include>
                    <jsp:include page="mainFormParts/attractions.jsp"></jsp:include>
                    <jsp:include page="mainFormParts/additionalAttractions.jsp"></jsp:include>
                    <jsp:include page="mainFormParts/meals.jsp"></jsp:include>
                    <jsp:include page="mainFormParts/accomodation.jsp"></jsp:include>
                    <jsp:include page="mainFormParts/status.jsp"></jsp:include>
                        <hr>
                        <div class="col-lg-12 text-center">
                            <button class ="btn btn-primary" type="submit">Prześlij formularz</button>
                        </div>
                    </form>
                </div>   <!--End of well-->
            </div> <!--End of main container-->
        <jsp:include page="mainFormParts/addCompanyModal.jsp"></jsp:include>
        <jsp:include page="mainFormParts/previewCompany.jsp"></jsp:include>
        <jsp:include page="scriptLinks.jsp"></jsp:include>
        <script src="resources/js/chosen.jquery.js"></script>
        <script src="resources/js/choosen.js"></script>
        <script src="resources/js/giveCompanies.js"></script>
        <script src="resources/js/jquery.chained.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
    </body>
</html>

