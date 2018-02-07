<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Raport: pierniki</title>
        <jsp:include page="stylesheets.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container mainContainer">
                <h1>Raport - Piernikarnia</h1>
                <h3>Znaleziono wpisów: ${gingerbreads.size()}</h3>
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
                    <c:forEach var="gingerbread" items="${gingerbreads}">
                               <c:set var="advance" value="${gingerbread.trip.advance}"/>
                               <c:set var="confirmed" value="${gingerbread.trip.confirmed}"/>
                               <c:set var="cancelled" value="${gingerbread.trip.cancelled}"/>
                        <tr
                                            <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                                            <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                                            <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                                            <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
                                             >
                            <td>${gingerbread.date}</td>
                            <td>
                            Dzieci:   ${gingerbread.trip.group.childrenNo} <br>
                            Dorośli:  ${gingerbread.trip.group.adultsNo} <br>
                            Obsługa:  ${gingerbread.trip.group.staffNo} <br></td>
                            <td>${gingerbread.trip.group.age}</td>
                            <td>${gingerbread.trip.company.name}</td>
                            <td>${gingerbread.hourFrom}</td>
                            <td>${gingerbread.hourTo}</td>
                            <td>${gingerbread.name}</td>
                            <td>${gingerbread.remarks}</td>
                            <td style="display:none;">
                            ${gingerbread.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${gingerbread.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${gingerbread.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                           </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div> <!--  end of container-->
        <jsp:include page="scriptLinks.jsp"></jsp:include>
    </body>

</html>

