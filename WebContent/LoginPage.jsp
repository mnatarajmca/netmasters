<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Netmasters Pvt Ltds</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/responsive.bootstrap.min.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script src="jquery/jquery.min.js"></script>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/responsive.bootstrap.min.js"></script>
</head>
<%!Connection con = null;
	Statement statement = null;
	ResultSet rs = null;%>
<body>

	<form name="loginform" method="post" id="loginform"
		class="form-horizontal" data-toggle="validator" role="form">
		<div class="col-lg-4"></div>
		<div class="container" style="margin-top: 10%; margin-bottom: 10%;">
			<div class="col-lg-5">
				<div class="panel panel-primary">
					<div class="panel-heading" align="center">
						<h4>
							<b><font color="white">Log In</font> </b>
						</h4>
					</div>
					<div class="panel-body" style="border-color: #337ab7">
						<div class="col-lg-12">
							<div class="col-lg-3" style="padding: 5px">
								<span class="Span">User Name</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-9" style="padding: 5px">
								<input name="txtUserName" id="txtUserName" type="text" autofocus
									class="form-control" />
							</div>
							<div id="error-username" align="right"></div>
						</div>
						<div class="col-lg-12">
							<div class="col-lg-3" style="padding: 5px">
								<span class="Span">Password</span><span style="color: red;">*</span>
							</div>
							<div class="col-lg-9" style="padding: 5px">
								<input name="txtPass" id="txtPass" type="password"
									class="form-control" />
							</div>
							<div id="error-password" align="center"></div>
						</div>
						<div id="error" align="center"></div>
						<div class="col-lg-12" class="form-group"
							style="padding-top: 5px; text-align: center;">
							<button type="button" name="b2" value="login" id="btn-login"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-log-in"></span> Login
							</button>
							<button type="button" name="b2" value="Reset" id="btnClear"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-refresh"></span> Clear
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>

<script>
	$(document)
			.ready(
					function(e) {

						$('#loginform #txtUserName').keyup(function() {
							$('#loginform #txtUserName').css({
								"border" : ""
							});
							$('#error-username').html('');
						});

						$('#loginform #txtPass').keyup(function() {
							$('#error-password').html('');
							$('#loginform #txtPass').css({
								"border" : ""
							});
						});

						/* Clear */
						$('#loginform #btnClear').click(function(e) {
							e.preventDefault();
							$('#loginform #txtUserName').css({
								"border" : ""
							});
							$('#error-username').html('');
							$('#error-password').html('');
							$('#loginform #txtPass').css({
								"border" : ""
							});
						});

						/* Login */
						$('#loginform #btn-login')
								.click(
										function(e) {
											e.preventDefault();
											var username = $(
													'#loginform #txtUserName')
													.val();
											var password = $(
													'#loginform #txtPass')
													.val();
											if (username == '') {
												$('#loginform #txtUserName')
														.css(
																{
																	"border" : "1px solid red"
																});
												$('#error-username')
														.html(
																'<span style="color: red;">*User Name required</span>');
												$('#loginform #txtUserName')
														.focus();
											}
											if (password == '') {
												$('#loginform #txtPass').css({
													"border" : "1px solid red"
												});
												$('#error-password')
														.html(
																'<span style="color: red;">*Password required</span>');
												$('#loginform #txtPass')
														.focus();
											}
											if (username != ''
													&& password != '') {
												$
														.ajax({
															url : 'LoginServlet',
															type : 'post',
															dataType : 'json',
															data : {
																"Username" : username,
																"Password" : password
															},
															dataType : 'json',
															success : function(
																	data) {
																if (data.Result == 'Success') {
																	window.location
																			.replace("HomePage.jsp");
																} else {
																	$('#error')
																			.html(
																					'<span style="color: red;">'
																							+ data.Result
																							+ '</span>');
																}
															}
														});
											}
										});
					});
</script>

</html>