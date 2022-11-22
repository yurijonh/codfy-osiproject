<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.qosi.model.*"%>

<% 
Database db = new Database();
if (session.getAttribute("usuario") == null) {
	response.sendRedirect("Login.jsp");
}else{
	String user = session.getAttribute("usuario").toString();
	String nome = request.getParameter("novoNome");
	
	db.alterarNome(nome, user);
	response.sendRedirect("MeusDados.jsp");
}
%>