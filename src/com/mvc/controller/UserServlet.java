package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.*;

import com.mvc.bean.UserBean;
import com.mvc.dao.UserDao;
import com.mvc.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		String usertypeidstring = "", branchnameid = "", name = "", mobile = "", phone = "", email = "", address = "",
				pincode = "", username = "", password = "", action = "", delete = "", check = "";
		int usertypeidint = 0, userid = 0;

		usertypeidstring = request.getParameter("Usertypeid");
		if (request.getParameter("Usertypeid") != null) {
			usertypeidint = Integer.parseInt(usertypeidstring);
		}

		check = request.getParameter("Check");
		delete = request.getParameter("Delete");
		branchnameid = request.getParameter("Branchnameid");
		name = request.getParameter("Name");
		address = request.getParameter("Address");
		pincode = request.getParameter("Pincode");
		mobile = request.getParameter("Mobile");
		phone = request.getParameter("Phone");
		email = request.getParameter("Email");
		username = request.getParameter("Username");
		password = request.getParameter("Password");
		action = request.getParameter("Action");

		UserBean bean = new UserBean();
		UserDao dao = new UserDao();

		Connection con = null;
		Statement statement = null;

		bean.setUsertypeid(usertypeidint);
		if (request.getParameter("Branchnameid") != null) {
			bean.setBranchnameid(Integer.parseInt(branchnameid));
		}
		bean.setName(name);
		bean.setAddress(address);
		bean.setPincode(pincode);
		bean.setMobile(mobile);
		bean.setPhone(phone);
		bean.setEmail(email);
		bean.setUsername(username);
		bean.setPassword(password);		

