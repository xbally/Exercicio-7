<%-- 
    Document   : clientesVisualizar
    Created on : 11/09/2018, 04:53:10
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
        <title>Visualizar Cliente</title>
    </head>
    <body>
        <c:if test="${empty sessionScope.login}">
            <jsp:forward page="/index.jsp">
                <jsp:param name="msg" value="USUÁRIO DEVE SE AUTENTICAR PARA ACESSAR O SISTEMA"/>
            </jsp:forward>
        </c:if>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
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
        <div class="container">
            <br><h1>Visualizar Cliente</h1><br>
            <jsp:useBean id="visualizar" class="com.ufpr.tads.web2.beans.Cliente" scope="request"/>
            <div class="form-row">
                <div class="form-group col-md-2">
                    <label for="cpf">CPF:</label><input class="form-control" type="text" name="cpf" maxlength="11" value="<c:out value="${visualizar.cpf}"/>" disabled/><br/>
                </div>
                <div class="form-group col-md-10">
                    <label for="nome">Nome:</label><input class="form-control" type="text" name="nome" maxlength="100" value="<c:out value="${visualizar.nome}"/>" disabled/><br/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-10">
                    <label for="email">E-mail:</label><input class="form-control" type="email" name="email" maxlength="100" value="<c:out value="${visualizar.email}"/>" disabled/><br/>
                </div>
                <div class="form-group col-md-2">
                    <label for="data">Data Nascimento:</label><input class="form-control" type="date" name="data" value="<c:out value="${visualizar.data}"/>" disabled/><br/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-2">
                    <label for="cep">CEP:</label><input class="form-control" type="text" name="cep" maxlength="8" value="<c:out value="${visualizar.cep}"/>" disabled/><br/>
                </div>
                <div class="form-group col-md-10">
                    <label for="rua">Rua:</label><input class="form-control" type="text" name="rua" maxlength="100" value="<c:out value="${visualizar.rua}"/>" disabled/><br/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-2">
                    <label for="numero">Número:</label><input class="form-control" type="number" name="nr" value="<c:out value="${visualizar.nr}"/>" disabled/><br/>
                </div>
                <div class="form-group col-md-1">
                    <label for="uf">UF:</label><input class="form-control" type="text" name="uf" maxlength="2" value="${visualizar.cidade.estado.sigla}" disabled/><br/>
                </div>
                <div class="form-group col-md-9">
                    <label for="cidade">Cidade:</label><input class="form-control" type="text" name="cidade" maxlength="100" value="${visualizar.cidade.nome}" disabled/><br/>
                </div>
            </div>
            <a class="btn btn-outline-danger" href="ClientesServlet">Voltar</a>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.buttflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
