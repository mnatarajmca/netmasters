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

	<form name="examform" method="post" id="examform"
		class="form-horizontal" data-toggle="validator" role="form">
		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading" align="center">
					<h4>
						<b><font color="white">Exam Form</font> </b>
					</h4>
				</div>
				<div class="panel-body" style="border-color: #337ab7">
					<div class="col-lg-6">
						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px;">
								<span class="Span">Client</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-10" style="padding: 5px">
								<select id="ddlClient" class="form-control">
									<option value="0">--Select Client--</option>
									<%
										try {
											con = DBConnection.createConnection();
											statement = con.createStatement();
											rs = statement.executeQuery("select * from tblclients");
											while (rs.next()) {
												out.println(
														"<option value='" + rs.getInt("clientid") + "'/>" + rs.getString("client") + "</option>");
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
							</div>
							<div id="error-selectclient" align="right"></div>
						</div>

						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px">
								<span class="Span">Exam Code</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-10" style="padding: 5px">
								<input name="txtExamcode" id="txtExamcode" type="text"
									class="form-control" />
							</div>
							<div id="error-examcode" align="right"></div>
						</div>

						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px">
								<span class="Span">Exam Name</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-10" style="padding: 5px">
								<input name="txtExamname" id="txtExamname" type="text"
									class="form-control" />
							</div>
							<div id="error-examname" align="right"></div>
						</div>

						<div class="col-lg-12" class="form-group"
							style="padding-top: 5px; text-align: center;">
							<button type="button" name="b1" value="Save" id="btnSave1"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span> Save
							</button>
							<button type="button" name="b1" value="Find" id="btnFind1"
								data-target="#myModal1" data-toggle="modal"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-edit"></span> Edit
							</button>
							<button type="button" name="b1" value="Reset" id="btnClear1"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-refresh"></span> Reset
							</button>
						</div>

					</div>

					<div class="col-lg-6" style="border-color: #337ab7">
						<div class="col-lg-12">
							<div class="col-lg-2" style="padding: 5px">
								<span class="Span">New Client</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-10" style="padding: 5px">
								<input name="txtClient" id="txtClient" type="text"
									class="form-control" />
							</div>
							<div id="error-newclient" align="right"></div>
						</div>

						<div class="col-lg-12" class="form-group"
							style="padding-top: 5px; text-align: center;">
							<button type="button" name="b1" value="Save" id="btnSave2"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span> Save
							</button>
							<button type="button" name="b1" value="Find" id="btnFind2"
								data-target="#myModal2" data-toggle="modal"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-edit"></span> Edit
							</button>
							<button type="button" name="b1" value="Reset" id="btnClear2"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-refresh"></span> Reset
							</button>
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
							<b><font color="white">Exam Details</font> </b>
						</h4>
					</div>
					<div class="panel-body" style="border-color: #337ab7">
						<table id="example3"
							class="table table-striped table-bordered nowrap"
							style="width: 100%">
							<thead>
								<tr>
									<th>Client</th>
									<th>Exam Code</th>
									<th>Exam Name</th>
								</tr>
							</thead>
							<tbody>
								<%
									try {
										con = DBConnection.createConnection();
										statement = con.createStatement();
										String sql = "SELECT tblclients.client,tblexams.examcode,tblexams.examname from tblclients,"
												+ "tblexams where tblclients.clientid=tblexams.clientid;";
										rs = statement.executeQuery(sql);
										while (rs.next()) {
											out.println("<tr><td>" + rs.getString("tblclients.client") + "</td>");
											out.println("<td>" + rs.getString("tblexams.examcode") + "</td>");
											out.println("<td>" + rs.getString("tblexams.examname") + "</td>");
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

		<div class="modal" id="myModal2" role="dialog">			
			<div class="col-lg-12">
				<div class="modal-body">
					<div class="panel panel-primary">
						<div class="panel-heading" align="center">
							<h4>
								<b><font color="white">Client</font> </b>
								<button type="button" class="btn btn-default"
									data-dismiss="modal" style="float: right">Close</button>
							</h4>
						</div>
						<div class="panel-body" style="border-color: #337ab7">
							<table id="example2"
								class="table table-striped table-bordered nowrap"
								style="width: 100%">
								<thead>
									<tr>
										<th>Client</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<%
										try {
											con = DBConnection.createConnection();
											statement = con.createStatement();
											String sql = "select * from tblclients";
											rs = statement.executeQuery(sql);
											while (rs.next()) {
												out.println("<tr><td>" + rs.getString("client") + "</td>");
												out.println("<td align='center'><input type='image' src='images/Edit.png' id='Edit1' value='"
														+ rs.getInt("clientid") + "'>");
												out.println("<td align='center'><input type='image' src='images/Delete.png' id='Delete1' value='"
														+ rs.getInt("clientid") + "'>");
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

		<div class="container-fluid">
			<div class="modal" id="myModal1" role="dialog">				
				<div class="col-lg-12">
					<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel-heading" align="center">
								<h4>
									<b><font color="white">Exam Code & Exam Name Details</font>
									</b>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" style="float: right">Close</button>
								</h4>
							</div>
							<div class="panel-body" style="border-color: #337ab7">
								<table id="example1"
									class="table table-striped table-bordered nowrap"
									style="width: 100%">
									<thead>
										<tr>
											<th>Client</th>
											<th>Exam Code</th>
											<th>Exam Name</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<%
											try {
												con = DBConnection.createConnection();
												statement = con.createStatement();
												String sql = "select tblexams.examid,tblclients.clientid,tblclients.client,tblexams.examcode,tblexams.examname from tblclients,tblexams"
														+ " where tblclients.clientid=tblexams.clientid";
												rs = statement.executeQuery(sql);
												while (rs.next()) {
													out.println("<tr><td>" + rs.getString("tblclients.client") + "</td>");
													out.println("<td>" + rs.getString("tblexams.examcode") + "</td>");
													out.println("<td>" + rs.getString("tblexams.examname") + "</td>");
													out.println("<td align='center'><input type='image' src='images/Edit.png' id='Edit2' value='"
															+ rs.getInt("tblexams.examid") + "'>");
													out.println("<td align='center'><input type='image' src='images/Delete.png' id='Delete2' value='"
															+ rs.getInt("tblexams.examid") + "'>");
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
		<input type="hidden" id="hfclientid1" name="hfclientid1"> <input
			type="hidden" id="hfexamid" name="hfexamid">
	</form>
</body>

<!-- Reset1 -->
<script>
	$(document).ready(function(e) {
		$('#examform #btnClear1').click(function(e) {
			e.preventDefault();
			$('#examform #txtExamcode').val('');
			$('#examform #txtExamname').val('');
			$('#examform #ddlClient').val('0');
			$('#examform #ddlClient').focus();
			$('#examform #ddlClient').css({
				"border" : ""
			});
			$('#error-selectclient').html('');
			$('#examform #txtExamcode').css({
				"border" : "",
			});
			$('#error-examcode').html('');
			$('#examform #txtExamname').css({
				"border" : "",
			});
			$('#error-examname').html('');
		});
	});
</script>


<!-- Reset2 -->
<script>
	$(document).ready(function(e) {
		$('#examform #btnClear2').click(function(e) {
			e.preventDefault();
			$('#examform #txtClient').css({
				"border" : ""
			});
			$('#error-newclient').html('');
			$('#examform #txtClient').val('');
			$('#examform #txtClient').focus();
		});
	});
</script>

<!-- Save Examname -->
<script>
	$(document)
			.ready(
					function(e) {

						$('#examform #ddlClient').change(function() {
							$('#examform #ddlClient').css({
								"border" : "",
							});
							$('#error-selectclient').html('');
						});

						$('#examform #txtExamcode').keyup(function() {
							$('#examform #txtExamcode').css({
								"border" : "",
							});
							$('#error-examcode').html('');
						});

						$('#examform #txtExamname').keyup(function() {
							$('#examform #txtExamname').css({
								"border" : "",
							});
							$('#error-examname').html('');
						});

						$('#examform #btnSave1')
								.click(
										function(e) {
											e.preventDefault();
											var clientid1 = $(
													'#examform #ddlClient')
													.val();
											var examcode = $(
													'#examform #txtExamcode')
													.val();
											var examname = $(
													'#examform #txtExamname')
													.val();
											var examid = $(
													'#examform #hfexamid')
													.val();
											var Action1 = $
													.trim($(this).text()) + 1;
											if (clientid1 == "0") {
												$('#examform #ddlClient').css({
													"border" : "1px solid red",
												});
												$('#error-selectclient')
														.html(
																'<span style="color: red;">*Select a Client</span>');
												$('#examform #ddlClient')
														.focus();
											} 

											if (examcode == "") {
												$('#examform #txtExamcode')
														.css(
																{
																	"border" : "1px solid red",
																});
												$('#error-examcode')
														.html(
																'<span style="color: red;">*Examcode is required</span>');
												$('#examform #txtExamcode')
														.focus();
											} 

											if (examname == "") {
												$('#examform #txtExamname')
														.css(
																{
																	"border" : "1px solid red",
																});
												$('#error-examname')
														.html(
																'<span style="color: red;">*Examname is required</span>');
												$('#examform #txtExamname')
														.focus();
											} 

											if (clientid1 != "0"
													&& examcode != ""
													&& examname != "") {
												$
														.ajax({
															url : 'ExamServlet',
															type : 'post',
															dataType : 'json',
															data : {
																"Examid" : examid,
																"Action1" : Action1,
																"Clientid1" : clientid1,
																"Examcode" : examcode,
																"Examname" : examname
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

<!-- Delete2 -->
<script>
	$(document).ready(function(e) {
		$('#examform #Delete2').click(function(e) {
			e.preventDefault();
			var examid = $(this).attr("value");
			if (confirm("Are you sure you want to delete this?")) {
				$.ajax({
					url : 'ExamServlet',
					type : 'post',
					dataType : 'json',
					data : {
						"Examid" : examid,
						"Delete2" : "Delete2"
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

<!-- Delet1 -->
<script>
	$(document).ready(function(e) {
		$('#examform #Delete1').click(function(e) {
			e.preventDefault();
			var clientid = $(this).attr("value");
			if (confirm("Are you sure you want to delete this?")) {
				$.ajax({
					url : 'ExamServlet',
					type : 'post',
					dataType : 'json',
					data : {
						"Clientid" : clientid,
						"Delete1" : "Delete1"
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

<!-- Edit2 -->
<script type="text/javascript">
	$(document).ready(function(e) {
		$('#examform #Edit2').click(function(e) {
			e.preventDefault();
			var examid = $(this).attr("value");
			$.ajax({
				url : 'ExamServlet',
				type : 'post',
				data : {
					"Examid" : examid,
					"Edit2" : "Edit2"
				},
				dataType : 'json',
				success : function(data) {
					$('#examform #myModal1').modal('hide');
					$('#examform #btnSave1').text('Update');
					$('#examform #hfexamid').val(data.Examid);
					$('#examform #ddlClient').val(data.Clientid);
					$('#examform #txtExamcode').val(data.Examcode);
					$('#examform #txtExamname').val(data.Examname);
				}
			});
		});
	});
</script>

<!-- Edit1 -->
<script type="text/javascript">
	$(document).ready(function(e) {
		$('#examform #Edit1').click(function(e) {
			e.preventDefault();
			var clientid = $(this).attr("value");
			$.ajax({
				url : 'ExamServlet',
				type : 'post',
				data : {
					"Clientid" : clientid,
					"Edit1" : "Edit1"
				},
				dataType : 'json',
				success : function(data) {
					$('#examform #myModal2').modal('hide');
					$('#examform #btnSave2').text('Update');
					$('#examform #hfclientid1').val(data.Clientid);
					$('#examform #txtClient').val(data.Client);
				}
			});
		});
	});
</script>

<!-- Save2 -->
<script type="text/javascript">
	$(document)
			.ready(
					function(e) {

						$('#examform #txtClient').keyup(function() {
							$('#examform #txtClient').css({
								"border" : ""
							});
							$('#error-newclient').html('');
						});

						$('#examform #btnSave2')
								.click(
										function(e) {
											e.preventDefault();
											var client = $(
													'#examform #txtClient')
													.val();
											var clientid = $(
													'#examform #hfclientid1')
													.val();
											var Action2 = $
													.trim($(this).text()) + 2;
											if (client == "") {
												$('#examform #txtClient').css({
													"border" : "1px solid red",
												});
												$('#error-newclient')
														.html(
																'<span style="color: red;">*New Client is required</span>');
												$('#examform #txtClient')
														.focus();
											} else  {
												$.ajax({
													url : 'ExamServlet',
													type : 'post',
													data : {
														"Action2" : Action2,
														"Clientid" : clientid,
														"Client" : client
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

</html>