<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.qosi.bean.*"%>
<%@page import="com.qosi.model.*"%>
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
        <%
			Database nome = new Database();
			String user = session.getAttribute("usuario").toString();
			out.print("<label id='user'>Usuário: "+nome.getNome(user)+"</label>");
		%>
       </div>
    </nav>

	<div align="center" style="padding-top: 100px; display: flex; flex-direction: row; justify-content: center;">
        <div width="250px" style="padding: 75px; background-color: white; border-radius:12px; color: black;">
            <h2 style=color:black>Alterar nome</h2>
            <form action="altNome.jsp">
            	Nome: 
            	<input type="text" name="novoNome" required placeholder="Novo nome">
            	<br><br>
            	<input type="submit" value="Alterar" style="background-color: rgba(5,124,196,255); border: none; padding: 3px; border-radius: 4px; font-size: 12pt; color:white;">
            	<a href="MeusDados.jsp" style="text-decoration: none; color: white; background-color: rgba(5,124,196,255);" id="cad">Voltar</a>
            </form>  
        </div>
    </div>

</body>
</html>