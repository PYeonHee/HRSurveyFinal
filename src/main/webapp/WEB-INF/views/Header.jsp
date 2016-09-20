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
	height: 100%
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

<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">IBM HR</a>
		<ul class="nav navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="adminhome">Home 
			<span class="sr-only">(current)</span>
			</a></li>
<!-- 
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">설문항목 조회 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><form id="viewhmQ" name="viewhmQ" action="HmQuestionKr"
							method="post">
							<a href="#" onclick="document.viewhmQ.submit()">Hiring
								Manager</a>
						</form></li>
					<li><form id="viewnhQ" name="viewnhQ" action="NhQuestionKr"
							method="post">
							<a href="#" onclick="document.viewnhQ.submit()">New Hire</a>
						</form></li>
					<li><form id="viewrecQ" name="viewrecQ" action="RecQuestionKr"
							method="post">
							<a href="#" onclick="document.viewrecQ.submit()">Recruiter</a>
						</form></li>
				</ul></li> -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">국문 설문수정 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><form id="hmQ" name="hmQ" action="hmQAct" method="POST">
							<a href="#" onclick="document.hmQ.submit()">Hiring Manager</a>
						</form></li>
					<li><form id="nhQ" name="nhQ" action="nhQAct" method="POST">
							<a href="#" onclick="document.nhQ.submit()">NewHire</a>
						</form></li>
					<li><form id="recQ" name="recQ" action="recQAct" method="POST">
							<a href="#" onclick="document.recQ.submit()">Recruiter</a>
						</form></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">영문 설문수정 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><form id="hmEnQ" name="hmEnQ" action="hmEnQAct"
							method="POST">
							<a href="#" onclick="document.hmEnQ.submit()">Hiring Manager</a>
						</form></li>
					<li><form id="nhEnQ" name="nhEnQ" action="nhEnQAct"
							method="POST">
							<a href="#" onclick="document.nhEnQ.submit()">NewHire</a>
						</form></li>
					<li><form id="recEnQ" name="recEnQ" action="recEnQAct"
							method="POST">
							<a href="#" onclick="document.recEnQ.submit()">Recruiter</a>
						</form></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">결과조회 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><form id="ViewHmResult" name="ViewHmResult" action="ViewHmResult"
							method="POST">
							<a href="#" onclick="document.ViewHmResult.submit()">Hiring
								Manager</a>
						</form></li>
					<li><form id="ViewNhResult" name="ViewNhResult" action="ViewNhResult"
							method="POST">
							<a href="#" onclick="document.ViewNhResult.submit()">New Hire</a>
						</form></li>
					<li><form id="ViewRecResult" name="ViewRecResult" action="ViewRecResult"
							method="POST">
							<a href="#" onclick="document.ViewRecResult.submit()">Recruiter</a>
						</form></li>
					<li class="nav-item"><form id="download" name="download"
						action="DownExcel" method="POST">
						<a class="nav-link" href="#" onclick="document.download.submit()">결과
							다운로드</a>
					</form></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">명단 업로드 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li class="nav-item"><form id="upload" name="upload"
							action="fileUpload" method="get">
							<a class="nav-link" href="#" onclick="document.upload.submit()">명단	업로드</a>
					</form></li>

					<li class="nav-item">
					<form id="result" name="result" action="ViewUploadRes" method="POST">
						<a class="nav-link" href="#" onclick="document.result.submit()">업로드된 명단</a>
					</form>
				</ul></li>

		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="logout.do"><span class="glyphicon glyphicon-log-out"></span>
					Logout</a></li>
		</ul>
	</div>
	</nav>
</body>
</html>