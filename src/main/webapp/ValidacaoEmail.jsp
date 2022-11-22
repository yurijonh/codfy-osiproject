<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Validação do Email</title>
<link rel="stylesheet" href="css/nav.css">
</head>
<body style="background-image: url(img/backgroundOSI.png); background-size:100%; background-repeat:no-repeat">

	<nav>
       <div>
<!--         <img  id="img" src="img/LogoFinalFundoTransparente.png"> -->
        <a href="sobre.jsp" style="color:black;">Sobre</a>
       </div>
    </nav>

	<div align="center" style="padding: 30px;">

		<div align="center"
			style="padding: 30px; width: 300px; border-radius: 10px">
			<img src="img/LogoFinalFundoTransparente.png" alt="logotipo" width="50px">
			<h2 style="color:white;">Cadastro</h2>

			<form action="validar" id=codigo>
				<label><b><h3 style=color:white;>Código de verificação:</h3></b></label><br>
				<table>	
					<tr>
						<td colspan="2">
						<input type="text" name="codigo"
							placeholder="Código" size="20px"
							style="height:20px; border-radius: 5px" required>
						</td>
						<td></td>
					</tr>

					<tr>
						<td align="center"><input type="submit" name="validar" value="Validar Email" id="cad">
						<a href="Cadastro.jsp" id="cad" style="font-size:13px">Voltar</a></td>

					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>