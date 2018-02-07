<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Raport: Młyny Wiedzy</title>
    <jsp:include page="stylesheets.jsp"></jsp:include>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container mainContainer">
    <h1>Raport - Młyny Wiedzy</h1>
    <h3>Znaleziono wpisów: ${mills.size()}</h3>
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
        <c:forEach var="mill" items="${mills}">
           <c:set var="advance" value="${mill.trip.advance}"/>
           <c:set var="confirmed" value="${mill.trip.confirmed}"/>
           <c:set var="cancelled" value="${mill.trip.cancelled}"/>
            <tr
                                <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                                <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                                <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                                <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
                                 >
                <td>${mill.date}</td>
                <td>
                Dzieci:   ${mill.trip.group.childrenNo} <br>
                Dorośli:  ${mill.trip.group.adultsNo} <br>
                Obsługa:  ${mill.trip.group.staffNo} <br></td>
                <td>${mill.trip.group.age}</td>
                <td>${mill.trip.company.name}</td>
                <td>${mill.hourFrom}</td>
                <td>${mill.hourTo} </td>
                <td>${mill.name}</td>
                <td>${mill.remarks}</td>
                <td style="display:none;">
               ${mill.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${mill.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${mill.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
               </td>
             </tr>
        </c:forEach>
        </tbody>
    </table>
</div> <!--  end of container-->
<jsp:include page="scriptLinks.jsp"></jsp:include>
</body>
</html>

