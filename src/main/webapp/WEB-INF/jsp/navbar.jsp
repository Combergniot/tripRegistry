<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<security:authorize access="isAuthenticated()" var="isAuthenticated" />
<c:choose>
    <c:when test="${isAuthenticated}">
        <security:authentication property="principal.username" var="userName" />
    </c:when>
</c:choose>
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div id="navContainer" class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="addTrip">Dodaj wycieczkę</a></li>
                <li class="nav-item dropdown noselect" id="navDropdown">
                    <a id="dropp" class="nav-link dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Raporty <i id="reportCaret" class="fa fa-caret-down" aria-hidden="true"></i></a>
                    <div id="dropMenu" class="dropdown-menu" aria-labelledby="dropdown">
                        <a class="dropdown-item" href="/sightseeings">Zwiedzania</a>
                        <a class="dropdown-item" href="/gesia">Posiłki</a>
                        <a class="dropdown-item" href="/fort">Fort IV</a>
                        <a class="dropdown-item" href="/olbracht">Olbracht</a>
                        <a class="dropdown-item" href="/planetarium">Planetarium</a>
                        <a class="dropdown-item" href="/gingerbread">Piernikarnia</a>
                        <a class="dropdown-item" href="/mlyny">Młyny Wiedzy</a>
                        <a class="dropdown-item" href="/museum">Muzeum</a>
                        <a class="dropdown-item" href="/castle">Zamek</a>
                        <a class="dropdown-item" href="/cruise">Rejs po Wiśle</a>
                        <a class="dropdown-item" href="/additional">Niestandardowe</a>
                        <a class="dropdown-item" href="/accommodation">Noclegi</a>
                    </div>
                <li><a href="mainReport">Raport Główny</a></li>
                </li>
                <li><a href="logout">Wyloguj się</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!--      end of nav container-->
</nav>
<!--   nawigacja gorna w container -->

<c:choose>
    <c:when test="${isAuthenticated}">
        <a href="/logout" class="btn btn-secondary my-2 my-sm-0"> 
            <i class="fa fa-sign-out"></i> Logout (${userName})</a>                                 
        </c:when>
        <c:otherwise>
        <a href="/login" class="btn btn-secondary my-2 my-sm-0"> 
            <i class="fa fa-sign-in"></i> Login</a>       
        </c:otherwise>
    </c:choose>
</div>
</nav>