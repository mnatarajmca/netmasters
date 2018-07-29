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

	<form name="examregform" method="post" id="examregform"
		class="form-horizontal" data-toggle="validator" role="form">
		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-body" style="border-color: #337ab7">
					<div class="col-lg-6">
						<div class="panel panel-primary">
							<div class="panel-heading" align="center">
								<h4>
									<b><font color="white">Exam Registraton Form</font> </b>
								</h4>
							</div>
							<div class="panel-body" style="border-color: #337ab7">
								<div id="printableArea">
									<div class="col-lg-12">
										<div class="col-lg-2" style="padding: 5px">
											<span class="Span">Candidate Name</span><span
												style="color: red;">*</span>
										</div>
										<div class="col-lg-6" style="padding: 5px">
											<input name="txtName" autofocus id="txtName" type="text"
												class="form-control" />
										</div>
										<div id="error-name" align="right"></div>
										<div class="col-lg-2" style="padding: 5px">
											<button type="button" name="b1" value="Find" id="btnFind"
												data-target="#add" data-toggle="modal"
												class="btn btn-primary">
												<span class="glyphicon glyphicon-plus"></span> Add
											</button>
										</div>
										<div class="col-lg-2" style="padding: 5px">
											<button type="button" name="b1" value="Reset" id="btnClear"
												class="btn btn-primary">
												<span class="glyphicon glyphicon-remove-circle"></span>
												Clear
											</button>
										</div>
									</div>

									<div class="col-lg-12">
										<div class="col-lg-2" style="padding: 5px">
											<span class="Span">Address</span>
										</div>
										<div class="col-lg-10" style="padding: 5px">
											<textarea name="txtAddress" id="txtAddress"
												class="form-control"></textarea>
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
										<div id="error-mobile" align="right"></div>
									</div>

									<div class="col-lg-12">
										<div class="col-lg-2" style="padding: 5px;">
											<span class="Span">Email ID</span><span style="color: red;">*</span>
										</div>
										<div class="col-lg-10" style="padding: 5px;">
											<input name="txtEmail" type="text" class="form-control"
												id="txtEmail">
										</div>
										<div id="error-email" align="right"></div>
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

									<div class="col-lg-12">
										<div class="col-lg-2" style="padding: 5px;">
											<span class="Span">Candidate Id</span>
										</div>
										<div class="col-lg-10" style="padding: 5px;">
											<input name="txtCandidateid" type="text" class="form-control"
												id="txtCandidateid">
										</div>
									</div>

									<div class="col-lg-12">
										<div class="col-lg-2" style="padding: 5px;">
											<span class="Span">Exam Code</span><span style="color: red;">*</span>
										</div>
										<div class="col-lg-10" style="padding: 5px">
											<select id="ddlExamcode" class="form-control">
												<option value="0">--Select Exam Code--</option>
												<%
													try {
														con = DBConnection.createConnection();
														statement = con.createStatement();
														rs = statement.executeQuery("select * from tblexams");
														while (rs.next()) {
															out.println("<option value='" + rs.getString("examid") + "'/>" + rs.getString("examcode")
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
											<div id="error-examcode" align="right"></div>
										</div>
									</div>

									<div class="col-lg-12">
										<div class="col-lg-2" style="padding: 5px;">
											<span class="Span">Exam Name</span><span style="color: red;">*</span>
										</div>
										<div class="col-lg-10" style="padding: 5px;">
											<input name="txtExamname" type="text" class="form-control"
												id="txtExamname">
										</div>
										<div id="error-examname" align="right"></div>
									</div>

									<div class="col-lg-12">
										<div class="col-lg-2" style="padding: 5px;">
											<span class="Span">Voucher No</span>
										</div>
										<div class="col-lg-10" style="padding: 5px;">
											<input name="txtVoucherno" type="text" class="form-control"
												id="txtVoucherno">
										</div>
									</div>

									<div class="col-lg-12">
										<div class="col-lg-2" style="padding: 5px;">
											<span class="Span">Date</span>
										</div>
										<div class="col-lg-10" style="padding: 5px;">
											<input name="txtDate" type="text" class="form-control"
												placeholder="dd/mm/yyyy eg 31/12/2018 , Default Date:Today"
												id="txtDate">
										</div>
										<div id="error-date" align="right"></div>
									</div>
								</div>
								<div class="col-lg-12" class="form-group"
									style="padding-top: 5px; text-align: center;">
									<button type="button" name="b2" value="Save" id="btnSave"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> Save
									</button>
									<button type="button" name="b2" value="Find" id="btnEdit"
										data-target="#editcandidate" data-toggle="modal"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-edit"></span> Edit
									</button>
									<button type="button" name="b2" value="Reset" id="btnClear"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-refresh"></span> Reset
									</button>
									<button type="button" name="b2" value="Print" id="btnPrint"
										onclick="printDiv('printableArea')" class="btn btn-primary">
										<span class="glyphicon glyphicon-print"></span> Print
									</button>
								</div>

							</div>
						</div>
					</div>

					<div class="col-lg-6">
						<div class="panel panel-primary">
							<div class="panel-heading" align="center">
								<h4>
									<b><font color="white">Examination</font> </b>
								</h4>
							</div>
							<div class="panel-body" style="border-color: #337ab7">
								<div class="col-lg-12" class="form-group"
									style="padding-top: 5px; text-align: center;">
									<div class="col-lg-2" style="padding: 5px">
										<button type="button" name="b1" value="Find" id="btnSearch"
											data-target="#searchcandidate" data-toggle="modal"
											class="btn btn-primary">
											<span class="glyphicon glyphicon-search"></span> Search
										</button>
									</div>
									<div class="col-lg-2" style="padding: 5px">
										<button type="button" name="b1" value="Save" id="btnNew"
											class="btn btn-primary">
											<span class="glyphicon glyphicon-plus"></span> New
										</button>
									</div>
									<div class="col-lg-2" style="padding: 5px">
										<button type="button" name="b1" value="Edit" id="btnEditexam"
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
									<div class="col-lg-2" style="padding: 5px">
										<button type="button" name="b1" value="View" id="btnView"
											class="btn btn-primary">
											<span class="glyphicon glyphicon-check"></span> View
										</button>
									</div>
								</div>
								<table id="studentcourses"
									class="table table-striped table-bordered nowrap"
									style="width: 100%">
									<thead>
										<tr>
											<th>Select</th>
											<th>Name</th>
											<th>Candidate ID</th>
											<th>Exam Code</th>
											<th>Exam Name</th>
											<th>Voucher No</th>
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

			<div class="container">
				<div class="modal" id="add" role="dialog">
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
									<table id="example"
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
														out.println(
																"<td align='center'><input type='image' src='images/Select.png' id='Selectstudent' value='"
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
		</div>
		<div class="container">
			<div class="modal" id="editcandidate" role="dialog">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel-heading" align="center">
								<h4>
									<b><font color="white">Candidate Details</font> </b>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" style="float: right">Close</button>
								</h4>
							</div>
							<div class="panel-body" style="border-color: #337ab7">
								<table id="candidateedit"
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
												String sql = "select * from tblcandidates";
												rs = statement.executeQuery(sql);
												while (rs.next()) {
													out.println("<tr><td>" + rs.getString("canname") + "</td>");
													out.println("<td>" + rs.getString("canmobile") + "</td>");
													out.println("<td>" + rs.getString("canemail") + "</td>");
													out.println(
															"<td align='center'><input type='image' src='images/View.png' id='Viewcandidate' value='"
																	+ rs.getInt("candidateid") + "'>");
													out.println(
															"<td align='center'><input type='image' src='images/Edit.png' id='Editcandidate' value='"
																	+ rs.getInt("candidateid") + "'>");
													out.println(
															"<td align='center'><input type='image' src='images/Delete.png' id='Deletecandidate' value='"
																	+ rs.getInt("candidateid") + "'>");
													out.println("</tr>");
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
			<div class="modal" id="searchcandidate" role="dialog">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">
					<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel-heading" align="center">
								<h4>
									<b><font color="white">Candidate Details</font> </b>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" style="float: right">Close</button>
								</h4>
							</div>
							<div class="panel-body" style="border-color: #337ab7">
								<table id="scandidate"
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
												String sql = "select distinct tblcandidates.canname,tblcandidates.canmobile,"
														+ "tblcandidates.canemail,tblcandidates.candidateid  from " + "tblcandidateexams,tblcandidates";
												rs = statement.executeQuery(sql);
												while (rs.next()) {
													out.println("<tr><td>" + rs.getString("canname") + "</td>");
													out.println("<td>" + rs.getString("canmobile") + "</td>");
													out.println("<td>" + rs.getString("canemail") + "</td>");
													out.println(
															"<td align='center'><input type='image' src='images/Select.png' id='Selectcandidate' value='"
																	+ rs.getInt("tblcandidates.candidateid") + "'>");
													out.println("</tr>");
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

		<div class="container">
			<div class="modal" id="examdetails" role="dialog">
				<div class="col-lg-4"></div>
				<div class="col-lg-5">
					<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel-heading" align="center">
								<h4>
									<b><font color="white">Exam Details</font> </b>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" style="float: right">Close</button>
								</h4>
							</div>
							<div class="panel-body" style="border-color: #337ab7">
								<div class="col-lg-12">
									<div class="col-lg-2" style="padding: 5px">
										<span class="Span">Candidate Name</span><span
											style="color: red;">*</span>
									</div>
									<div class="col-lg-10" style="padding: 5px">
										<input name="txnname" id="txtname" type="text" readonly
											class="form-control" />
									</div>
								</div>
								<div class="col-lg-12">
									<div class="col-lg-2" style="padding: 5px;">
										<span class="Span">Candidate Id</span>
									</div>
									<div class="col-lg-10" style="padding: 5px;">
										<input name="txtCanid" type="text" class="form-control"
											id="txtCanid">
									</div>
								</div>
								<div class="col-lg-12">
									<div class="col-lg-2" style="padding: 5px;">
										<span class="Span">Exam Code</span><span style="color: red;">*</span>
									</div>
									<div class="col-lg-10" style="padding: 5px">
										<select id="ddlCode" class="form-control">
											<option value="0">--Select Exam Code--</option>
											<%
												try {
													con = DBConnection.createConnection();
													statement = con.createStatement();
													rs = statement.executeQuery("select * from tblexams");
													while (rs.next()) {
														out.println("<option value='" + rs.getString("examid") + "'/>" + rs.getString("examcode")
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
									</div>
								</div>

								<div class="col-lg-12">
									<div class="col-lg-2" style="padding: 5px;">
										<span class="Span">Exam Name</span><span style="color: red;">*</span>
									</div>
									<div class="col-lg-10" style="padding: 5px;">
										<input name="txtExam" type="text" class="form-control"
											readonly="readonly" id="txtExam">
									</div>
								</div>

								<div class="col-lg-12">
									<div class="col-lg-2" style="padding: 5px;">
										<span class="Span">Voucher No</span>
									</div>
									<div class="col-lg-10" style="padding: 5px;">
										<input name="txtVoucher" type="text" class="form-control"
											id="txtVoucher">
									</div>
								</div>

								<div class="col-lg-12">
									<div class="col-lg-2" style="padding: 5px;">
										<span class="Span">Date</span>
									</div>
									<div class="col-lg-10" style="padding: 5px;">
										<input name="txtdate" type="text" class="form-control"
											placeholder="dd/mm/yyyy eg 31/12/2018 , Default Date:Today"
											id="txtdate">
									</div>
								</div>
								<div class="col-lg-12" class="form-group"
									style="padding-top: 5px; text-align: center;">
									<button type="button" name="b2" value="Save" id="btnSaveexam"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span> Save
									</button>
									<button type="button" name="b2" value="Reset" id="btnClearexam"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-refresh"></span> Clear
									</button>
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
		</div>

		<input type="hidden" id="hfstuid"><input type="hidden"
			id="hfcandidateid"><input type="hidden" id="hfcanexamid">
	</form>
</body>

<script>
	function printDiv(divName) {
		$(divName).show();
		window.print();
	}

	$(document).ready(
			function(e) {
				$('#examregform #btnView').click(
						function(e) {
							e.preventDefault();
							var radioValue = $(
									"input[name='radiogroup']:checked").val();
							if (radioValue) {
								$.ajax({
									url : 'ExamRegistrationServlet',
									type : 'post',
									dataType : 'json',
									data : {
										"Canexamid" : radioValue,
										"Select" : "Placeexam"
									},
									dataType : 'json',
									success : function(data) {
										var date = new Date(data.Date);
										var year = date.getFullYear();
										var month = date.getMonth() + 1;
										var day = date.getDate();
										date = day + '/' + month + '/' + year;
										$('#examregform #txtCandidateid').val(
												data.Canid);
										$('#examregform #ddlExamcode').val(
												data.Examid).change();
										$('#examregform #txtVoucherno').val(
												data.Voucherno);
										$('#examregform #txtDate').val(date);
									}
								});
							}
						});
			});
</script>

<script>
	$('#examregform #txtExamname').keydown(function(e) {
		return false;
	});

	$('#examregform #txtExamname').bind('cut paste', function(e) {
		e.preventDefault();
	});
</script>

<!-- Clear Exam -->
<script>
	$(document).ready(function(e) {
		$('#examregform #btnClearexam').click(function(e) {
			e.preventDefault();
			$('#examregform #txtCanid').val('');
			$('#examregform #ddlCode').val('0').change();
			$('#examregform #txtExam').val('');
			$('#examregform #txtVoucher').val('');
			$('#examregform #txtdate').val('');
		});
	});
</script>

<!-- Save Exam -->
<script>
	$(document).ready(function(e) {
		$('#examregform #btnSaveexam').click(function(e) {
			e.preventDefault();
			var candidateid = $('#examregform #hfcandidateid').val();
			var Action = $.trim($(this).text()) + 'exam';
			var canexamid = $('#examregform #hfcanexamid').val();
			if (candidateid != '') {
				var reg = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
				var stuid = $('#examregform #hfstuid').val();
				var canid = $('#examregform #txtCanid').val();
				var examid = $('#examregform #ddlCode').val();
				var examname = $('#examregform #txtExam').val();
				var voucherno = $('#examregform #txtVoucher').val();
				var date = $('#examregform #txtdate').val();
				if (date != '' && !reg.test(date)) {
					$('#examregform #txtdate').css({
						"border" : "1px solid red",
					});
					$('#examregform #txtdate').focus();
				} else if (examid == "0") {
					$('#examregform #ddlCode').css({
						"border" : "1px solid red",
					});
					$('#examregform #ddlCode').focus();
				} else if (examname == '') {
					$('#examregform #txtExam').css({
						"border" : "1px solid red",
					});
					$('#examregform #ddlCode').focus();
				} else {
					$.ajax({
						url : 'ExamRegistrationServlet',
						type : 'post',
						dataType : 'json',
						data : {
							"Stuid" : stuid,
							"Candidateid" : candidateid,
							"Canexamid" : canexamid,
							"Canid" : canid,
							"Examid" : examid,
							"Voucherno" : voucherno,
							"Date" : date,
							"Action" : Action
						},
						dataType : 'json',
						success : function(data) {
							alert(data.Result);
							location.reload();
							$('#examregform #examdetails').modal('hide');
						}
					});
				}
			}
		});
	});
</script>

<!-- Search candidate -->
<script>
	$(document)
			.ready(
					function(e) {
						$('#examregform #Selectcandidate')
								.click(
										function(e) {
											e.preventDefault();
											var candidateid = $(this).attr(
													"value");
											$
													.ajax({
														url : 'ExamRegistrationServlet',
														type : 'post',
														dataType : 'json',
														data : {
															"Candidateid" : candidateid,
															"Select" : "Selectcandidate"
														},
														dataType : 'json',
														success : function(data) {
															var table = $('#examregform #studentcourses tbody');
															$(
																	'#examregform #txtCandidateid')
																	.val('');
															$(
																	'#examregform #ddlExamcode')
																	.val('0')
																	.change();
															$(
																	'#examregform #txtVoucherno')
																	.val('');
															$(
																	'#examregform #txtDate')
																	.val('');
															$(
																	'#examregform #searchcandidate')
																	.modal(
																			'hide');
															if (data.Candidateid != '') {
																table.empty();
																$(
																		'#examregform #hfcandidateid')
																		.val(
																				data.Candidateid);
																$(
																		'#examregform #hfstuid')
																		.val(
																				data.Stuid);
																$(
																		'#examregform #txtName')
																		.val(
																				data.Canname);
																$(
																		'#examregform #txtAddress')
																		.val(
																				data.Canaddress);
																$(
																		'#examregform #txtMobile')
																		.val(
																				data.Canmobile);
																$(
																		'#examregform #txtEmail')
																		.val(
																				data.Canemail);
																$(
																		'#examregform #txtComapny')
																		.val(
																				data.Cancompany);
															}
															var length = data.Exam.length;
															if (length > 0) {
																$(
																		'#examregform #hfcandidateid')
																		.val(
																				data.Exam[0].Candidateid);
																$(
																		'#examregform #txtName')
																		.val(
																				data.Exam[0].Canname);
																$(
																		'#examregform #txtAddress')
																		.val(
																				data.Exam[0].Canaddress);
																$(
																		'#examregform #txtMobile')
																		.val(
																				data.Exam[0].Canmobile);
																$(
																		'#examregform #txtEmail')
																		.val(
																				data.Exam[0].Canemail);
																$(
																		'#examregform #txtComapny')
																		.val(
																				data.Exam[0].Cancompany);
																for (var i = 0; i < length; i++) {
																	var date = new Date(
																			data.Exam[i].Date);
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
																	table
																			.prepend('<tr><td><input name="radiogroup" type="radio" value="'
																					+data.Exam[i].Canexamid +'"></td><td>'
																					+ data.Exam[i].Canname
																					+ '</td><td>'
																					+ data.Exam[i].Canid
																					+ '</td><td>'
																					+ data.Exam[i].Examcode
																					+ '</td><td>'
																					+ data.Exam[i].Examname
																					+ '</td><td>'
																					+ data.Exam[i].Voucherno
																					+ '</td><td>'
																					+ date
																					+ '</td></tr>');
																}
																$(
																		'#examregform #btnSave')
																		.prop(
																				'disabled',
																				true);
																$(
																		'#examregform #btnEdit')
																		.prop(
																				'disabled',
																				true);
															}
														}
													});
										});
					});
</script>

<!-- New Exam -->
<script>
	$(document).ready(function(e) {
		$('#examregform #btnNew').click(function(e) {
			e.preventDefault();
			var action = $(this).attr("value");
			var candidateid = $('#examregform #hfcandidateid').val();
			if (action == 'Save') {
				if (candidateid != '') {
					$.ajax({
						url : 'ExamRegistrationServlet',
						type : 'post',
						dataType : 'json',
						data : {
							"Candidateid" : candidateid,
							"Select" : "Viewcandidate"
						},
						dataType : 'json',
						success : function(data) {
							$('#examregform #examdetails').modal('show');
							$('#examregform #txtname').val(data.Canname);
							$('#examregform #txtCanid').val('');
							$('#examregform #ddlCode').val('0');
							$('#examregform #txtExamname').val('');
							$('#examregform #txtVoucher').val('');
							$('#examregform #txtdate').val('');
							$('#examregform #btnSaveexam').text('Save');
						}
					});
				} else {
					alert('Select Candidate');
					$('#examregform #searchcandidate').modal('show');
				}
			}
		});
	});
</script>

<!-- Remove Exam -->
<script type="text/javascript">
	$(document).ready(function(e) {
		$('#examregform #btnRemove').click(function(e) {
			e.preventDefault();
			var radioValue = $("input[name='radiogroup']:checked").val();
			if (radioValue) {
				if (confirm("Are you sure you want to delete this?")) {
					$.ajax({
						url : 'ExamRegistrationServlet',
						type : 'post',
						dataType : 'json',
						data : {
							"Canexamid" : radioValue,
							"Delete" : "Deleteexam"
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

<!-- Edit Exam -->
<script>
	$(document).ready(
			function(e) {
				$('#examregform #btnEditexam').click(
						function(e) {
							e.preventDefault();
							var radioValue = $(
									"input[name='radiogroup']:checked").val();
							if (radioValue) {
								$.ajax({
									url : 'ExamRegistrationServlet',
									type : 'post',
									dataType : 'json',
									data : {
										"Canexamid" : radioValue,
										"Select" : "Editexam"
									},
									dataType : 'json',
									success : function(data) {
										$('#examregform #examdetails').modal(
												'show');
										if (data.Canexamid != '') {
											var date = new Date(data.Date);
											var year = date.getFullYear();
											var month = date.getMonth() + 1;
											var day = date.getDate();
											date = day + '/' + month + '/'
													+ year;
											$('#examregform #hfcanexamid').val(
													data.Canexamid);
											$('#examregform #txtname').val(
													data.Canname);
											$('#examregform #txtCanid').val(
													data.Canid);
											$('#examregform #ddlCode').val(
													data.Examid).change();
											$('#examregform #txtVoucher').val(
													data.Voucherno);
											$('#examregform #txtdate')
													.val(date);
											$('#examregform #btnSaveexam')
													.text('Update');
										}
									}
								});
							}
						});
			});
</script>

<!-- View candidate -->
<script>
	$(document).ready(function(e) {
		$('#examregform #Viewcandidate').click(function(e) {
			e.preventDefault();
			var candidateid = $(this).attr("value");
			$.ajax({
				url : 'ExamRegistrationServlet',
				type : 'post',
				dataType : 'json',
				data : {
					"Candidateid" : candidateid,
					"Select" : "Viewcandidate"
				},
				dataType : 'json',
				success : function(data) {
					$('#examregform #editcandidate').modal('hide');
					$('#examregform #txtName').val(data.Canname);
					$('#examregform #txtAddress').val(data.Canaddress);
					$('#examregform #txtMobile').val(data.Canmobile);
					$('#examregform #txtEmail').val(data.Canemail);
					$('#examregform #txtComapny').val(data.Cancompany);
					$('#examregform #btnSave').prop('disabled', true);
				}
			});
		});
	});
</script>

<!-- Edit candidate -->
<script>
	$(document).ready(function(e) {
		$('#examregform #Editcandidate').click(function(e) {
			e.preventDefault();
			var candidateid = $(this).attr("value");
			$.ajax({
				url : 'ExamRegistrationServlet',
				type : 'post',
				dataType : 'json',
				data : {
					"Candidateid" : candidateid,
					"Select" : "Viewcandidate"
				},
				dataType : 'json',
				success : function(data) {
					$('#examregform #editcandidate').modal('hide');
					$('#examregform #hfstuid').val(data.Stuid);
					$('#examregform #hfcandidateid').val(data.Candidateid);
					$('#examregform #txtName').val(data.Canname);
					$('#examregform #txtAddress').val(data.Canaddress);
					$('#examregform #txtMobile').val(data.Canmobile);
					$('#examregform #txtEmail').val(data.Canemail);
					$('#examregform #txtComapny').val(data.Cancompany);
					$('#examregform #txtCandidateid').attr("readonly", "true");
					$('#examregform #txtExamname').attr("readonly", "true");
					$('#examregform #txtVoucherno').attr("readonly", "true");
					$('#examregform #txtDate').attr("readonly", "true");
					$('#examregform #ddlExamcode').prop('disabled', true);
					$('#examregform #btnSave').text('Update');
					$('#examregform #btnSave').prop('disabled', false);
				}
			});
		});
	});
</script>

<script>
	$('#examregform #txtName').keyup(function() {
		$('#examregform #txtName').css({
			"border" : ""
		});
		$('#error-name').html('');
	});

	$('#examregform #txtMobile').keyup(function() {
		$('#examregform #txtMobile').css({
			"border" : ""
		});
		$('#error-mobile').html('');
	});

	$('#examregform #txtEmail').keyup(function() {
		$('#examregform #txtEmail').css({
			"border" : ""
		});
		$('#error-email').html('');
	});

	$('#examregform #ddlExamcode').change(function() {
		$('#examregform #ddlExamcode').css({
			"border" : ""
		});
		$('#error-examcode').html('');
		$('#examregform #txtExamname').css({
			"border" : ""
		});
		$('#error-examname').html('');
	});

	$('#examregform #txtDate').keyup(function() {
		$('#examregform #txtDate').css({
			"border" : ""
		});
		$('#error-date').html('');
	});
</script>

<!-- Save Candiate -->
<script>
	$(document)
			.ready(
					function(e) {

						$('#examregform #btnSave')
								.click(
										function(e) {
											e.preventDefault();
											var Action = $.trim($(this).text());
											var re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
											var reg = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
											var stuid = $(
													'#examregform #hfstuid')
													.val();
											var canid = $(
													'#examregform #hfcandidateid')
													.val();
											var stuname = $(
													'#examregform #txtName')
													.val();
											var address = $(
													'#examregform #txtAddress')
													.val();
											var mobile = $(
													'#examregform #txtMobile')
													.val();
											var email = $(
													'#examregform #txtEmail')
													.val();
											var company = $(
													'#examregform #txtComapny')
													.val();
											var candidateid = $(
													'#examregform #txtCandidateid')
													.val();
											var examid = $(
													'#examregform #ddlExamcode')
													.val();
											var examname = $(
													'#examregform #txtExamname')
													.val();
											var voucherno = $(
													'#examregform #txtVoucherno')
													.val();
											var date = $(
													'#examregform #txtDate')
													.val();
											if (Action == 'Save') {
												if (stuname == "") {
													$('#examregform #txtName')
															.css(
																	{
																		"border" : "1px solid red",
																	});
													$('#error-name')
															.html(
																	'<span style="color: red;">*Candidate Name is required</span>');
													$('#examregform #txtName')
															.focus();
												}

												if (mobile == ""
														|| mobile.length < 10) {
													$('#examregform #txtMobile')
															.css(
																	{
																		"border" : "1px solid red"
																	});
													$('#error-mobile')
															.html(
																	'<span style="color: red;">*Mobile Number is required</span>');
													$('#examregform #txtMobile')
															.focus();
												}

												if (!re.test(email)) {
													$('#examregform #txtEmail')
															.css(
																	{
																		"border" : "1px solid red",
																	});
													$('#error-email')
															.html(
																	'<span style="color: red;">*Email ID is required</span>');
													$('#examregform #txtEmail')
															.focus();
												}

												if (date != ''
														&& !reg.test(date)) {
													$('#examregform #txtDate')
															.css(
																	{
																		"border" : "1px solid red",
																	});
													$('#error-date')
															.html(
																	'<span style="color: red;">*Date is required</span>');
													$('#examregform #txtDate')
															.focus();
												}

												if (examid == "0") {
													$(
															'#examregform #ddlExamcode')
															.css(
																	{
																		"border" : "1px solid red",
																	});
													$('#error-examcode')
															.html(
																	'<span style="color: red;">*Exam Code is required</span>');
													$(
															'#examregform #ddlExamcode')
															.focus();
												}
												if (examname == '') {
													$(
															'#examregform #txtExamname')
															.css(
																	{
																		"border" : "1px solid red"
																	});
													$('#error-examname')
															.html(
																	'<span style="color: red;">*Exam Name is required</span>');
													$(
															'#examregform #ddlExamcode')
															.focus();
												}

												if (stuname != ''
														&& mobile.length == 10
														&& examname != ''
														&& examid != "0"
														&& re.test(email)
														|| (date != '' && !reg
																.test(date))) {
													if (stuid == "") {
														stuid = "0";
													}
													$
															.ajax({
																url : 'ExamRegistrationServlet',
																type : 'post',
																dataType : 'json',
																data : {
																	"Canid" : canid,
																	"Stuid" : stuid,
																	"Stuname" : stuname,
																	"Address" : address,
																	"Mobile" : mobile,
																	"Email" : email,
																	"Company" : company,
																	"Candidateid" : candidateid,
																	"Examid" : examid,
																	"Voucherno" : voucherno,
																	"Date" : date,
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
											} else if (Action == 'Update') {
												if (stuid > '0') {
													$('#examregform #btnSave')
															.prop('disabled',
																	true);
													alert('Student cannot be Updated here');
												}
												if (canid == '') {
													alert('Candidate not Selected');
												}
												if (stuname == "") {
													$('#examregform #txtName')
															.css(
																	{
																		"border" : "1px solid red",
																	});
													$('#examregform #txtName')
															.focus();
												} else if (address == "") {
													$(
															'#examregform #txtAddress')
															.css(
																	{
																		"border" : "1px solid red",
																	});
													$(
															'#examregform #txtAddress')
															.focus();
												} else if (mobile == ""
														|| mobile < 10) {
													$('#examregform #txtMobile')
															.css(
																	{
																		"border" : "1px solid red",
																	});
													$('#examregform #txtMobile')
															.focus();
												} else if (!re.test(email)) {
													$('#examregform #txtEmail')
															.css(
																	{
																		"border" : "1px solid red",
																	});
													$('#examregform #txtEmail')
															.focus();
												} else if (company == "") {
													$(
															'#examregform #txtCompany')
															.css(
																	{
																		"border" : "1px solid red",
																	});
													$(
															'#examregform #txtComapny')
															.focus();
												} else {
													$
															.ajax({
																url : 'ExamRegistrationServlet',
																type : 'post',
																dataType : 'json',
																data : {
																	"Canid" : canid,
																	"Stuname" : stuname,
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
											}
										});
					});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
		$('#examregform #btnClear').click(function(e) {
			$('#examregform #hfcandidateid').val('');
			$('#examregform #hfstuid').val('');
			$('#examregform #txtName').val('');
			$('#examregform #txtAddress').val('');
			$('#examregform #txtMobile').val('');
			$('#examregform #txtEmail').val('');
			$('#examregform #txtComapny').val('');
			$('#examregform #txtName').focus();
			$('#examregform #txtCandidateid').val('');
			$('#examregform #ddlExamcode').val('0');
			$('#examregform #txtExamname').val('');
			$('#examregform #txtVoucherno').val('');
			$('#examregform #txtDate').val('');

			$('#examregform #txtName').removeAttr('readonly');
			$('#examregform #txtAddress').removeAttr('readonly');
			$('#examregform #txtMobile').removeAttr('readonly');
			$('#examregform #txtEmail').removeAttr('readonly');
			$('#examregform #txtComapny').removeAttr('readonly');

			$('#examregform #txtCandidateid').removeAttr('readonly');
			$('#examregform #txtExamname').removeAttr('readonly');
			$('#examregform #txtVoucherno').removeAttr('readonly');
			$('#examregform #txtDate').removeAttr('readonly');

			$('#examregform #ddlExamcode').prop('disabled', false);
			$('#examregform #btnSave').prop('disabled', false);
			$('#examregform #btnEdit').prop('disabled', false);

			$('#examregform #txtName').css({
				"border" : ""
			});
			$('#error-name').html('');

			$('#examregform #txtMobile').css({
				"border" : ""
			});
			$('#error-mobile').html('');

			$('#examregform #txtEmail').css({
				"border" : ""
			});
			$('#error-email').html('');

			$('#examregform #ddlExamcode').css({
				"border" : ""
			});
			$('#error-examcode').html('');
			$('#examregform #txtExamname').css({
				"border" : ""
			});
			$('#error-examname').html('');
		});
	});
</script>

<!-- Select Student -->
<script>
	$(document).ready(function(e) {
		$('#examregform #Selectstudent').click(function(e) {
			e.preventDefault();
			var stuid = $(this).attr("value");
			$.ajax({
				url : 'ExamRegistrationServlet',
				type : 'post',
				dataType : 'json',
				data : {
					"Stuid" : stuid,
					"Select" : "Select"
				},
				dataType : 'json',
				success : function(data) {
					$('#examregform #add').modal('hide');
					$('#examregform #txtName').val(data.Stuname);
					$('#examregform #txtAddress').val(data.Stuaddress);
					$('#examregform #txtMobile').val(data.Stumobile);
					$('#examregform #txtEmail').val(data.Stuemail);
					$('#examregform #txtComapny').val(data.Stucompany);
					$('#examregform #hfstuid').val(data.Stuid);

					$('#examregform #txtName').attr("readonly", "true");
					$('#examregform #txtAddress').attr("readonly", "true");
					$('#examregform #txtMobile').attr("readonly", "true");
					$('#examregform #txtEmail').attr("readonly", "true");
					$('#examregform #txtComapny').attr("readonly", "true");
				}
			});
		});
	});
</script>

</html>