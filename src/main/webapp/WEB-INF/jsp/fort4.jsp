<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Raport: Fort IV</title>
        <jsp:include page="stylesheets.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container mainContainer">
                <h1>Raport - Fort IV</h1>
                <h3>Znaleziono wpisów: ${fort4.size()}</h3>
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
                    <c:forEach var="fort4" items="${forts4}">
                               <c:set var="advance" value="${fort4.trip.advance}"/>
                               <c:set var="confirmed" value="${fort4.trip.confirmed}"/>
                               <c:set var="cancelled" value="${fort4.trip.cancelled}"/>
                          <tr
                                              <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                                              <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                                              <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                                              <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
                                               >
                            <td>${fort4.date}</td>
                            <td>
                            Dzieci:   ${fort4.trip.group.childrenNo} <br>
                            Dorośli:  ${fort4.trip.group.adultsNo} <br>
                            Obsługa:  ${fort4.trip.group.staffNo} <br>
                            </td>
                            <td>${fort4.trip.group.age}</td>
                            <td>${fort4.trip.company.name}</td>
                            <td>${fort4.hourFrom}</td>
                            <td>${fort4.hourTo}</td>
                            <td>${fort4.name}</td>
                            <td>${fort4.remarks}</td>
                            <td style="display:none;">
                            ${fort4.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${fort4.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${fort4.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                            </td>
                      </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div> <!--  end of container-->
        <jsp:include page="scriptLinks.jsp"></jsp:include>
    </body>

</html>

