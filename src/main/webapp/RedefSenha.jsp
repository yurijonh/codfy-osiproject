<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.qosi.bean.*"%>
<%@page import="com.qosi.model.*"%>
<%@include file="RedefinirSenha.jsp" %>
  
<%
String Npass = request.getParameter("novaSenha");
String RNpass = request.getParameter("repetirSenha");

if(session.getAttribute("email") != null){
	Database db = new Database();
	String email = session.getAttribute("email").toString();
	if(Npass.equalsIgnoreCase(RNpass)){
		db.redefinirSenha(email, Npass);
		response.sendRedirect("logout.jsp");
	} else{
		out.print("<br>");
		out.print("<p align='center' style='padding:0; margin:0; color:white;'>Senhas não correspondem.</p>");
	}	
}
%>