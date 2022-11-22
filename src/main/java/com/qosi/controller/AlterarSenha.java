package com.qosi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qosi.model.Database;

@WebServlet("/altSenha")
public class AlterarSenha extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AlterarSenha() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String senhaAtual = request.getParameter("oldPassword");
		String novaSenha = request.getParameter("novoPassword");
		
		Database db = new Database();
		
		if(db.alterarSenha(senhaAtual, novaSenha)){
			response.sendRedirect("logout.jsp");
		}else {
			response.sendRedirect("erroSenha.jsp");
		}
	}

}
