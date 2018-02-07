<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <title>Raport: zwiedzania</title>
        <jsp:include page="stylesheets.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container-fluid mainContainer">
                <h1>Raport - zwiedzania</h1>
                <h3>Znaleziono wpisów: ${seeings.size()}</h3>
            <c:if test="${param.deleteSuccess == 'true'}">
                <div class="alert alert-success alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Udało się!</strong> Wpis został usunięty
                </div>
            </c:if>
            
            <c:if test="${param.deleteSuccess == 'false'}">
                <div class="alert alert-danger alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Oj oj oj!</strong> Nie udało się usunąć wpisu. Sorki! 
                </div>
            </c:if>
            
            
            <table class="table table-striped table-bordered" id="example" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Data</th>
                        <th>Liczba osób</th>
                        <th>Wiek</th>
                        <th>Firma</th>
                        <th>Start</th>
                        <th>Zakończenie</th>
                        <th>Program</th>
                        <th>Przewodnik</th>
                        <th>Dodatki</th>
                        <th>Język</th>
                        <th>Uwagi</th>
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
                            <td>
                                Dzieci:  ${seeing.trip.group.childrenNo} <br>
                                Dorośli:  ${seeing.trip.group.adultsNo} <br>
                                Obsługa:  ${seeing.trip.group.staffNo} <br>

                            </td>
                            <td>${seeing.trip.group.age}</td>
                            <td>${seeing.trip.company.name}</td>
                            <td>${seeing.hourFrom}</td>
                            <td>${seeing.hourTo}</td>
                            <td>${seeing.name}</td>
                            <td>
                                <c:forEach var="guide" items="${seeing.guides}">
                                    ${guide.firstName} ${guide.lastName} <br>
                                </c:forEach>           
                            </td> 
                            <td>
                            ${seeing.addition}
                            </td>
                            <td>
                            ${seeing.language}
                            </td>
                            <td>${seeing.remarks}</td>
                            <td><a href="costEstimateForm?tripId=${seeing.trip.id}" title="Generuj kosztorys"><i class="fa fa-file-pdf-o fa-lg" aria-hidden="true"></i></a>
                                <form action="/deleteTrip/${seeing.trip.id}" method="post"  style="display:inline;">
                                <button type="submit" class="trash-button"  title="Usuń"><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i></button>
                            <a href="showTrip?id=${seeing.trip.id}" title="Edytuj"><i class="fa fa-pencil fa-lg" aria-hidden="true"></i></a>
                                </td>
                             <td style="display:none;">
                             ${seeing.trip.cancelled ? 'Anulowana': 'Nieanulowana'}: ${seeing.trip.advance ? 'Opłacona': 'Nieopłacona'} i ${seeing.trip.confirmed ? 'potwierdzona': 'niepotwierdzona'}
                             </td>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>


        </div> <!--  end of container-->
        <jsp:include page="scriptLinks.jsp"></jsp:include>
    </body>

</html>

