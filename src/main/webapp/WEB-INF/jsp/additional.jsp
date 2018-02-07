<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Raport: Olbracht</title>
    <jsp:include page="stylesheets.jsp"></jsp:include>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container mainContainer">
    <h1>Raport - Dodatkowe Atrakcje</h1>
    <h3>Znaleziono wpisów: ${additionalAttracions.size()}</h3>
    <table class="table table-striped table-bordered" id="example" cellspacing="0" width="100%">
        <thead>
        <tr>

            <th>Data</th>
            <th>Liczba osób</th>
            <th>Wiek</th>
            <th>Firma</th>
            <th>Start</th>
            <th>Zakończenie</th>
            <th>Typ atrakcji</th>
            <th>Uwagi</th>
            <th style="display:none;">Status</th>
         </tr>
        </thead>
        <tbody>
        <c:forEach var="additionalAttraction" items="${additionalAttractions}">
                   <c:set var="advance" value="${additionalAttraction.trip.advance}"/>
                   <c:set var="confirmed" value="${additionalAttraction.trip.confirmed}"/>
                   <c:set var="cancelled" value="${additionalAttraction.trip.cancelled}"/>
                                  <tr
                                   <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                                   <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                                   <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                                   <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
                                    >
                <td>${additionalAttraction.date}</td>
                <td>
                        Dzieci:  ${additionalAttraction.trip.group.childrenNo} <br>
                        Dorośli:  ${additionalAttraction.trip.group.adultsNo} <br>
                        Obsługa:  ${additionalAttraction.trip.group.staffNo} <br>
                </td>
                <td>${additionalAttraction.trip.group.age}</td>
                <td>${additionalAttraction.trip.company.name}</td>
                <td>${additionalAttraction.hourFrom}</td>
                <td>${additionalAttraction.hourTo}</td>
                <td>${additionalAttraction.name}</td>
                <td>${additionalAttraction.remarks}</td>
                <td style="display:none;">
                ${additionalAttraction.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${additionalAttraction.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${additionalAttraction.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div> <!--  end of container-->
<jsp:include page="scriptLinks.jsp"></jsp:include>
</body>

</html>

