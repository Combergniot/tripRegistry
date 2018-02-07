<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Raport: Muzeum Okręgowe</title>
    <jsp:include page="stylesheets.jsp"></jsp:include>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container mainContainer">
    <h1>Raport - Muzeum Okręgowe</h1>
    <h3>Znaleziono wpisów: ${museums.size()}</h3>
    <table class="table table-striped table-bordered" id="example" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>Data</th>
            <th>Liczba osób</th>
            <th>Wiek</th>
            <th>Firma</th>
            <th>Start</th>
            <th>Zakończenie</th>
            <th>Oddział Muzeum Okręgowego</th>
            <th>Uwagi</th>
            <th style="display:none;">Status</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="museum" items="${museums}">
                   <c:set var="advance" value="${museum.trip.advance}"/>
                   <c:set var="confirmed" value="${museum.trip.confirmed}"/>
            <tr
                   <c:if test="${advance && confirmed}">style="background: #a6e06c;"</c:if>
                        <c:if test="${!advance && !confirmed}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                        <c:if test="${!advance && confirmed}">style="background: #f0d175;"</c:if>
                   >
                <td>${museum.date}</td>
                <td>
                Dzieci:  ${museum.trip.group.childrenNo} <br>
                Dorośli:  ${museum.trip.group.adultsNo} <br>
                Obsługa:  ${museum.trip.group.staffNo} <br></td>
                <td>${museum.trip.group.age}</td>
                <td>${museum.trip.company.name}</td>
                <td>${museum.hourFrom}</td>
                <td>${museum.hourTo}</td>
                <td>${museum.name}</td>
                <td>${museum.remarks}</td>
                <td style="display:none;">
                ${museum.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${museum.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${museum.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                </td>
             </tr>
        </c:forEach>
        </tbody>
    </table>
</div> <!--  end of container-->
<jsp:include page="scriptLinks.jsp"></jsp:include>
</body>

</html>

