<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Dodaj użytkownika</title>
    <jsp:include page="stylesheets.jsp"></jsp:include>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="resources/css/timepicki.css">
    <script src="resources/js/init.js"></script>


</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<div class="container mainContainer">
    <div class="row">
        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">Dodaj konto użytkownika</h4>
            </div>

            <form:form action="addUser" method="POST" modelAttribute="user">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userEmail">Nazwa użytkownika</label>
                        <form:input path="username" type="text" class="form-control" required="" name="userEmail" value=""/>
                        <span class="help-block">Nazwa ta wykorzystywana jest do logowania</span>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="password">Hasło</label>
                                <form:input path="password" id="password" type="password" class="form-control" required="" name="password"
                                       value=""/>
                                <span class="help-block">Wpisz hasło</span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="passwordr">Powtórz hasło</label>
                                <input id="passwordr" type="password" class="form-control" required="" name="passwordr"
                                       value="">
                                <span class="help-block">Wpisz hasło ponownie. Hasła muszą być takie same.</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <input type="hidden" name="isEmpty" value="">
                    <button type="input" name="submit" value="newAccount" class="btn btn-success btn-icon"><i
                            class="fa fa-check"></i> Utwórz konto
                    </button>

                </div>
            </form:form>

        </div>
    </div>

    <c:if test="${param.success == 'true'}">
        <div class="alert alert-success alert-dismissable">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Och tak!</strong> Utworzono użytkownika
        </div>
    </c:if>
    <c:if test="${param.success == 'false'}">
        <div class="alert alert-danger alert-dismissable">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Oj oj oj!</strong> Nie udało się dodać użytkownika. Sorki! <br>
        </div>
    </c:if>


</div>


<jsp:include page="scriptLinks.jsp"/>
<script>
    var password = document.getElementById("password")
        , passwordr = document.getElementById("passwordr");

    function validatePassword() {

        if (password.value != passwordr.value) {
            passwordr.style["border-color"] = "red";
            passwordr.setCustomValidity("Hasła nie pasują");
        } else {
            passwordr.removeAttribute("style");
            passwordr.style["border-color"] = "green";
            passwordr.setCustomValidity("");
        }
    }

    password.onchange = validatePassword;
    passwordr.onkeyup = validatePassword;
</script>
</body>

</html>