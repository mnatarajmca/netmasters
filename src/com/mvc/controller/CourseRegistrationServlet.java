package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.CourseRegistrationBean;
import com.mvc.dao.CourseRegistationDao;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/CourseRegistrationServlet")
public class CourseRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CourseRegistrationServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String select = "", selectedcoursetypeid = "", sql = "", action = "", name = "", address = "", mobile = "",
				email = "", companyname = "", view2 = "", stuid = "", delete = "", edit = "", reset = "", edit1 = "",
				find = "", saveupdatecourse = "", coursetypeid = "", courseid = "", canselect = "", canid = "",
				date = "", stucourseid = "";

		CourseRegistrationBean bean = new CourseRegistrationBean();
		CourseRegistationDao dao = new CourseRegistationDao();

		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();

		Connection con = null;
		Statement statement = null;
		ResultSet rs = null;

		try {
			stucourseid = request.getParameter("Stucourseid");
			date = request.getParameter("Date");
			canselect = request.getParameter("Canselect");
			canid = request.getParameter("Canid");
			saveupdatecourse = request.getParameter("Saveupdatecourse");
			find = request.getParameter("Find");
			action = request.getParameter("Action");
			select = request.getParameter("Select");
			selectedcoursetypeid = request.getParameter("Selectedcoursetypeid");

			edit = request.getParameter("Edit");
			delete = request.getParameter("Delete");

			name = request.getParameter("Name");
			address = request.getParameter("Address");
			mobile = request.getParameter("Mobile");
			email = request.getParameter("Email");
			companyname = request.getParameter("Company");

			coursetypeid = request.getParameter("Coursetypeid");
			courseid = request.getParameter("Courseid");
			view2 = request.getParameter("View2");
			edit1 = request.getParameter("Edit1");
			stuid = request.getParameter("Stuid");
			reset = request.getParameter("Reset");

			con = DBConnection.createConnection();
			statement = con.createStatement();

			// Delete Course
			if (delete != null) {
				if (delete.equals("Deletecourse")) {
					if (request.getParameter("Courseid") != null) {
						int id = Integer.parseInt(courseid);
						bean.setCourseid(id);
						delete = dao.SaveUpdateDelete(bean, "Deletecourse");
						if (delete.equals("SUCCESS")) {
							json.put("Result", "Deleted");
							out.println(json);
							out.flush();
						} else if (delete.equals("AE")) {
							json.put("Result", "Not Existed");
							out.println(json);
							out.flush();
						} else {
							json.put("Result", delete);
							out.println(json);
							out.flush();
						}
					}
				}
			}

			// saveupdate courses
			if (saveupdatecourse != null) {
				if (saveupdatecourse.equals("Save")) {
					if (stuid != null && courseid != null && coursetypeid != null) {
						bean.setStuid(Integer.parseInt(stuid));
						bean.setCourseid(Integer.parseInt(courseid));
						bean.setCoursetypeid(Integer.parseInt(coursetypeid));
						bean.setDate(date);
						saveupdatecourse = dao.SaveUpdateDelete(bean, "Save");
						if (saveupdatecourse.equals("SUCCESS")) {
							json.put("Result", "Saved");
							out.println(json);
							out.flush();
						} else if (saveupdatecourse.equals("AE")) {
							json.put("Result", "Already Existed");
							out.println(json);
							out.flush();
						} else {
							json.put("Result", saveupdatecourse);
							out.println(json);
							out.flush();
						}
					}
				} else if (saveupdatecourse.equals("Update")) {
					if (stucourseid != null) {
						int sid = Integer.parseInt(stucourseid);
						int cid = Integer.parseInt(courseid);
						int ctid = Integer.parseInt(coursetypeid);
						String date1 = date;
						bean.setStucourseid(sid);
						bean.setCourseid(cid);
						bean.setCoursetypeid(ctid);
						bean.setDate(date1);
						saveupdatecourse = dao.SaveUpdateDelete(bean, "Update");
						if (saveupdatecourse.equals("SUCCESS")) {
							json.put("Result", "Updated");
							out.println(json);
							out.flush();
						} else if (saveupdatecourse.equals("E")) {
							json.put("Result", "Cannot be Updated");
							out.println(json);
							out.flush();
						} else {
							json.put("Result", saveupdatecourse);
							out.println(json);
							out.flush();
						}
					}
				}
			}

			// Find
			if (find != null) {
				if (find.equals("Find")) {
					if (stuid != null) {
						JSONArray jsonarray = new JSONArray();
						JSONObject root = new JSONObject();
						int id = Integer.parseInt(stuid);
						sql = "select distinct tblstudents.stuid,tblstudents.stuname,tblcoursetypes.coursetype,"
								+ "tblcoursetypes.coursetypeid,tblcourses.course,tblcourses.courseid,tblstudentcourses.stucourseid"
								+ ",tblstudentcourses.date,tblstudents.stuaddress,tblstudents.stumobile,tblstudents.stuemail,"
								+ "tblstudents.stucompany from tblstudentcourses,tblstudents,tblcoursetypes,tblcourses where "
								+ "tblstudentcourses.coursetypeid=tblcoursetypes.coursetypeid and "
								+ "tblcourses.courseid=tblstudentcourses.courseid and tblstudentcourses.stuid=tblstudents.stuid and"
								+ " tblstudentcourses.stuid=" + id;
						try {
							rs = statement.executeQuery(sql);
							root = new JSONObject();
							if (rs.next()) {
								rs.previous();
								while (rs.next()) {
									json = new JSONObject();
									json.put("Stuid", rs.getInt("tblstudents.stuid"));
									json.put("Stuname", rs.getString("tblstudents.stuname"));
									json.put("Stuaddress", rs.getString("tblstudents.stuaddress"));
									json.put("Stumobile", rs.getString("tblstudents.stumobile"));
									json.put("Stuemail", rs.getString("tblstudents.stuemail"));
									json.put("Stucompany", rs.getString("tblstudents.stucompany"));
									json.put("Coursetype", rs.getString("tblcoursetypes.coursetype"));
									json.put("Coursetypeid", rs.getInt("tblcoursetypes.coursetypeid"));
									json.put("Course", rs.getString("tblcourses.course"));
									json.put("Courseid", rs.getInt("tblcourses.courseid"));
									json.put("Stucourseid", rs.getInt("tblstudentcourses.stucourseid"));
									json.put("Date", rs.getDate("tblstudentcourses.date"));
									jsonarray.put(json);
								}
								root.put("Course", jsonarray);
								out.println(root);
								out.flush();
							} else {
								sql = "select * from tblstudents where stuid=" + id;
								rs = statement.executeQuery(sql);
								while (rs.next()) {
									json.put("Stuid", rs.getInt("stuid"));
									json.put("Stuname", rs.getString("stuname"));
								}
								rs.close();
								out.println(json);
								out.flush();
							}
						} catch (Exception ex) {
							System.out.println(ex.toString());
						} finally {
							if (rs.isClosed()) {
								rs.close();
							}
							rs = null;
						}
					}
				}
			}
			// Reset
			if (reset != null) {
				if (reset.equals("Reset")) {
					JSONObject root = new JSONObject();
					JSONArray jsonarray = new JSONArray();
					sql = "select * from tblcoursetypes";
					rs = statement.executeQuery(sql);
					while (rs.next()) {
						json.put("Coursetypeid", rs.getInt("coursetypeid"));
						json.put("Coursetype", rs.getString("coursetype"));
						jsonarray.put(json);
					}
					root.put("Course", jsonarray);
					out.println(root);
					out.flush();
				}
			}

			// Edit course
			if (edit != null) {
				if (edit.equals("Editcourse")) {
					if (stucourseid != null) {
						int id = Integer.parseInt(stucourseid);
						sql = "select tblstudentcourses.stuid,tblstudents.stuname,tblstudentcourses.coursetypeid,tblstudentcourses.courseid,"
								+ "tblstudentcourses.date,tblstudentcourses.stucourseid from "
								+ "tblstudents,tblstudentcourses where tblstudentcourses.stucourseid=" + id;
						rs = statement.executeQuery(sql);
						while (rs.next()) {
							json.put("Stuid", rs.getInt("tblstudentcourses.stuid"));
							json.put("Stuname", rs.getString("tblstudents.stuname"));
							json.put("Coursetypeid", rs.getInt("tblstudentcourses.coursetypeid"));
							json.put("Stucourseid", rs.getInt("tblstudentcourses.stucourseid"));
							json.put("Courseid", rs.getInt("tblstudentcourses.courseid"));
							json.put("Date", rs.getDate("tblstudentcourses.date"));
						}
						out.println(json);
						out.flush();
					}
				}
			}
			// Edit Student Details
			if (edit != null) {
				if (edit.equals("Edit")) {
					if (stuid != null) {
						int id = Integer.parseInt(stuid);
						sql = "select * from tblstudents where stuid=" + id;
						rs = statement.executeQuery(sql);
						while (rs.next()) {
							json.put("Stuid", rs.getInt("stuid"));
							json.put("Name", rs.getString("stuname"));
							json.put("Address", rs.getString("stuaddress"));
							json.put("Mobile", rs.getString("stumobile"));
							json.put("Email", rs.getString("stuemail"));
							json.put("Companyname", rs.getString("stucompany"));
						}
						out.print(json);
						out.flush();
					}
				}
			}

			// Delete
			if (delete != null) {
				if (delete.equals("Delete")) {
					if (stuid != null) {
						int id = Integer.parseInt(stuid);
						bean.setStuid(id);
						delete = dao.SaveUpdateDelete(bean, "Delete");
						if (delete.equals("SUCCESS")) {
							json.put("Result", "Deleted");
							out.println(json);
							out.flush();
						}
					}
				}
			}
			// Edit1
			if (edit1 != null) {
				if (edit1.equals("Edit1")) {
					if (stuid != null) {
						int id = Integer.parseInt(stuid);
						sql = "SELECT tblstudentcourses.stuid,tblstudentcourses.stucourseid FROM tblstudentcourses where stuid="
								+ id;
						rs = statement.executeQuery(sql);
						while (rs.next()) {
							json.put("Stuid", rs.getInt("stuid"));
							json.put("Stuname", rs.getString("stuname"));
						}
						out.print(json);
						out.flush();
					}
				}
			}
			// View2
			if (view2 != null) {
				if (view2.equals("View2")) {
					if (stuid != null) {
						int id = Integer.parseInt(stuid);
						sql = "select * from tblstudents where stuid=" + id;
						rs = statement.executeQuery(sql);
						while (rs.next()) {
							json.put("Stuid", rs.getInt("stuid"));
							json.put("Name", rs.getString("stuname"));
							json.put("Address", rs.getString("stuaddress"));
							json.put("Mobile", rs.getString("stumobile"));
							json.put("Email", rs.getString("stuemail"));
							json.put("Companyname", rs.getString("stucompany"));
						}
						out.print(json);
						out.flush();
					}
				}
			}

			// Save Student
			if (action != null) {
				if (action.equals("Save")) {
					bean.setName(name);
					bean.setAddress(address);
					bean.setMobile(mobile);
					bean.setEmail(email);
					bean.setCompanyname(companyname);
					String save = dao.SaveUpdateDelete(bean, "Savestu");
					if (save.equals("SUCCESS")) {
						json.put("Result", "Saved");
						out.println(json);
						out.flush();
					} else if (save.equals("AE")) {
						json.put("Result", "Already Existed");
						out.println(json);
						out.flush();
					} else {
						json.put("Result", save);
						out.println(json);
						out.flush();
					}
				} else if (action.equals("Update")) {
					if (request.getParameter("Stuid") != null) {
						int id = Integer.parseInt(stuid);
						bean.setStuid(id);
						bean.setName(name);
						bean.setAddress(address);
						bean.setMobile(mobile);
						bean.setEmail(email);
						bean.setCompanyname(companyname);
						action = dao.SaveUpdateDelete(bean, "Updatestu");
						if (action.equals("SUCCESS")) {
							json.put("Result", "Updated");
							out.println(json);
							out.flush();
						} else if (action.equals("E")) {
							json.put("Result", "Cannot be updated");
							out.println(json);
							out.flush();
						} else {
							json.put("Result", action);
							out.println(json);
							out.flush();
						}
					}
				}
			}

			if (canselect != null) {
				if (canselect.equals("Canselect")) {
					if (canid != null) {
						int id = Integer.parseInt(canid);
						sql = "select * from tblcandidates where cadidateid=" + id;
						rs = statement.executeQuery(sql);
						while (rs.next()) {
							json.put("Canid", rs.getString("canid"));
							json.put("Name", rs.getString("canname"));
							json.put("Address", rs.getString("canaddress"));
							json.put("Mobile", rs.getString("canmobile"));
							json.put("Email", rs.getString("canemail"));
							json.put("Company", rs.getString("cancompany"));
						}
						out.print(json);
						out.flush();
					}
				}
			}

			// Select
			if (select != null) {
				if (select.equals("Select")) {
					if (request.getParameter("Selectedcoursetypeid") != null) {
						int id = Integer.parseInt(selectedcoursetypeid);
						JSONObject root = new JSONObject();
						JSONArray jsonarray = new JSONArray();
						sql = "select * from tblcourses where coursetypeid=" + id;
						rs = statement.executeQuery(sql);
						while (rs.next()) {
							json = new JSONObject();
							json.put("Courseid", rs.getInt("courseid"));
							json.put("Coursename", rs.getString("course"));
							jsonarray.put(json);
						}
						root.put("Course", jsonarray);
						out.println(root);
						out.flush();
					}
				}
			}
		} catch (

		Exception ex) {
			System.out.println(ex.toString());
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
