<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.RecQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.RecQEn"%>
<%@ page import="java.util.List"%>
<html>
<head><link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	<%-- 페이제 전체 높이  --%><% int hght=900;%>
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
	height: <%=hght%>px;
	 top: 0;
    left: 0;
    bottom: 0;
    z-index: 1000;
    display: block;

top: 0;

left: 0;

bottom: 0;
}	
form {
	display: inline;
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
div{
padding :0px;}
</style>
<script>
	$(function() {
		$("input:text").keydown(function(evt) {
			if (evt.keyCode == 13)
				return false;
		});
	});
</script>
<title>Survey for Recruiter</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div class="container-fluid text-center" style="margin:0px;">
		<div class="row content">
			<nav class="navbar navbar-fixed-top ">
               <font color="white">Please Select</font>
                  
                  <font color="white">Your <b>Language</b></font><br><br>
               
                  <a class="w3-btn w3-dark-grey" href="MRecQuestion?lang=1"><b>Korean</b></a>
               
            &nbsp;&nbsp;&nbsp;
               
                  <a class="w3-btn w3-dark-grey" href="MRecQuestion?lang=2"><b>English</b></a>
               
            </nav>
            <br><br><br><br><br>
			</div>
			<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 text-left" >
				<form class="form-horizontal" action="recSrvyAct" method="post">
					<%
						if (Integer.parseInt((String) request.getParameter("lang")) == 1) {
					%>
					<fieldset>
						<legend>국문</legend>
						<%
							@SuppressWarnings (value="unchecked")
							List<RecQKr> dtos = (List<RecQKr>) request.getAttribute("recqkr");
							RecQKr dto = null;
							for (int i = 0; i < dtos.size(); i++) {
							dto = dtos.get(i);
							if(i==1){
						%>
								<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                        		<label class="control-label" for="radios_<%=dto.getRecQNum()%>" style="text-align:left;"><%=dto.getRecQNum()%> . <%=dto.getRecQKr()%></label>
                        		</div>
		                        <div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
        	                    <label class="radio-inline" for="radios-1_<%=dto.getRecQNum()%>"><input name="radios_<%=dto.getRecQNum()%>" id="radios-1_<%=dto.getRecQNum()%>" type="radio" value="1" class="txt1" required>매우 아니다</label><br>
        	                    <label class="radio-inline" for="radios-2_<%=dto.getRecQNum()%>"><input name="radios_<%=dto.getRecQNum()%>" id="radios-2_<%=dto.getRecQNum()%>" type="radio" value="2" class="txt1"> 아니다</label><br>
        	                    <label class="radio-inline" for="radios-3_<%=dto.getRecQNum()%>"><input name="radios_<%=dto.getRecQNum()%>" id="radios-3_<%=dto.getRecQNum()%>" type="radio" value="3" class="txt1"> 보통이다</label><br>
        	                    <label class="radio-inline" for="radios-4_<%=dto.getRecQNum()%>"><input name="radios_<%=dto.getRecQNum()%>" id="radios-4_<%=dto.getRecQNum()%>" type="radio" value="4" class="txt1"> 그렇다</label><br>
								<label class="radio-inline" for="radios-5_<%=dto.getRecQNum()%>"><input name="radios_<%=dto.getRecQNum()%>" id="radios-5_<%=dto.getRecQNum()%>" type="radio" value="5" class="txt1"> 매우 그렇다</label>
                           <script>
                              $(".txt1").click(function() {
                                 //check if the selected option is others
                                 if ($(this).val() == "1") {
                                    $("#other-text1").show();
                                 } else {
                                    $("#other-text1").hide();
                                 }
                              });
                           </script>
                           <input type="text" style="width: 300px;"id="other-text1" name="data1" placeholder="이유를 간단히 작성해주세요." />
                        </div>
                    
                     <%
							}else if(i==9){
                     %>
                     			<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                        		<label class="control-label" for="checks_<%=dto.getRecQNum()%>" style="text-align:left;"> <%=dto.getRecQNum()%> . <%=dto.getRecQKr()%></label>
                        		</div>
                        		<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                        		<label class="checkbox-inline" for="checks-1_<%=dto.getRecQNum()%>">
                        			<input name="checks_<%=dto.getRecQNum()%>" id="checks-1_<%=dto.getRecQNum()%>" type="checkbox" value="1" class="txt2"/> GOM </label><br>
                        			<label class="checkbox-inline" for="checks-2_<%=dto.getRecQNum()%>">
                        			<input name="checks_<%=dto.getRecQNum()%>" id="checks-2_<%=dto.getRecQNum()%>" type="checkbox" value="2" class="txt2" /> 직원추천 </label><br>
									<label class="checkbox-inline" for="checks-3_<%=dto.getRecQNum()%>">
                              		<input name="checks_<%=dto.getRecQNum()%>" id="checks-3_<%=dto.getRecQNum()%>" type="checkbox" value="3" class="txt2" /> 링크드인 </label><br>
									<label class="checkbox-inline" for="checks-4_<%=dto.getRecQNum()%>">
                              		<input name="checks_<%=dto.getRecQNum()%>" id="checks-4_<%=dto.getRecQNum()%>" type="checkbox" value="4" class="txt2" /> Agency </label><br>
                              		<label class="checkbox-inline" for="checks-5_<%=dto.getRecQNum()%>">
                              		<input name="checks_<%=dto.getRecQNum()%>" id="checks-5_<%=dto.getRecQNum()%>" type="checkbox" value="5" class="txt2" /> 유료잡보드 </label><br>
                              		<label class="checkbox-inline" for="checks-6_<%=dto.getRecQNum()%>">
                              		<input name="checks_<%=dto.getRecQNum()%>" id="checks-6_<%=dto.getRecQNum()%>" type="checkbox" value="6" class="txt2" /> Univ.잡보드 </label><br>
									<label class="checkbox-inline" for="checks-7_<%=dto.getRecQNum()%>">
                              		<input name="checks_<%=dto.getRecQNum()%>" id="checks-7_<%=dto.getRecQNum()%>" type="checkbox" value="7" class="txt2" /> 기타 </label>
                           <script>
                              $(".txt2").change(function() {
                                 //check if the selected option is others
                                 if (this.value == "7") {
                                    //toggle textbox visibility
                                    $("#other-text2").toggle();
                                 }
                              });
                           </script>
                           <input type="text" id="other-text2" name="data2" placeholder="기타항목을 간단히 작성해주세요." style="width: 300px;"/>
                           <input type="text" style="display: none;" /> <input type="text" style="display: none;" />
                        			</div>
                     				
                     <%
							}else if(i==10){
                     %>
                     			<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                        		<label class="control-label" for="checks_<%=dto.getRecQNum()%>" style="text-align:left;"> <%=dto.getRecQNum()%> . <%=dto.getRecQKr()%></label>
                        		</div>
                        		<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                           		<input type="text" id="checks-1_<%=dto.getRecQNum()%>" name="data3" value="" style="height: 30px; width: 300px;" placeholder="직접 작성해주세요." />
                        		</div>
                     			
                     <%
							}else if(i==11){
                     %>
                     			<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 " >
		                        <label class="control-label" for="checks_<%=dto.getRecQNum()%>" style="text-align:left;"> <%=dto.getRecQNum()%> . <%=dto.getRecQKr()%></label>
                        		</div>
                        		<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                           		 <input type="text"  id="checks-1_<%=dto.getRecQNum()%>" name="data4" value="" style="height: 30px; width: 300px;" placeholder="직접 작성해주세요." />
		                        </div>
                     			
                     <%
							}else{
                     %>
							<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 " >
							<label class="control-label"	for="radios_<%=dto.getRecQNum()%>" style="text-align:left;"><%=dto.getRecQNum()%> . <%=dto.getRecQKr()%></label>
							</div>
							<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
							<label class="radio-inline" for="radios-1_<%=dto.getRecQNum()%>">
							<input name="radios_<%=dto.getRecQNum()%>" 	id="radios-1_<%=dto.getRecQNum()%>" type="radio" value="1"	onclick="hide()" required> 매우 아니다	</label><br>
							<label class="radio-inline" for="radios-2_<%=dto.getRecQNum()%>">
							<input name="radios_<%=dto.getRecQNum()%>"		id="radios-2_<%=dto.getRecQNum()%>" type="radio" value="2"	onclick="hide()"> 아니다 </label><br>
							<label class="radio-inline" for="radios-3_<%=dto.getRecQNum()%>">
							<input name="radios_<%=dto.getRecQNum()%>"		id="radios-3_<%=dto.getRecQNum()%>" type="radio" value="3"	onclick="hide()"> 보통이다 </label><br>
							<label class="radio-inline" for="radios-4_<%=dto.getRecQNum()%>">
							<input name="radios_<%=dto.getRecQNum()%>"		id="radios-4_<%=dto.getRecQNum()%>" type="radio" value="4"	onclick="hide()"> 그렇다 </label><br>
							<label class="radio-inline" for="radios-5_<%=dto.getRecQNum()%>">
							<input name="radios_<%=dto.getRecQNum()%>"		id="radios-5_<%=dto.getRecQNum()%>" type="radio" value="5"	onclick="hide()"> 매우 그렇다	 </label> 
							</div>
							
					<%
						}
							}
					%>
					<button class="btn btn-primary btn-lg" onclick="submit"><b>설문제출</b></button>
					</fieldset>
					
					<%
						} else {
					%>
					<fieldset>
						<legend>English</legend>
						<!-- Multiple Radios (inline) -->
						<%
							List<RecQEn> dtos2 = (List<RecQEn>) request.getAttribute("recqen");
							RecQEn dto2 = null;
							for (int i = 0; i < dtos2.size(); i++) {
								dto2 = dtos2.get(i);
								if(i==1){
						%>
									<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                        			<label class="control-label" for="radios_<%=dto2.getRecQNum()%>" style="text-align:left;"><%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
                        			</div>
                        			<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                           			<label class="radio-inline" for="radios-1_<%=dto2.getRecQNum()%>">
                              		<input name="radios_<%=dto2.getRecQNum()%>" id="radios-1_<%=dto2.getRecQNum()%>" type="radio" value="1" class="txt3" required> Strongly Disagree</label><br>
                              		<label class="radio-inline" for="radios-2_<%=dto2.getRecQNum()%>">
                              		<input name="radios_<%=dto2.getRecQNum()%>" id="radios-2_<%=dto2.getRecQNum()%>" type="radio" value="2" class="txt3"> Disagree </label><br>
									<label class="radio-inline" for="radios-3_<%=dto2.getRecQNum()%>">
                              		<input name="radios_<%=dto2.getRecQNum()%>"  id="radios-3_<%=dto2.getRecQNum()%>" type="radio" value="3" class="txt3"> Neutral </label><br>
                              		<label class="radio-inline" for="radios-4_<%=dto2.getRecQNum()%>">
		                            <input name="radios_<%=dto2.getRecQNum()%>"  id="radios-4_<%=dto2.getRecQNum()%>" type="radio" value="4" class="txt3"> Agree </label><br>
		                            <label class="radio-inline" for="radios-5_<%=dto2.getRecQNum()%>">
                              		<input name="radios_<%=dto2.getRecQNum()%>"  id="radios-5_<%=dto2.getRecQNum()%>" type="radio" value="5" class="txt3"> Strongly Agree </label>
                           <script>
                              $(".txt3").click(function() {
                                 //check if the selected option is others
                                 if ($(this).val() == "1") {
                                    $("#other-text3").show();
                                 } else {
                                    $("#other-text3").hide();
                                 }
                              });
                           </script>
                           			<input type="text" id="other-text3" name="data1" placeholder="Please write down the reason." style="width:300px;"/>
                        			</div>
                     				
                     <%
								}else if(i==9){
                     %>				
									<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                        			<label class="control-label" for="checks_<%=dto2.getRecQNum()%>" style="text-align:left;"> <%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
                        			</div>
                        			<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                           			<label class="checkbox-inline" for="checks-1_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-1_<%=dto2.getRecQNum()%>" type="checkbox" value="1" class="txt4" required/> GOM </label><br>
                              		<label class="checkbox-inline" for="checks-2_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-2_<%=dto2.getRecQNum()%>" type="checkbox" value="2" class="txt4" /> Recommendation </label><br>
									<label class="checkbox-inline" for="checks-3_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-3_<%=dto2.getRecQNum()%>" type="checkbox" value="3" class="txt4" /> LinkedIn </label><br>
                              		<label class="checkbox-inline" for="checks-4_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-4_<%=dto2.getRecQNum()%>" type="checkbox" value="4" class="txt4" /> Agency </label><br>
                              		<label class="checkbox-inline" for="checks-5_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-5_<%=dto2.getRecQNum()%>" type="checkbox" value="5" class="txt4" /> Paid Job Board </label><br>
                              		<label class="checkbox-inline" for="checks-6_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-6_<%=dto2.getRecQNum()%>" type="checkbox" value="6" class="txt4" /> Univ. Job Board </label><br>
                              		<label class="checkbox-inline" for="checks-7_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-7_<%=dto2.getRecQNum()%>" type="checkbox" value="7" class="txt4" /> ETC </label>
                           <script>
                              $(".txt4").change(function() {
                                 //check if the selected option is others
                                 if (this.value == "7") {
                                    //toggle textbox visibility
                                    $("#other-text4").toggle();
                                 }
                              });
                           </script>
                           <input type="text" id="other-text4" name="data2" placeholder="Please write down the other items." style="width:300px;" />
                           <input type="text"  style="display: none;" /> <input type="text"  style="display: none;" />
                     
	                  		</div>
                     <%
								}else if(i==10){
                     %>
									<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                        			<label class=" control-label" for="checks_<%=dto2.getRecQNum()%>" style="text-align:left;"> <%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
                        			</div>
                        			<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                           			
                           			<input name="checks_<%=dto2.getRecQNum()%>" name="data3" id="checks-1_<%=dto2.getRecQNum()%>" type="text" value="" style="height: 30px; width: 300px;" placeholder="Please write down." />
                        			</div>
                     				
                     <%
								}else if(i==11){
                     %>
									<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 " >
                        			<label class="control-label" for="checks_<%=dto2.getRecQNum()%>" style="text-align:left;"> <%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
                        			</div>
                        			<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
                           			<input name="checks_<%=dto2.getRecQNum()%>" name="data4" id="checks-1_<%=dto2.getRecQNum()%>" type="text" value=""
                             				 style="height: 30px; width: 300px;"placeholder="Please write down." style="width:300px;" />
                        			</div>
                     				
                     <%
								}else{
                     %>
							<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
							<label class="control-label"	for="radios_<%=dto2.getRecQNum()%>" style="text-align:left;"><%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
							</div>
							<div class="form-group col-sm-12 col-xs-12 col-md-12 col-lg-12 ">
							<label class="radio-inline" for="radios-1_<%=dto2.getRecQNum()%>">
							<input name="radios_<%=dto2.getRecQNum()%>" 	id="radios-1_<%=dto2.getRecQNum()%>" type="radio" value="1"	onclick="hide()" required> Strongly Disagree	</label><br>
							<label class="radio-inline" for="radios-2_<%=dto2.getRecQNum()%>">
							<input name="radios_<%=dto2.getRecQNum()%>"		id="radios-2_<%=dto2.getRecQNum()%>" type="radio" value="2"	onclick="hide()"> Disagree </label><br>
							<label class="radio-inline" for="radios-3_<%=dto2.getRecQNum()%>">
							<input name="radios_<%=dto2.getRecQNum()%>"		id="radios-3_<%=dto2.getRecQNum()%>" type="radio" value="3"	onclick="hide()"> Neutral </label><br>
							<label class="radio-inline" for="radios-4_<%=dto2.getRecQNum()%>">
							<input name="radios_<%=dto2.getRecQNum()%>"		id="radios-4_<%=dto2.getRecQNum()%>" type="radio" value="4"	onclick="hide()"> Agree </label><br>
							<label class="radio-inline" for="radios-5_<%=dto2.getRecQNum()%>">
							<input name="radios_<%=dto2.getRecQNum()%>"		id="radios-5_<%=dto2.getRecQNum()%>" type="radio" value="5"	onclick="hide()"> Strongly Agree	 </label> 
							</div>
							
					<%
						}
							}
					%>
						
					</fieldset>
					<button class="w3-btn w3-dark-grey" onclick="submit"><b>Submit</b></button><br>
					<%
						}
					%>
					
				</form>

			</div>
			

		</div>
	

	<jsp:include page="Footer.jsp" flush="true" />

</body>
</html>
