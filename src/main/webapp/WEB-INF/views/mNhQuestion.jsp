<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhQEn"%>
<%@ page import="java.util.List"%>
<html>
<head><link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
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
<title>Survey for New Hire</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>


<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-0 col-xs-0 col-md-2 col-lg-2">
				<nav class="navbar navbar-fixed-top ">
               <font color="white">Please Select</font>
                  
                  <font color="white">Your <b>Language</b></font><br><br>
               
                  <a class="w3-btn w3-dark-grey" href="MNhQuestion?lang=1"><b>Korean</b></a>
               
            &nbsp;&nbsp;&nbsp;
               
                  <a class="w3-btn w3-dark-grey" href="MNhQuestion?lang=2"><b>English</b></a>
               
            </nav>
            <br><br><br><br><br>
			</div>
			<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 text-left" style="height:auto;">
				<form class="form-horizontal" action="nhSrvyAct" method="post">
				<%
					if (Integer.parseInt((String) request.getParameter("lang")) == 1) {
				%>
				<fieldset>
					<legend>국문</legend>
					<%
						@SuppressWarnings (value="unchecked")
						List<NhQKr> dtos = (List<NhQKr>) request.getAttribute("nhqkr");
						NhQKr dto = null;
						for (int i = 0; i < dtos.size(); i++) {
							dto = dtos.get(i);
							if(i==8){
					%>
								<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
								<label class="control-label" for="radios_<%=dto.getNhQNum()%>" style="text-align:left;"><%=dto.getNhQNum()%> . <%=dto.getNhQKr()%></label>
								</div>
								<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
									<label class="radio-inline" for="radios-1_<%=dto.getNhQNum()%>"><input name="radios_<%=dto.getNhQNum()%>" id="radios-1_<%=dto.getNhQNum()%>" type="radio" value="1" class="multi2" required>	매우 아니다</label><br>
									<label class="radio-inline" for="radios-2_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-2_<%=dto.getNhQNum()%>" type="radio" value="2" class="multi2"> 아니다</label><br>
									<label class="radio-inline" for="radios-3_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-3_<%=dto.getNhQNum()%>" type="radio" value="3" class="multi2"> 보통이다</label><br>
									<label class="radio-inline" for="radios-4_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-4_<%=dto.getNhQNum()%>" type="radio" value="4" class="multi2"> 그렇다</label><br>
									<label class="radio-inline" for="radios-5_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-5_<%=dto.getNhQNum()%>" type="radio" value="5" class="multi2"> 매우 그렇다</label>
									<script>
										$(".multi2").click(function() {
											//check if the selected option is others
											if ($(this).val() == "1") {
												$("#other-text1").show();
											} else {
												$("#other-text1").hide();
											}
										});
									</script>
									<input type="text" id="other-text1" name="data1" placeholder="이유를 간단히 작성해주세요." style="width:300px;"/>
								
								</div>
					<%
							}else if(i==9){
					%>
								<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
								<label class="control-label" for="radios_<%=dto.getNhQNum()%>" style="text-align:left;"><%=dto.getNhQNum()%> . <%=dto.getNhQKr()%></label>
								</div>
								<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
									<label class="radio-inline" for="radios-1_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-1_<%=dto.getNhQNum()%>" type="radio" value="1" class="multi3" required>	매우 아니다</label><br>
									<label class="radio-inline" for="radios-2_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-2_<%=dto.getNhQNum()%>"type="radio" value="2" class="multi3"> 아니다</label><br>
									<label class="radio-inline" for="radios-3_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-3_<%=dto.getNhQNum()%>"type="radio" value="3" class="multi3"> 보통이다	</label><br>
									<label class="radio-inline" for="radios-4_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-4_<%=dto.getNhQNum()%>"type="radio" value="4" class="multi3"> 그렇다</label><br>
									<label class="radio-inline" for="radios-5_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-5_<%=dto.getNhQNum()%>"type="radio" value="5" class="multi3"> 매우 그렇다</label>
									<script>
										$(".multi3").click(function() {
											//check if the selected option is others
											if ($(this).val() == "1" || $(this).val() == "2") {
												$("#other-text2").show();
											} else {
												$("#other-text2").hide();
											}
										});
									</script>
									<input type="text" id="other-text2" name="data2" placeholder="이유를 간단히 작성해주세요." style="width:300px;"/>
								</div>
								
					<%
					}else{
					%>	
							<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 " >
							<label class="control-label"	for="radios_<%=dto.getNhQNum()%>" style="text-align:left;"><%=dto.getNhQNum()%> . <%=dto.getNhQKr()%></label>
							</div>
							<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
							<label class="radio-inline" for="radios-1_<%=dto.getNhQNum()%>">
							<input name="radios_<%=dto.getNhQNum()%>" 	id="radios-1_<%=dto.getNhQNum()%>" type="radio" value="1"	onclick="hide()" required> 매우 아니다	</label><br>
							<label class="radio-inline" for="radios-2_<%=dto.getNhQNum()%>">
							<input name="radios_<%=dto.getNhQNum()%>"		id="radios-2_<%=dto.getNhQNum()%>" type="radio" value="2"	onclick="hide()"> 아니다 </label><br>
							<label class="radio-inline" for="radios-3_<%=dto.getNhQNum()%>">
							<input name="radios_<%=dto.getNhQNum()%>"		id="radios-3_<%=dto.getNhQNum()%>" type="radio" value="3"	onclick="hide()"> 보통이다 </label><br>
							<label class="radio-inline" for="radios-4_<%=dto.getNhQNum()%>">
							<input name="radios_<%=dto.getNhQNum()%>"		id="radios-4_<%=dto.getNhQNum()%>" type="radio" value="4"	onclick="hide()"> 그렇다 </label><br>
							<label class="radio-inline" for="radios-5_<%=dto.getNhQNum()%>">
							<input name="radios_<%=dto.getNhQNum()%>"		id="radios-5_<%=dto.getNhQNum()%>" type="radio" value="5"	onclick="hide()"> 매우 그렇다	 </label> 
							</div>
							
					<%
					}
						}
					%>
					</fieldset>
					<button class="btn btn-primary btn-lg" onclick="submit"><b>설문제출</b></button>
					<%
						} else {
					%>
					<fieldset>
						<legend>English</legend>
						<%
							List<NhQEn> dtos2 = (List<NhQEn>) request.getAttribute("nhqen");
							NhQEn dto2 = null;
							for (int i = 0; i < dtos2.size(); i++) {
								dto2 = dtos2.get(i);
								if(i==8){
						%>
									<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 " >
									<label class="control-label" for="radios_<%=dto2.getNhQNum()%>" style="text-align:left;"><%=dto2.getNhQNum()%> . <%=dto2.getNhQEn()%></label>
									</div>
									<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
									<label class="radio-inline" for="radios-1_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-1_<%=dto2.getNhQNum()%>" type="radio" value="1" class="multi4" required>	Strongly Disagree</label><br>
									<label class="radio-inline" for="radios-2_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-2_<%=dto2.getNhQNum()%>"type="radio" value="2" class="multi4"> Disagree	</label><br>
									<label class="radio-inline" for="radios-3_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-3_<%=dto2.getNhQNum()%>"type="radio" value="3" class="multi4"> Neutral</label><br>
									<label class="radio-inline" for="radios-4_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-4_<%=dto2.getNhQNum()%>"type="radio" value="4" class="multi4"> Agree	</label><br>
									<label class="radio-inline" for="radios-5_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-5_<%=dto2.getNhQNum()%>"type="radio" value="5" class="multi4"> Strongly Agree</label>
									<script>
										$(".multi4").click(function() {
											//check if the selected option is others
											if ($(this).val() == "1") {
												$("#other-text1").show();
											} else {
												$("#other-text1").hide();
											}
										});
									</script>
									<input type="text" id="other-text1" name="data1" placeholder="Please write down the reason simply" style="width:300px;" />
								</div>
								
						<%
							}else if(i==9){
						%>
								<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
								<label class="control-label" for="radios_<%=dto2.getNhQNum()%>" style="text-align:left;">	<%=dto2.getNhQNum()%> . <%=dto2.getNhQEn()%></label>
								</div>
								<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
								<label class="radio-inline" for="radios-1_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-1_<%=dto2.getNhQNum()%>"type="radio" value="1" class="multi5" required>Strongly Disagree	</label><br>
								<label class="radio-inline" for="radios-2_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-2_<%=dto2.getNhQNum()%>"type="radio" value="2" class="multi5"> Disagree	</label><br>
								<label class="radio-inline" for="radios-3_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-3_<%=dto2.getNhQNum()%>"type="radio" value="3" class="multi5"> Neutral </label><br>
								<label class="radio-inline" for="radios-4_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-4_<%=dto2.getNhQNum()%>"type="radio" value="4" class="multi5"> Agree	</label><br>
								<label class="radio-inline" for="radios-5_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-5_<%=dto2.getNhQNum()%>"type="radio" value="5" class="multi5"> Strongly Agree</label>
								<script>
									$(".multi5").click(function() {
									//check if the selected option is others
									if ($(this).val() == "1" || $(this).val() == "2") {
										$("#other-text2").show();
									} else {
										$("#other-text2").hide();
									}
									});
								</script>
								<input type="text" id="other-text2" name="data2" placeholder="Please write down the reason simply" style="width:300px;" />
								</div>
								
						<%
							}else{
						%>
								<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 " >
								<label class="control-label"	for="radios_<%=dto2.getNhQNum()%>" style="text-align:left;"><%=dto2.getNhQNum()%> . <%=dto2.getNhQEn()%></label>
								</div>
								<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
								<label class="radio-inline" for="radios-1_<%=dto2.getNhQNum()%>">
								<input name="radios_<%=dto2.getNhQNum()%>" 	id="radios-1_<%=dto2.getNhQNum()%>" type="radio" value="1"	onclick="hide()" required> Strongly Disagree	</label><br>
								<label class="radio-inline" for="radios-2_<%=dto2.getNhQNum()%>">
								<input name="radios_<%=dto2.getNhQNum()%>"	id="radios-2_<%=dto2.getNhQNum()%>" type="radio" value="2"	onclick="hide()"> Disagree </label><br>
								<label class="radio-inline" for="radios-3_<%=dto2.getNhQNum()%>">
								<input name="radios_<%=dto2.getNhQNum()%>"	id="radios-3_<%=dto2.getNhQNum()%>" type="radio" value="3"	onclick="hide()"> Neutral </label><br>
								<label class="radio-inline" for="radios-4_<%=dto2.getNhQNum()%>">
								<input name="radios_<%=dto2.getNhQNum()%>"	id="radios-4_<%=dto2.getNhQNum()%>" type="radio" value="4"	onclick="hide()"> Agree </label><br>
								<label class="radio-inline" for="radios-5_<%=dto2.getNhQNum()%>">
								<input name="radios_<%=dto2.getNhQNum()%>"	id="radios-5_<%=dto2.getNhQNum()%>" type="radio" value="5"	onclick="hide()"> Strongly Agree </label> 
								</div>
								
						<%
						}
						}
						%>
					</fieldset>
					<button class="w3-btn w3-dark-grey" onclick="submit"><b>Submit</b></button>
					<%
						}
					%>
				</form>
			</div>
			
		</div>
	</div>

	<jsp:include page="Footer.jsp" flush="true" />

</body>
</html>
