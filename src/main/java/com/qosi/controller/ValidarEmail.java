package com.qosi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qosi.model.*;


@WebServlet("/validar")
public class ValidarEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ValidarEmail() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Database ld = new Database();
		String codigo = request.getParameter("codigo");
		System.out.println(codigo);
		
		//System.out.println(mail.getCodigo());
		if(codigo.equals(ld.getCod(codigo))) {
			//System.out.println("Iguais: "+codigo+" | "+ld.getCod(codigo));
			ld.validarEmail();
			response.sendRedirect("EmailValidado.jsp");
			
		}else {
			//System.out.println("Não iguais: "+codigo+" | "+ld.getCod(codigo));
			response.sendRedirect("ErroCodigo.jsp");
		}
	}

}
