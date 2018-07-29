<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="MenuPage.jsp"></jsp:include>
</head>
<%!Connection con = null;
	Statement statement = null;
	ResultSet rs = null;%>
<body>
	<form name="loginform" method="post" id="loginform"
		class="form-horizontal" data-toggle="validator" role="form">
		<div class="col-lg-4"></div>
		<div class="col-lg-5">
			<div class="panel panel-primary">
				<div class="panel-heading" align="center">
					<h4>
						<b><font color="white">User Accounts</font> </b>
					</h4>
				</div>
				<div class="panel-body" style="border-color: #337ab7">
					<div class="col-lg-12">
						<div class="col-lg-2" style="padding: 5px;">
							<span class="Span">User Name</span><span style="color: red;">*</span>
						</div>
						<div class="col-lg-10" style="padding: 5px">
							<select id="ddlUsername" class="form-control" autofocus>
								<option value="0">--Select User Name--</option>
								<%
									try {
										con = DBConnection.createConnection();
										statement = con.createStatement();
										rs = statement.executeQuery("select * from tblusers");
										while (rs.next()) {
											out.println("<option value='" + rs.getString("userid") + "'/>" + rs.getString("username")
													+ "</option>");
										}
									} catch (Exception ex) {
										System.out.println(ex.toString());
									} finally {
										try {
											if (statement.isClosed()) {
												statement.close();
											}
										} catch (SQLException e1) {
											System.out.println(e1.toString());
										}
										statement = null;
										try {
											if (con.isClosed()) {
												con.close();
											}
										} catch (SQLException e) {
											System.out.println(e.toString());
										}
										con = null;
									}
								%>
							</select>
							<div id="error-username" align="right"></div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="col-lg-2" style="padding: 5px;">
							<span class="Span">Old Password</span><span style="color: red;">*</span>
						</div>
						<div class="col-lg-10" style="padding: 5px;">
							<input name="txtoldpassword" class="form-control" type="password"
								id="txtoldpassword">
						</div>
						<div id="error-oldpassword" align="right"></div>
					</div>
					<div class="col-lg-12">
						<div class="col-lg-2" style="padding: 5px;">
							<span class="Span">New Password</span><span style="color: red;">*</span>
						</div>
						<div class="col-lg-10" style="padding: 5px;">
							<input name="txtnewpassword" class="form-control" type="password"
								id="txtnewpassword">
						</div>
						<div id="error-newpassword" align="right"></div>
					</div>
					<div class="col-lg-12">
						<div class="col-lg-2" style="padding: 5px;">
							<span class="Span">Confirm Password</span><span
								style="color: red;">*</span>
						</div>
						<div class="col-lg-10" style="padding: 5px;">
							<input name="txtconfirmpassword" class="form-control"
								type="password" id="txtconfirmpassword">
						</div>
						<div id="error-confirmpassword" align="right"></div>
					</div>
					<div class="col-lg-12" class="form-group"
						style="padding-top: 5px; text-align: center;">
						<button type="button" name="b2" value="Update" id="btnUpdate"
							class="btn btn-primary">
							<span class="glyphicon glyphicon-ok"></span> Update
						</button>
						<button type="button" name="b2" value="Reset" id="btnClear"
							class="btn btn-primary">
							<span class="glyphicon glyphicon-refresh"></span> Reset
						</button>
					</div>
				</div>
			</div>
		</div>

		<script>
			$(document).ready(function(e) {
				$('#loginform #btnClear').click(function(e) {
					e.preventDefault();
					$('#loginform #ddlUsername').css({
						"border" : ""
					});
					$('#loginform #txtoldpassword').css({
						"border" : ""
					});
					$('#loginform #txtnewpassword').css({
						"border" : ""
					});
					$('#loginform #txtconfirmpassword').css({
						"border" : ""
					});
					$('#error-username').html('');
					$('#error-oldpassword').html('');
					$('#error-newpassword').html('');
					$('#error-confirmpassword').html('');
				});
			});
		</script>

		<script>
			$('#loginform #ddlUsername').change(function() {
				$('#loginform #ddlUsername').css({
					"border" : ""
				});
				$('#error-username').html('');
			});

			$('#loginform #txtoldpassword').keyup(function() {
				$('#loginform #txtoldpassword').css({
					"border" : ""
				});
				$('#error-oldpassword').html('');
			});

			$('#loginform #txtnewpassword').keyup(function() {
				$('#loginform #txtnewpassword').css({
					"border" : ""
				});
				$('#error-newpassword').html('');
			});

			$('#loginform #txtconfirmpassword').keyup(function() {
				$('#loginform #txtconfirmpassword').css({
					"border" : ""
				});
				$('#error-confirmpassword').html('');
			});
		</script>

		<!-- Save Exam -->
		<script>
			$(document)
					.ready(
							function(e) {
								$('#loginform #btnUpdate')
										.click(
												function(e) {
													e.preventDefault();
													var username = $(
															'#loginform #ddlUsername')
															.val();
													var oldpassword = $(
															'#loginform #txtoldpassword')
															.val();
													var newpassword = $(
															'#loginform #txtnewpassword')
															.val();
													var confirmpassword = $(
															'#loginform #txtconfirmpassword')
															.val();
													if (username == '0') {
														$(
																'#loginform #ddlUsername')
																.css(
																		{
																			"border" : "1px solid red"
																		});
														$('#error-username')
																.html(
																		'<span style="color: red;"> Select a User</span>');
														$(
																'#loginform #ddlUsername')
																.focus();
													}
													if (oldpassword == '') {
														$(
																'#loginform #txtoldpassword')
																.css(
																		{
																			"border" : "1px solid red"
																		});
														$('#error-oldpassword')
																.html(
																		'<span style="color: red;">Old Password is required</span>');
														$(
																'#loginform #txtoldpassword')
																.focus();
													}

													if (newpassword == '') {
														$(
																'#loginform #txtnewpassword')
																.css(
																		{
																			"border" : "1px solid red"
																		});
														$('#error-newpassword')
																.html(
																		'<span style="color: red;">Old Password is required</span>');
														$(
																'#loginform #txtnewpassword')
																.focus();
													}

													if (confirmpassword == '') {
														$(
																'#loginform #txtconfirmpassword')
																.css(
																		{
																			"border" : "1px solid red"
																		});
														$(
																'#error-confirmpassword')
																.html(
																		'<span style="color: red;">Old Password is required</span>');
														$(
																'#loginform #txtconfirmpassword')
																.focus();
													}

													if (newpassword != confirmpassword) {
														$(
																'#loginform #txtconfirmpassword')
																.css(
																		{
																			"border" : "1px solid red"
																		});
														$(
																'#error-confirmpassword')
																.html(
																		'<span style="color: red;">Confirm Password is mismatch to New Password</span>');
														$(
																'#loginform #txtconfirmpassword')
																.focus();
													}

													if (username != '0'
															&& oldpassword != ''
															&& newpassword != '') {
														$
																.ajax({
																	url : 'UserAccountServlet',
																	type : 'post',
																	dataType : 'json',
																	data : {
																		"Userid" : username,
																		"Oldpassword" : oldpassword,
																		"Newpassword" : newpassword
																	},
																	dataType : 'json',
																	success : function(
																			data) {
																		location
																				.reload();
																	}
																});
													}
												});
							});
		</script>
	</form>
</body>
</html>