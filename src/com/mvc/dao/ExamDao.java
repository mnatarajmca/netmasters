package com.mvc.dao;

import java.sql.*;

import com.mvc.bean.ExamBean;
import com.mvc.util.DBConnection;

public class ExamDao {

	public String SaveUpdateDelete(ExamBean bean, String string) {
		// TODO Auto-generated method stub
		
		String client = "", sql = "", examname = "", examcode = "";
		int clientid,examid,clientid1;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		client = bean.getClient();
		
		try {
			con = DBConnection.createConnection();
			stmt = con.createStatement();

			if (string.equals("Save1")) {
				clientid = bean.getClientid1();
				examcode = bean.getExamcode();
				examname = bean.getExamname();
				sql = "insert into tblexams(clientid,examcode,examname) values(" + clientid + ",'" + examcode + "','"
						+ examname + "');";
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "AE";
				}
			} else if (string.equals("Save2")) {
				sql = "insert into tblclients(client) values('" + client + "');";
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "AE";
				}
			}else if(string.equals("Update1")) {
				examid=bean.getExamid();
				clientid1=bean.getClientid1();
				examcode=bean.getExamcode();
				examname=bean.getExamname();
				sql="update tblexams set clientid="+clientid1+",examcode='"+examcode+"',examname='"+examname+"' where examid="+examid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "AU";
				}
			}
			else if (string.equals("Update2")) {
				clientid = bean.getClientid();
				client = bean.getClient();
				sql = "update tblclients set client='" + client + "' where clientid=" + clientid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "UE";
				}
			} else if (string.equals("Delete1")) {
				clientid = bean.getClientid();
				sql = "delete from tblclients where clientid=" + clientid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "AD";
				}
			}
			else if (string.equals("Delete2")) {
				examid = bean.getExamid();
				sql = "delete from tblexams where examid=" + examid;
				int result = stmt.executeUpdate(sql);
				if (result > 0) {
					return "SUCCESS";
				} else {
					return "AD";
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return ex.toString();
		}
		return null;
	}

}
