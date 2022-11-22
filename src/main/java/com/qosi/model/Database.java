package com.qosi.model;

import java.security.MessageDigest;
import java.sql.*;

import com.qosi.bean.LoginBean;
import com.qosi.bean.QuestaoBean;

public class Database {
	
	public boolean validate(LoginBean lb) {
		Dao dao = Dao.getDriver();
		String sql = "Select * from usuario;";

		try {
			Connection conn = (Connection) dao.getConnection();

			Statement stt = conn.createStatement();

			ResultSet rs = stt.executeQuery(sql);

			while (rs.next()) {
				if ((rs.getString("email").equals(lb.getEmail()) && rs.getString("senha").equals(sha256(lb.getSenha())))) {
					return true;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

	public boolean inserir(LoginBean lb) {
		Dao dao = Dao.getDriver();
		String sql = "insert into usuario (nome, email, senha) select"
				+ " nome, email, senha from auxiliar where email like ";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			stt.executeUpdate(sql + "");

			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}

	public boolean deletar(LoginBean lb) {
		Dao dao = Dao.getDriver();
		String sql = "delete from usuario where ";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			stt.executeUpdate(sql + " id = " + lb.getId() + ";");

			//
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}
	
	public boolean alterarSenha(String atual, String nova) {
		String sql = "select * from usuario";
		Dao dao = Dao.getDriver();
		try {
			Connection conn = dao.getConnection();
			Statement stt = conn.createStatement();
			ResultSet rs = stt.executeQuery(sql);

			while (rs.next()) {
				if (rs.getString("senha").equals(sha256(atual))) {
					stt.executeUpdate("update usuario set senha = '" + sha256(nova) + "' where senha like '" + sha256(atual) + "';");
					return true;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public String getNome(String email) {
		Dao dao = Dao.getDriver();
		String sql = "Select * from usuario;";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			ResultSet rs = stt.executeQuery(sql);

			while (rs.next()) {
				if (rs.getString("email").equals(email)) {
					return rs.getString("nome");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String getIdUser(String email) {
		Dao dao = Dao.getDriver();
		String sql = "Select * from usuario;";
		
		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			ResultSet rs = stt.executeQuery(sql);

			while (rs.next()) {
				if (rs.getString("email").equals(email)) {
					return rs.getString("id");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}

	public boolean alterarNome(String nome, String email) {
		String sql = "update usuario set nome = '"+nome+"' where email like '"+email+"'";
		Dao dao = Dao.getDriver();
		
		try {
			Connection conn = dao.getConnection();
			Statement stt = conn.createStatement();
			
			stt.executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean getEmail(String email) {
		Dao dao = Dao.getDriver();
		String sql = "select * from usuario;";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			ResultSet rs = stt.executeQuery(sql);

			while (rs.next()) {
				if (rs.getString("email").equals(email)) {
					return true;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public String getEmailUser(String email) {
		Dao dao = Dao.getDriver();
		String sql = "select * from usuario;";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			ResultSet rs = stt.executeQuery(sql);

			while (rs.next()) {
				if (rs.getString("email").equals(email)) {
					return rs.getString("email");
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
		
	public String getDataCadastro(String email) {
		Dao dao = Dao.getDriver();
		String sql = "select * from usuario";
		
		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			ResultSet rs = stt.executeQuery(sql);

			while (rs.next()) {
				if (rs.getString("email").equals(email)) {
					return rs.getString("dataCadastro");
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
		
	public boolean inserirCod(String cod) {
		Dao dao = Dao.getDriver();
		String sql = "insert into codigo (codigo) values ";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			stt.executeUpdate(sql + "('" + cod + "');");

			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public String getCod(String cod) {
		Dao dao = Dao.getDriver();
		String sql = "select codigo from codigo;";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			ResultSet rs = stt.executeQuery(sql);

			while (rs.next()) {
				if (rs.getString("codigo").equals(cod)) {
					return rs.getString("codigo");
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean inserirAux(LoginBean lb) {
		Dao dao = Dao.getDriver();
		String sql = "insert into auxiliar (nome, email, senha) values ";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			stt.executeUpdate(sql + "('" + lb.getNome() + "','" + lb.getEmail() + "',SHA2('" +lb.getSenha()+"', 256));");

			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}

	public void validarEmail() {
		Dao dao = Dao.getDriver();
		String sql = "select email from auxiliar;";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			ResultSet rs = stt.executeQuery(sql);

			while (rs.next()) {
				if (!getEmail(rs.getString("email"))) {
					copyTable();
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void copyTable() {
		Dao dao = Dao.getDriver();
		String sql = "insert into usuario (nome, email, senha) " + "select nome, email, senha from auxiliar; ";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			stt.executeUpdate(sql);
			
			delAtr();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void delAtr() {
		Dao dao = Dao.getDriver();
		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			stt.executeUpdate("truncate table codigo;");
			stt.executeUpdate("truncate table auxiliar;");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean inserirAuxTA(QuestaoBean qb) {
		Dao dao = Dao.getDriver();
		String sql = "insert into auxiliar (areaQuestao) values ";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			stt.executeUpdate(sql + "('" + qb.getAreaQuestao() + "');");

			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}

	public boolean inserirAuxQAM(QuestaoBean qb) {
		Dao dao = Dao.getDriver();
		PreparedStatement stt = null;

		String sql = "select areaQuestao from auxiliar;";
		//String[] aux = new String[2];
		String aux = "";
		try {
			Connection conn = dao.getConnection();

			Statement stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				//aux[0] = rs.getString("tipo");
				aux = rs.getString("areaQuestao");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			Connection conn = dao.getConnection();

			stt = conn.prepareStatement(
					"update auxiliar set enunciado = ?," + " altA = ?," + " altB = ?," + " altC = ?," + " altD = ?,"
							+ " altE = ? where areaQuestao like '" + aux + "';");

			stt.setString(1, qb.getEnunciado());
			stt.setString(2, qb.getAltA());
			stt.setString(3, qb.getAltB());
			stt.setString(4, qb.getAltC());
			stt.setString(5, qb.getAltD());
			stt.setString(6, qb.getAltE());

			stt.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}

	public void copyTableQAM(String email) {
		Dao dao = Dao.getDriver();
		String[] aux = new String[8];
		String id = "";

		String sql = "insert into questao "
				+ " (idUser, enunciado, altA, altB, altC, altD, altE, areaQuestao) values ";

		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			ResultSet rs1 = stt
					.executeQuery("select enunciado, altA, altB, altC, altD, altE, areaQuestao from auxiliar;");

			while (rs1.next()) {
				//aux[1] = rs1.getString("tipo");
				aux[1] = rs1.getString("enunciado");
				aux[2] = rs1.getString("altA");
				aux[3] = rs1.getString("altB");
				aux[4] = rs1.getString("altC");
				aux[5] = rs1.getString("altD");
				aux[6] = rs1.getString("altE");
				aux[7] = rs1.getString("areaQuestao");
			}

			stt.executeUpdate(
					"insert into auxiliar (idUser) " + "select id from usuario where email like '" + email + "';");

			ResultSet rs = stt.executeQuery("select idUser from auxiliar;");

			while (rs.next()) {
				id = rs.getString("idUser");
			}

			aux[0] = id;

			stt.executeUpdate(sql + "(" + aux[0] + ",'" + aux[1] + "','" + aux[2] + "','" + aux[3] + "','" + aux[4]
					+ "','" + aux[5] + "','" + aux[6] + "','" + aux[7] + "');");

			delAtr();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public String sha256(String base) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(base.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if (hex.length() == 1)
					hexString.append('0');
				hexString.append(hex);
			}

			return hexString.toString();
		}

		catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}
	
	public int getQtdRegistros(String id) {
		Dao dao = Dao.getDriver();
		String sql = "select * from questao";
		int qtd = 0;
		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			ResultSet rs = stt.executeQuery(sql);

			while (rs.next()) {
				if (rs.getString("idUser").equals(id)) {
					qtd++;
					
				}
			}
			
			return qtd;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qtd;
	}
	
	public boolean redefinirSenha(String email, String pass) {
		Dao dao = Dao.getDriver();
		String sql = "update usuario set senha = '"+ sha256(pass) + "' where email like '"+email+"'";
		
		try {
			Connection conn = dao.getConnection();

			Statement stt = conn.createStatement();

			stt.executeUpdate(sql);
			
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
