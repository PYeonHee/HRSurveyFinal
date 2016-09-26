<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmQEn"%>
<%@ page import="java.util.List"%>
<html>
<head>
<title></title>
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
	background-color: #325C80;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 100%
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 250px;
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
form {
	display: inline;
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
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>
<title>Survey for Hiring Manager</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
				<nav class="navbar navbar-fixed-top ">
            <p>   <font color="white">Please Select</font></p>
                  <font color="white">Your <b>Language</b></font><br><br>
                  <a class="w3-btn w3-dark-grey" href="MHmQuestion?lang=1"><b>Korean</b></a>
               &nbsp;&nbsp;&nbsp;
                  <a class="w3-btn w3-dark-grey" href="MHmQuestion?lang=2"><b>English</b></a>
			 </nav>
            <br><br><br><br><br><br>
			</div>
			<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 text-left" style="height:auto;">

				<form class="form-horizontal" action="hmSrvyAct" method="post">
					<%
						if (Integer.parseInt((String) request.getParameter("lang")) == 1) {
					%>
					<fieldset>
						<!-- Form Name -->
						<legend>국문</legend>
						<%
						@SuppressWarnings (value="unchecked")
					List<HmQKr> dtos = (List<HmQKr>) request.getAttribute("hmqkr");
					HmQKr dto = null;
					for (int i = 0; i < dtos.size(); i++) {
						dto = dtos.get(i);
				%>
						<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
						<label class="control-label"	for="radios_<%=dto.getHmQNum()%>" style="text-align:left;"><%=dto.getHmQNum()%> . <%=dto.getHmQKr()%></label>
						</div>
						<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
							<label class="radio-inline" for="radios-1_<%=dto.getHmQNum()%>">
							<input name="radios_<%=dto.getHmQNum()%>" 	id="radios-1_<%=dto.getHmQNum()%>" type="radio" value="1"	onclick="hide()" required> 매우 아니다	</label><br>
							<label class="radio-inline" for="radios-2_<%=dto.getHmQNum()%>">
							<input name="radios_<%=dto.getHmQNum()%>"		id="radios-2_<%=dto.getHmQNum()%>" type="radio" value="2"	onclick="hide()"> 아니다 </label><br>
							<label class="radio-inline" for="radios-3_<%=dto.getHmQNum()%>">
							<input name="radios_<%=dto.getHmQNum()%>"		id="radios-3_<%=dto.getHmQNum()%>" type="radio" value="3"	onclick="hide()"> 보통이다 </label><br>
							<label class="radio-inline" for="radios-4_<%=dto.getHmQNum()%>">
							<input name="radios_<%=dto.getHmQNum()%>"		id="radios-4_<%=dto.getHmQNum()%>" type="radio" value="4"	onclick="hide()"> 그렇다 </label><br>
							<label class="radio-inline" for="radios-5_<%=dto.getHmQNum()%>">
							<input name="radios_<%=dto.getHmQNum()%>"		id="radios-5_<%=dto.getHmQNum()%>" type="radio" value="5"	onclick="hide()"> 매우 그렇다	 </label> 
						</div>
						
				<%
					}
				%>
						<!-- id="radios_${hmq.hmQNum}로 function 사용 -->
					</fieldset>
					<button class="btn btn-primary btn-lg" onclick="submit"><b>설문제출</b></button>
					<%
						} else {
					%>
					<fieldset>
						<legend>English</legend>
						<!-- Multiple Radios (inline) -->
						<%
						List<HmQEn> dtos2 = (List<HmQEn>) request.getAttribute("hmqen");
						HmQEn dto2 = null;
						for (int i = 0; i < dtos2.size(); i++) {
							dto2 = dtos2.get(i);
					%>
							<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 " >
							<label class="control-label"	for="radios_<%=dto2.getHmQNum()%>" style="text-align:left;"><%=dto2.getHmQNum()%> . <%=dto2.getHmQEn()%></label>
							</div>
							<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
							<label class="radio-inline" for="radios-1_<%=dto2.getHmQNum()%>">
							<input name="radios_<%=dto2.getHmQNum()%>" 	id="radios-1_<%=dto2.getHmQNum()%>" type="radio" value="1" onclick="hide()" required> Strongly Disagree </label><br>
							<label class="radio-inline" for="radios-2_<%=dto2.getHmQNum()%>">
							<input name="radios_<%=dto2.getHmQNum()%>"	id="radios-2_<%=dto2.getHmQNum()%>" type="radio" value="2"	onclick="hide()"> Disagree </label><br>
							<label class="radio-inline" for="radios-3_<%=dto2.getHmQNum()%>">
							<input name="radios_<%=dto2.getHmQNum()%>"	id="radios-3_<%=dto2.getHmQNum()%>" type="radio" value="3" onclick="hide()"> Neutral </label><br>
							<label class="radio-inline" for="radios-4_<%=dto2.getHmQNum()%>">
							<input name="radios_<%=dto2.getHmQNum()%>"	id="radios-4_<%=dto2.getHmQNum()%>" type="radio" value="4" onclick="hide()"> Agree </label><br>
							<label class="radio-inline" for="radios-5_<%=dto2.getHmQNum()%>">
							<input name="radios_<%=dto2.getHmQNum()%>"	id="radios-5_<%=dto2.getHmQNum()%>" type="radio" value="5" onclick="hide()">Strongly Agree</label>
							</div>
							
					<%
						}
					%>
						
					</fieldset>
					<button class="w3-btn w3-dark-grey" onclick="submit"><b>Submit</b></button>
					<%
						}
					%>
				 
				<!-- <button type="submit"name = "survey_finish">survey 완료</button> -->
				</form>

			</div>
			

		</div>
	</div>

	<jsp:include page="Footer.jsp" flush="true" />

</body>
</html>
