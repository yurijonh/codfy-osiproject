package com.qosi.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qosi.bean.LoginBean;
import com.qosi.model.*;



/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		LoginBean lb = new LoginBean();
		
		lb.setEmail(user);
		lb.setSenha(pass);
		
		Database ld = new Database();
		System.out.println(ld.validate(lb));
		if(ld.validate(lb)) {
			request.getSession().setAttribute("usuario", user);
			response.sendRedirect("Bemvindo.jsp");
		} else {
			//response.sendRedirect("Login.jsp");
			response.sendRedirect("NaoExiste.jsp");
		}
	}
}
