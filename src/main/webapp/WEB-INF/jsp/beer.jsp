<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Raport: Olbracht</title>
        <jsp:include page="stylesheets.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container mainContainer">
                <h1>Raport - Olbracht</h1>
                <h3>Znaleziono wpisów: ${beers.size()}</h3>
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
                    <c:forEach var="beer" items="${beers}">
                               <c:set var="advance" value="${beer.trip.advance}"/>
                               <c:set var="confirmed" value="${beer.trip.confirmed}"/>
                               <c:set var="cancelled" value="${beer.trip.cancelled}"/>
                        <tr
                                            <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                                            <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                                            <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                                            <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
                                             >
                            <td>${beer.date}</td>
                            <td>
                            Dzieci:  ${beer.trip.group.childrenNo} <br>
                            Dorośli:  ${beer.trip.group.adultsNo} <br>
                            Obsługa:  ${beer.trip.group.staffNo} <br>
                            </td>
                            <td>${beer.trip.group.age}</td>
                            <td>${beer.trip.company.name}</td>
                            <td>${beer.hourFrom}</td>
                            <td>${beer.hourTo}</td>
                            <td>${beer.name}</td>
                            <td>${beer.remarks}</td>
                            <td style="display:none;">
                            ${beer.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${beer.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${beer.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                            </td>
                           </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div> <!--  end of container-->
        <jsp:include page="scriptLinks.jsp"></jsp:include>
    </body>

</html>

