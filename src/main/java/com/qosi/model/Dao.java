package com.qosi.model;

import java.sql.*;



public class Dao {
	private String url = "jdbc:mysql://127.0.0.1:3306/qosi?useTimezone=true&serverTimezone=UTC";
	private String username = "root";
	private String password = "senha";
	private static String driver = "com.mysql.cj.jdbc.Driver";
	
	private static Dao conexao = new Dao();
	
	private Dao() {}
	
	public static Dao getDriver() {
		try {
			Class.forName(driver);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conexao;
	}


	public Connection getConnection() throws SQLException {
		//Connection conn = null;

			Connection conn = DriverManager.getConnection(this.url, this.username, this.password);
		

		return conn;
	}
	
}
