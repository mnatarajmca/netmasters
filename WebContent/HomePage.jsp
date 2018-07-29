<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
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
						<b><font color="white">Student Course Details</font> </b>
					</h4>
				</div>
				<div class="panel-body" style="border-color: #337ab7">
					<table id="studentcourse"
						class="table table-striped table-bordered nowrap"
						style="width: 100%">
						<thead>
							<tr>
								<th>Name</th>
								<th>Mobile</th>
								<th>Email</th>
								<th>Course Type</th>
								<th>Course Name</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody>
							<%
								try {
									con = DBConnection.createConnection();
									statement = con.createStatement();
									String sql = "select tblstudents.stuname,tblstudents.stumobile,tblstudents.stuemail,"
											+ "tblcoursetypes.coursetype,tblcourses.course,tblstudentcourses.date from tblstudentcourses,"
											+ "tblstudents,tblcourses,tblcoursetypes where tblstudents.stuid=tblstudentcourses.stuid and "
											+ "tblstudentcourses.coursetypeid=tblcoursetypes.coursetypeid and "
											+ "tblstudentcourses.courseid=tblcourses.courseid";
									rs = statement.executeQuery(sql);
									while (rs.next()) {
										String date, month, year;
										date = String.valueOf(rs.getDate("tblstudentcourses.date").getDate());
										month = String.valueOf(rs.getDate("tblstudentcourses.date").getMonth() + 1);
										year = String.valueOf(1900 + rs.getDate("tblstudentcourses.date").getYear());
										date = date + '/' + month + '/' + year;
										out.println("<tr><td>" + rs.getString("tblstudents.stuname") + "</td>");
										out.println("<td>" + rs.getString("tblstudents.stumobile") + "</td>");
										out.println("<td><a href='mailto:" + rs.getString("tblstudents.stuemail") + "'>"
												+ rs.getString("tblstudents.stuemail") + "</td>");
										out.println("<td>" + rs.getString("tblcoursetypes.coursetype") + "</td>");
										out.println("<td>" + rs.getString("tblcourses.course") + "</td>");
										out.println("<td>" + date + "</td></tr>");
									}
								} catch (Exception ex) {
									System.out.println(ex.toString());
								} finally {
									try {
										if (statement.isClosed()) {
											statement.close();
										}
									} catch (Exception e1) {
										System.out.println(e1.toString());
									}
									statement = null;
									try {
										if (con.isClosed()) {
											con.close();
										}
									} catch (Exception e) {
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

		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading" align="center">
					<h4>
						<b><font color="white">Candidate Examination Details</font> </b>
					</h4>
				</div>
				<div class="panel-body" style="border-color: #337ab7">
					<table id="studentexam1"
						class="table table-striped table-bordered nowrap"
						style="width: 100%">
						<thead>
							<tr>
								<th>Name</th>
								<th>Mobile</th>
								<th>Email</th>
								<th>Exam Code</th>
								<th>Exam Name</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody>
							<%
								try {
									con = DBConnection.createConnection();
									statement = con.createStatement();
									String sql = "select tblcandidates.canname,tblcandidates.canmobile,tblcandidates.canemail,"
											+ "tblexams.examcode,tblexams.examname,tblcandidateexams.date from tblcandidates,tblcandidateexams,tblexams "
											+ " where tblcandidateexams.candidateid=tblcandidates.candidateid and tblexams.examid=tblcandidateexams.examid";
									rs = statement.executeQuery(sql);
									while (rs.next()) {
										String date, month, year;
										date = String.valueOf(rs.getDate("tblcandidateexams.date").getDate());
										month = String.valueOf(rs.getDate("tblcandidateexams.date").getMonth() + 1);
										year = String.valueOf(1900 + rs.getDate("tblcandidateexams.date").getYear());
										date = date + '/' + month + '/' + year;
										out.println("<tr><td>" + rs.getString("tblcandidates.canname") + "</td>");
										out.println("<td>" + rs.getString("tblcandidates.canmobile") + "</td>");
										out.println("<td><a href='mailto:" + rs.getString("tblcandidates.canemail") + "'>"
												+ rs.getString("tblcandidates.canemail") + "</td>");
										out.println("<td>" + rs.getString("tblexams.examcode") + "</td>");
										out.println("<td>" + rs.getString("tblexams.examname") + "</td>");
										out.println("<td>" + date + "</td>");
									}
								} catch (Exception ex) {
									System.out.println(ex.toString());
								} finally {
									try {
										if (statement.isClosed()) {
											statement.close();
										}
									} catch (Exception e1) {
										System.out.println(e1.toString());
									}
									statement = null;
									try {
										if (con.isClosed()) {
											con.close();
										}
									} catch (Exception e) {
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
	</form>
</body>

<script>
	$(document).ready(function() {
		$('#studentcourse').DataTable({
			dom : 'Bfrtip',
			buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]
		});
	});
</script>

<script>
	$(document).ready(function() {
		$('#studentexam1').DataTable({
			dom : 'Bfrtip',
			buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]
		});
	});
</script>

</html>