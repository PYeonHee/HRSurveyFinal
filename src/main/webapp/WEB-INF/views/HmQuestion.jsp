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

</head>
<title>Survey for Hiring Manager</title>

<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

	<div class="container-fluid text-center">
		<div class="row content">
		<div class="col-sm-1 sidenav">
			<form id="krhm" name="krhm" action="HmQuestionKr" method="post">
				<p><font color="white">Please select your language.</font></p>
					<div class="well">
					<button onclick="document.krhm.submit();">국문</button>
					
					</div>
					</form>
					<form id="enhm" name="enhm" action="HmQuestionEn" method="post">
					<div class="well">
					<button onclick="document.enhm.submit();">영문</button>
					
					</div>
				</form>
			</div>
			<div class="col-sm-10 text-left">

				<form class="form-horizontal" action="hmSrvyAct" method="post">
					<%
						if (Integer.parseInt((String) request.getAttribute("lang")) == 1) {
					%>
					<fieldset>
						<!-- Form Name -->
						<legend>국문</legend>
						<%
					List<HmQKr> dtos = (List<HmQKr>) request.getAttribute("hmqkr");
					HmQKr dto = null;
					for (int i = 0; i < dtos.size(); i++) {
						dto = dtos.get(i);
				%>
						<div class="form-group">
						<label class="col-md-7 col-xs-4 control-label"	for="radios_<%=dto.getHmQNum()%>"><%=dto.getHmQNum()%> . <%=dto.getHmQKr()%></label>
						<div class="col-md-7 col-xs-4">
							<label class="radio-inline" for="radios-1_<%=dto.getHmQNum()%>">
							<input name="radios_<%=dto.getHmQNum()%>" 	id="radios-1_<%=dto.getHmQNum()%>" type="radio" value="1"	onclick="hide()" required> 매우 아니다	</label>
							<label class="radio-inline" for="radios-2_<%=dto.getHmQNum()%>">
							<input name="radios_<%=dto.getHmQNum()%>"		id="radios-2_<%=dto.getHmQNum()%>" type="radio" value="2"	onclick="hide()"> 아니다 </label>
							<label class="radio-inline" for="radios-3_<%=dto.getHmQNum()%>">
							<input name="radios_<%=dto.getHmQNum()%>"		id="radios-3_<%=dto.getHmQNum()%>" type="radio" value="3"	onclick="hide()"> 보통이다 </label>
							<label class="radio-inline" for="radios-4_<%=dto.getHmQNum()%>">
							<input name="radios_<%=dto.getHmQNum()%>"		id="radios-4_<%=dto.getHmQNum()%>" type="radio" value="4"	onclick="hide()"> 그렇다 </label>
							<label class="radio-inline" for="radios-5_<%=dto.getHmQNum()%>">
							<input name="radios_<%=dto.getHmQNum()%>"		id="radios-5_<%=dto.getHmQNum()%>" type="radio" value="5"	onclick="hide()"> 매우 그렇다	 </label> 
						</div>
						</div>
				<%
					}
				%>
						<!-- id="radios_${hmq.hmQNum}로 function 사용 -->
					</fieldset>
					<input type="submit" value="설문 완료"><!-- 버튼으로 바꿔!!!!submit말고! onclick줘!!! -->
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
							<div class="form-group">
							<label class="col-md-7 col-xs-4 control-label"	for="radios_<%=dto2.getHmQNum()%>"><%=dto2.getHmQNum()%> . <%=dto2.getHmQEn()%></label>
							<div class="col-md-7 col-xs-4">
							<label class="radio-inline" for="radios-1_<%=dto2.getHmQNum()%>">
							<input name="radios_<%=dto2.getHmQNum()%>" 	id="radios-1_<%=dto2.getHmQNum()%>" type="radio" value="1" onclick="hide()" required> Strongly Disagree </label>
							<label class="radio-inline" for="radios-2_<%=dto2.getHmQNum()%>">
							<input name="radios_<%=dto2.getHmQNum()%>"	id="radios-2_<%=dto2.getHmQNum()%>" type="radio" value="2"	onclick="hide()"> Disagree </label>
							<label class="radio-inline" for="radios-3_<%=dto2.getHmQNum()%>">
							<input name="radios_<%=dto2.getHmQNum()%>"	id="radios-3_<%=dto2.getHmQNum()%>" type="radio" value="3" onclick="hide()"> Neutral </label>
							<label class="radio-inline" for="radios-4_<%=dto2.getHmQNum()%>">
							<input name="radios_<%=dto2.getHmQNum()%>"	id="radios-4_<%=dto2.getHmQNum()%>" type="radio" value="4" onclick="hide()"> Agree </label>
							<label class="radio-inline" for="radios-5_<%=dto2.getHmQNum()%>">
							<input name="radios_<%=dto2.getHmQNum()%>"	id="radios-5_<%=dto2.getHmQNum()%>" type="radio" value="5" onclick="hide()">Strongly Agree</label>
							</div>
							</div>
					<%
						}
					%>
						
					</fieldset>
					<input type="submit" value="Submit"><!-- 버튼으로 바꿔!!!!submit말고! onclick줘!!! -->
					<%
						}
					%>
				 
				<!-- <button type="submit"name = "survey_finish">survey 완료</button> -->
				</form>

			</div>
			<div class="col-sm-1 sidenav">
				
			</div>

		</div>
	</div>

	<jsp:include page="Footer.jsp" flush="true" />

</body>
</html>
