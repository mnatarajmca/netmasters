package com.mvc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.mvc.bean.LoginBean;
import com.mvc.util.DBConnection;

public class LoginDao {
	public String authenticateUser(LoginBean loginBean) {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			String userName = loginBean.getUsername();
			String password = loginBean.getPassword();
			con = DBConnection.createConnection();
			statement = con.createStatement();

			String sql = "select * from tblusers where username='" + userName + "' and password='" + password + "';";
			resultSet = statement.executeQuery(sql);
			if (resultSet.next()) {
				userName = resultSet.getString("username");
				password = resultSet.getString("password");
				if (userName.equals(userName) && password.equals(password)) {
					return "SUCCESS";
				}
			}
		} catch (SQLException e) {
			System.out.println(e.toString());
			return e.toString();
		} finally {
			try {
				if (statement.isClosed()) {
					statement.close();
				}
			} catch (SQLException e1) {
				System.out.println(e1.toString());
			}
			statement = null;
			try {
				if (con.isClosed()) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
			con = null;
		}

		return "Invalid user credentials";
	}

}
