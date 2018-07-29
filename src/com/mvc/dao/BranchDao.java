package com.mvc.dao;

import java.sql.*;

import com.mvc.bean.BranchBean;
import com.mvc.util.DBConnection;

public class BranchDao {
	String code = "", branch = "", address = "", place = "", district = "", pincode = "", phoneno = "", mobileno = "",
			email = "";
	int branchid;
	Connection con = null;
	Statement statement = null;
	ResultSet rs = null;

	// Save
	public String SaveUpdateDelete(BranchBean bean, String action) {
		try {
			code = bean.getCode();
			branch = bean.getBranch();
			address = bean.getAddress();
			place = bean.getPlace();
			district = bean.getDistrict();
			pincode = bean.getPincode();
			phoneno = bean.getPhone();
			mobileno = bean.getMobile();
			email = bean.getEmail();
			branchid = bean.getBranchid();

			con = DBConnection.createConnection();
			CallableStatement cs = con.prepareCall("{call tblbranchmasterproc(?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter("output", java.sql.Types.VARCHAR);
			cs.setString("branchcode", code);
			cs.setString("branchname", branch);
			cs.setString("branchaddress", address);
			cs.setString("branchplace", place);
			cs.setString("branchdistrict", district);
			cs.setString("branchpincode", pincode);
			cs.setString("branchphone", phoneno);
			cs.setString("branchmobile", mobileno);
			cs.setString("branchemail", email);
			
			if (action.equals("Save")) {
				try {
					cs.setInt("id", 0);
					cs.setString("actionname", "Save");					
					int i = cs.executeUpdate();
					String output = cs.getString("output");
					if (output.equals("Save")) {
						return "SUCCESS";
					} else {
						return "AE";
					}
				} catch (Exception ex) {
					System.out.println(ex.toString());
					return ex.toString();
				}
			} else if (action.equals("Update")) {
				try {
					cs.setInt("id", branchid);
					cs.setString("actionname", "Update");					
					int i = cs.executeUpdate();
					String output = cs.getString("output");
					if (output.equals("Updated")) {
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
					cs.setInt("id", branchid);
					cs.setString("actionname", "Delete");					
					int i = cs.executeUpdate();
					String output = cs.getString("output");					
					if (output.equals("Deleted")) {
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
			return ex.toString();
		}
		return "Error in Insert Delete Update";
	}
}
