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
    <h1>Raport - Rejs po Wiśle</h1>
    <h3>Znaleziono wpisów: ${cruises.size()}</h3>
    <table class="table table-striped table-bordered" id="example" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>Data</th>
            <th>Liczba osób</th>
            <th>Wiek</th>
            <th>Firma</th>
            <th>Start</th>
            <th>Zakończenie</th>
            <th>Nazwa łodzi</th>
            <th>Uwagi</th>
            <th style="display:none;">Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cruise" items="${cruises}">
                   <c:set var="advance" value="${cruise.trip.advance}"/>
                   <c:set var="confirmed" value="${cruise.trip.confirmed}"/>
                   <c:set var="cancelled" value="${cruise.trip.cancelled}"/>
             <tr
                                 <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                                 <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                                 <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                                 <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
                                  >
                <td>${cruise.date}</td>
                <td>
                Dzieci:  ${cruise.trip.group.childrenNo} <br>
                Dorośli:  ${cruise.trip.group.adultsNo} <br>
                Obsługa:  ${cruise.trip.group.staffNo} <br></td>
                <td>${cruise.trip.group.age}</td>
                <td>${cruise.trip.company.name}</td>
                <td>${cruise.hourFrom}</td>
                <td>${cruise.hourTo}</td>
                <td>${cruise.name}</td>
                <td>${cruise.remarks}</td>
                <td style="display:none;">
                ${cruise.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${cruise.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${cruise.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div> <!--  end of container-->
<jsp:include page="scriptLinks.jsp"></jsp:include>
</body>

</html>

