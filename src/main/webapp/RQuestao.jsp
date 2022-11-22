<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.qosi.bean.*"%>
<%@page import="com.qosi.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Resolver Questões</title>
<link rel="stylesheet" href="css/nav.css">
</head>
<%
if (session.getAttribute("usuario") == null) {
	response.sendRedirect("Login.jsp");
}
%>
<body
	style="background-image: url(img/backgroundOSI.png); background-size: 100%; background-repeat: no-repeat">
	<nav>
		<div>
			<a href="sobre.jsp" style="color: black;">Sobre</a> <a
				href="logout.jsp" style="color: black;">Sair</a>
			<%
			Database nome = new Database();
			String user = session.getAttribute("usuario").toString();
			out.print("<label id='user'>Usuário: "+nome.getNome(user)+"</label>");
		%>
		</div>
	</nav>

	<div
		style="padding-top: 20px; display: flex; flex-direction: row; justify-content: center;">
		<form action="Questionario.jsp">
			<h2
				style="background-color: white; color: black; width: 300px; border-radius: 8px; text-align: center;">Resolução
				de questões</h2>
			<table align="center">

				<tr>
					<td>
						<p>
							<b style="color: white;">Quantidade de questões:</b>
						</p> <input type="text" name="qtd" required
						placeholder="Quantidade de questões">
					</td>
				</tr>
				<tr>
					<td><br> <input type="submit" name="enviar"
						value="Gerar questionário" id="cad"> <a
						href="Bemvindo.jsp" id="cad" style="font-size: 13px">Voltar</a></td>
				</tr>

			</table>

		</form>

	</div>
</body>
</html>