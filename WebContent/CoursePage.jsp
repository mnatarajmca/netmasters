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

	<form name="courseform" method="post" id="courseform"
		class="form-horizontal" data-toggle="validator" role="form">
		<input type="hidden" id="hfcoursetypeid" name="hfcoursetypeid">
		<input type="hidden" id="hfcoursetypenameid" name="hfcoursetypenameid">
		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading" align="center">
					<h4>
						<b> <font color="white">Course Form</font>
						</b>
					</h4>
				</div>
				<div class="panel-body" style="border-color: #337ab7">
					<div class="col-lg-6">
						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px;">
								<span class="Span">Course Type</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-10" style="padding: 5px">
								<select id="ddlCoursetype" class="form-control">
									<option value="0">--Select Course Type--</option>
									<%
										try {
											con = DBConnection.createConnection();
											statement = con.createStatement();
											ResultSet rs = statement.executeQuery("select * from tblcoursetypes");
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
								<div id="error-coursetype" align="right"></div>
							</div>
						</div>

						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px">
								<span class="Span">Course Name</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-10" style="padding: 5px">
								<input name="txtCoursename" id="txtCoursename" type="text"
									class="form-control" />
							</div>
							<div id="error-coursename" align="right"></div>
						</div>
						<div class="col-lg-12" class="form-group"
							style="padding-top: 5px; text-align: center;">
							<button type="button" name="b1" value="Save" id="btnSave"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span> Save
							</button>
							<button type="button" name="b1" value="Find" id="btnFind"
								data-target="#myModal" data-toggle="modal"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-edit"></span> Edit
							</button>
							<button type="button" name="b1" value="Reset" id="btnClear"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-refresh"></span> Reset
							</button>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px">
								<span class="Span">Course Type</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-10" style="padding: 5px">
								<input name="txtCoursetype1" id="txtCoursetype1" type="text"
									class="form-control" />
								<div id="error-coursetype1" align="left"></div>
							</div>
						</div>
						<div class="col-lg-12" class="form-group"
							style="padding-top: 5px; text-align: center;">
							<button type="button" name="b2" value="Save" id="btnSave1"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span> Save
							</button>
							<button type="button" name="b2" value="Find" id="btnFind1"
								data-target="#myModal1" data-toggle="modal"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-edit"></span> Edit
							</button>
							<button type="button" name="b2" value="Reset" id="btnClear1"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-refresh"></span> Reset
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="modal" id="myModal1" role="dialog">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel-heading" align="center">
								<h4>
									<b><font color="white">Course Type</font> </b>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" style="float: right">Close</button>
								</h4>
							</div>
							<div class="panel-body" style="border-color: #337ab7">
								<table id="coursetype"
									class="table table-striped table-bordered nowrap"
									style="width: 100%">
									<thead>
										<tr>
											<th>Course Type</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<%
											try {
												con = DBConnection.createConnection();
												statement = con.createStatement();
												rs = statement.executeQuery("select * from tblcoursetypes");
												while (rs.next()) {
													out.println("<tr><td>" + rs.getString("coursetype") + "</td>");
													out.println("<td align='center'><input type='image' src='images/Edit.png' id='Edit1' value='"
															+ rs.getInt("coursetypeid") + "'>");
													out.println("<td align='center'><input type='image' src='images/Delete.png' id='Delete1' value='"
															+ rs.getInt("coursetypeid") + "'>");
													out.println("</tr>");
												}
											} catch (Exception ex) {
												System.out.println(ex.toString());
											} finally {
												if (!statement.isClosed()) {
													statement.close();
												}
												statement = null;
												if (!con.isClosed()) {
													con.close();
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

		<div class="container-fluid">
			<div class="modal" id="myModal" role="dialog">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel-heading" align="center">
								<h4>
									<b><font color="white">Course Name</font> </b>
								</h4>
							</div>
							<div class="panel-body" style="border-color: #337ab7">
								<table id="coursename"
									class="table table-striped table-bordered nowrap"
									style="width: 100%">
									<thead>
										<tr>
											<th>Course Type</th>
											<th>Course Name</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<%
											try {
												con = DBConnection.createConnection();
												statement = con.createStatement();
												String sql = "SELECT type.coursetype,name.course,name.courseid from tblcoursetypes as type,"
														+ "tblcourses as name where type.coursetypeid=name.coursetypeid;";
												rs = statement.executeQuery(sql);
												while (rs.next()) {
													out.println("<tr><td>" + rs.getString("type.coursetype") + "</td>");
													out.println("<td>" + rs.getString("name.course") + "</td>");
													out.println("<td align='center'><input type='image' src='images/Edit.png' id='Edit' value='"
															+ rs.getInt("name.courseid") + "'>");
													out.println("<td align='center'><input type='image' src='images/Delete.png' id='Delete' value='"
															+ rs.getInt("name.courseid") + "'>");
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

		<div class="container-fluid">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading" align="center">
						<h4>
							<b><font color="white">Courses</font> </b>
						</h4>
					</div>
					<div class="panel-body" style="border-color: #337ab7">
						<table id="courseselection"
							class="table table-striped table-bordered nowrap"
							style="width: 100%">
							<thead>
								<tr>
									<th>Course Type</th>
									<th>Course Name</th>
								</tr>
							</thead>
							<tbody>
								<%
									try {
										con = DBConnection.createConnection();
										statement = con.createStatement();
										String sql = "SELECT type.coursetype,name.course,name.courseid from tblcoursetypes as type,"
												+ "tblcourses as name where type.coursetypeid=name.coursetypeid;";
										rs = statement.executeQuery(sql);
										while (rs.next()) {
											out.println("<tr><td>" + rs.getString("type.coursetype") + "</td>");
											out.println("<td>" + rs.getString("name.course") + "</td>");
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
					</div>
				</div>
			</div>
		</div>
	</form>
</body>

<!-- Course Type1 Save -->
<script>
	$(document)
			.ready(
					function(e) {
						$('#courseform #txtCoursetype1').keyup(function() {
							$('#courseform #txtCoursetype1').css({
								"border" : ""
							});
							$('#error-coursetype1').html('');
						});

						$('#courseform #btnSave1')
								.click(
										function(e) {
											e.preventDefault();
											var Coursetype1 = $(
													'#courseform #txtCoursetype1')
													.val();
											var coursetypeid1 = $(
													'#courseform #hfcoursetypeid')
													.val();
											var Action1 = $
													.trim($(this).text()) + 1;
											if (Coursetype1 == '') {
												$('#courseform #txtCoursetype1')
														.css(
																{
																	"border" : "1px solid red",
																});
												$('#error-coursetype1')
														.html(
																'<span style="color: red;">Coursetype is requeired</span>');
												$('#courseform #txtCoursetype1')
														.focus();
											} else {
												$
														.ajax({
															url : 'CourseServlet',
															type : 'post',
															data : {
																"Coursetype1" : Coursetype1,
																"Coursetypeid1" : coursetypeid1,
																"Action1" : Action1
															},
															dataType : 'json',
															success : function(
																	data) {
																alert(data.Result);
																location
																		.reload();
															},
															error : function(
																	data) {
																alert(data.Result);
															}
														});
											}
										});
					});
</script>

<!-- Delete Course Type1 -->
<script>
	$(document).ready(function(e) {
		$('#courseform #Delete1').click(function(e) {
			e.preventDefault();
			var coursetypeid1 = $(this).attr("value");
			var del = "Delete1";
			if (confirm("Are you sure you want to delete this?")) {
				$.ajax({
					url : 'CourseServlet',
					type : 'post',
					dataType : 'json',
					data : {
						"Coursetypeid1" : coursetypeid1,
						"Delete1" : del
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

<!-- Edit Course type1  -->
<script>
	$(document).ready(function(e) {
		$('#courseform #Edit1').click(function(e) {
			e.preventDefault();
			var coursetypeid1 = $(this).attr("value");
			var edit1 = "Edit1";
			$('#courseform #hfcoursetypeid').val(coursetypeid1);
			$.ajax({
				url : 'CourseServlet',
				type : 'post',
				data : {
					"Coursetypeid1" : coursetypeid1,
					"Edit1" : edit1
				},
				dataType : 'json',
				success : function(data) {
					$('#courseform #myModal1').modal('hide');
					$('#courseform #txtCoursetype1').val(data.Coursetype1);
					$('#courseform #btnSave1').text('Update');
				}
			});
		});
	});
</script>

<!-- Edit Course name  -->
<script>
	$(document).ready(
			function(e) {
				$('#courseform #Edit').click(
						function(e) {
							e.preventDefault();
							var coursetypenameid = $(this).attr("value");
							var edit = "Edit";
							$('#courseform #hfcoursetypenameid').val(
									coursetypenameid);
							$.ajax({
								url : 'CourseServlet',
								type : 'post',
								data : {
									"Coursetypenameid" : coursetypenameid,
									"Edit" : edit
								},
								dataType : 'json',
								success : function(data) {
									$('#courseform #myModal').modal('hide');
									$('#courseform #hfcoursetypenameid').val(
											data.Coursenameid);
									$('#courseform #ddlCoursetype').val(
											data.Coursetypeid);
									$('#courseform #txtCoursename').val(
											data.Coursename);
									txtCoursename
									$('#courseform #btnSave').text('Update');
								}
							});
						});
			});
</script>

<!-- Save Course name -->
<script>
	$(document)
			.ready(
					function(e) {

						$('#courseform #ddlCoursetype').change(function() {
							$('#courseform #ddlCoursetype').css({
								"border" : ""
							});
							$('#error-coursetype').html('');
						});

						$('#courseform #txtCoursename').keyup(function() {
							$('#courseform #txtCoursename').css({
								"border" : ""
							});
							$('#error-coursename').html('');
						});

						$('#courseform #btnSave')
								.click(
										function(e) {
											e.preventDefault();
											var coursename = $(
													'#courseform #txtCoursename')
													.val();
											var ddlCoursetype = $(
													'#courseform #ddlCoursetype :selected')
													.text();
											var ddlCoursetypeid = $(
													'#courseform #ddlCoursetype :selected')
													.val();
											var Action = $.trim($(this).text());

											if (ddlCoursetype == '--Select Course Type--') {
												$('#courseform #ddlCoursetype')
														.css(
																{
																	"border" : "1px solid red",
																});
												$('#error-coursetype')
														.html(
																'<span style="color: red;">*Select Coursetype</span>');
												$('#userform #ddlCoursetype')
														.focus();
											}

											if (coursename == '') {
												$('#courseform #txtCoursename')
														.css(
																{
																	"border" : "1px solid red",
																});
												$('#error-coursename')
														.html(
																'<span style="color: red;">Coursename is required</span>');
												$('#courseform #txtCoursename')
														.focus()
											}

											if (coursename != ''
													&& ddlCoursetype != '--Select Course Type--') {
												$
														.ajax({
															url : 'CourseServlet',
															type : 'post',
															data : {
																"Coursename" : coursename,
																"Coursetypeid" : ddlCoursetypeid,
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

<!-- Delete  -->
<script>
	$(document).ready(function(e) {
		$('#courseform #Delete').click(function(e) {
			e.preventDefault();
			var coursetypenameid = $(this).attr("value");
			var del = "Delete";
			if (confirm("Are you sure you want to delete this?")) {
				$.ajax({
					url : 'CourseServlet',
					type : 'post',
					dataType : 'json',
					data : {
						"Coursetypenameid" : coursetypenameid,
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

<script>
	$(document).ready(function(e) {
		$('#courseform #btnClear').click(function(e) {
			e.preventDefault();
			$('#courseform #ddlCoursetype').css({
				"border" : ""
			});
			$('#courseform #txtCoursename').css({
				"border" : ""
			});
			$('#error-coursetype').html('');
			$('#error-coursename').html('');
			$('#courseform #txtCoursename').val('');
			$('#branchform #txtCoursename').prop('readonly', false);
			$('#branchform #btnSave').prop('disabled', false);
			$('#branchform #txtCoursename').focus();
		});
	});
</script>

<script>
	$(document).ready(function(e) {
		$('#courseform #btnClear1').click(function(e) {
			e.preventDefault();
			$('#courseform #txtCoursetype1').css({
				"border" : ""
			});
			$('#error-coursetype1').html('');
			$('#courseform #txtCoursetype1').val('');
			$('#branchform #txtCoursetype1').focus();
			$('#branchform #btnSave1').prop('disabled', false);
		});
	});
</script>

</html>