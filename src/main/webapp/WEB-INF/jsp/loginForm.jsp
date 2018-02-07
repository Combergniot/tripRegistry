<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="stylesheets.jsp"></jsp:include>
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
            <title>Zaloguj się</title>

        </head>
        <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="container-fluid" id="loginBgWrapper">


                <div class="container mainContainer">
                    <div class="loginContainer text-center">
                        <div class="row">
                            <h2 class="heading-login">Logowanie</h2>  
                        </div>

                    <c:if test="${param.error ne null}">
                        <div class="login-error-message">Nieprawidłowe dane logowania.</div>
                    </c:if>
                    <div class="row text-center">
                        <div class="form-wrapper col-lg-12 col-md-12 col-sm-12">


                            <form c:action="{@/login}" method="post" class="form-horizontal text-center">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="remember-me" value="true"/>

                                <!--                        <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>-->
                                <input class="form-control input-lg login" type="text" id="username" name="username" placeholder="Login"/>


                                <!--                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>-->
                                <input class="form-control input-lg login" type="password" name="password" placeholder="Hasło"  />
                                <button class="btn btn-secondary login" type="submit">Zaloguj się</button>

                                <!--                    <span class="help-block">Wpisz swój login i hasło</span>-->
                                <br/>

                                <div></div>
                            </form>  
                        </div> 
                    </div>

                </div>

            </div>
            <h4>wersja: ${applicationVersion}</h4>
        </div>  <!--end of background wrapper-->

        <jsp:include page="scriptLinks.jsp"></jsp:include>
    </body>

</html>