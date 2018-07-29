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

	<form name="courseregistrationform" method="post"
		id="courseregistrationform" class="form-horizontal"
		data-toggle="validator" role="form">
		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading" align="center">
					<h4>
						<b><font color="white">Student Course Registration Form</font>
						</b>
					</h4>
				</div>
				<div class="panel-body" style="border-color: #337ab7">
					<div class="col-lg-6">
						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px">
								<span class="Span">Student Name</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-10" style="padding: 5px">
								<input name="txtName" autofocus id="txtName" type="text"
									class="form-control" />
							</div>
							<div id="error-stuname" align="right"></div>
						</div>

						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px">
								<span class="Span">Address</span>
							</div>
							<div class="col-lg-10" style="padding: 5px">
								<textarea name="txtAddress" id="txtAddress" class="form-control"></textarea>
							</div>
						</div>

						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px">
								<span class="Span">Tel/Mobile</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-10" style="padding: 5px">
								<input name="txtMobile" id="txtMobile" maxlength="10"
									onkeyPress="return isNumber(event)" type="text"
									class="form-control" />
							</div>
							<div id="error-stumobile" align="right"></div>
						</div>

						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px;">
								<span class="Span">Email ID</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-10" style="padding: 5px;">
								<input name="txtEmail" type="text" class="form-control"
									id="txtEmail">
							</div>
							<div id="error-stuemail" align="right"></div>
						</div>

						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px;">
								<span class="Span">Company Name</span>
							</div>
							<div class="col-lg-10" style="padding: 5px;">
								<input name="txtComapny" type="text" class="form-control"
									id="txtComapny">
							</div>
						</div>

						<div class="col-lg-12" class="form-group"
							style="padding-top: 5px; text-align: center;">
							<button type="button" name="b1" value="Save" id="btnSave2"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span> Save
							</button>
							<button type="button" name="b1" value="Find" id="btnFind2"
								data-target="#myModal" data-toggle="modal"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-edit"></span> Edit
							</button>
							<button type="button" name="b1" value="Reset" id="btnClear2"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-refresh"></span> Reset
							</button>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="col-lg-12">
							<div class="col-lg-3" style="padding: 5px">
								<span class="Span">Existing Student Name</span><span
									style="color: red;">*</span>
							</div>
							<div class="col-lg-7" style="padding: 5px">
								<input name="txtName" id="txtStuName" type="text"
									class="form-control" />
							</div>
							<div class="col-lg-2" style="padding: 5px">
								<button type="button" name="b1" value="Find" id="btnFind"
									data-target="#myModal2" data-toggle="modal"
									class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span> Search
								</button>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px">
								<button type="button" name="b1" value="Save" id="btnNew"
									class="btn btn-primary">
									<span class="glyphicon glyphicon-plus"></span> New
								</button>
							</div>
							<div class="col-lg-2" style="padding: 5px">
								<button type="button" name="b1" value="Edit" id="btnEdit"
									class="btn btn-primary">
									<span class="glyphicon glyphicon-edit"></span> Edit
								</button>
							</div>
							<div class="col-lg-2" style="padding: 5px">
								<button type="button" name="b1" value="Save" id="btnRemove"
									class="btn btn-primary">
									<span class="glyphicon glyphicon-minus"></span> Remove
								</button>
							</div>
						</div>

						<div class="container-fluid">
							<div class="col-lg-12">
								<div class="panel panel-primary">
									<div class="panel-body">
										<table id="studentcourse"
											class="table table-striped table-bordered nowrap"
											style="border-color: #337ab7" style="width: 100%">
											<thead>
												<tr>
													<th>Select</th>
													<th>Name</th>
													<th>Course Type</th>
													<th>Course Name</th>
													<th>Date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="modal" id="myModal" role="dialog">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel-heading" align="center">
								<h4>
									<b><font color="white">Student Details</font> </b>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" style="float: right">Close</button>
								</h4>
							</div>
							<div class="panel-body" style="border-color: #337ab7">
								<table id="students"
									class="table table-striped table-bordered nowrap"
									style="width: 100%">
									<thead>
										<tr>
											<th>Name</th>
											<th>Mobile</th>
											<th>Email</th>
											<th>View</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<%
											try {
												con = DBConnection.createConnection();
												statement = con.createStatement();
												String sql = "select * from tblstudents where stuid!=0";
												rs = statement.executeQuery(sql);
												while (rs.next()) {
													out.println("<tr><td>" + rs.getString("stuname") + "</td>");
													out.println("<td>" + rs.getString("stumobile") + "</td>");
													out.println("<td>" + rs.getString("stuemail") + "</td>");
													out.println("<td align='center'><input type='image' src='images/View.png' id='View2' value='"
															+ rs.getInt("stuid") + "'>");
													out.println("<td align='center'><input type='image' src='images/Edit.png' id='Edit2' value='"
															+ rs.getInt("stuid") + "'>");
													out.println("<td align='center'><input type='image' src='images/Delete.png' id='Delete2' value='"
															+ rs.getInt("stuid") + "'>");
													out.println("</tr>");
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
									</tbody>
								</table>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal" id="neweditdelete" role="dialog">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="modal-body">
					<div class="panel panel-primary">
						<div class="panel-heading" align="center">
							<h4>
								<b><font color="white">Course Details</font> </b>
								<button type="button" class="btn btn-default"
									data-dismiss="modal" style="float: right">Close</button>
							</h4>
						</div>
						<div class="panel-body" style="border-color: #337ab7">
							<div class="col-lg-12">
								<div class="col-lg-2" style="padding: 5px">
									<span class="Span">Student Name</span><span style="color: red;">*</span>
								</div>
								<div class="col-lg-10" style="padding: 5px">
									<input name="txtStuname1" readonly id="txtStuname1" type="text"
										class="form-control" />
								</div>
							</div>
							<div class="col-lg-12">
								<div class="col-lg-2" style="padding: 5px">
									<span class="Span">Course Type</span><span style="color: red;">*</span>
								</div>
								<div class="col-lg-10" style="padding: 5px">
									<select id="ddlCoursetype" class="form-control">
										<option value="0">--Select Course Type--</option>
										<%
											try {
												con = DBConnection.createConnection();
												statement = con.createStatement();
												rs = statement.executeQuery("select * from tblcoursetypes");
												while (rs.next()) {
													out.println("<option value='" + rs.getInt("coursetypeid") + "'/>" + rs.getString("coursetype")
															+ "</option>");
												}
											} catch (Exception ex) {
												System.out.println(ex.toString());
											} finally {
												try {
													if (statement.isClosed()) {
														statement.close();
													}
												} catch (SQLException e) {
													System.out.println(e.toString());
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
								</div>
							</div>
							<div class="col-lg-12">
								<div class="col-lg-2" style="padding: 5px">
									<span class="Span">Course Name</span><span style="color: red;">*</span>
								</div>
								<div class="col-lg-10" style="padding: 5px">
									<select id="ddlCoursename" class="form-control">
										<option value="0">--Select Course Name--</option>
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="col-lg-2" style="padding: 5px">
									<span class="Span">Date</span>
								</div>
								<div class="col-lg-10" style="padding: 5px">
									<input name="txtDate" id="txtDate" type="text" maxlength="10"
										placeholder="dd/mm/yyyy eg 31/12/2018 , Default Date:Today"
										class="form-control" />
								</div>
							</div>
							<div class="col-lg-12">
								<div class="col-lg-2"></div>
								<div class="col-lg-4">
									<button type="button" name="b1" value="Save" id="btnSavecourse"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> Save
									</button>
								</div>
								<div class="col-lg-4">
									<button type="button" name="b1" value="Save"
										id="btnClearcourse" class="btn btn-primary">
										<span class="glyphicon glyphicon-refresh"></span> Clear
									</button>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="modal" id="myModal2" role="dialog">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel-heading" align="center">
								<h4>
									<b><font color="white">Student Details</font> </b>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" style="float: right">Close</button>
								</h4>
							</div>
							<div class="panel-body" style="border-color: #337ab7">
								<table id="studentdetails2"
									class="table table-striped table-bordered nowrap"
									style="width: 100%">
									<thead>
										<tr>
											<th>Name</th>
											<th>Mobile</th>
											<th>Email</th>
											<th>Select</th>
										</tr>
									</thead>
									<tbody>
										<%
											try {
												con = DBConnection.createConnection();
												statement = con.createStatement();
												String sql = "select * from tblstudents where stuid!=0";
												rs = statement.executeQuery(sql);
												while (rs.next()) {
													out.println("<tr><td>" + rs.getString("stuname") + "</td>");
													out.println("<td>" + rs.getString("stumobile") + "</td>");
													out.println("<td>" + rs.getString("stuemail") + "</td>");
													out.println("<td align='center'><input type='image' src='images/Select.png' id='Select'"
															+ " value='" + rs.getInt("stuid") + "'>");
													out.println("</tr>");
												}
											} catch (Exception ex) {
												System.out.println(ex.toString());
											} finally {
												try {
													if (statement.isClosed()) {
														statement.close();
													}
												} catch (SQLException e1) {
													// TODO Auto-generated catch block
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
									</tbody>
								</table>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading" align="center">
					<h4>
						<b><font color="white">Student Details</font> </b>
					</h4>
				</div>
				<div class="panel-body" style="border-color: #337ab7">
					<table id="studentdetails"
						class="table table-striped table-bordered nowrap"
						style="width: 100%">
						<thead>
							<tr>
								<th>Name</th>
								<th>Address</th>
								<th>Mobile No</th>
								<th>Email</th>
								<th>Company Name</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<input type="hidden" id="hfstuid"> <input type="hidden"
			id="hfstuid1"><input type="hidden" id="hfstuid2"><input
			type="hidden" id="hfstucourseid">
	</form>
</body>

<script>
	$(document).ready(function(e) {
		$('#courseregistrationform #btnNew').click(function(e) {
			$('#courseregistrationform #btnSavecourse').text('Save');
			$('#courseregistrationform #ddlCoursetype').val('0');
			$('#courseregistrationform #txtDate').val('');
			$('#courseregistrationform #neweditdelete').modal('show');
		});
	});
</script>

<!-- Clearcourse -->
<script>
	$(document).ready(function(e) {
		$('#courseregistrationform #btnClearcourse').click(function(e) {
			$('#courseregistrationform #ddlCoursetype').val('0');
			$('#courseregistrationform #ddlCoursename').val('0');
			$('#courseregistrationform #txtDate').val('');
		});
	});
</script>

<!-- Radio Group -->
<script>
	$(document)
			.ready(
					function(e) {
						$('#courseregistrationform #btnEdit')
								.click(
										function(e) {
											var radioValue = $(
													"input[name='radiogroup']:checked")
													.val();
											if (radioValue) {
												$
														.ajax({
															url : 'CourseRegistrationServlet',
															type : 'post',
															dataType : 'json',
															data : {
																"Stucourseid" : radioValue,
																"Edit" : "Editcourse"
															},
															dataType : 'json',
															success : function(
																	data) {
																var date = new Date(
																		data.Date);
																var year = date
																		.getFullYear();
																var month = date
																		.getMonth() + 1;
																var day = date
																		.getDate();
																date = day
																		+ '/'
																		+ month
																		+ '/'
																		+ year;
																$(
																		'#courseregistrationform #hfstuid2')
																		.val(
																				data.Stuid);
																$(
																		'#courseregistrationform #ddlCoursetype')
																		.val(
																				data.Coursetypeid)
																		.change();
																courseselection();
																$(
																		'#courseregistrationform #ddlCoursename')
																		.val(
																				'0')
																		.change();
																$(
																		'#courseregistrationform #ddlCoursename')
																		.val(
																				data.Courseid)
																		.change();
																$(
																		'#courseregistrationform #txtDate')
																		.val(
																				date);
																$(
																		'#courseregistrationform #hfstucourseid')
																		.val(
																				data.Stucourseid);
																$(
																		'#courseregistrationform #btnSavecourse')
																		.text(
																				'Update');
																$(
																		'#courseregistrationform #neweditdelete')
																		.modal(
																				'show');
															}
														});

											}
										});
					});
</script>

<script>
	$(document).ready(function(e) {
		$('#courseregistrationform #btnRemove').click(function(e) {
			var radioValue = $("input[name='radiogroup']:checked").val();
			if (radioValue) {
				if (confirm("Are you sure you want to delete this?")) {
					$.ajax({
						url : 'CourseRegistrationServlet',
						type : 'post',
						dataType : 'json',
						data : {
							"Courseid" : radioValue,
							"Delete" : "Deletecourse"
						},
						dataType : 'json',
						success : function(data) {
							alert(data.Result);
							location.reload();
						}
					});
				} else {
					return false;
				}
			}
		});
	});
</script>

<!-- Save Course-->
<script>
	$(document).ready(
			function(e) {
				$('#courseregistrationform #btnSavecourse').click(
						function(e) {
							e.preventDefault();
							var reg = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
							var action = $.trim($(this).text());
							var stuid = $('#courseregistrationform #hfstuid2')
									.val();
							var stucourseid = $(
									'#courseregistrationform #hfstucourseid')
									.val();
							var sname = $(
									'#courseregistrationform #txtStuname1')
									.val();
							var coursetypeid = $(
									'#courseregistrationform #ddlCoursetype')
									.val();
							var courseid = $(
									'#courseregistrationform #ddlCoursename')
									.val();
							var date = $('#courseregistrationform #txtDate')
									.val();
							if (sname == '') {
								alert('Select Name');
								$('#courseregistrationform #neweditdelete')
										.modal('hide');
								$('#courseregistrationform #myModal2').modal(
										'show');
							} else if (coursetypeid == '0') {
								$('#courseregistrationform #ddlCoursetype')
										.css({
											"border" : "1px solid red",
										});
								$('#courseregistrationform #ddlCoursetype')
										.focus();
							} else if (courseid == '0') {
								$('#courseregistrationform #ddlCoursename')
										.css({
											"border" : "1px solid red",
										});
								$('#courseregistrationform #ddlCoursename')
										.focus();
							} else {
								$.ajax({
									url : 'CourseRegistrationServlet',
									type : 'post',
									data : {
										"Stucourseid" : stucourseid,
										"Stuid" : stuid,
										"Coursetypeid" : coursetypeid,
										"Courseid" : courseid,
										"Date" : date,
										"Saveupdatecourse" : action
									},
									dataType : 'json',
									success : function(data) {
										alert(data.Result);
										location.reload();
									}
								});
							}
						});
			});
</script>

<script>
	function courseselection() {
		$('#courseregistrationform #ddlCoursetype')
				.change(
						function() {
							var coursetypeid = $(
									'#courseregistrationform #ddlCoursetype option:selected')
									.val();
							$
									.ajax({
										url : 'CourseRegistrationServlet',
										type : 'post',
										data : {
											"Selectedcoursetypeid" : coursetypeid,
											"Select" : "Select"
										},
										dataType : 'json',
										success : function(data) {
											var length = data.Course.length;
											var select = $('#courseregistrationform #ddlCoursename');
											select.empty();
											select
													.append($(
															"<option></option>")
															.attr("value", "0")
															.text(
																	"--Select Course Name"));
											for (var i = 0; i < length; i++) {
												select
														.append($(
																"<option></option>")
																.attr(
																		"value",
																		data.Course[i].Courseid)
																.text(
																		data.Course[i].Coursename));
											}
										}
									});

						});
	}
</script>

<!-- Select Course Type -->
<script>
	$(document).ready(function(e) {
		courseselection();
	});
</script>

<!-- Select -->
<script>
	$(document)
			.ready(
					function(e) {
						$('#courseregistrationform #Select')
								.click(
										function(e) {
											e.preventDefault();
											var stuid = $(this).attr("value");
											$(
													'#courseregistrationform #hfstuid2')
													.val(stuid);
											$
													.ajax({
														url : 'CourseRegistrationServlet',
														type : 'post',
														dataType : 'json',
														data : {
															"Stuid" : stuid,
															"Find" : "Find"
														},
														dataType : 'json',
														success : function(data) {
															$(
																	'#courseregistrationform #myModal2')
																	.modal(
																			'hide');
															if (data.Stuname != '') {
																$(
																		'#courseregistrationform #txtStuname1')
																		.val(
																				data.Stuname);
																$(
																		'#courseregistrationform #txtStuName')
																		.val(
																				data.Stuname);
																$(
																		'#courseregistrationform #hfstuid2')
																		.val(
																				data.Stuid);
															}
															var courselength = data.Course.length;
															var coursetable = $('#courseregistrationform #studentcourse tbody');
															coursetable.empty();
															var detailstable = $('#courseregistrationform #studentdetails tbody');
															detailstable
																	.empty();
															if (courselength > 0) {
																detailstable
																		.prepend('<tr><td>'
																				+ data.Course[0].Stuname
																				+ '</td><td>'
																				+ data.Course[0].Stuaddress
																				+ '</td><td>'
																				+ data.Course[0].Stumobile
																				+ '</td><td>'
																				+ data.Course[0].Stuemail
																				+ '</td><td>'
																				+ data.Course[0].Stucompany
																				+ '</td></tr>');
																for (var i = 0; i < courselength; i++) {
																	var date = new Date(
																			data.Course[i].Date);
																	var year = date
																			.getFullYear();
																	var month = date
																			.getMonth() + 1;
																	var day = date
																			.getDate();
																	date = day
																			+ '/'
																			+ month
																			+ '/'
																			+ year;
																	$(
																			'#courseregistrationform #hfstuid2')
																			.val(
																					data.Course[0].Stuid);
																	$(
																			'#courseregistrationform #txtStuName')
																			.val(
																					data.Course[0].Stuname);
																	$(
																			'#courseregistrationform #txtStuname1')
																			.val(
																					data.Course[0].Stuname);
																	coursetable
																			.prepend('<tr><td><input name="radiogroup" type="radio" value="'
																				+data.Course[i].Stucourseid +'"></td><td>'
																					+ data.Course[0].Stuname
																					+ '</td><td>'
																					+ data.Course[i].Coursetype
																					+ '</td><td>'
																					+ data.Course[i].Course
																					+ '</td><td>'
																					+ date
																					+ '</td></tr>');
																}
															}
														}
													});
										});
					});
</script>

<!-- Edit1 -->
<script>
	$(document).ready(function(e) {
		$('#courseregistrationform #Edit1').click(function(e) {
			e.preventDefault();
			var stuid = $(this).attr("value");
			$('#courseregistrationform #hfstuid1').val(stuid);
			var edit1 = "Edit1";
			$.ajax({
				url : 'CourseRegistrationServlet',
				type : 'post',
				data : {
					"Stuid" : stuid,
					"Edit1" : edit1
				},
				dataType : 'json',
				success : function(data) {
					$('#courseregistrationform #myModal1').modal('hide');
					return false;
				}
			});
		});
	});
</script>

<!-- Reset -->
<script>
	$(document)
			.ready(
					function(e) {
						$('#courseregistrationform #btnClear2')
								.click(
										function(e) {
											e.preventDefault();
											$(
													'#courseregistrationform #txtName')
													.css({
														"border" : ""
													});
											$('#error-stuname').html('');
											$(
													'#courseregistrationform #txtMobile')
													.css({
														"border" : ""
													});
											$('#error-stumobile').html('');
											$(
													'#courseregistrationform #txtEmail')
													.css({
														"border" : ""
													});
											$('#error-stuemail').html('');
											$(
													'#courseregistrationform #txtName')
													.val('');
											$(
													'#courseregistrationform #txtAddress')
													.val('');
											$(
													'#courseregistrationform #txtMobile')
													.val('');
											$(
													'#courseregistrationform #txtEmail')
													.val('');
											$(
													'#courseregistrationform #txtComapny')
													.val('');
											$(
													'#courseregistrationform #btnSave2')
													.prop('disabled', false);
											$(
													'#courseregistrationform #btnSave2')
													.text('Save');
											$(
													'#courseregistrationform #btnSave2')
													.addClass(
															'glyphicon glyphicon-save');
										});
					});
</script>

<!-- Edit -->
<script>
	$(document).ready(
			function(e) {
				$('#courseregistrationform #Edit2').click(
						function(e) {
							e.preventDefault();
							var stuid = $(this).attr("value");
							$('#courseregistrationform #hfstuid').val(stuid);
							var edit = "Edit";
							$.ajax({
								url : 'CourseRegistrationServlet',
								type : 'post',
								dataType : 'json',
								data : {
									"Stuid" : stuid,
									"Edit" : edit
								},
								dataType : 'json',
								success : function(data) {
									$('#courseregistrationform #myModal')
											.modal('hide');
									$('#courseregistrationform #hfstuid').val(
											data.Stuid);
									$('#courseregistrationform #txtName').val(
											data.Name);
									$('#courseregistrationform #txtAddress')
											.val(data.Address);
									$('#courseregistrationform #txtMobile')
											.val(data.Mobile);
									$('#courseregistrationform #txtEmail').val(
											data.Email);
									$('#courseregistrationform #txtComapny')
											.val(data.Companyname);
									$('#courseregistrationform #btnSave2')
											.prop('disabled', false);
									$('#courseregistrationform #btnSave2')
											.text('Update');
								}
							});
						});
			});
</script>

<!-- Delete -->
<script>
	$(document).ready(function(e) {
		$('#courseregistrationform #Delete2').click(function(e) {
			e.preventDefault();
			var stuid = $(this).attr("value");
			var del = "Delete";
			if (confirm("Are you sure you want to delete this?")) {
				$.ajax({
					url : 'CourseRegistrationServlet',
					type : 'post',
					dataType : 'json',
					data : {
						"Stuid" : stuid,
						"Delete" : del
					},
					dataType : 'json',
					success : function(data) {
						alert(data.Result);
						location.reload();
					}
				});
			} else {
				return false;
			}
		});
	});
</script>

<!-- View -->
<script>
	$(document).ready(
			function(e) {
				$('#courseregistrationform #View2').click(
						function(e) {
							e.preventDefault();
							var stuid = $(this).attr("value");
							var view2 = "View2";
							$.ajax({
								url : 'CourseRegistrationServlet',
								type : 'post',
								data : {
									"Stuid" : stuid,
									"View2" : view2
								},
								dataType : 'json',
								success : function(data) {
									e.preventDefault();
									$('#courseregistrationform #myModal')
											.modal('hide');
									$('#courseregistrationform #txtName').val(
											data.Name);
									$('#courseregistrationform #txtAddress')
											.val(data.Address);
									$('#courseregistrationform #txtMobile')
											.val(data.Mobile);
									$('#courseregistrationform #txtEmail').val(
											data.Email);
									$('#courseregistrationform #txtComapny')
											.val(data.Companyname);
									$('#courseregistrationform #btnSave2')
											.prop('disabled', true);
								}
							});
						});
			});
</script>

<!-- Save student -->
<script>
	$(document)
			.ready(
					function(e) {

						$('#courseregistrationform #txtName').keyup(function() {
							$('#courseregistrationform #txtName').css({
								"border" : ""
							});
							$('#error-stuname').html('');
						});

						$('#courseregistrationform #txtMobile').keyup(
								function() {
									$('#courseregistrationform #txtMobile')
											.css({
												"border" : ""
											});
									$('#error-stumobile').html('');
								});

						$('#courseregistrationform #txtEmail').keyup(
								function() {
									$('#courseregistrationform #txtEmail').css(
											{
												"border" : ""
											});
									$('#error-stuemail').html('');
								});

						$('#courseregistrationform #btnSave2')
								.click(
										function(e) {
											e.preventDefault();
											var Action = $.trim($(this).text());
											var stuid = $(
													'#courseregistrationform #hfstuid')
													.val();
											var re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
											var name = $(
													'#courseregistrationform #txtName')
													.val();
											var address = $(
													'#courseregistrationform #txtAddress')
													.val();
											var mobile = $(
													'#courseregistrationform #txtMobile')
													.val();
											var email = $(
													'#courseregistrationform #txtEmail')
													.val();
											var company = $(
													'#courseregistrationform #txtComapny')
													.val();
											if (name == "") {
												$(
														'#courseregistrationform #txtName')
														.css(
																{
																	"border" : "1px solid red"
																});
												$('#error-stuname')
														.html(
																'<span style="color: red;">*Name is requeired</span>');
											}

											if (mobile == ""
													|| mobile.length < 10) {
												$(
														'#courseregistrationform #txtMobile')
														.css(
																{
																	"border" : "1px solid red",
																});
												$('#error-stumobile')
														.html(
																'<span style="color: red;">*Mobile Number is requeired</span>');
											}

											if (!re.test(email)) {
												$(
														'#courseregistrationform #txtEmail')
														.css(
																{
																	"border" : "1px solid red",
																});
												$('#error-stuemail')
														.html(
																'<span style="color: red;">*Valid Email is requeired</span>');
											}

											if (mobile != ""
													&& mobile.length == 10
													&& re.test(email)
													&& name != '') {
												$
														.ajax({
															url : 'CourseRegistrationServlet',
															type : 'post',
															data : {
																"Stuid" : stuid,
																"Name" : name,
																"Address" : address,
																"Mobile" : mobile,
																"Email" : email,
																"Company" : company,
																"Action" : Action
															},
															dataType : 'json',
															success : function(
																	data) {
																alert(data.Result);
																location
																		.reload();
															}
														});
											}
										});
					});
</script>

</html>