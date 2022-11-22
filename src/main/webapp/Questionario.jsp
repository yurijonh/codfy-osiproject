<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.qosi.bean.*"%>
<%@page import="com.qosi.model.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Questionário</title>
<link rel="stylesheet" href="css/nav.css">
</head>
<body>
	<nav>
		<div>
			<a href="sobre.jsp" style="color: black;">Sobre</a> <a
				href="logout.jsp" style="color: black;">Sair</a> <a
				href="Bemvindo.jsp" id="cad"
				style="font-size: 13px; font-size: 13pt; color: black;">Voltar</a>
			<%
			Database nome = new Database();
			String user = session.getAttribute("usuario").toString();
			out.print("<label id='user'>Usuário: " + nome.getNome(user) + "</label>");
			%>
		</div>
	</nav>

	<div align="center"
		style="padding-top: 25px; display: flex; flex-direction: row; justify-content: center;">
		<div style="width: 800px; border-radius: 12px; text-align: justify;">
			<h1>Questionário</h1>
			<%
			Dao dao = Dao.getDriver();
			QuestaoBean qb = new QuestaoBean();

			ArrayList<Object> questoes = new ArrayList<>();

			int qtd = Integer.parseInt(request.getParameter("qtd"));

			int i = 0;
			int contador = qtd;

			try {
				Connection conn = dao.getConnection();

				Statement stt = conn.createStatement();

				ResultSet rs = null;

				rs = stt.executeQuery("select enunciado, altA, altB, altC, altD, altE from questao order by rand();");

				while (contador > 0 && rs.next()) {

					//String tipo = rs.getString("tipo");
					String enunciado = rs.getString("enunciado");
					String A = rs.getString("altA");
					String B = rs.getString("altB");
					String C = rs.getString("altC");
					String D = rs.getString("altD");
					String E = rs.getString("altE");

					String[] array = {enunciado, A, B, C, D, E};

					questoes.add(i, array);
					/*Declarando um ArrayList... necessário importar "java.util.ArrayList"
					EX: ArrayList<Tipo_do_array> nome_variavel = new ArrayList<>();*/

					i++;
					contador--;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			%>

			<%
			//Exibição do questionário 
			int q = 0;
			for (int j = 0; j < questoes.size(); j++) {
				String[] aux2 = (String[]) questoes.get(j);

				while (true) {

					String questao = "<h3>Questão " + (j + 1) + ": " + aux2[0] + "</h3>";
					String A = "<input type='radio' name='Q" + (q + 1) + "' class='" + q + "' value='1'>" + aux2[1];
					String B = "<input type='radio' name='Q" + (q + 1) + "' class='" + q + "' value='0'>" + aux2[2];
					String C = "<input type='radio' name='Q" + (q + 1) + "' class='" + q + "' value='0'>" + aux2[3];
					String D = "<input type='radio' name='Q" + (q + 1) + "' class='" + q + "' value='0'>" + aux2[4];
					String E = "<input type='radio' name='Q" + (q + 1) + "' class='" + q + "' value='0'>" + aux2[5];

					String[] alternative = new String[5];
					alternative[0] = A;
					alternative[1] = B;
					alternative[2] = C;
					alternative[3] = D;
					alternative[4] = E;

					out.println(questao);

					Random rand = new Random();
					ArrayList<Integer> position = new ArrayList<>();
					int value = 0;

					position.add(2);

					do {
				int number = rand.nextInt(5);
				if (position.isEmpty()) {
					position.add(number);
					value++;
				} else {
					if (position.contains(number)) {
						continue;
					} else {
						position.add(number);
						value++;
					}
				}

				if (value == 4) {
					break;
				}
					} while (true);

					for (int cont = 0; cont < alternative.length; cont++) {
				out.println(alternative[position.get(cont)] + "<br>");

					}

					q++;
					break;
				}

			}
			%>
			<br>
			<button onclick="corrigir()">Corrigir</button>
		</div>
	</div>


	<script type="text/javascript">
		function corrigir() {
			var erros = 0;
			var acertos = 0;
			var cont = 0;

			while (true) {
				if (cont ==
	<%=qtd%>
		) {
					break;
				}
				var op = document.getElementsByClassName("" + cont);

				for (k = 0; k < op.length; k++) {
					if (op[k].value == "1" && op[k].checked) {
						acertos++;
					} else if (op[k].value == "0" && op[k].checked) {
						erros++;

					}
				}

				cont++;
			}
			if (acertos == 0 && erros == 0) {
				alert("Você não resolveu nenhuma questão.")
			} else {
				alert("Acertos: " + acertos + "\nErros: " + erros);
			}

		}
	</script>
</body>
</html>