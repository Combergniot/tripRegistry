<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Raport: Noclegi</title>
        <jsp:include page="stylesheets.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container mainContainer">
                <h1>Raport - Noclegi</h1>
                <h3>Znaleziono wpisów: ${accommodations.size()}</h3>
            <table class="table table-striped table-bordered" id="example" cellspacing="0" width="100%">
                <thead>
                    <tr>
                      <th>Nocleg od:</th>
                      <th>Nocleg do:</th>
                        <th>Liczba osób</th>
                        <th>Wiek</th>
                        <th>Firma</th>
                        <th>Hotel</th>
                        <th>Uwagi</th>
                        <th style="display:none;">Status</th>
                     </tr>
                </thead>
                <tbody>
                    <c:forEach var="accommodation" items="${accommodations}">
                               <c:set var="advance" value="${accommodation.trip.advance}"/>
                               <c:set var="confirmed" value="${accommodation.trip.confirmed}"/>
                               <c:set var="cancelled" value="${accommodation.trip.cancelled}"/>
                              <tr
                                                  <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                                                  <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                                                  <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                                                  <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
                                                   >
                             <td>${accommodation.dateFrom}</td>
                             <td>${accommodation.dateTo}</td>
                            <td>
                            Dzieci:  ${accommodation.trip.group.childrenNo}<br>
                            Dorośli:  ${accommodation.trip.group.adultsNo}<br>
                            Obsługa:  ${accommodation.trip.group.staffNo}<br></td>
                            <td>${accommodation.trip.group.age}</td>
                            <td>${accommodation.trip.company.name}</td>
                            <td>${accommodation.hotelName}</td>
                            <td>${accommodation.remarks}</td>
                            <td style="display:none;">
                           ${accommodation.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${accommodation.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${accommodation.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                           </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div> <!--  end of container-->
        <jsp:include page="scriptLinks.jsp"></jsp:include>
    </body>

</html>

