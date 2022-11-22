<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.qosi.bean.*"%>
<%@page import="com.qosi.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Inicio</title>
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
<!-- 			<img id="img" src="img/logo QQ.png"> -->
			<a href="sobre.jsp" style=color:black;>Sobre</a>
			<a href="logout.jsp" style=color:black;>Sair</a>
			<%
			Database nome = new Database();
			String user = session.getAttribute("usuario").toString();
			out.print("<label id='user'>Usuário: "+nome.getNome(user)+"</label>");
			%>
		</div>
	</nav>

	<div align="center"
		style="padding-top: 100px; display: flex; flex-direction: row; justify-content: center;">
		<div
			style="padding: 100px; background-color: white; border-radius: 12px">
			<a href="Questao.jsp" style="color: black; text-decoration: none;">Cadastrar</a>
		</div>
		&nbsp;&nbsp;
		<div
			style="padding: 100px; background-color: white; border-radius: 12px">
			<a href="RQuestao.jsp" style="color: black; text-decoration: none;">Resolver</a>
		</div>
		&nbsp;&nbsp;
		<div
			style="padding: 100px; background-color: white; border-radius: 12px">
			<a href="Opcoes.jsp" style="color: black; text-decoration: none;">Opções</a>
		</div>
	</div>

</body>
</html>