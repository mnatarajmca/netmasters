package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.CourseBean;
import com.mvc.dao.CourseDao;
import com.mvc.util.DBConnection;

import java.sql.*;

@WebServlet("/BranchServlet")
public class BranchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int HashMap = 0;
	private static final int String = 0;

	public BranchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		CourseBean bean = new CourseBean();
		CourseDao dao = new CourseDao();
		Connection con = null;
		Statement statement = null;
		ResultSet rs = null;
		String action1 = "", coursetype1 = "";
		coursetype1 = request.getParameter("Coursetype1");
		action1 = request.getParameter("Action1");

		try {
			if (action1 != null) {
				if (action1.equals("Save1")) {
					PrintWriter out = response.getWriter();
					JSONObject json = new JSONObject();
					json.put("Result", coursetype1);
					out.println(json);
					out.flush();
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
	}

}
