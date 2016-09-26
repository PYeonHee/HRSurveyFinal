<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
<style>
#other-text1 {
	height: 30px;
	width: 588px;
	display: none;
}

#other-text2 {
	height: 30px;
	width: 588px;
	display: none;
}

#other-text3 {
	height: 30px;
	width: 588px;
	display: none;
}

#other-text4 {
	height: 30px;
	width: 588px;
	display: none;
}

input[type=text] {
	padding: 5px;
	border: 2px solid #ccc;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

input[type=text]:focus {
	border-color: #333;
}

input[type=submit] {
	padding: 5px 15px;
	background: #5596E6;
	border: 0 none;
	cursor: pointer;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 100%;
}

.navbar-default {
	color: #325C80;
	background-color: #325C80;
}

.navbar-default .nav>li>a, .navbar .nav>li>a {
	color: white;
	text-shadow: white;
}

a {
	color: #325C80;
	text-decoration: none;
}

.dropdown-menu>li>a {
	color: blue;
	background: yellow;
	border-bottom: 2px solid green;
}

.navbar-default .nav>li>a:active, .navbar .nav>li>a:active:first-letter,
	.navbar-default .nav>li.current-menu-item>a, .navbar-default .nav>li.current-menu-ancestor>a,
	.navbar-default .nav>li.current-menu-item>a:first-letter,
	.navbar-default .nav>li.current-menu-ancestor>a:first-letter {
	color: red;
	text-shadow: red;
}

a.no-uline {
	text-decoration: none
}

body {
	background-color: #f9f9ec !important;
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #325C80;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
<script>
	$(function() {
		$("input:text").keydown(function(evt) {
			if (evt.keyCode == 13)
				return false;
		});
	});
</script>
</head>
<body>
	<nav class="navbar navbar-default navbar-top">
	<div class="container-fluid">
		<form id="HomeList" name="HomeList" action="Home" method="post">
			<a class="navbar-brand" onclick="document.HomeList.submit()"><img
				src="<%=request.getContextPath()%>/resources/images/logo.png"
				style="width: 80px; height: 30px; margin: 0px;" border="0"/></a>
		</form>
		<ul class="nav navbar-nav">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Modify Survey Question <span
					class="caret"></span></a>
				<ul class="dropdown-menu" style="width: 196px;">
					<li><form id="hmQ" name="hmQ" action="hmQAct" method="POST">
							<a href="#" onclick="document.hmQ.submit()" class="no-uline">Hiring
								Manager</a>
						</form></li>
					<li><form id="nhQ" name="nhQ" action="nhQAct" method="POST">
							<a href="#" onclick="document.nhQ.submit()" class="no-uline">New
								Hire</a>
						</form></li>
					<li><form id="recQ" name="recQ" action="recQAct" method="POST">
							<a href="#" onclick="document.recQ.submit()" class="no-uline">Recruiter</a>
						</form></li>
				</ul></li>

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Total Survey Result <span
					class="caret"></span></a>
				<ul class="dropdown-menu" style="width: 165px;">
					<li><form id="ViewHmResult" name="ViewHmResult"
							action="ViewHmResult" method="POST">
							<a href="#" onclick="document.ViewHmResult.submit()"
								class="no-uline">Hiring Manager</a>
						</form></li>
					<li><form id="ViewNhResult" name="ViewNhResult"
							action="ViewNhResult" method="POST">
							<a href="#" onclick="document.ViewNhResult.submit()"
								class="no-uline">New Hire</a>
						</form></li>
					<li><form id="ViewRecResult" name="ViewRecResult"
							action="ViewRecResult" method="POST">
							<a href="#" onclick="document.ViewRecResult.submit()"
								class="no-uline">Recruiter</a>
						</form></li>
					<li><form id="download" name="download"
							action="DownResultExcel" method="POST">
							<a href="#" onclick="document.download.submit()" class="no-uline">Download
								Result</a>
						</form></li>
					<li><form id="reminder" name="reminder"
							action="SurveyReminder" method="POST">
							<a href="#" onclick="document.reminder.submit()" class="no-uline">Unsurveyed
								List</a>
						</form></li>
				</ul></li>

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Survey List Upload <span
					class="caret"></span></a>
				<ul class="dropdown-menu" style="width: 165px;">
					<li class="nav-item"><form id="down" name="down"
							action="DownFormExcel" method="post">
							<a href="#" onclick="document.down.submit()" class="no-uline">
								Download Form </a>
						</form></li>
					<li><form id="upload" name="upload" action="fileUpload"
							method="get">
							<a href="#" onclick="document.upload.submit()" class="no-uline">Upload
								List</a>
						</form></li>

					<li>
						<form id="result" name="result" action="ViewUploadRes"
							method="POST">
							<a href="#" onclick="document.result.submit()" class="no-uline">Uploaded
								List</a>
						</form>
					</li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Question Version Management <span
					class="caret"></span></a>
				<ul class="dropdown-menu" style="width: 242px;">
					<li><form id="history" name="history" action="viewHistory"
							method="get">
							<a href="#" onclick="document.history.submit()" class="no-uline">View
								History</a>
						</form></li>
				</ul></li>

		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="logout.do"><span
					class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		</ul>
	</div>
	</nav>
</body>
</html>