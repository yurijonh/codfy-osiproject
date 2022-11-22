<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<link rel="stylesheet" href="css/nav.css">
</head>
<body style="background-image: url(img/backgroundOSI.png); background-size:100%; background-repeat:no-repeat;">
	<nav>
       <div>
<!--         <img  id="img" src="img/LogoFinalFundoTransparente.png"> -->
        <a href="sobre.jsp" style="color:black;">Sobre</a>
       </div>
    </nav>

	<div align="center" id="loginlog">
        
        <div align="center" style="padding:30px; width: 300px; border-radius:10px" >
            <img src="img/LogoFinalFundoTransparente.png" alt="logotipo" width="50px" id="img2" >
            <h2 style="color:White">Login</h2>
            
            <form action="login" id=login >
                <table>
                    <tr>
                        <td colspan="2">
                            <input type="text" name="user" placeholder="email" size="20px" style="height:20px; border-radius: 5px" required> 
                        </td>
                        <td></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2">
                            <input type="password" name="pass" placeholder="senha" size="20px" style=" height:20px; border-radius: 5px" required>
                        </td>
                        <td></td>
                    </tr>
                    <tr align="center">
                        <td >
                            <input type="submit" name="login" value="Login" id="log">
                            
                            
                        </td>
                        
                        <td>
                        	<a href="Cadastro.jsp" id="cad" Style="font-size:14px" >Cadastrar</a>
                        </td>
    
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>