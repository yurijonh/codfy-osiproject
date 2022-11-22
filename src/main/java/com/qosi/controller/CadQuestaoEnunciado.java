package com.qosi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qosi.bean.QuestaoBean;
import com.qosi.model.Database;

@WebServlet("/enunciado")
public class CadQuestaoEnunciado extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CadQuestaoEnunciado() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String enunciado = request.getParameter("enunciado");
		String A = request.getParameter("A");
		String B = request.getParameter("B");
		String C = request.getParameter("C");
		String D = request.getParameter("D");
		String E = request.getParameter("E");

		QuestaoBean qb = new QuestaoBean();

		qb.setEnunciado(enunciado);
		qb.setAltA(A);
		qb.setAltB(B);
		qb.setAltC(C);
		qb.setAltD(D);
		qb.setAltE(E);

		Database ld = new Database();
		System.out.println(ld.inserirAuxQAM(qb));
		
		if(A!=null && B!=null && C!=null && D!=null && E!=null  ) {
			response.sendRedirect("QuestaoCadastrada.jsp");
		} else {
			response.sendRedirect("ErrorFieldsEmpty.jsp");
		}
	}

}
