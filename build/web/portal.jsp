<%-- 
    Document   : portal
    Created on : 29/08/2018, 00:19:22
    Author     : Ronaldo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="/erro.jsp"%>
<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <title>Portal</title>
    </head>
    <body>
        <c:if test="${empty sessionScope.login}">
            <jsp:forward page="/index.jsp">
                <jsp:param name="msg" value="USUÁRIO DEVE SE AUTENTICAR PARA ACESSAR O SISTEMA"/>
            </jsp:forward>
        </c:if>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <jsp:useBean id="login" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"/>
            <div class="navbar-collapse collapse w-100">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="ClientesServlet">Lista de Clientes</a></li>
                </ul>
            </div>
            <div class="navbar-collapse w-100">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><p class="nav-link active">Bem vindo, <c:out value="${login.nome}"/>
                    <li class="nav-item"><a class="nav-link" href="LogoutServlet">Sair</a></li>
                </ul>
            </div>
        </nav>
        <footer class="page-footer font-small teal pt-4">
            Em caso de problemas contate o administrador: <c:out value="${configuracao.email}"/>
        </footer>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.buttflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
