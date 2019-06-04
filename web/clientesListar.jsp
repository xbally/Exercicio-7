<%-- 
    Document   : clientesListar
    Created on : 07/09/2018, 17:45:55
    Author     : Ronaldo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="/erro.jsp"%>
<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Lista de Clientes</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
        <table class="table table-striped">
            <tr>
                <th>CPF</th><th>Nome</th><th>E-mail</th><th>Visualizar</th><th>Alterar</th><th>Remover</th>
            </tr>
            <c:forEach items="${listar}" var="cliente">
                <tr>
                    <td><c:out value="${cliente.cpf}"/></td>
                    <td><c:out value="${cliente.nome}"/></td>
                    <td><c:out value="${cliente.email}"/></td>
                    <td><a href="ClientesServlet?action=show&id=<c:out value="${cliente.id}"/>"><i class="fas fa-user"></i></a></td>
                    <td><a href="ClientesServlet?action=formUpdate&id=<c:out value="${cliente.id}"/>"><i class="fas fa-user-edit"></i></a></td>
                    <td><a href="ClientesServlet?action=remove&id=<c:out value="${cliente.id}"/>" onClick="return confirm('Deletar cliente?')"><i class="fas fa-user-times"></i></a></td>
                </tr>
            </c:forEach>
        </table>
        <a class="btn btn-outline-success" href="ClientesServlet?action=formNew">Novo Cliente</a>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.buttflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
