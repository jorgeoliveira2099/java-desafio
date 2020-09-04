<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script> 

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>	
		
	
	<meta charset="UTF-8">
	<title>Cadastrar usuário</title>
	<script type="text/javascript">
		  $(document).ready(function(){
		    $('select').formSelect();
		  });
	</script>

</head>
<body>
   
  <div class="container">

	<h5>Cadastrar usuário</h5>
	<form id="form_usuario" action="usuario" method="post">
		<input type="hidden" name="opcao" value="guardar">
		<table border="1" class="highlight">
			<tr>
				<td>
					<div class="input-field col s6">
						<p>Nome Completo</p>
						<input id="nome_prefix" type="text" placeholder="Nome completo" size="30" name="nome">						
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s6">
					<p>E-mail</p>						
						<input id="email_prefix" type="email" name="email">						
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s6">
						<p>Senha</p>
						<input id="senha_prefix" type="password" class="validate" name="senha">						
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s5">
						<div class="left-align">							
							<label>Telefone 01</label>
						</div>
						<select name="id_telefone_tipo01">
							<option value="">Tipo de telefone</option>
							<c:forEach var="telefoneTipo" items="${lista}">
							<option value="<c:out value="${telefoneTipo.id_telefone_tipo}"></c:out>"><c:out value="${telefoneTipo.nome}"></c:out></option>
							</c:forEach>						
						</select>
						<div class="input-field col s1">
							<input id="ddd01_prefix" type="text" name="ddd01" maxlength="3" size="5">
							<label for="ddd01_prefix">DDD </label>
				        </div>
						<div class="input-field col s1">
							<input id="numero01_prefix" type="text" name="telefone01" maxlength="9" size="13">
							<label for="numero01_prefix">Número de telefone </label>
				        </div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s5">
						<div class="left-align">
							
							<label>Telefone 02</label>
						</div>
						<select name="id_telefone_tipo02">
							<option value="">Tipo de telefone</option>
							<c:forEach var="telefoneTipo" items="${lista}">
							<option value="<c:out value="${telefoneTipo.id_telefone_tipo}"></c:out>"><c:out value="${telefoneTipo.nome}"></c:out></option>
							</c:forEach>						
						</select>
						<div class="input-field col s1">
							<input id="ddd02_prefix" type="text" name="ddd02" maxlength="3" size="5">
							<label for="ddd02_prefix">DDD </label>
				        </div>
						<div class="input-field col s1">
							<input id="numero02_prefix" type="text" name="telefone02" maxlength="9" size="13">
							<label for="numero02_prefix">Número de telefone </label>
				        </div>
					</div>
				</td>
			</tr>		
		</table>		
		  <button class="btn-large waves-effect waves-dark" type="submit" value="Guardar">Cadastrar		   
		  </button>
		<p></p>
		<br>
		<c:if test="${!empty sessionScope['usuario']}">			
				<a class="waves-effect waves-light btn-large" href= "usuario?opcao=voltar&view=principal.jsp">Voltar</a>
			<p></p>
		</c:if>
		<c:if test="${empty sessionScope['usuario']}">			
				<a class="waves-effect indigo-darken btn-large" href= "usuario?opcao=voltar">Voltar</a>			
		</c:if>
		<br>
	</form>
</div>
</div>
</body>
</html>