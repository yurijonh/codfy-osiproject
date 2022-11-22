package com.qosi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qosi.bean.QuestaoBean;
import com.qosi.model.Database;

@WebServlet("/type")
public class CadQuestaoType extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CadQuestaoType() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String tipo = request.getParameter("tipo");
		String area = request.getParameter("area");
		
		QuestaoBean qb = new QuestaoBean();
		//qb.setTipo(tipo);
		qb.setAreaQuestao(area);
		
		Database ld = new Database();
		ld.inserirAuxTA(qb);
	
		response.sendRedirect("Questao1.jsp");
		//System.out.println(tipo+" "+area);
//		if(tipo.equals("Multipla escolha")) {
//			response.sendRedirect("Questao1.jsp");
//		} else {
//			response.sendRedirect("Questao2.jsp");
//		}
	}

}
