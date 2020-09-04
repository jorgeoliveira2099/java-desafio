
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<c:if test="${empty sessionScope['usuario']}">
		<c:set var="msgAviso" value="Você precisa entrar no sistema para ter acesso a esse conteúdo" scope="session" />
		<c:redirect url="index.jsp" />
	</c:if>
	
	<meta charset="UTF-8">
	<title>Listar Usuarios</title>
</head>
<body>
 <nav>
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">Sefaz</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href= "usuario?opcao=criar">Cadastrar um Usuário</a></li>
        <li><a href= "usuario?opcao=listar">Listar todos os Usuários</a></li>
        <li><a href="logout">Logout</a></li>
      </ul>
    </div>
  </nav> 
  <div class="container">	
	<h3>Listar Usuarios</h3> 
	<a class="waves-effect waves-light btn" href= "usuario?opcao=voltar&view=principal.jsp">Voltar</a>	
	<table border="1" class="striped">
		<tr>
			<td>Id</td>
			<td>Nome: </td>
			<td>Email: </td>
			<td>Senha: </td>
			<td>DDD: </td>
			<td>Número: </td>
			<td>Tipo de Telefone: </td>
			<td>Ação:</td>
		</tr>		
		<c:forEach var="arrayUsuario" items="${arrayUsuario}" varStatus="loopUsuario">
			<tr>
				<td><c:out value="${arrayUsuario.id_usuario}"></c:out> </td>
				<td><c:out value="${arrayUsuario.nome}"></c:out></td>
				<td><c:out value="${arrayUsuario.email}"></c:out></td>
				<td><c:out value="${arrayUsuario.senha}"></c:out></td>
				<td><c:forEach var="arrayUsuarioTelefone" items="${arrayUsuarioTelefone[loopUsuario.index]}">
					<c:out value="${arrayUsuarioTelefone.ddd}"></c:out><br>
				</c:forEach></td>
				<td><c:forEach var="arrayUsuarioTelefone" items="${arrayUsuarioTelefone[loopUsuario.index]}">
					<c:out value="${arrayUsuarioTelefone.numero_telefone}"></c:out><br>
				</c:forEach></td>
				<td><c:forEach var="arrayTelefoneTipo" items="${arrayTelefoneTipo[loopUsuario.index]}">
					<c:out value="${arrayTelefoneTipo.nome}"></c:out><br>
				</c:forEach></td>
				<td>
				 <a class="waves-effect waves-light btn" href="usuario?opcao=deletar&id_usuario=<c:out value="${arrayUsuario.id_usuario}"></c:out> "> Excluir </a>  
				 <a class="waves-effect waves-light btn" href="usuario?opcao=meditar&id_usuario=<c:out value="${arrayUsuario.id_usuario}"></c:out>"> Editar </a>
				 </td>
			</tr>
		</c:forEach>		
	</table>
</div>
 <footer class="page-footer">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">Desafio Sefaz</h5>
                <p class="grey-text text-lighten-4">Desafio realizado com Java 1.8, JDBC, Maven, JSP e Materialize</p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="#!">Saiba Mais</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Contato</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Quem somos nós</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Redes Sociais</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2020 Desafio Sefaz
            <a class="grey-text text-lighten-4 right" href="#!">Muito Mais</a>
            </div>
          </div>
        </footer>
</body>
</html>