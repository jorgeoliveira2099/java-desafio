<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CRUD Sefaz</title>    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


</head>
<body>
<div class="container">

	<h1>Crud Sefaz </h1>
	<form action="login" method="post">
		<input type="hidden" name="opcao" value="login">
		<table border="1" class="highlight">
			<tr>
				<td>
					<div class="input-field col s6">
						
						<input id="email_prefix" type="email" class="validate"  name="email">
						<label for="email_prefix">Entre com seu E-mail</label>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s6">						
						<input id="senha_prefix" type="password" class="validate" name="senha">
						<label for="senha_prefix">Entre com sua senha</label>
			        </div>
				</td>
			</tr>
		</table>
		
		  <button class="btn waves-effect waves-light" type="submit" value="Login">Entrar</button>
		
	</form>
	<p></p>
				<a class="waves-effect waves-red btn" href= "usuario?opcao=criar">Cadastrar</a>
		
		<c:if test="${!empty sessionScope.msgAviso }">
			
					<font size="6" color="<c:out value="${sessionScope.msgAvisoCor}"/>">
						<c:out value="${sessionScope.msgAviso}"/>
					</font>
			
		</c:if>
	
</div>
	<c:set var="msgAviso" value="" scope="session" />	
</body>
</html>