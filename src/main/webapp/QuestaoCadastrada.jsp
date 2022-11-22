<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="Questao1.jsp" %>
<%@page import="com.qosi.model.*"%>
<%
Database ld = new Database();
if (session.getAttribute("usuario") == null) {
	response.sendRedirect("Login.jsp");
} else {
ld.copyTableQAM(session.getAttribute("usuario").toString());
}
%>
<p align="center" style="padding:0; margin:0; color: white; margin-top: 10px">Questão cadastrada com sucesso.</p>
<p align="center" style="padding:0; margin:0; font-size:14px; margin-top: 10px"><a href="Bemvindo.jsp" id="cad">Inicio</a></p>
