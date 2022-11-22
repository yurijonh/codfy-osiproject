<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.qosi.bean.*"%>
<%@page import="com.qosi.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Opções</title>
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
        <a href="Bemvindo.jsp" id="cad" style="font-size:13px; font-size: 13pt;" >Voltar</a>
        <%
			Database nome = new Database();
			String user = session.getAttribute("usuario").toString();
			out.print("<label id='user'>Usuário: "+nome.getNome(user)+"</label>");
		%>
       </div>
    </nav>

	<div align="center" style="padding-top: 100px; display: flex; flex-direction: row; justify-content: center;">
        <div style="padding:100px; background-color: white; border-radius:12px">
            <a href="MeusDados.jsp" style="color:black; text-decoration: none;">Meus dados cadastrais</a>
        </div>
        &nbsp;&nbsp;
        <div style="padding:100px; background-color: white; border-radius:12px">
            <a href="minhasQuestoes.jsp" style="color:black; text-decoration: none;">Minhas questões cadastradas</a>
        </div>
        <br><br>
    </div>

</body>
</html>