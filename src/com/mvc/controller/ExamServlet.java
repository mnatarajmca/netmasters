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

import com.mvc.bean.ExamBean;
import com.mvc.dao.ExamDao;
import com.mvc.util.DBConnection;

import java.sql.*;

@WebServlet("/ExamServlet")
public class ExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExamServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		ExamBean bean = new ExamBean();
		ExamDao dao = new ExamDao();

		String action2 = "", action1 = "", client = "", edit1 = "", edit2 = "", clientid = "", clientid1 = "",
				delete1 = "", examname = "", examcode = "", examid = "", delete2 = "";

		client = request.getParameter("Client");
		action1 = request.getParameter("Action1");
		action2 = request.getParameter("Action2");
		edit1 = request.getParameter("Edit1");
		edit2 = request.getParameter("Edit2");
		clientid = request.getParameter("Clientid");
		clientid1 = request.getParameter("Clientid1");
		examid = request.getParameter("Examid");
		delete1 = request.getParameter("Delete1");
		delete2 = request.getParameter("Delete2");
		examcode = request.getParameter("Examcode");
		examname = request.getParameter("Examname");
//Save1
		try {
			if (action1 != null) {
				if (action1.equals("Save1")) {
					int id = Integer.parseInt(clientid1);
					bean.setClientid1(id);
					bean.setExamcode(examcode);
					bean.setExamname(examname);
					action1 = dao.SaveUpdateDelete(bean, "Save1");
					if (action1.equals("SUCCESS")) {
						PrintWriter out = response.getWriter();
						JSONObject json = new JSONObject();
						json.put("Result", "Saved");
						out.println(json);
						out.flush();
					} else if (action1.equals("AE")) {
						PrintWriter out = response.getWriter();
						JSONObject json = new JSONObject();
						json.put("Result", "Already Existed");
						out.println(json);
						out.flush();
					} else {
						PrintWriter out = response.getWriter();
						JSONObject json = new JSONObject();
						json.put("Result", action1);
						out.println(json);
						out.flush();
					}
				} else if (action1.equals("Update1")) {
					if (examid != null) {
						int id = Integer.parseInt(examid);
						bean.setExamid(id);
						bean.setClientid1(Integer.parseInt(clientid1));
						bean.setExamcode(examcode);
						bean.setExamname(examname);
						action1 = dao.SaveUpdateDelete(bean, "Update1");
						if (action1.equals("SUCCESS")) {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", "Updated");
							out.println(json);
							out.flush();
						} else if (action1.equals("AU")) {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", "Canot be Updated");
							out.println(json);
							out.flush();
						} else {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", action1);
							out.println(json);
							out.flush();
						}
					}
				}
			}	
//Delete2		
			if (delete2 != null) {
				if (delete2.equals("Delete2")) {
					if (examid != null) {
						int id = Integer.parseInt(examid);
						bean.setExamid(id);
						delete1 = dao.SaveUpdateDelete(bean, "Delete2");
						if (delete1.equals("SUCCESS")) {
							JSONObject json = new JSONObject();
							PrintWriter out = response.getWriter();
							json.put("Result", "Deleted");
							out.println(json);
							out.flush();
						} else if (delete1.equals("AD")) {
							JSONObject json = new JSONObject();
							PrintWriter out = response.getWriter();
							json.put("Result", "Already Deleted");
							out.println(json);
							out.flush();
						} else {
							JSONObject json = new JSONObject();
							PrintWriter out = response.getWriter();
							json.put("Result", delete1);
							out.println(json);
							out.flush();
						}
					}
				}
			}
//Delete1		
			if (delete1 != null) {
				if (delete1.equals("Delete1")) {
					if (clientid != null) {
						int id = Integer.parseInt(clientid);
						bean.setClientid(id);
						delete1 = dao.SaveUpdateDelete(bean, "Delete1");
						if (delete1.equals("SUCCESS")) {
							JSONObject json = new JSONObject();
							PrintWriter out = response.getWriter();
							json.put("Result", "Deleted");
							out.println(json);
							out.flush();
						} else if (delete1.equals("UD")) {
							JSONObject json = new JSONObject();
							PrintWriter out = response.getWriter();
							json.put("Result", "Already Deleted");
							out.println(json);
							out.flush();
						} else {
							JSONObject json = new JSONObject();
							PrintWriter out = response.getWriter();
							json.put("Result", delete1);
							out.println(json);
							out.flush();
						}
					}
				}
			}	
/* Edit2 */		
			if (edit2 != null) {
				if (edit2.equals("Edit2")) {
					if (examid != null) {
						int id = Integer.parseInt(examid);
						Connection con = null;
						Statement statement = null;
						con = DBConnection.createConnection();
						statement = con.createStatement();
						PrintWriter out = response.getWriter();
						JSONObject json = new JSONObject();
						ResultSet rs = statement.executeQuery("select * from tblexams where examid=" + id);
						while (rs.next()) {
							json.put("Examid", rs.getInt("examid"));
							json.put("Clientid", rs.getString("clientid"));
							json.put("Examcode", rs.getString("examcode"));
							json.put("Examname", rs.getString("examname"));
						}
						out.println(json);
						out.flush();
					}

				}
			}
/* Edit1 */	
			if (edit1 != null) {
				if (edit1.equals("Edit1")) {
					if (clientid != null) {
						int id = Integer.parseInt(clientid);
						Connection con = null;
						Statement statement = null;
						con = DBConnection.createConnection();
						statement = con.createStatement();
						PrintWriter out = response.getWriter();
						JSONObject json = new JSONObject();
						ResultSet rs = statement.executeQuery("select * from tblclients where clientid=" + id);
						while (rs.next()) {
							json.put("Clientid", rs.getInt("clientid"));
							json.put("Client", rs.getString("client"));
						}
						out.println(json);
						out.flush();
					}

				}
			}	
/* Save2 */		
			if (action2 != null) {
				if (action2.equals("Save2")) {
					bean.setClient(client);
					action2 = dao.SaveUpdateDelete(bean, "Save2");
					if (action2.equals("SUCCESS")) {
						PrintWriter out = response.getWriter();
						JSONObject json = new JSONObject();
						json.put("Result", "Saved");
						out.println(json);
						out.flush();
					}
				} else if (action2.equals("Update2")) {
					if (clientid != null) {
						int id = Integer.parseInt(clientid);
						bean.setClientid(id);
						bean.setClient(client);						
						action2 = dao.SaveUpdateDelete(bean, "Update2");
						if (action2.equals("SUCCESS")) {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", "Updated");
							out.println(json);
							out.flush();
						} else if (action2.equals("UE")) {
							PrintWriter out = response.getWriter();
							JSONObject json = new JSONObject();
							json.put("Result", "Cannot be Updated");
							out.println(json);
							out.flush();
						}
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
				e.printStackTrace();
			}
			out.println(json);
			out.flush();
		}
		
	}

}
