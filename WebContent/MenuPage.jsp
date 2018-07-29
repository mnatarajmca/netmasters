<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>Netmasters Pvt Ltds</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="css/responsive.bootstrap.min.css">
<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/buttons.dataTables.min.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script src="jquery/jquery.min.js"></script>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.buttons.min.js"></script>
<script src="js/buttons.flash.min.js"></script>
<script src="js/jszip.min.js"></script>
<script src="js/pdfmake.min.js"></script>
<script src="js/vfs_fonts.js"></script>
<script src="js/buttons.html5.min.js"></script>
<script src="js/buttons.print.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>
<script src="js/dataTables.responsive.min.js"></script>
<script src="js/responsive.bootstrap.min.js"></script>
<script src="js/bootbox.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/myjs.js"></script>
</head>
<%!String Session = null;%>
<body>
	<%
		if (session.getAttribute("username") != null) {
			Session = session.getAttribute("username").toString();
		} else {
			response.sendRedirect("LoginPage.jsp");
		}
	%>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<li class="active"><a href="HomePage.jsp">Home</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Exam<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="ExamRegistrationPage.jsp">Exam Registration</a></li>
					<li><a href="ExamPage.jsp">Add/Delete Exam</a></li>
				</ul></li>

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Course<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="CourseRegistration.jsp">Course Registration</a></li>
					<li><a href="CoursePage.jsp">Add/Delete Course</a></li>
				</ul></li>

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Welcome <%=Session%><span
					class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="UserAccountPage.jsp"><span
							class="glyphicon glyphicon-user"></span> User Account</a></li>
					<li><a href="LoginPage.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul></li>
		</ul>
	</div>
	</nav>
</body>
</html>