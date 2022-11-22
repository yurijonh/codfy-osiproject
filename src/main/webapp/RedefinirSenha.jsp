<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.qosi.bean.*"%>
<%@page import="com.qosi.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recuperar Senha</title>
<link rel="stylesheet" href="css/nav.css">
</head>
<body style="background-image: url(img/backgroundOSI.png); background-size:100%; background-repeat:no-repeat">
<nav>
       <div>
<!--         <img  id="img" src="img/LogoFinalFundoTransparente.png"> -->
        <a href="sobre.jsp" style="color:black;">Sobre</a>
       </div>
    </nav>

<div align="center">
	<h2 style="margin-top: 100px; background-color:white; color:black; width:300px; border-radius: 8px; text-align:center;">Redefinir senha</h2>
	<div  style="width: 800px; ">
		<form action="RedefSenha.jsp">
			<label style=color:white;>Nova senha</label>
			<br>
			<input type="password" name="novaSenha" placeholder="Nova senha" required>
			<br><br>
			<input type="password" name="repetirSenha" placeholder="Repita a senha" required>
			<br><br>
			<input type="submit" value="Redefinir" id="log">
		</form>		
	</div>	
</div>

	
</body>
</html>