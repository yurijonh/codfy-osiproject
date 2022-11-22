<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.qosi.bean.*"%>
<%@page import="com.qosi.model.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Minhas questões</title>
<link rel="stylesheet" href="css/nav.css">
</head>
<body>
<%
if (session.getAttribute("usuario") == null) {
	response.sendRedirect("Login.jsp");
}
%>
	<nav>
       <div>
        <a href="sobre.jsp" style=color:black;>Sobre</a>
        <a href="logout.jsp" style=color:black;>Sair</a>
        <a href="Bemvindo.jsp" id="cad" style="font-size:13px; font-size: 13pt;" >Voltar</a>
        <%
			Database nome = new Database();
			String user1 = session.getAttribute("usuario").toString();
			out.print("<label id='user'>Usuário: "+nome.getNome(user1)+"</label>");
		%>
       </div>
    </nav>

	<div align="center" style="padding-top: 25px; display: flex; flex-direction: row; justify-content: center;">
        <div style="width: 800px; border-radius:12px; text-align: justify;">
        	<h1 style="text-align: center;">Minhas questões cadastradas</h1>
            <%
                        
            Dao dao = Dao.getDriver();
        	QuestaoBean qb = new QuestaoBean();
        	Database db = new Database();
        	ArrayList<String> area = new ArrayList<>();
        	ArrayList<Object> questoes = new ArrayList<>();
        	try{
        		String sql = "select * from questao where idUser like ";
        		String user = session.getAttribute("usuario").toString();
        		Connection conn = dao.getConnection();
        		Statement stt = conn.createStatement();
        		ResultSet rs = stt.executeQuery(sql+"'"+db.getIdUser(user)+"'"); //adicionar o session no lugar do 33 
        		
        		//out.print(session.getAttribute("usuario").toString());
        		//out.print(db.getIdUser(user));
        		
        		while(rs.next()){
        			
         			if(area.contains(rs.getString("areaQuestao"))){
        				
         			}else{
         				area.add(rs.getString("areaQuestao"));
         			}
        		}
        		
        	}catch(SQLException e){
        		e.printStackTrace();
        	}
        		
        		//out.println("<h3 align='center'>Áreas cadastradas</h3>");
        		//out.println("<a href=''>"+array[0]+"</a>");
        		//out.print(array.length);
        		//out.println(db.getQtdRegistros("33")); //adicionar o session no lugar do 33 
        		String [] array = new String[area.size()];
        		//out.print(area.size());
        		//out.print(array.length);
        		
        		for(int i=0; i<array.length; i++){
        			array[i] = area.get(i);
        		}
        		
        		for(int i=0; i<array.length; i++){
        			//out.println("<a href=''>"+array[i]+"</a>");
        			//out.println("<h3>"+array[i]+"</h3>");
        			try{
                		
                		Connection conn1 = dao.getConnection();
                		Statement stt1 = conn1.createStatement();
                		ResultSet rs1 = stt1.executeQuery("select enunciado, altA, altB, altC, altD, altE from questao where areaQuestao like '" + array[i] 
                				+"' and idUser like '"+db.getIdUser(session.getAttribute("usuario").toString())+"' order by rand();");
                		 
                		
                		while(rs1.next()){
                			
                			//String tipo = rs1.getString("tipo");
                			String enunciado = rs1.getString("enunciado");
                			String A = rs1.getString("altA");
                			String B = rs1.getString("altB");
                			String C = rs1.getString("altC");
                			String D = rs1.getString("altD");
                			String E = rs1.getString("altE");
                			
                			String[] array1 = {enunciado, A, B, C, D, E};
                			questoes.add(i, array1);
                			//out.println(questoes.size());
                		}
        			
                		
                	}catch(SQLException e){
                		e.printStackTrace();
                	}
        		}
        			int q = 0;
					int q2 = array.length;
    				for(int j=0; j<questoes.size(); j++){
    					String[] aux2 = (String[])questoes.get(j);
    					    					
    					while(true) {
    				
    						//String tipo = aux2[0];
    						String questao = "<h3>Questão "+(j+1)+": "+aux2[0]+"</h3>";
    						String A = "<input type='radio' name='Q"+(q+1)+"' class='"+q+"' value='1'>"+aux2[1];
    						String B = "<input type='radio' name='Q"+(q+1)+"' class='"+q+"' value='0'>"+aux2[2];
    						String C = "<input type='radio' name='Q"+(q+1)+"' class='"+q+"' value='0'>"+aux2[3];
    						String D = "<input type='radio' name='Q"+(q+1)+"' class='"+q+"' value='0'>"+aux2[4];
    						String E = "<input type='radio' name='Q"+(q+1)+"' class='"+q+"' value='0'>"+aux2[5];
    				
//     						if(tipo.equals("Multipla escolha")){
//     							out.println(questao);
//     							out.println(A + "<br>");
//     							out.println(B + "<br>");
//     							out.println(C + "<br>");
//     							out.println(D + "<br>");
//     							out.println(E + "<br>");
    					
//     						} else if (tipo.equals("Verdadeiro ou falso")){
//     							out.println(questao);
//     							out.println(A + "<br>");
//     							out.println(B + "<br>");
//     						} 

							out.println(questao);
    						out.println(A + "<br>");
     						out.println(B + "<br>");
     						out.println(C + "<br>");
     						out.println(D + "<br>");
    						out.println(E + "<br>");
    				
    						q++;
    						break;
    					}
    				}   		
            %>
        </div>
    </div>

</body>
</html>