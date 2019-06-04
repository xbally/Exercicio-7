<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="/erro.jsp"%>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-md bg-dark">
            <div class="navbar">
                <ul class="navbar-nav">
                    <li class="nav-item">Bem vindo. Faça login para começar</li>
                </ul>
            </div>
        </nav> 
        <c:if test="${!(empty param.msg)}">
            <div class="container">
                <div class="row alerta">
                    <div class="col-md-4"></div>
                    <div class="col-md-5 alert alert-warning alert-dismissable fade show">
                        ${param.msg}
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                    </div>
                </div>
            </div>
        </c:if>
        <div class="center">
            <div class="container">
                <div class="row">
                    <div class="col-md-6"></div>
                    <h1>Login</h1>
                </div>
                <form action="LoginServlet" method="POST">
                    <div class="form-group row">
                        <div class="col-md-4"></div>
                        <input type="text" class="form-control col-md-5" id="login" placeholder="Seu nome de usuário" name="login">
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4"></div>
                        <input type="password" class="form-control col-md-5" id="senha" placeholder="Sua senha" name="senha">
                    </div>
                    <div class="form-group row">
                        <div class="col-md-5"></div>
                        <button type="submit" class="btn btn-primary col-md-3">Login</button>
                    </div>
                </form>
            </div>
        </div>
        <jsp:useBean id="configuracao" class="com.ufpr.tads.web2.beans.ConfigBean" scope="application"/>
        <footer class="page-footer font-small teal pt-4">
            Em caso de problemas contate o administrador: <c:out value="${configuracao.email}"/>
        </footer>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
