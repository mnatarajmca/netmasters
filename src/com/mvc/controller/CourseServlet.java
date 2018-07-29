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

@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CourseServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

		CourseBean bean = new CourseBean();
		CourseDao dao = new CourseDao();

		String action1 = "", coursetype1 = "", coursetypeid1 = "", delete1 = "", edit1 = "", action = "", edit = "",
				coursename = "", coursetypeid = "", coursetypenameid = "", delete = "";
		Connection con = null;
		Statement statement = null;

		try {
			coursetype1 = request.getParameter("Coursetype1");
			action1 = request.getParameter("Action1");
			coursetypeid1 = request.getParameter("Coursetypeid1");
			delete1 = request.getParameter("Delete1");
			edit1 = request.getParameter("Edit1");
			bean.setCoursetype1(coursetype1);

			coursetypeid = request.getParameter("Coursetypeid");
			coursetypenameid = request.getParameter("Coursetypenameid");
			coursename = request.getParameter("Coursename");
			action = request.getParameter("Action");
			edit = request.getParameter("Edit");
			delete = request.getParameter("Delete");

			con = DBConnection.createConnection();
			statement = con.createStatement();

//Delete			
			if (delete != null) {
				if (delete.equals("Delete")) {
					if (request.getParameter("Coursetypenameid") != null) {
						bean.setCoursetypenameid(Integer.parseInt(coursetypenameid));
						String deleteCoursetypename = dao.SaveUpdateDelete(bean, "Delete");
						if (deleteCoursetypename.equals("SUCCESS")) {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", "Deleted");
							out.println(json);
							out.flush();
						}
					}
				}
			}
//Edit			
			if (edit != null) {
				if (edit.equals("Edit")) {
					if (request.getParameter("Coursetypenameid") != null) {
						try {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							ResultSet rs = statement.executeQuery(
									"select * from tblcourses where courseid=" + Integer.parseInt(coursetypenameid));
							while (rs.next()) {
								json.put("Coursenameid", rs.getInt("courseid"));
								json.put("Coursetypeid", rs.getInt("coursetypeid"));
								json.put("Coursename", rs.getString("course"));
							}
							out.println(json);
							out.flush();
						} catch (Exception ex) {
							System.out.println(ex.toString());
						}
					}
				}
			}
//Save			
			if (action != null) {
				if (action.equals("Save")) {
					if (coursetypeid != null) {
						bean.setCoursename(coursename);
						bean.setCoursetypeid(Integer.parseInt(coursetypeid));
						String saveCoursename = dao.SaveUpdateDelete(bean, "Save");
						if (saveCoursename.equals("SUCCESS")) {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", "Saved");
							out.println(json);
							out.flush();
						} else if (saveCoursename.equals("AE")) {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", "Already Saved");
							out.println(json);
							out.flush();
						} else {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", saveCoursename);
							out.println(json);
							out.flush();
						}
					}
				} else if (action.equals("Update")) {
					if (coursetypeid != null) {
						bean.setCoursename(coursename);
						bean.setCoursetypeid(Integer.parseInt(coursetypeid));
						String saveCoursename = dao.SaveUpdateDelete(bean, "Update");
						if (saveCoursename.equals("SUCCESS")) {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", "Updated");
							out.println(json);
							out.flush();
						} else if (saveCoursename.equals("AE")) {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", "Already Saved");
							out.println(json);
							out.flush();
						} else {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", saveCoursename);
							out.println(json);
							out.flush();
						}
					}
				}
			}
//Edit1			
			if (edit1 != null) {
				if (edit1.equals("Edit1")) {
					if (request.getParameter("Coursetypeid1") != null) {
						try {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							ResultSet rs = statement.executeQuery(
									"select coursetype from tblcoursetypes where coursetypeid=" + coursetypeid1);
							while (rs.next()) {
								json.put("Coursetype1", rs.getString("coursetype"));
							}
							out.println(json);
							out.flush();
						} catch (Exception ex) {
							System.out.println(ex.toString());
						}
					}
				}
			}
//Delete1			
			if (delete1 != null) {
				if (delete1.equals("Delete1")) {
					if (request.getParameter("Coursetypeid1") != null) {
						bean.setCoursetypeid1(Integer.parseInt(coursetypeid1));
						String deleteCoursetype1 = dao.SaveUpdateDelete(bean, "Delete1");
						if (deleteCoursetype1.equals("SUCCESS")) {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", "Deleted");
							out.println(json);
							out.flush();
						}
					}
				}
			}
//Save1			
			if (action1 != null) {
				if (action1.equals("Save1")) {
					bean.setCoursetype1(coursetype1);
					String saveCoursetype1 = dao.SaveUpdateDelete(bean, "Save1");
					if (saveCoursetype1.equals("SUCCESS")) {
						PrintWriter out = response.getWriter();
						JSONObject json = new JSONObject();
						json.put("Result", "Saved");
						out.println(json);
						out.flush();
					} else if (saveCoursetype1.equals("AE")) {
						PrintWriter out = response.getWriter();
						JSONObject json = new JSONObject();
						json.put("Result", "Already Saved");
						out.println(json);
						out.flush();
					} else {
						PrintWriter out = response.getWriter();
						JSONObject json = new JSONObject();
						json.put("Result", saveCoursetype1);
						out.println(json);
						out.flush();
					}
				} else if (action1.equals("Update1")) {
					bean.setCoursetypeid1(Integer.parseInt(coursetypeid1));
					bean.setCoursetype1(coursetype1);
					String updateCoursetype1 = dao.SaveUpdateDelete(bean, "Update1");
					if (updateCoursetype1.equals("SUCCESS")) {
						PrintWriter out = response.getWriter();
						JSONObject json = new JSONObject();
						json.put("Result", "Updated");
						out.println(json);
						out.flush();
					}
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			PrintWriter out = response.getWriter();
			JSONObject json = new JSONObject();
			try {
				json.put("Result", ex.toString());
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				System.out.print(e.toString());
			}
			out.println(json);
			out.flush();
		} finally {
			try {
				if (statement.isClosed()) {
					statement.close();
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println(e1.toString());
			}
			statement = null;
			try {
				if (con.isClosed()) {
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.toString());
			}
			con = null;
		}
	}
}
