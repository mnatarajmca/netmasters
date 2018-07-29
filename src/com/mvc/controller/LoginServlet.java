package com.mvc.controller;

import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		try {
			String name = request.getParameter("Username");
			String pass = request.getParameter("Password");
			PrintWriter out = response.getWriter();
			JSONObject json = new JSONObject();
			LoginBean loginBean = new LoginBean();
			HttpSession session = request.getSession();
			loginBean.setUsername(name);
			loginBean.setPassword(pass);

			LoginDao loginDao = new LoginDao();
			String userValidate = loginDao.authenticateUser(loginBean);

			if (userValidate.equals("SUCCESS")) {
				session.setAttribute("username", name);
				json.put("Result", "Success");
				out.println(json);
				out.flush();
			} else {
				json.put("Result", userValidate);
				out.println(json);
				out.flush();
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
	}

}
