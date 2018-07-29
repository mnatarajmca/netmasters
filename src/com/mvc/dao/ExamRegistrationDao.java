package com.mvc.dao;

import java.sql.*;
import java.util.StringTokenizer;

import com.mvc.bean.ExamRegistrationBean;
import com.mvc.util.DBConnection;

public class ExamRegistrationDao {

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public String SaveUpdateDelete(ExamRegistrationBean bean, String string) {

		String name = "", address = "", mobile = "", email = "", company = "", candidateid = "", voucherno = "",
				date = "", day = "", month = "", year = "", sql = "";
		int stuid = 0, examid, canid, canexamid;
		try {
			con = DBConnection.createConnection();
			stmt = con.createStatement();
			if (string.equals("Delete")) {
				canid = bean.getCanid();
				sql = "delete from tblcandidates where candidateid=" + canid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "E";
				}
			} else if (string.equals("Updateexam")) {
				canexamid = bean.getCanexamid();
				candidateid = bean.getCandidateid();
				examid = bean.getExamid();
				voucherno = bean.getVoucher();
				date = bean.getDate();
				StringTokenizer st = new StringTokenizer(date, "/");
				while (st.hasMoreElements()) {
					month = st.nextToken();
					day = st.nextToken();
					year = st.nextToken();
				}
				date = year + '/' + month + '/' + day;
				if (!date.equals("//")) {
					sql = "update tblcandidateexams set canid='" + candidateid + "',examid=" + examid + ",voucherno='"
							+ voucherno + "',date='" + date + "' where canexamid=" + canexamid;
				} else {
					sql = "update tblcandidateexams set canid='" + candidateid + "',examid=" + examid + ",voucherno='"
							+ voucherno + "',date='" + java.time.LocalDate.now() + "' where canexamid=" + canexamid;
				}
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "E";
				}
			} else if (string.equals("Deleteexam")) {
				examid = bean.getExamid();
				sql = "delete from tblcandidateexams where canexamid=" + examid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "E";
				}
			} else if (string.equals("SaveExam")) {
				canid = bean.getCanid();
				candidateid = bean.getCandidateid();
				examid = bean.getExamid();
				voucherno = bean.getVoucher();
				date = bean.getDate();
				stuid = bean.getStuid();
				StringTokenizer st = new StringTokenizer(date, "/");
				while (st.hasMoreElements()) {
					month = st.nextToken();
					day = st.nextToken();
					year = st.nextToken();
				}
				date = year + '/' + month + '/' + day;
				if (!date.equals("//")) {
					sql = "insert into tblcandidateexams(stuid,candidateid,canid,examid,voucherno,date) values(" + stuid
							+ "," + canid + ",'" + candidateid + "'," + examid + ",'" + voucherno + "','" + date + "')";
				} else {
					sql = "insert into tblcandidateexams(stuid,candidateid,canid,examid,voucherno,date) values(" + stuid
							+ "," + canid + ",'" + candidateid + "'," + examid + ",'" + voucherno + "','"
							+ java.time.LocalDate.now() + "')";
				}
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "AE";
				}
			} else if (string.equals("Save")) {
				stuid = bean.getStuid();
				name = bean.getName();
				address = bean.getAddress();
				mobile = bean.getMobile();
				email = bean.getEmail();
				company = bean.getCompany();
				candidateid = bean.getCandidateid();
				examid = bean.getExamid();
				voucherno = bean.getVoucher();
				date = bean.getDate();
				StringTokenizer st = new StringTokenizer(date, "/");
				while (st.hasMoreElements()) {
					day = st.nextToken();
					month = st.nextToken();
					year = st.nextToken();
				}
				date = year + '/' + month + '/' + day;
				sql = "insert into tblcandidates(stuid,canname,canaddress,canmobile,canemail,cancompany) values("
						+ stuid + ",'" + name + "','" + address + "','" + mobile + "','" + email + "','" + company
						+ "');";
				int result = stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
				if (result > 0) {
					rs = stmt.getGeneratedKeys();
					if (rs.next()) {
						int id = rs.getInt(1);
						if (date.equals("//")) {
							sql = "insert into tblcandidateexams (stuid,candidateid,canid,examid,voucherno,date) values("
									+ stuid + "," + id + ",'" + candidateid + "'," + examid + ",'" + voucherno + "','"
									+ java.time.LocalDate.now() + "');";
						} else {
							sql = "insert into tblcandidateexams (stuid,candidateid,canid,examid,voucherno,date) values("
									+ stuid + "," + id + ",'" + candidateid + "'," + examid + ",'" + voucherno + "','"
									+ date + "');";
						}
						result = stmt.executeUpdate(sql);
						if (result > 0) {
							return "SUCCESS";
						} else {
							return "AE";
						}
					}
				} else {
					return "AE";
				}
			} else if (string.equals("Update")) {
				canid = bean.getCanid();
				name = bean.getName();
				address = bean.getAddress();
				mobile = bean.getMobile();
				email = bean.getEmail();
				company = bean.getCompany();
				sql = "update tblcandidates set canname='" + name + "',canaddress='" + address + "',canmobile='"
						+ mobile + "',canemail='" + email + "',cancompany='" + company + "' where candidateid=" + canid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "E";
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return ex.toString();
		} finally {
			try {
				if (!stmt.isClosed()) {
					stmt.close();
				}
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
			stmt = null;
			try {
				if (!con.isClosed()) {
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
