<%-- 
    Document   : clientesAlterar
    Created on : 11/09/2018, 04:08:25
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
        <title>Alterar Cliente</title>        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/clientesAlterar.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/jquery.mask.js" type="text/javascript"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="maskedinput-1.3.js" type="text/javascript"></script>
            <script type="text/javascript" >

$(document).ready(function() {
    $( "#estado" ).change(function() {
      getCidades();
    });
});

function getCidades(){
    var estadoId = $("#estado").val();
    var url = "CidadeServlet";
    $.ajax({
            url : url, // URL da sua Servlet
            data : {
                estadoId : estadoId
            }, // Parâmetro passado para a Servlet
            dataType : 'json',
            success : function(data) {
                // Se sucesso, limpa e preenche a combo de cidade
                // alert(JSON.stringify(data));
                $("#cidade").empty();
                $.each(data, function(i, obj) {
                    $("#cidade").append('<option value=' + obj.id + '>' + obj.nome + '</option>');
                });
            },
            error : function(request, textStatus, errorThrown) {
                alert(request.status + ', Error: ' + request.statusText);
                 // Erro
            }
        });
}
</script>


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
            <br><h1><c:out value="${(!(empty param.form) || param.form == \"alterar\") ? \"Alterar Cliente\" : \"Novo Cliente\"}"/></h1><br>
            <form action="<c:out value="${(!(empty param.form) || param.form == \"alterar\") ? \"ClientesServlet?action=update\" : \"ClientesServlet?action=new\"}"/>" method="POST">
                <c:if test="${(!(empty param.form) || param.form == \"alterar\")}" >
                    <input type="hidden" name="id" value="<c:out value="${alterar.id}"/>">
                </c:if>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label for="cpf">CPF:</label>
                        <input class="form-control" type="text" name="cpf" maxlength="11" value="<c:out value="${(!(empty param.form) || param.form == \"alterar\") ? alterar.cpf : \"\"}"/>" placeholder="CPF" required/><br/>
                    </div>
                    <div class="form-group col-md-10">
                        <label for="nome">Nome:</label>
                        <input class="form-control" type="text" name="nome" maxlength="100" value="<c:out value="${(!(empty param.form) || param.form == \"alterar\") ? alterar.nome : \"\"}"/>" placeholder="Nome" required/><br/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-10">
                        <label for="email">E-mail:</label>
                        <input class="form-control" type="email" name="email" maxlength="100" value="<c:out value="${(!(empty param.form) || param.form == \"alterar\") ? alterar.email : \"\"}"/>" placeholder="E-mail" required/><br/>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="data">Data de Nascimento:</label>
                        <input class="form-control" type="date" name="data" value="<c:out value="${(!(empty param.form) || param.form == \"alterar\") ? alterar.data : \"\"}"/>" placeholder="Data de Nascimento" required/><br/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label for="cep">CEP:</label>
                        <input class="form-control" type="text" name="cep" maxlength="8" value="<c:out value="${(!(empty param.form) || param.form == \"alterar\") ? alterar.cep : \"\"}"/>" placeholder="CEP" required/><br/>
                    </div>
                    <div class="form-group col-md-10">
                        <label for="rua">Rua:</label>
                        <input class="form-control" type="text" name="rua" maxlength="100" value="<c:out value="${(!(empty param.form) || param.form == \"alterar\") ? alterar.rua : \"\"}"/>" placeholder="Rua" required/><br/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label for="numero">Número:</label>
                        <input class="form-control" type="int" name="nr" value="<c:out value="${(!(empty param.form) || param.form == \"alterar\") ? alterar.nr : \"\"}"/>" placeholder="Número" required/><br/>
                    </div>
                  <div class="form-group col-md-1">
                        <label for="uf">UF:</label>
                        <select id="estado" name="uf" class="custom-select" required>
                        <c:forEach items="${estados}" var="estado">
                            <option value="<c:out value="${estado.id}"/>"><c:out value="${estado.sigla}"/></option>
                        </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-9">  
                        <label for="cidade">Cidade:</label>
                        <select id="cidade" name="cidade" class="custom-select" required>
                        </select>
                    </div>
                </div>
                <input class="btn btn-outline-success" type="submit" value="<c:out value="${(!(empty param.form) || param.form == \"alterar\") ? \"Alterar\" : \"Salvar\"}"/>"/>
                <a class="btn btn-outline-danger" href="ClientesServlet">Cancelar</a>
            </form>
        </div>
       </body>
 <script type="text/javascript">

    jQuery(document).ready(function($) {
            $('#rg').mask('99.999.999-9');    
            $('#cpf').mask('999.999.999-99');    
    }); 
    
    
    console.log("dataNascimento");
</script>
</html>
