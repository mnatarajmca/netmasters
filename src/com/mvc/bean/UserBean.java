package com.mvc.bean;

public class UserBean {
private String username="",password="",address="",pincode="",name="",
	mobile="",phone="",email="";
private int branchnameid,usertypeid,userid,intoutput;
private int Menuid = 0, Visible = 0, Add = 0, View = 0, Edit = 0, Delete = 0, Report = 0, Print = 0,usermenuid=0;

public int getUsermenuid() {
	return usermenuid;
}

public void setUsermenuid(int usermenuid) {
	this.usermenuid = usermenuid;
}

public int getMenuid() {
	return Menuid;
}

public void setMenuid(int menuid) {
	Menuid = menuid;
}

public int getVisible() {
	return Visible;
}

public void setVisible(int visible) {
	Visible = visible;
}

public int getAdd() {
	return Add;
}

public void setAdd(int add) {
	Add = add;
}

public int getView() {
	return View;
}

public void setView(int view) {
	View = view;
}

public int getEdit() {
	return Edit;
}

public void setEdit(int edit) {
	Edit = edit;
}

public int getDelete() {
	return Delete;
}

public void setDelete(int delete) {
	Delete = delete;
}

public int getReport() {
	return Report;
}

public void setReport(int report) {
	Report = report;
}

public int getPrint() {
	return Print;
}

public void setPrint(int print) {
	Print = print;
}

public int getIntoutput() {
	return intoutput;
}

public void setIntoutput(int intoutput) {
	this.intoutput = intoutput;
}

public int getBranchnameid() {
	return branchnameid;
}

public void setBranchnameid(int branchnameid) {
	this.branchnameid = branchnameid;
}

public int getUsertypeid() {
	return usertypeid;
}

public void setUsertypeid(int usertypeid) {
	this.usertypeid = usertypeid;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getPincode() {
	return pincode;
}

public void setPincode(String pincode) {
	this.pincode = pincode;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getMobile() {
	return mobile;
}

public void setMobile(String mobile) {
	this.mobile = mobile;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public int getUserid() {
	return userid;
}

public void setUserid(int userid) {
	this.userid = userid;
}

}
