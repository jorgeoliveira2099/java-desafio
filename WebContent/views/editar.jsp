<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script> 
	<script src="js/validarFormEditarUsuario.js" type="text/javascript"></script>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


	
	<c:if test="${empty sessionScope['usuario']}">
		<c:set var="msgAviso" value="Você precisa entrar no sistema para ter acesso a esse conteúdo" scope="session" />
		<c:redirect url="index.jsp" />
	</c:if>
	
	<meta charset="UTF-8">
	<title>Editar</title>
	<script type="text/javascript">
		  $(document).ready(function(){
		    $('select').formSelect();
		  });
		  $(document).ready(function() {
		    $('select').material_select();
		  });
  </script>
	
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
	<h3>Editar</h3>
	<form id="form_usuario" action="usuario" method="post">
	<c:set var="usuario" value="${usuario}"></c:set>
		<input type="hidden" name="opcao" value="editar">
		<input type="hidden" name="id_usuario" value="${usuario.id_usuario}">
		<table border="1">
			<tr>
				<td>
					<div class="input-field col s6">						
						<input id="nome_prefix" type="text" class="validate" campo-obrigatorio size="30" name="nome" value="${usuario.nome}">
						<label for="nome_prefix">Nome </label>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s6">						
						<input id="email_prefix" type="email" class="validate"  name="email" value="${usuario.email}">
						<label for="email_prefix">E-mail </label>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s6">						
						<input id="senha_prefix" type="password" class="validate" name="senha" value="${usuario.senha}">
						<label for="senha_prefix">Senha </label>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s12">
						<div class="left-align">							
							<label>Telefone 01</label>
						</div>					
						<select name="id_telefone_tipo01">
							<option value="">Selecione...</option>
								<c:forEach var="listaTiposTelefone" items="${listaTiposTelefone}">
								<option value="<c:out value="${listaTiposTelefone.id_telefone_tipo}"></c:out>" 
									<c:forEach var="arrayUsuarioTelefone" begin="0" end="0" items="${arrayUsuarioTelefone}">
										<c:if test="${arrayUsuarioTelefone.id_telefone_tipo == listaTiposTelefone.id_telefone_tipo}"> 
											<c:out value = "selected='selected'"> </c:out>
										</c:if>
									</c:forEach>><c:out value="${listaTiposTelefone.nome}"></c:out>
								</option>
								</c:forEach>
						</select>
						<div class="input-field col s1">
							<input id="ddd01_prefix" type="text" name="ddd01" maxlength="3" size="5" value =<c:forEach var="arrayUsuarioTelefone" begin="0" end="0" items="${arrayUsuarioTelefone}">
								<c:out value="${arrayUsuarioTelefone.ddd}"></c:out>
							</c:forEach>>
							<label for="ddd01_prefix">DDD </label>
				        </div>
						<div class="input-field col s1">
							<input id="numero01_prefix" type="text" name="telefone01" maxlength="9" size="13"value =<c:forEach var="arrayUsuarioTelefone" begin="0" end="0" items="${arrayUsuarioTelefone}">
								<c:out value="${arrayUsuarioTelefone.numero_telefone}"></c:out>
							</c:forEach>>
							<label for="numero01_prefix">Número de telefone </label>
				        </div>
					</div>

				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s12">
						<div class="left-align">
							<i class="material-icons prefix">phone</i>
							<label>Telefone 02</label>
						</div>
					
						<select name="id_telefone_tipo02">
							<option value="">Selecione...</option>
								<c:forEach var="listaTiposTelefone" items="${listaTiposTelefone}">
								<option value="<c:out value="${listaTiposTelefone.id_telefone_tipo}"></c:out>" 
									<c:forEach var="arrayUsuarioTelefone" begin="1" end="1" items="${arrayUsuarioTelefone}">
										<c:if test="${arrayUsuarioTelefone.id_telefone_tipo == listaTiposTelefone.id_telefone_tipo}"> 
											<c:out value = "selected='selected'"> </c:out>
										</c:if>
									</c:forEach>><c:out value="${listaTiposTelefone.nome}"></c:out>
								</option>
								</c:forEach>
						</select>
						<div class="input-field col s1">
							<input id="ddd02_prefix" type="text" name="ddd02" maxlength="3" size="5" value =<c:forEach var="arrayUsuarioTelefone" begin="1" end="1" items="${arrayUsuarioTelefone}">
								<c:out value="${arrayUsuarioTelefone.ddd}"></c:out>
							</c:forEach>>
							<label for="ddd02_prefix">DDD </label>
				        </div>
						<div class="input-field col s1">
							<input id="numero02_prefix" type="text" name="telefone02" maxlength="9" size="13"value =<c:forEach var="arrayUsuarioTelefone" begin="1" end="1" items="${arrayUsuarioTelefone}">
								<c:out value="${arrayUsuarioTelefone.numero_telefone}"></c:out>
							</c:forEach>>
							<label for="numero02_prefix">Número de telefone </label>
				        </div>
					</div>

				</td>
			</tr>
			
		</table>	
		  <button class="btn-large waves-effect waves-light" type="submit" value="Guardar">Editar</button>			
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