//Check
		try {
			if (check != null) {
				if (check.equals("Check")) {
					if (request.getParameter("Menuid") != "" && request.getParameter("Visible") != ""
							&& request.getParameter("Add") != "" && request.getParameter("View") != ""
							&& request.getParameter("Edit") != "" && request.getParameter("Delete") != ""
							&& request.getParameter("Report") != "" && request.getParameter("Print") != "") {
						if (request.getParameter("Menuid") != null) {
							bean.setMenuid(Integer.parseInt(request.getParameter("Menuid")));
						}
						if (request.getParameter("Visible") != null) {
							bean.setVisible(Integer.parseInt(request.getParameter("Visible")));
						}
						if (request.getParameter("Add") != null) {
							bean.setAdd(Integer.parseInt(request.getParameter("Add")));
						}
						if (request.getParameter("View") != null) {
							bean.setView(Integer.parseInt(request.getParameter("View")));
						}
						if (request.getParameter("Edit") != null) {
							bean.setEdit(Integer.parseInt(request.getParameter("Edit")));
						}
						if (request.getParameter("Delete") != null) {
							bean.setDelete(Integer.parseInt(request.getParameter("Delete")));
						}
						if (request.getParameter("Report") != null) {
							bean.setReport(Integer.parseInt(request.getParameter("Report")));
						}
						if (request.getParameter("Print") != null) {
							bean.setPrint(Integer.parseInt(request.getParameter("Print")));
						}
						if (request.getParameter("Usermenuid") != null) {
							bean.setUsermenuid(Integer.parseInt(request.getParameter("Usermenuid")));
						}
						String checkboxresult = dao.insertCheckbox(bean);
						JSONObject json1 = new JSONObject();
						PrintWriter out1 = response.getWriter();
						json1.put("Result", checkboxresult);
						out1.println(json1);
						out1.flush();
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
//Save
		try {
			if (action != null) {
				if (action.equals("Save")) {
					if (request.getParameter("Usertypeid") != "" && request.getParameter("Branchnameid") != ""
							&& request.getParameter("Name") != "" && request.getParameter("Address") != ""
							&& request.getParameter("Pincode") != "" && request.getParameter("Mobile") != ""
							&& request.getParameter("Username") != "" && request.getParameter("Password") != "") {
						String saveUser = dao.SaveUpdateDelete(bean, "Save");
						if (saveUser.equals("SUCCESS")) {
							JSONObject json1 = new JSONObject();
							PrintWriter out1 = response.getWriter();
							json1.put("Userid", bean.getIntoutput());
							out1.println(json1);
							out1.flush();
						} else if (saveUser.equals("UAE")) {
							JSONObject json2 = new JSONObject();
							json2.put("Result", "Username Already Exists");
							PrintWriter out2 = response.getWriter();
							out2.println(json2);
							out2.flush();
						} else {
							System.out.println("Err");
							PrintWriter out4 = response.getWriter();
							JSONObject json4 = new JSONObject();
							json4.put("Result", saveUser);
							out4.println(json4);
							out4.flush();
						}
					}
//Update
				} else if (action.equals("Update")) {
					if (request.getParameter("Userid") != null) {
						userid = Integer.parseInt(request.getParameter("Userid"));
						bean.setUserid(userid);
						String updateUser = dao.SaveUpdateDelete(bean, "Update");
						if (updateUser.equals("SUCCESS")) {
							JSONObject json1 = new JSONObject();
							PrintWriter out1 = response.getWriter();
							json1.put("Userid", bean.getIntoutput());
							out1.println(json1);
							out1.flush();
						} else if (updateUser.equals("UE")) {
							PrintWriter out3 = response.getWriter();
							JSONObject json3 = new JSONObject();
							json3.put("Result", "Username Already Saved");
							out3.println(json3);
							out3.flush();
						} else {
							System.out.println("Err");
							PrintWriter out4 = response.getWriter();
							JSONObject json4 = new JSONObject();
							json4.put("Result", updateUser);
							out4.println(json4);
							out4.flush();
						}
					}
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}

//Delete
		try {
			if (delete != null) {
				if (delete.equals("Delete")) {
					if (request.getParameter("Userid") != null) {
						userid = Integer.parseInt(request.getParameter("Userid"));
						bean.setUserid(userid);
						String deleteuser = dao.SaveUpdateDelete(bean, "Delete");
						if (deleteuser.equals("SUCCESS")) {
							JSONObject json1 = new JSONObject();
							json1.put("Result", "Deleted");
							PrintWriter out1 = response.getWriter();
							out1.println(json1);
							out1.flush();
						} else if (deleteuser.equals("DE")) {
							JSONObject json2 = new JSONObject();
							json2.put("Result", "Cannot be Deleted");
							PrintWriter out2 = response.getWriter();
							out2.println(json2);
							out2.flush();
						} else {
							PrintWriter out4 = response.getWriter();
							JSONObject json4 = new JSONObject();
							json4.put("Result", deleteuser);
							out4.println(json4);
							out4.flush();
						}
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
// View
		try {
			if (request.getParameter("View") != null) {
				if (request.getParameter("Id") != null) {
					int tempid = Integer.parseInt(request.getParameter("Id"));
					con = DBConnection.createConnection();
					statement = con.createStatement();
					ResultSet rs = null;
					JSONArray sarray = new JSONArray();
					JSONArray sarray1 = new JSONArray();

					JSONObject root = new JSONObject();
					String qry = "select * from view_usermaster where userid=" + tempid + " order by menuid";
					rs = statement.executeQuery(qry);

					while (rs.next()) {
						JSONObject json2 = new JSONObject();
						json2.put("Menuid", rs.getInt("menuid"));
						json2.put("uvisible", rs.getInt("uvisible"));
						json2.put("uadd", rs.getInt("uadd"));
						json2.put("uview", rs.getInt("uview"));
						json2.put("uedit", rs.getInt("uedit"));
						json2.put("udelete", rs.getInt("udelete"));
						json2.put("ureport", rs.getInt("ureport"));
						json2.put("uprint", rs.getInt("uprint"));
						sarray.put(json2);
					}
					rs.first();
					if (rs.next()) {
						if (tempid == rs.getInt("userid")) {
							JSONObject json1 = new JSONObject();
							json1.put("Usermenuid", rs.getInt("userid"));
							json1.put("Usertypeid", rs.getInt("usertypeid"));
							json1.put("Branchnameid", rs.getInt("branchid"));
							json1.put("Empcode", rs.getString("empcode"));
							json1.put("Name", rs.getString("name"));
							json1.put("Address", rs.getString("address"));
							json1.put("Pincode", rs.getString("pincode"));
							json1.put("Mobile", rs.getString("mobileno"));
							json1.put("Phone", rs.getString("phoneno"));
							json1.put("Email", rs.getString("email"));
							json1.put("Username", rs.getString("username"));
							json1.put("Password", rs.getString("password"));
							sarray1.put(json1);
						}
					}
					root.put("User", sarray1);
					root.put("Userdetails", sarray);
					PrintWriter out1 = response.getWriter();
					out1.print(root);
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}

//Edit
		try {
			if (request.getParameter("Edit") != null) {
				if (request.getParameter("Id") != null) {
					int tempid = Integer.parseInt(request.getParameter("Id"));
					con = DBConnection.createConnection();
					statement = con.createStatement();
					ResultSet rs = null;
					JSONArray sarray = new JSONArray();
					JSONArray sarray1 = new JSONArray();

					JSONObject root = new JSONObject();
					String qry = "select * from view_usermaster where userid=" + tempid + " order by menuid";
					rs = statement.executeQuery(qry);

					while (rs.next()) {
						JSONObject json2 = new JSONObject();
						json2.put("Menuid", rs.getInt("menuid"));
						json2.put("uvisible", rs.getInt("uvisible"));
						json2.put("uadd", rs.getInt("uadd"));
						json2.put("uview", rs.getInt("uview"));
						json2.put("uedit", rs.getInt("uedit"));
						json2.put("udelete", rs.getInt("udelete"));
						json2.put("ureport", rs.getInt("ureport"));
						json2.put("uprint", rs.getInt("uprint"));
						sarray.put(json2);
					}
					rs.first();
					if (rs.next()) {
						if (tempid == rs.getInt("userid")) {
							JSONObject json1 = new JSONObject();
							json1.put("Usermenuid", rs.getInt("userid"));
							json1.put("Usertypeid", rs.getInt("usertypeid"));
							json1.put("Branchnameid", rs.getInt("branchid"));
							json1.put("Empcode", rs.getString("empcode"));
							json1.put("Name", rs.getString("name"));
							json1.put("Address", rs.getString("address"));
							json1.put("Pincode", rs.getString("pincode"));
							json1.put("Mobile", rs.getString("mobileno"));
							json1.put("Phone", rs.getString("phoneno"));
							json1.put("Email", rs.getString("email"));
							json1.put("Username", rs.getString("username"));
							json1.put("Password", rs.getString("password"));
							sarray1.put(json1);
						}
					}
					root.put("User", sarray1);
					root.put("Userdetails", sarray);
					PrintWriter out1 = response.getWriter();
					out1.print(root);
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
