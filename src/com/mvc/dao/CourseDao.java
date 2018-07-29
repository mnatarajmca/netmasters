package com.mvc.dao;

import java.sql.*;

import com.mvc.util.*;
import com.mvc.bean.CourseBean;

public class CourseDao {

	private String coursename = "", sql = "", coursetype1 = "";
	private int coursetypeid, coursetype, coursetypenameid;
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public String SaveUpdateDelete(CourseBean bean, String string) {
		// TODO Auto-generated method stub
		try {
			coursetype1 = bean.getCoursetype1();

			if (string.equals("Delete")) {
				try {
					coursetypenameid = bean.getCoursetypenameid();
					sql = "delete from tblcourses where courseid=" + coursetypenameid;
					con = DBConnection.createConnection();
					stmt = con.createStatement();
					int result = stmt.executeUpdate(sql);
					if (result > 0) {
						return "SUCCESS";
					} else {
						return "AE";
					}
				} catch (Exception ex) {
					System.out.println(ex.toString());
				} finally {
					if (!stmt.isClosed()) {
						stmt.close();
					}
					stmt = null;
					if (!con.isClosed()) {
						con.close();
					}
					con = null;
				}
			}

			if (string.equals("Update")) {
				try {
					coursetype = bean.getCoursetypeid();
					coursename = bean.getCoursename();
					sql = "update tblcourses set coursetypeid=" + coursetype + ", course='" + coursename + "'";
					con = DBConnection.createConnection();
					stmt = con.createStatement();
					int result = stmt.executeUpdate(sql);
					if (result > 0) {
						return "SUCCESS";
					} else {
						return "AE";
					}

				} catch (Exception ex) {
					System.out.println(ex.toString());
					return ex.toString();
				} finally {
					if (!stmt.isClosed()) {
						stmt.close();
					}
					stmt = null;
					if (!con.isClosed()) {
						con.close();
					}
					con = null;
				}
			}

			if (string.equals("Save")) {
				try {
					coursetype = bean.getCoursetypeid();
					coursename = bean.getCoursename();
					sql = "insert into tblcourses(coursetypeid,course) values(" + coursetype + ",'" + coursename
							+ "');";
					con = DBConnection.createConnection();
					stmt = con.createStatement();
					int result = stmt.executeUpdate(sql);
					if (result > 0) {
						return "SUCCESS";
					} else {
						return "AE";
					}
				} catch (Exception ex) {
					System.out.println(ex.toString());
					return ex.toString();
				} finally {
					if (!stmt.isClosed()) {
						stmt.close();
					}
					stmt = null;
					if (!con.isClosed()) {
						con.close();
					}
					con = null;
				}
			}

			if (string.equals("Update1")) {
				try {
					coursetype1 = bean.getCoursetype1();
					coursetypeid = bean.getCoursetypeid1();
					sql = "update tblcoursetypes set coursetype='" + coursetype1 + "' where coursetypeid="
							+ coursetypeid;
					con = DBConnection.createConnection();
					stmt = con.createStatement();
					int result = stmt.executeUpdate(sql);
					if (result > 0) {
						return "SUCCESS";
					} else {
						return "AE";
					}
				} catch (Exception ex) {
					System.out.println(ex.toString());
					return ex.toString();
				} finally {
					if (!stmt.isClosed()) {
						stmt.close();
					}
					stmt = null;
					if (!con.isClosed()) {
						con.close();
					}
					con = null;
				}
			}

			if (string.equals("Delete1")) {
				try {
					coursetypeid = bean.getCoursetypeid1();
					sql = "delete from tblcoursetypes where coursetypeid=" + coursetypeid;
					con = DBConnection.createConnection();
					stmt = con.createStatement();
					int result = stmt.executeUpdate(sql);
					if (result > 0) {
						return "SUCCESS";
					} else {
						return "AE";
					}
				} catch (Exception ex) {
					System.out.println(ex.toString());
					return ex.toString();
				} finally {
					if (!stmt.isClosed()) {
						stmt.close();
					}
					stmt = null;
					if (!con.isClosed()) {
						con.close();
					}
					con = null;
				}
			}

			if (string.equals("Save1")) {
				try {
					
					sql = "insert into tblcoursetypes(coursetype) values('" + coursetype1 + "');";
					con = DBConnection.createConnection();
					stmt = con.createStatement();
					int result = stmt.executeUpdate(sql);
					if (result > 0) {
						return "SUCCESS";
					} else {
						return "AE";
					}
				} catch (Exception ex) {
					System.out.println(ex.toString());
					return ex.toString();
				}
			}

			coursename = bean.getCoursename();

			if (string.equals("Save")) {
				try {
					sql = "insert into tblcourses(course) values('" + coursename + "');";
					con.createStatement();
					int result = stmt.executeUpdate(sql);
					if (result > 0) {
						return "SUCCESS";
					} else {
						return "AE";
					}
				} catch (Exception ex) {
					System.out.println(ex.toString());
					return ex.toString();
				}
			}

		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return null;
	}

}
