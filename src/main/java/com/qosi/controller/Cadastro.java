package com.qosi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qosi.bean.*;

import com.qosi.model.*;

@WebServlet("/cadastro")
public class Cadastro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Cadastro() {
        super();
      
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		//System.out.println(nome+" "+email+" "+senha);
		
		LoginBean lb = new LoginBean();
		lb.setNome(nome);
		lb.setEmail(email);
		lb.setSenha(senha);
		
		
		Database ld = new Database();
		EmailAccess mail = new EmailAccess();
		
		ld.inserirAux(lb);
		
		if(ld.getEmail(email)) {
			response.sendRedirect("EmailInvalido.jsp");
			ld.delAtr();
		}
		else {
			mail.getProp(email);
			response.sendRedirect("ValidacaoEmail.jsp");
		}
	}

}
