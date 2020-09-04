<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>Usuários</title>
</head>
<body>
 <nav>
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">Desafio Sefaz</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href= "usuario?opcao=criar">Cadastrar suário</a></li>
        <li><a href= "usuario?opcao=listar">Listar usuários</a></li>
        <li><a href="logout">Logout</a></li>
      </ul>
    </div>
  </nav> 	
  <div class="container">	
	<c:if test="${!empty sessionScope.msgAviso }">
		<tr>
			<td class="center-align">
				<font size="5" color="<c:out value="${sessionScope.msgAvisoCor}"/>">
				Olá <c:out value="${sessionScope.usuario.nome}"/>
				</font>
			</td>
		</tr>
	</c:if>		
	<div class="row">
    <div class="col s12 m6">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title">Olá <c:out value="${sessionScope.usuario.nome}"/> O que deseja fazer ?</span>
          <p>Para usar o sistema é simples, basta escolher uma opção no menu a cima e o resto é auto-explicativo.</p>
        </div>
        <div class="card-action">
          <a href= "usuario?opcao=criar">Cadastrar</a>
        <a href= "usuario?opcao=listar">Listar</a>
        </div>
      </div>
    </div>
  </div>  
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