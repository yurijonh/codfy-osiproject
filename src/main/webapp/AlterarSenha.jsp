<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meu cadastro</title>
<link rel="stylesheet" href="css/nav.css">
</head>
<body style="background-image: url(img/backgroundOSI.png); background-size:100%; background-repeat:no-repeat">
<%
if (session.getAttribute("usuario") == null) {
	response.sendRedirect("Login.jsp");
}
%>
	<nav>
       <div>
        <a href="sobre.jsp" style=color:black;>Sobre</a>
        <a href="logout.jsp" style=color:black;>Sair</a>
       </div>
    </nav>

	<div align="center" style="padding-top: 100px; display: flex; flex-direction: row; justify-content: center;">
        <div width="250px" style="padding: 75px; background-color: white; border-radius:12px; color: black;">
            <h2>Alterar senha</h2>
            <form action="altSenha">
            	Senha atual: 
            	<input type="password" name="oldPassword" required placeholder="Senha atual">
            	<br><br>
            	Novo senha: 
            	<input type="password" name="novoPassword" required placeholder="Nova senha">
            	<br><br>
            	<input type="submit" value="Alterar" style="background-color: rgba(5,124,196,255);; border: none; padding: 3px; border-radius: 4px; font-size: 12pt; color:white;">
            	<a href="MeusDados.jsp" style="text-decoration: none; color: white; background-color: rgba(5,124,196,255);;" id="cad">Voltar</a>
            </form>  
        </div>
    </div>

</body>
</html>