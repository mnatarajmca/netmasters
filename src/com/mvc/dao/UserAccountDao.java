package com.mvc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mvc.bean.UserAccountBean;
import com.mvc.util.DBConnection;

public class UserAccountDao {

	public String Update(UserAccountBean bean) {
		String newpassword = "", sql = "";
		int id;
		Connection con = null;
		Statement stmt = null;
		try {
			con = DBConnection.createConnection();
			stmt = con.createStatement();

			id = bean.getId();
			newpassword = bean.getNewpassword();

			sql = "update tblusers set password='" + newpassword + "' where userid=" + id;
			int result = stmt.executeUpdate(sql);
			if (result > 0) {
				return "SUCCESS";
			} else {
				return "E";
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
		} finally {
			try {
				if (stmt.isClosed()) {
					stmt.close();
				}
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
			stmt = null;
			try {
				if (con.isClosed()) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
			con = null;
		}
		return null;
	}

}
