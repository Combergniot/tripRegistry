<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Raport: Planetarium</title>
        <jsp:include page="stylesheets.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container mainContainer">
                <h1>Raport - Planetarium</h1>
                <h3>Znaleziono wpisów: ${planets.size()}</h3>
            <table class="table table-striped table-bordered" id="example" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Data</th>
                        <th>Liczba osób</th>
                        <th>Wiek</th>
                        <th>Firma</th>
                        <th>Start</th>
                        <th>Zakończenie</th>
                        <th>Seans</th>
                        <th>Uwagi</th>
                        <th style="display:none;">Status</th>
                     </tr>
                </thead>
                <tbody>
                    <c:forEach var="planetarium" items="${planets}">
                               <c:set var="advance" value="${planetarium.trip.advance}"/>
                               <c:set var="confirmed" value="${planetarium.trip.confirmed}"/>
                               <c:set var="cancelled" value="${planetarium.trip.cancelled}"/>
                        <tr
                                            <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                                            <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                                            <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                                            <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
                                             >
                            <td>${planetarium.date}</td>
                            <td>
                            Dzieci:  ${planetarium.trip.group.childrenNo} <br>
                            Dorośli:  ${planetarium.trip.group.adultsNo} <br>
                            Obsługa:  ${planetarium.trip.group.staffNo} <br></td></td>
                            <td>${planetarium.trip.group.age}</td>
                            <td>${planetarium.trip.company.name}</td>
                            <td>${planetarium.hourFrom}</td>
                            <td>${planetarium.hourTo}</td>
                            <td>${planetarium.name}</td>
                            <td>${planetarium.remarks}</td>
                            <td style="display:none;">
                            ${planetarium.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${planetarium.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${planetarium.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div> <!--  end of container-->
        <jsp:include page="scriptLinks.jsp"></jsp:include>
    </body>
</html>

