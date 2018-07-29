package com.mvc.util;

import java.sql.DriverManager;
import java.sql.Connection;

public class DBConnection {
	public static Connection createConnection() {
		Connection con = null;
		String host = "";
		String dbname = "netmasters";
		String port = "3306";
		String url = "jdbc:mysql://" + host + ":" + port + "/" + dbname;
		String username = "root";
		String password = "";

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return con;
	}
}