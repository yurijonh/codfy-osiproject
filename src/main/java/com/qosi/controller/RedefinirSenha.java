package com.qosi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qosi.model.Database;

@WebServlet("/redefinir")
public class RedefinirSenha extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RedefinirSenha() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		Database db = new Database();
		
		if(db.getEmail(email)) {
			request.getSession().setAttribute("email", email);
			//System.out.println("Verdade");
			response.sendRedirect("RedefinirSenha.jsp");
		} else {
			response.sendRedirect("ErroEmail.jsp");
		}
	}

}
