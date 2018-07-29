package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.mvc.bean.UserAccountBean;
import com.mvc.dao.UserAccountDao;
import com.mvc.util.DBConnection;

@WebServlet("/UserAccountServlet")
public class UserAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserAccountServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		String userid = "", oldpassword = "", newpassword = "", sql = "", test = "";

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		UserAccountBean bean = new UserAccountBean();
		UserAccountDao dao = new UserAccountDao();

		userid = request.getParameter("Userid");
		oldpassword = request.getParameter("Oldpassword");
		newpassword = request.getParameter("Newpassword");

		try {
			con = DBConnection.createConnection();
			stmt = con.createStatement();

			if (userid != null && oldpassword != null && newpassword != null) {
				int id = Integer.parseInt(userid);
				sql = "select password from tblusers where userid=" + id + " and password='" + oldpassword + "';";
				rs = stmt.executeQuery(sql);
				PrintWriter out = response.getWriter();
				JSONObject json = new JSONObject();
				if (rs.next()) {
					bean.setId(id);
					bean.setNewpassword(newpassword);
					test = dao.Update(bean);
					if (test.equals("SUCCESS")) {
						json.put("Result", "Updated");
						out.println(json);
						out.flush();
					} else if (test.equals("E")) {
						json.put("Result", "Cannot be Updated");
						out.println(json);
						out.flush();
					} else {
						json.put("Result", test);
						out.println(json);
						out.flush();
					}
				} else {
					json.put("Result", "Invalid Creditialns");
					out.println(json);
					out.flush();
				}
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
	}

}
