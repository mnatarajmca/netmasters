package com.mvc.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mvc.bean.UserBean;
import com.mvc.util.DBConnection;

public class UserDao {

	Connection con = null;
	Statement statement = null;
	ResultSet rs = null;

	String address = "", pincode = "", name = "", mobile = "", phone = "", email = "", uname = "", password = "";
	int usertypeid, branchnameid, userid, intoutput;

	public String insertCheckbox(UserBean bean)
	{
		try
		{
			con = DBConnection.createConnection();
			CallableStatement cs = con.prepareCall("{call tblmenumasterproc(?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter("output", java.sql.Types.VARCHAR);						
			cs.setInt("uid",bean.getUsermenuid());
			cs.setInt("mid",bean.getMenuid());
			cs.setInt("vvisible", bean.getVisible());
			cs.setInt("vadd", bean.getAdd());
			cs.setInt("vview", bean.getView());
			cs.setInt("vedit", bean.getEdit());
			cs.setInt("vdelete", bean.getDelete());
			cs.setInt("vreport", bean.getReport());
			cs.setInt("vprint", bean.getPrint());
			int i = cs.executeUpdate();
			String output = cs.getString("output");			
			return output;
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			return e.toString();
		}
	}
	
	public String SaveUpdateDelete(UserBean bean, String action) {
		try {
			userid = bean.getUserid();
			usertypeid = bean.getUsertypeid();
			branchnameid = bean.getBranchnameid();
			name = bean.getName();
			address = bean.getAddress();
			pincode = bean.getPincode();
			mobile = bean.getMobile();
			phone = bean.getPhone();
			email = bean.getEmail();
			uname = bean.getUsername();
			password = bean.getPassword();

			con = DBConnection.createConnection();
			CallableStatement cs = con.prepareCall("{call tblusermasterproc(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter("stroutput", java.sql.Types.VARCHAR);
			cs.registerOutParameter("intoutput", java.sql.Types.INTEGER);
			cs.setInt("usertypeid", usertypeid);
			cs.setInt("branchid", branchnameid);
			cs.setString("empname", name);
			cs.setString("address", address);
			cs.setString("pincode", pincode);
			cs.setString("mobile", mobile);
			cs.setString("phone", phone);
			cs.setString("email", email);
			cs.setString("uname", uname);
			cs.setString("password", password);

			if (action.equals("Save")) {
				try {
					cs.setString("actionname", "Save");
					cs.setInt("uid", 0);
					int i = cs.executeUpdate();
					String stroutput = cs.getString("stroutput");
					intoutput = cs.getInt("intoutput");					
					if (stroutput.equals("Save")) {
						bean.setIntoutput(intoutput);						
						return "SUCCESS";
					} else if (stroutput.equals("UAE")) {
						return "UAE";
					} else if (stroutput.equals("AE")) {
						return "AE";
					}
				} catch (Exception ex) {
					System.out.println(ex.toString());
					return ex.toString();
				}
			} else if (action.equals("Update")) {
				try {
					cs.setString("actionname", "Update");
					cs.setInt("uid", userid);
					int i = cs.executeUpdate();
					String stroutput = cs.getString("stroutput");
					intoutput = cs.getInt("intoutput");
					System.out.println(intoutput);
					if (stroutput.equals("Updated")) {
						bean.setIntoutput(intoutput);
						return "SUCCESS";
					} else {
						return "UE";
					}
				} catch (Exception ex) {
					System.out.println(ex.toString());
					return ex.toString();
				}
			} else if (action.equals("Delete")) {
				try {
					cs.setString("actionname", "Delete");
					cs.setInt("uid", userid);
					int i = cs.executeUpdate();
					String stroutput = cs.getString("stroutput");
					if (stroutput.equals("Deleted")) {
						return "SUCCESS";
					} else {
						return "DE";
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
