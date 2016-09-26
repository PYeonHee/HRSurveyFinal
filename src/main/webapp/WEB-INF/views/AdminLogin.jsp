<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>IBM HR Survey</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<% request.getSession();

%>
</head>
<body>
	<div class="container">
		<div id="loginbox" style="margin-top: 50px;" 
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Sign In</div>
				</div>
				
				<div style="padding-top: 30px" class="panel-body">
					<div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>
					<form action="login.do" id="loginform" class="form-horizontal" role="form">
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
							<input id="id" type="text" class="form-control" name="id" placeholder="userID">
						</div>
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
							<input id="pw" type="password" class="form-control" name="pw" 
									placeholder="password">
						</div>
						<!-- <div class="input-group">
							<div class="checkbox">
								<label> 
								<input id="login-remember" type="checkbox" name="remember" value="1"> Remember Info
								</label>
							</div>
						</div> -->
						
						<div style="margin-top: 10px" class="form-group">
							<!-- Button -->
							<div class="col-sm-12 controls">
								<input type="submit" id="btn-login" class="btn btn-success" value="Login"/>
							</div>
						</div>
						<div class="form-group"></div>
					</form>	
					<ul><li>
							<a href="HmQuestion?lang=1">Hiring	Manager</a>
							</li><li>
							<a href="NhQuestion?lang=1">New Hire</a>
							</li><li>
							<a href="RecQuestion?lang=1">Recruiter</a>
							</li><li>
							<a href="MHmQuestion?lang=1">Mobile Hiring	Manager</a>
							</li><li>
							<a href="MNhQuestion?lang=1">Mobile New Hire</a>
							</li><li>
							<a href="MRecQuestion?lang=1">Mobile Recruiter</a>
							</ul>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>