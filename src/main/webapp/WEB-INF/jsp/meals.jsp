<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Raport: posiłki</title>
        <jsp:include page="stylesheets.jsp"></jsp:include>
        <jsp:include page="favicon.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container mainContainer">
                <h1>Raport - posiłki</h1>
                <h3>Znaleziono wpisów: ${meals.size()}</h3>
            <table class="table table-striped table-bordered" id="example" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Data</th>
                        <th>Liczba osób</th>
                        <th>Wiek</th>
                        <th>Firma</th>
                        <th>Start</th>
                        <th>Zakończenie</th>
                        <th>Posiłek</th>
                        <th>Miejsce</th>
                        <th>Uwagi</th>
                        <th style="display:none;">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="meal" items="${meals}">
                                            <c:set var="advance" value="${meal.trip.advance}"/>
                                            <c:set var="confirmed" value="${meal.trip.confirmed}"/>
                                            <c:set var="cancelled" value="${meal.trip.cancelled}"/>
                       <tr
                                           <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                                           <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                                           <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                                           <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
                                            >
                            <td>${meal.date}</td>
                            <td>
                              Dzieci:   ${meal.trip.group.childrenNo} <br>
                              Dorośli:  ${meal.trip.group.adultsNo} <br>
                              Obsługa:  ${meal.trip.group.staffNo} <br></td>
                            <td>${meal.trip.group.age}</td>
                            <td>${meal.trip.company.name}</td>
                            <td>${meal.hourFrom}</td>
                            <td>${meal.hourTo}</td>
                            <td>${meal.mealType}</td>
                            <td>${meal.place}</td>
                            <td>${meal.remarks}</td>
                            <td style="display:none;">
                            ${meal.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${meal.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${meal.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div> <!--  end of container-->
        <jsp:include page="scriptLinks.jsp"></jsp:include>

    </body>

</html>

