package com.mvc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.StringTokenizer;

import com.mvc.bean.CourseRegistrationBean;
import com.mvc.util.DBConnection;

public class CourseRegistationDao {

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	@SuppressWarnings("deprecation")
	public String SaveUpdateDelete(CourseRegistrationBean bean, String string) throws SQLException {
		// TODO Auto-generated method stub
		String name = "", address = "", mobile = "", email = "", companyname = "", sql = "", date = "", day = "",
				month = "", year = "";
		int stuid, coursetypeid, courseid, stucourseid;

		try {
			con = DBConnection.createConnection();
			stmt = con.createStatement();
//Save		
			if (string.equals("Save")) {
				stuid = bean.getStuid();
				courseid = bean.getCourseid();
				coursetypeid = bean.getCoursetypeid();
				date = bean.getDate();
				StringTokenizer st = new StringTokenizer(date, "/");
				while (st.hasMoreElements()) {
					day = st.nextToken();
					month = st.nextToken();
					year = st.nextToken();
				}
				date = year + '/' + month + '/' + day;
				if (date.equals("//")) {
					sql = "insert into tblstudentcourses(stuid,coursetypeid,courseid,date) values(" + stuid + ","
							+ coursetypeid + "," + courseid + ",'" + java.time.LocalDate.now() + "');";
				} else {
					sql = "insert into tblstudentcourses(stuid,coursetypeid,courseid,date) values(" + stuid + ","
							+ coursetypeid + "," + courseid + ",'" + date + "');";
				}
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "AE";
				}
			}

			else if (string.equals("Update")) {
				stucourseid = bean.getStucourseid();
				courseid = bean.getCourseid();
				coursetypeid = bean.getCoursetypeid();
				date = bean.getDate();
				StringTokenizer st = new StringTokenizer(date, "/");
				while (st.hasMoreElements()) {
					day = st.nextToken();
					month = st.nextToken();
					year = st.nextToken();
				}
				date = year + '/' + month + '/' + day;				
				sql = "update tblstudentcourses set coursetypeid=" + coursetypeid + ",courseid=" + courseid + ",date='"
						+ date + "' where stucourseid=" + stucourseid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "E";
				}
			}

//Update Student Details
			else if (string.equals("Updatestu")) {
				stuid = bean.getStuid();
				name = bean.getName();
				address = bean.getAddress();
				mobile = bean.getMobile();
				email = bean.getEmail();
				companyname = bean.getCompanyname();
				sql = "update tblstudents set stuname='" + name + "',stuaddress='" + address + "',stumobile='" + mobile
						+ "',stuemail='" + email + "',stucompany='" + companyname + "' where stuid=" + stuid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "E";
				}
			}

			else if (string.equals("Deletecourse")) {
				courseid = bean.getCourseid();
				sql = "delete from tblstudentcourses where stucourseid=" + courseid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "E";
				}
			}
//Delete
			else if (string.equals("Delete")) {
				stuid = bean.getStuid();
				sql = "delete from tblstudents where stuid=" + stuid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "AE";
				}
			}
//Save	
			else if (string.equals("Savestu")) {
				name = bean.getName();
				address = bean.getAddress();
				mobile = bean.getMobile();
				email = bean.getEmail();
				companyname = bean.getCompanyname();
				sql = "insert into tblstudents(stuname,stuaddress,stumobile,stuemail,stucompany)" + "values('" + name
						+ "','" + address + "','" + mobile + "','" + email + "','" + companyname + "');";
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "AE";
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return ex.toString();
		} finally {
			try {
				if (stmt.isClosed()) {
					stmt.close();
				}
			} catch (SQLException e1) {
				System.out.println(e1.toString());
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
