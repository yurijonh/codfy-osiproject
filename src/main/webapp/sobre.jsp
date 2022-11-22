<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.qosi.bean.*"%>
<%@page import="com.qosi.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/nav.css">
<title>Sobre</title>
</head>
<body style="background-image: url(img/backgroundOSI.png); background-size:100%; background-repeat:no-repeat">
<%
if (session.getAttribute("usuario") == null){
	out.print("<nav align='right'>");
    out.print("<div>");
    out.print("<a href='sobre.jsp' style=color:black>Sobre</a>");
    out.print("<label id='user'><a href='Login.jsp' style=color:black>Login</a></label>");
    out.print("<label id='user'><a href='Cadastro.jsp' style=color:black>Cadastrar</a></label>");
    out.print("</div>");
    out.print("</nav>");
} else{
	Database nome = new Database();
	String user = session.getAttribute("usuario").toString();
	out.print("<nav>");
    out.print("<div>");
    out.print("<a href='sobre.jsp' style=color:black>Sobre</a>");
    out.print("<a href='logout.jsp' style=color:black>Sair</a>");
    out.print("<a href='Bemvindo.jsp' id='cad' style='font-size:13px; font-size: 13pt;' >Voltar</a>");
    out.print("<label id='user'>Usuário: "+nome.getNome(user)+"</label>");
    out.print("</div>");
    out.print("</nav>");
}
%>
<div align="center">
	<div style="width: 800px;">
    
    	<h2>Seja bem vindo ao Q-OSI!</h2>
    	<p>O Q-OSI é uma aplicação educacional. Tem por objetivo o cadastro e a realização de questões,
    	 voltadas para a Olimpíada Salgueirense de Informática (OSI).</p>
    
    </div>
    
</div>
    

</body>
</html>