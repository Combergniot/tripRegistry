<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Raport: Zamek Krzyżacki</title>
    <jsp:include page="stylesheets.jsp"></jsp:include>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container mainContainer">
    <h1>Raport - Zamek Krzyżacki</h1>
    <h3>Znaleziono wpisów: ${castle.size()}</h3>
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
        <c:forEach var="teutonicCastle" items="${castle}">
                   <c:set var="advance" value="${teutonicCastle.trip.advance}"/>
                   <c:set var="confirmed" value="${teutonicCastle.trip.confirmed}"/>
                   <c:set var="cancelled" value="${teutonicCastle.trip.cancelled}"/>
              <tr
                                  <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                                  <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                                  <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                                  <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
                                   >
                <td>${teutonicCastle.date}</td>
                <td>
                Dzieci:  ${teutonicCastle.trip.group.childrenNo} <br>
                Dorośli:  ${teutonicCastle.trip.group.adultsNo} <br>
                Obsługa:  ${teutonicCastle.trip.group.staffNo} <br>
                </td>
                <td>${teutonicCastle.trip.group.age}</td>
                <td>${teutonicCastle.trip.company.name}</td>
                <td>${teutonicCastle.hourFrom}</td>
                <td>${teutonicCastle.hourTo}</td>
                <td>${teutonicCastle.name}</td>
                <td>${teutonicCastle.remarks}</td>
                <td style="display:none;">
                ${teutonicCastle.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${teutonicCastle.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${teutonicCastle.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div> <!--  end of container-->
<jsp:include page="scriptLinks.jsp"></jsp:include>
</body>
</html>

