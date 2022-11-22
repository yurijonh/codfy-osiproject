<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.qosi.bean.*"%>
<%@page import="com.qosi.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Cadastro de Questões</title>
<link rel="stylesheet" href="css/nav.css">
</head>
<body style="background-image: url(img/backgroundOSI.png); background-size:100%; background-repeat:no-repeat">
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
<%
if (session.getAttribute("usuario") == null) {
	response.sendRedirect("Login.jsp");
}
%>
	<div style="padding-top: 20px; display: flex; flex-direction: row; justify-content: center;">
		<form action="type" >
			<h2 style="background-color:white; color:black; width:300px; border-radius: 8px; text-align:center;">Cadastro de questão</h2>
			<table align="center">
<!-- 				<tr > -->
<!-- 					<td> -->
<!-- 						<p> -->
<!-- 							<b>Tipo de questão:</b> -->
<!-- 						</p>  -->
<!-- 						<input type="radio" name="tipo" value="Multipla escolha" required>Multipla escolha<br> -->
<!-- 						<input type="radio" name="tipo" value="Verdadeiro ou falso" required>Verdadeiro ou falso -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr >
					<td>
						<p>
							<b>Área da questão:</b>
						</p> 
						<input type="radio" name="area" value="Redes" required>Redes<br>
						<input type="radio" name="area" value="Sistemas Operacionais" required>Sistemas Operacionais<br>
						<input type="radio" name="area" value="Banco de Dados" required>Banco de Dados<br>
						<input type="radio" name="area" value="Linguagem de Programação" required>Linguagem de Programação<br>
						<input type="radio" name="area" value="Sistemas Distribuídos" required>Sistemas Distribuídos<br>
						<input type="radio" name="area" value="Fundamentos da Computação" required>Fundamentos da Computação
					</td>
				</tr>
				<tr>
					<td>
					<br> 
					<input type="submit" name="enviar" value="Avançar" id="cad">
					<a href="Bemvindo.jsp" id="cad" style="font-size:13px">Voltar</a>
					</td>
				
				</tr>
			</table>
		</form>

	</div>
</body>
</html>