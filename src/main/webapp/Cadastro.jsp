<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Cadastro</title>
<link rel="stylesheet" href="css/nav.css">
</head>
<body style="background-image: url(img/backgroundOSI.png); background-size:100%; background-repeat:no-repeat">
	<nav>
       <div>
<!--         <img  id="img" src="img/LogoFinalFundoTransparente.png"> -->
        <a href="sobre.jsp" style="color:black;">Sobre</a>
       </div>
    </nav>

    
            <div align="center" style="padding-top:80px;">
                <img src="img/LogoFinalFundoTransparente.png" alt="logotipo" width="50px" id="img2">
                <h2 style="color:White">Cadastro</h2>
                <form action="cadastro" id="cadastro" >
                    <table>
                        <tr>
                            <td colspan="2">
                                <input type="text" name="nome" required placeholder="nome" size="20px" style="height: 20px; border-radius: 5px">
                            </td>
                            <td></td>
                        </tr>
                        
                        <tr>
                            <td colspan="2">
                                <input type="text" name="email" required placeholder="email" size="20px" style="height: 20px; border-radius: 5px">
                            </td>
                            <td></td>
                        </tr>
        
                        <tr>
                            <td colspan="2">
                                <input type="password" name="senha" required placeholder="senha" size="20px" style="height: 20px; border-radius: 5px">
                            </td>
                            <td></td>
                        </tr>
        
                
                        <tr align="center">
                            <td >
                                <input type="submit" name="cadastrar" value="Cadastrar" id="inCad">
                            </td>
                        
                            <td >
                                <a href="Login.jsp" id="jaPossuo" Style="font-size:14px">Já possuo!</a>
                            </td>
                        </tr>
                    </table>
        
                </form>
    	</div>
</body>
</html>