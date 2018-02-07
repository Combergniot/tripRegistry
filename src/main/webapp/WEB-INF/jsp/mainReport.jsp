<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Raport: Główny</title>
    <jsp:include page="stylesheets.jsp"></jsp:include>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container-fluid mainContainer">
    <h1>Raport - Główny</h1>
    <h3>Znaleziono wpisów: ${seeings.size()}</h3>

    <div class="btn-group ">
        <a onclick="toggleColumn(this, 1)" class="btn btn-primary btn-xs">Data</a>
        <a onclick="toggleColumn(this, 2)" class="btn btn-primary btn-xs">Firma</a>
        <a onclick="toggleColumn(this, 3)" class="btn btn-primary btn-xs">Liczba osób</a>
        <a onclick="toggleColumn(this, 4)" class="btn btn-primary btn-xs">Wiek</a>
        <a onclick="toggleColumn(this, 5)" class="btn btn-primary btn-xs">Start</a>
        <a onclick="toggleColumn(this, 6)" class="btn btn-primary btn-xs">Zakończenie</a>
        <a onclick="toggleColumn(this, 7)" class="btn btn-primary btn-xs">Program</a>
        <a onclick="toggleColumn(this, 8)" class="btn btn-primary btn-xs">Przewodnik</a>
        <a onclick="toggleColumn(this, 9)" class="btn btn-primary btn-xs">Język</a>
        <a onclick="toggleColumn(this, 10)" class="btn btn-primary btn-xs">Dodatki</a>
        <a onclick="toggleColumn(this, 11)" class="btn btn-primary btn-xs">Atrakcje</a>
        <a onclick="toggleColumn(this, 12)" class="btn btn-primary btn-xs">Wyżywienie</a>
        <a onclick="toggleColumn(this, 13)" class="btn btn-primary btn-xs">Nocleg</a>
        <a onclick="toggleColumn(this, 14)" class="btn btn-primary btn-xs">Uwagi</a>
        <a onclick="toggleColumn(this, 15)" class="btn btn-primary btn-xs">Opiekun wycieczki</a>
        <a onclick="toggleColumn(this, 16)" class="btn btn-primary btn-xs">Akcja</a>
    </div>
    <script>
        function toggleColumn(element, columnNo) {
            $('td:nth-child(' + columnNo + '),th:nth-child(' + columnNo + ')').toggle();
            $(element).toggleClass("btn-primary");
            $(element).toggleClass("btn-default");
        }

    </script>


    <table class="table table-striped table-bordered" id="example" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>Data</th>
            <th>Firma</th>
            <th>Liczba osób</th>
            <th>Wiek</th>
            <th>Start</th>
            <th>Zakończenie</th>
            <th>Program</th>
            <th>Przewodnik</th>
            <th>Język</th>
            <th>Dodatki do zwiedzania</th>
            <th>Atrakcje</th>
            <th>Wyżywienie</th>
            <th>Nocleg</th>
            <th>Uwagi</th>
            <th>Opiekun wycieczki</th>
            <th>Akcja</th>
            <th style="display:none;">Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="seeing" items="${seeings}">
            <c:set var="advance" value="${seeing.trip.advance}"/>
            <c:set var="confirmed" value="${seeing.trip.confirmed}"/>
            <c:set var="cancelled" value="${seeing.trip.cancelled}"/>
            <tr
                    <c:if test="${advance && confirmed && !cancelled}">style="background: #a6e06c;"</c:if>
                    <c:if test="${!advance && !confirmed && !cancelled}">style="background: rgba(255, 153, 153,0.6);"</c:if>
                    <c:if test="${!advance && confirmed && !cancelled}">style="background: #f0d175;"</c:if>
                    <c:if test="${cancelled && !advance && !confirmed}">style="background: linear-gradient(to bottom right, transparent calc(50% - 1px), black, transparent calc(50% + 1px));"</c:if>
            >
                <td>${seeing.date}</td>
                <td style= "text-transform: uppercase"><strong>${seeing.trip.company.name}</strong></td>
                <td>
                    Dzieci: ${seeing.trip.group.childrenNo} <br>
                    Dorośli: ${seeing.trip.group.adultsNo} <br>
                    Obsługa: ${seeing.trip.group.staffNo} <br>
                </td>
                <td>${seeing.trip.group.age}</td>
                <td>${seeing.hourFrom}</td>
                <td>${seeing.hourTo}</td>
                <td>${seeing.name}</td>
                <td>

                    <c:forEach var="guide" items="${seeing.guides}">
                        ${guide.firstName} ${guide.lastName} <br>
                    </c:forEach>
                </td>
                    <td>
                 ${seeing.language}
                    </td>
                <td>
                    <c:forEach var="additionVar" items="${seeing.trip.attractionsWithGuide}">
                        ${additionVar.addition}<br>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="attractionVar" items="${seeing.trip.attractions}">
                        ${attractionVar.name}<br>
                    </c:forEach></td>
                <td>
                    <c:forEach var="meal" items="${seeing.trip.meals}">
                        ${meal.place} - ${meal.mealType} <br>
                    </c:forEach>
                </td>
                <td>
                    <c:if test="${seeing.trip.accomodations.size() > 0}">
                        ${seeing.trip.accomodations.get(0).hotelName}
                    </c:if>
                </td>
                <td>
                    Grupa: ${seeing.trip.group.remarks}<br>
                    Zwiedzanie: ${seeing.remarks}<br>
                    <c:if test="${seeing.trip.accomodations.size() > 0}">
                        Noclegi: ${seeing.trip.accomodations.get(0).remarks}<br>
                    </c:if>
                    <c:if test="${seeing.trip.meals.size() > 0}">
                        Wyżywienie: ${seeing.trip.meals.get(i).remarks}<br>
                    </c:if>
                    <c:if test="${seeing.trip.attractions.size()> 0}">
                        Atrakcje: ${seeing.trip.attractions.get(i).remarks}<br>
                    </c:if>
                </td>
                <td>
                        ${seeing.trip.accountExecutive}
                </td>
                <td>
                    <a href="costEstimateForm?tripId=${seeing.trip.id}" title="Generuj kosztorys"><i
                            class="fa fa-file-pdf-o fa-lg" aria-hidden="true"></i></a>
                    <form action="/deleteTrip/${seeing.trip.id}" method="post" style="display:inline;">
                        <button type="submit" value="delete"
                                onclick="return confirm('Czy na pewno chcesz usunąć tą wycieczkę?')"
                                class="trash-button" title="Usuń"><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i>
                        </button>
                    </form>
                    <a href="showTrip?id=${seeing.trip.id}" title="Edytuj"><i class="fa fa-pencil fa-lg"
                                                                              aria-hidden="true"></i></a>
                </td>
                <td style="display:none;">
                      ${seeing.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${seeing.trip.advance ? 'Opłacona': 'Nieopłacona'}
                    i ${seeing.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div> <!--  end of container-->
<jsp:include page="scriptLinks.jsp"></jsp:include>
</body>

</html>

