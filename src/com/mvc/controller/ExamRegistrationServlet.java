package com.mvc.controller;

import com.mvc.bean.ExamRegistrationBean;

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

import com.mvc.dao.ExamRegistrationDao;
import com.mvc.util.DBConnection;

import java.sql.*;

@WebServlet("/ExamRegistrationServlet")
public class ExamRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExamRegistrationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@SuppressWarnings({ "resource", "unused" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

		ExamRegistrationBean bean = new ExamRegistrationBean();
		ExamRegistrationDao dao = new ExamRegistrationDao();

		String option = "", sql = "", select = "", stuid = "", action = "", name = "", address = "", mobile = "",
				email = "", company = "", candidateid = "", date = "", voucherno = "", examid = "", examname = "",
				canexamid = "", delete = "", canid = "";

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		JSONObject json = new JSONObject();
		PrintWriter out = response.getWriter();

		try {

			con = DBConnection.createConnection();
			stmt = con.createStatement();

			option = request.getParameter("Option");
			select = request.getParameter("Select");
			action = request.getParameter("Action");
			delete = request.getParameter("Delete");
			stuid = request.getParameter("Stuid");
			name = request.getParameter("Stuname");
			address = request.getParameter("Address");
			mobile = request.getParameter("Mobile");
			email = request.getParameter("Email");
			company = request.getParameter("Company");
			canid = request.getParameter("Canid");
			candidateid = request.getParameter("Candidateid");
			examid = request.getParameter("Examid");
			examname = request.getParameter("Examname");
			voucherno = request.getParameter("Voucherno");
			date = request.getParameter("Date");
			canexamid = request.getParameter("Canexamid");
			con = DBConnection.createConnection();
			stmt = con.createStatement();

			if (action != null) {
				if (action.equals("Save")) {
					if (stuid != null) {
						int id = Integer.parseInt(stuid);
						bean.setStuid(id);
					}
					bean.setName(name);
					bean.setAddress(address);
					bean.setMobile(mobile);
					bean.setEmail(email);
					bean.setCompany(company);
					bean.setCandidateid(candidateid);
					bean.setExamid(Integer.parseInt(examid));
					bean.setVoucher(voucherno);
					bean.setDate(date);

					action = dao.SaveUpdateDelete(bean, "Save");
					if (action.equals("SUCCESS")) {
						json.put("Result", "Saved");
						out.println(json);
						out.flush();
					} else if (action.equals("AE")) {
						json.put("Result", "Already Existed");
						out.println(json);
						out.flush();
					} else {
						json.put("Result", action);
						out.println(json);
						out.flush();
					}
				} else if (action.equals("Update")) {
					if (canid != null) {
						int id = Integer.parseInt(canid);
						bean.setCanid(id);
						bean.setName(name);
						bean.setAddress(address);
						bean.setMobile(mobile);
						bean.setEmail(email);
						bean.setCompany(company);
						action = dao.SaveUpdateDelete(bean, "Update");
						if (action.equals("SUCCESS")) {
							json.put("Result", "Updated");
							out.println(json);
							out.flush();
						} else if (action.equals("E")) {
							json.put("Result", "Cannot be Updated");
							out.println(json);
							out.flush();
						} else {
							json.put("Result", action);
							out.println(json);
							out.flush();
						}
					}
				} else if (action.equals("Saveexam")) {
					if (candidateid != null) {
						int id = Integer.parseInt(candidateid);
						bean.setCanid(id);
						bean.setCandidateid(canid);
						bean.setExamid(Integer.parseInt(examid));
						bean.setVoucher(voucherno);
						bean.setDate(date);
						sql = "select stuid from tblcandidates where candidateid=" + id;
						rs = stmt.executeQuery(sql);
						if (rs.next()) {
							id = rs.getInt("stuid");
							bean.setStuid(id);
						} else {
							bean.setStuid(0);
						}
						action = dao.SaveUpdateDelete(bean, "SaveExam");
						if (action.equals("SUCCESS")) {
							json.put("Result", "Saved");
							out.println(json);
							out.flush();
						} else if (action.equals("AE")) {
							json.put("Result", "Already Existed");
							out.println(json);
							out.flush();
						} else {
							json.put("Result", action);
							out.println(json);
							out.flush();
						}
					}
				}
				if (action.equals("Updateexam")) {
					bean.setCanexamid(Integer.parseInt(canexamid));
					bean.setCandidateid(canid);
					bean.setExamid(Integer.parseInt(examid));
					bean.setVoucher(voucherno);
					bean.setDate(date);
					action = dao.SaveUpdateDelete(bean, "Updateexam");
					if (action.equals("SUCCESS")) {
						json.put("Result", "Updated");
						out.println(json);
						out.flush();
					} else if (action.equals("E")) {
						json.put("Result", "Cannot be Updated");
						out.println(json);
						out.flush();
					} else {
						json.put("Result", action);
						out.println(json);
						out.flush();
					}
				}
			}

			if (delete != null) {
				if (delete.equals("Deletecandidate")) {
					if (candidateid != null) {
						int id = Integer.parseInt(candidateid);
						bean.setCanid(id);
						delete = dao.SaveUpdateDelete(bean, "Delete");
						if (delete.equals("SUCCESS")) {
							json.put("Result", "Deleted");
							out.println(json);
							out.flush();
						} else if (delete.equals("E")) {
							json.put("Result", "Not Existed");
							out.println(json);
							out.flush();
						} else {
							json.put("Result", delete);
							out.println(json);
							out.flush();
						}
					}
				} else if (delete.equals("Deleteexam")) {
					if (canexamid != null) {
						int id = Integer.parseInt(canexamid);
						bean.setExamid(id);
						delete = dao.SaveUpdateDelete(bean, "Deleteexam");
						if (delete.equals("SUCCESS")) {
							json.put("Result", "Deleted");
							out.println(json);
							out.flush();
						} else if (delete.equals("E")) {
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

			if (select != null) {
				if (select.equals("Select")) {
					if (stuid != null) {
						int id = Integer.parseInt(stuid);
						sql = "select * from tblstudents where stuid=" + id;
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							json.put("Stuid", rs.getString("stuid"));
							json.put("Stuname", rs.getString("stuname"));
							json.put("Stuaddress", rs.getString("stuaddress"));
							json.put("Stumobile", rs.getString("stumobile"));
							json.put("Stuemail", rs.getString("stuemail"));
							json.put("Stucompany", rs.getString("stucompany"));
							out.println(json);
							out.flush();
						}
					}
				} else if (select.equals("Placeexam")) {
					if (canexamid != null) {
						int id = Integer.parseInt(canexamid);
						sql = "select * from tblcandidateexams where canexamid=" + id;
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							json.put("Canid", rs.getString("canid"));
							json.put("Examid", rs.getString("examid"));
							json.put("Voucherno", rs.getString("voucherno"));
							json.put("Date", rs.getString("date"));
							out.println(json);
							out.flush();
						}
					}
				} else if (select.equals("Editexam")) {
					if (canexamid != null) {
						int id = Integer.parseInt(canexamid);
						sql = "select tblcandidates.canname,tblcandidateexams.canid,tblcandidateexams.examid,"
								+ "tblcandidateexams.voucherno,tblcandidateexams.date,tblcandidateexams.canexamid "
								+ "from tblcandidates,tblcandidateexams where tblcandidates.candidateid=tblcandidateexams.candidateid and tblcandidateexams.canexamid="
								+ id;
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							json.put("Canexamid", rs.getString("tblcandidateexams.canexamid"));
							json.put("Canname", rs.getString("tblcandidates.canname"));
							json.put("Canid", rs.getString("tblcandidateexams.canid"));
							json.put("Examid", rs.getString("tblcandidateexams.examid"));
							json.put("Voucherno", rs.getString("tblcandidateexams.voucherno"));
							json.put("Date", rs.getString("tblcandidateexams.date"));
							out.println(json);
							out.flush();
						}
					}
				} else if (select.equals("Viewcandidate")) {
					if (candidateid != null) {
						if (candidateid != null) {
							int id = Integer.parseInt(candidateid);
							sql = "select * from tblcandidates where candidateid=" + id;
							rs = stmt.executeQuery(sql);
							while (rs.next()) {
								json.put("Candidateid", rs.getInt("candidateid"));
								json.put("Stuid", rs.getInt("stuid"));
								json.put("Canname", rs.getString("canname"));
								json.put("Canaddress", rs.getString("canaddress"));
								json.put("Canmobile", rs.getString("canmobile"));
								json.put("Canemail", rs.getString("canemail"));
								json.put("Cancompany", rs.getString("cancompany"));
								out.println(json);
								out.flush();
							}
						} else {
							System.out.println("Candidate id not found");
						}
					}
				} else if (select.equals("Selectcandidate")) {
					int id = Integer.parseInt(candidateid);
					sql = "select tblcandidates.canname,tblcandidates.canaddress,tblcandidates.canmobile,tblcandidates.canemail,"
							+ "tblcandidates.cancompany,tblexams.examcode,tblexams.examname,tblcandidateexams.voucherno,"
							+ "tblcandidateexams.date,tblcandidateexams.canexamid,tblcandidateexams.candidateid,tblcandidateexams.canid from tblcandidates,tblcandidateexams,tblexams "
							+ "where tblcandidateexams.examid=tblexams.examid and tblcandidates.candidateid=tblcandidateexams.candidateid and tblcandidateexams.candidateid="
							+ id;
					rs = stmt.executeQuery(sql);
					JSONObject root = new JSONObject();
					JSONArray jsonarray = new JSONArray();
					if (rs.next()) {
						rs.previous();
						while (rs.next()) {
							json = new JSONObject();
							json.put("Canexamid", rs.getString("tblcandidateexams.canexamid"));
							json.put("Candidateid", rs.getString("tblcandidateexams.candidateid"));
							json.put("Canid", rs.getString("tblcandidateexams.canid"));
							json.put("Canname", rs.getString("tblcandidates.canname"));
							json.put("Canaddress", rs.getString("tblcandidates.canaddress"));
							json.put("Canmobile", rs.getString("tblcandidates.canmobile"));
							json.put("Canemail", rs.getString("tblcandidates.canemail"));
							json.put("Cancompany", rs.getString("tblcandidates.cancompany"));
							json.put("Examcode", rs.getString("tblexams.examcode"));
							json.put("Examname", rs.getString("tblexams.examname"));
							json.put("Voucherno", rs.getString("tblcandidateexams.voucherno"));
							json.put("Date", rs.getDate("tblcandidateexams.date"));
							jsonarray.put(json);
						}
						root.put("Exam", jsonarray);
						out.println(root);
						out.flush();
					} else {
						id = Integer.parseInt(candidateid);
						sql = "select * from tblcandidates where candidateid=" + id;
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							json = new JSONObject();
							json.put("Candidateid", rs.getString("candidateid"));
							json.put("Canname", rs.getString("canname"));
							json.put("Canaddress", rs.getString("canaddress"));
							json.put("Canmobile", rs.getString("canmobile"));
							json.put("Canemail", rs.getString("canemail"));
							json.put("Cancompany", rs.getString("cancompany"));
						}
						out.println(json);
						out.flush();
					}
				}
			}
			if (option != null) {
				if (option.equals("Option")) {
					if (examid != null) {
						int id = Integer.parseInt(examid);
						sql = "select * from tblexams where examid=" + id;
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							json.put("Examname", rs.getString("examname"));
							out.println(json);
							out.flush();
						}
					}
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			try {
				json.put("Result", ex.toString());
			} catch (JSONException e) {
				System.out.println(e.toString());
			}
			out.println(json);
			out.flush();
		} finally {
			try {
				if (!stmt.isClosed()) {
					stmt.close();
				}
				stmt = null;

				if (!con.isClosed()) {
					con.close();
				}
				con = null;
			} catch (SQLException ex) {
				System.out.println(ex.toString());
				try {
					json.put("Result", ex.toString());
				} catch (JSONException e) {
					System.out.println(e.toString());
				}
				out.println(json);
				out.flush();
			}
		}
	}
}
