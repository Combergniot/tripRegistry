<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Edycja wycieczki</title>
    <jsp:include page="stylesheets.jsp"></jsp:include>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/chosen.css">
    <link rel="stylesheet" href="resources/css/datepicker.css">
    <link rel="stylesheet" type="text/css" href="resources/css/timepicki.css">
    <script src="resources/js/datepicker.js"></script>
    <script src="resources/js/init.js"></script>

    <style>
        .datepicker-container {
            z-index: 9999 !important;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<c:set var="advance" value="${trip.advance}"/>
<c:set var="confirmed" value="${trip.confirmed}"/>

<div class="container mainContainer">
    <h1 style="display:inline-block;margin-bottom:30px;">Wycieczka nr ${trip.id}</h1>
    Status:
    <c:if test="${advance && confirmed && !cancelled}}"><span
            class="label label-success">Potwierdzona i zapłacona</span></c:if>
    <c:if test="${!advance && !confirmed && !cancelled}}"><span class="label label-danger">Niepotwierdzona i niezapłacona</span></c:if>
    <c:if test="${!advance && confirmed && !cancelled}}"><span
            class="label label-warning">Potwierdzona i niezapłacona</span></c:if>
    <c:if test="${cancelled && !advance && !confirmed}}"><span>Wycieczka anulowana</span></c:if>

    <a href="#statusModal" data-toggle="modal"> &nbsp;<i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a><br>

    <div class="row">
        <div class="col-lg-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    Data od: ${trip.dateFrom} <br>
                    Data do: ${trip.dateTo}
                    <br>
                    <a href="#editDate" data-toggle="modal"><i class="fa fa-pencil-square-o fa-lg"
                                                               aria-hidden="true"></i></a> <br>
                    Opiekun grupy: ${trip.accountExecutive}
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-body">

                    Liczba osób: (Dzieci-${trip.group.childrenNo}) (Dorośli-${trip.group.adultsNo})
                    (Obsługa-${trip.group.staffNo}) <a href="#peopleNoModal" data-toggle="modal"><i
                        class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a> <br>
                    Wiek: ${trip.group.age} <a href="#myModal" data-toggle="modal"><i
                        class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a> <br>
                    Firma: ${trip.company.name} <a href="#editCompany" data-toggle="modal"><i
                        class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a> <br>
                    Uwagi: ${trip.group.remarks} <a href="#groupRemarksModal" data-toggle="modal"><i
                        class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a> <br>
                </div>
            </div>
        </div>

    </div> <!--end of row-->

    <hr>
    <div class="row">
        <h2 style="display:inline-block;margin-bottom:30px;">Posiłki</h2>
        &nbsp; <a href="#mealModal" data-toggle="modal"><i class="fa fa fa-plus-circle fa-2x"
                                                           aria-hidden="true"></i></a> <br>
        <c:forEach items="${trip.meals}" var="meal">
            <div class="col-lg-3">
                <div class="panel panel-default">
                    <div class="panel-body">

                        Rodzaj: ${meal.mealType}<br>
                        Data: ${meal.date}<br>
                        Od: ${meal.hourFrom}<br>
                        Do: ${meal.hourTo}<br>
                        Miejsce: ${meal.place}<br>
                        Uwagi: ${meal.remarks}<br>

                        <form action="removeMealFromTrip/${trip.id}/${meal.id}" method="POST">
                            <strong>Usuń</strong>
                            <button type="submit" value="delete"
                                    onclick="return confirm('Czy na pewno chcesz usunąć wskazany posiłek?')"
                                    style="border:0 solid transparent; background:transparent;"><i
                                    class="fa fa-trash-o fa-lg" aria-hidden="true"></i></button>
                        </form>


                    </div> <!--end of panel body-->
                </div>  <!--end of panel-->
            </div>
            <!--end of column-->
        </c:forEach>
    </div> <!--end of row-->


    <hr>
    <div class="row">
        <h3 style="display:inline-block;margin-bottom:30px;">Noclegi</h3>
        &nbsp; <a href="#accommodationModal" data-toggle="modal"><i class="fa fa fa-plus-circle fa-2x"
                                                                    aria-hidden="true"></i></a><br>

        <c:forEach items="${trip.accomodations}" var="accomodation">
            <div class="col-lg-3">
                <div class="panel panel-default">
                    <div class="panel-body">

                        Od: ${accomodation.dateFrom}<br>
                        Do: ${accomodation.dateTo}<br>
                        Miejsce: ${accomodation.hotelName}<br>
                        Uwagi: ${accomodation.remarks}<br>

                        <form action="removeAccommodationFromTrip/${trip.id}/${accomodation.id}" method="POST">
                            <strong>Usuń</strong>
                            <button type="submit" value="delete"
                                    onclick="return confirm('Czy na pewno chcesz usunąć wskazany nocleg?')"
                                    style="border:0 solid transparent; background:transparent;"><i
                                    class="fa fa-trash-o fa-lg" aria-hidden="true"></i></button>
                        </form>

                    </div> <!--end of panel body-->
                </div>  <!--end of panel-->
            </div>
            <!--end of column-->
        </c:forEach>
    </div> <!--end of row-->

    <hr>
    <div class="row">
        <h3 style="display:inline-block;margin-bottom:30px;">Usługi przewodnickie</h3>
        &nbsp; <a href="#sightseeingModal" data-toggle="modal"><i class="fa fa fa-plus-circle fa-2x" aria-hidden="true"></i></a><br>

        <c:forEach items="${trip.attractionsWithGuide}" var="attraction">
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-body">

                        Data: ${attraction.date}<br>
                        Od: ${attraction.hourFrom}<br>
                        Do: ${attraction.hourTo}<br>
                        <br>
                        Program: ${attraction.name}<br>
                        <a href="#" data-toggle="modal"><i class="fa fa-pencil-square-o fa-lg"
                                                           aria-hidden="true"></i></a> <br>
                        <br>
                        Dodatki: ${attraction.gingerbread ? 'Degustacja pierników':''} ${attraction.nalewki ? 'Degustacja nalewek':''} ${attraction.meetingWithCopernicus ? 'Spotkanie z Kopernikiem':''} ${attraction.meetingWithExecutioner ? 'Spotkanie z katem':''}<br>
                        <a href="#" data-toggle="modal"><i class="fa fa-pencil-square-o fa-lg"
                                                           aria-hidden="true"></i></a> <br>
                        <br>

                        <div class="panel panel-default">
                            <!-- Default panel contents -->
                            <div class="panel-heading">Przewodnicy</div>


                            <!-- Table -->
                            <table class="table">
                                <c:forEach items="${attraction.guides}" var="guide">
                                    <tr>
                                        <td>${guide.firstName} ${guide.lastName}</td>
                                        <td>
                                            <form action="removeGuideFromService/${trip.id}/${attraction.id}/${guide.id}"
                                                  method="POST" style="display:inline;">

                                                    <%--<input name="guideId" type="hidden" value="${guide.id}">--%>
                                                <button type="submit"
                                                        style="border:0px solid transparent; background: transparent; display: inline;">
                                                    <i class="fa fa-times fa-lg" aria-hidden="true"></i></button>

                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td><a id="showAddGuide" class=".open-AddGuideModal" href="#guideModal" data-toggle="modal" data-id="${attraction.id}">Dodaj
                                        przewodnika</a><br></td>

                                    <td></td>
                                </tr>
                            </table>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                             Uwagi: ${attraction.remarks} <a href="#guideRemarksModal" data-toggle="modal"><i
                               class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a> <br>
                            </div>

                        </div>
                        <strong>Usuń </strong><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i> <br>


                    </div> <!--end of panel body-->
                </div>  <!--end of panel-->
            </div>
            <!--end of column-->
        </c:forEach>
    </div> <!--end of row-->
</div> <!--  end of container-->


<!-- Group Type Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">Edycja typu grupy</h4>
            </div>
            <div class="modal-body">

                <form action="/updateGroupType/${trip.group.id}/${trip.id}/${trip.group.age}" method="post">
                    <select name="newGroupType" class="chosen-select form-control" id="groupType">
                        <option selected disabled value>Typ grupy</option>
                        <option>Przedszkolna</option>
                        <option>Dzieci I-III</option>
                        <option>Dzieci IV-VI</option>
                        <option>Młodzież</option>
                        <option>Dorośli</option>
                        <option>Seniorzy</option>
                        <option>Rodzina</option>
                    </select>
                    <button type="submit" class="btn btn-primary">Zapisz</button>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Precz</button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<jsp:include page="editTripModals/editCompany.jsp"/>
<jsp:include page="editTripModals/editPeople.jsp"/>
<jsp:include page="editTripModals/editGroupRemarks.jsp"/>
<jsp:include page="editTripModals/editGuideRemarks.jsp"/>
<jsp:include page="editTripModals/editStatus.jsp"/>
<jsp:include page="editTripModals/addMeal.jsp"/>
<jsp:include page="editTripModals/addGuide.jsp"/>
<jsp:include page="editTripModals/addSightseeing.jsp"/>


<jsp:include page="scriptLinks.jsp"/>
<jsp:include page="editTripModals/addAccommodation.jsp"/>


<script src="resources/js/chosen.jquery.js"/>
<script src="resources/js/choosen.js"/>
<script src="resources/js/giveCompanies.js"/>

</body>

</html>

