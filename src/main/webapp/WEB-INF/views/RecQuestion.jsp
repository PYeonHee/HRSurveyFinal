<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.RecQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.RecQEn"%>
<%@ page import="java.util.List"%>
<html>
<head></head>
<title></title>

<body>
	<jsp:include page="Header.jsp" flush="true" />

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-1 sidenav">
				<form id="krrec" name="krrec" action="RecQuestionKr" method="post">
					<p>
						<font color="white">Please select your language.</font>
					</p>
					<div class="well">
						<p onclick="document.krrec.submit()">국문</p>
					</div>
				</form>
				<form id="enrec" name="enrec" action="RecQuestionEn" method="post">
					<div class="well">
						<p onclick="document.enrec.submit()">English</p>
					</div>
				</form>
			</div>
			<div class="col-sm-10 text-left">
				<form class="form-horizontal" action="recSrvyAct" method="post">
					<%
						if (Integer.parseInt((String) request.getAttribute("lang")) == 1) {
					%>
					<fieldset>
						<legend>국문</legend>
						<%
							List<RecQKr> dtos = (List<RecQKr>) request.getAttribute("recqkr");
							RecQKr dto = null;
							for (int i = 0; i < dtos.size(); i++) {
							dto = dtos.get(i);
							if(i==1){
						%>
								<div class="form-group text-left">
                        		<label class="col-md-6 control-label" for="radios_<%=dto.getRecQNum()%>"><%=dto.getRecQNum()%> . <%=dto.getRecQKr()%></label>
		                        <div class="col-md-6">
        	                    <label class="radio-inline" for="radios-1_<%=dto.getRecQNum()%>"><input name="radios_<%=dto.getRecQNum()%>" id="radios-1_<%=dto.getRecQNum()%>" type="radio" value="1" class="txt1" required>매우 아니다</label>
        	                    <label class="radio-inline" for="radios-2_<%=dto.getRecQNum()%>"><input name="radios_<%=dto.getRecQNum()%>" id="radios-2_<%=dto.getRecQNum()%>" type="radio" value="2" class="txt1"> 아니다</label>
        	                    <label class="radio-inline" for="radios-3_<%=dto.getRecQNum()%>"><input name="radios_<%=dto.getRecQNum()%>" id="radios-3_<%=dto.getRecQNum()%>" type="radio" value="3" class="txt1"> 보통이다</label>
        	                    <label class="radio-inline" for="radios-4_<%=dto.getRecQNum()%>"><input name="radios_<%=dto.getRecQNum()%>" id="radios-4_<%=dto.getRecQNum()%>" type="radio" value="4" class="txt1"> 그렇다</label>
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
                           <input type="text" id="other-text1" name="data1" placeholder="이유를 간단히 작성해주세요." />
                        </div>
                     </div>
                     <%
							}else if(i==9){
                     %>
                     			<div class="form-group text-left">
                        		<label class="col-md-6 control-label" for="checks_<%=dto.getRecQNum()%>"> <%=dto.getRecQNum()%> . <%=dto.getRecQKr()%></label>
                        		<div class="col-md-6">
                        		<label class="checkbox-inline" for="checks-1_<%=dto.getRecQNum()%>">
                        			<input name="checks_<%=dto.getRecQNum()%>" id="checks-1_<%=dto.getRecQNum()%>" type="checkbox" value="1" class="txt2"/> GOM </label>
                        			<label class="checkbox-inline" for="checks-2_<%=dto.getRecQNum()%>">
                        			<input name="checks_<%=dto.getRecQNum()%>" id="checks-2_<%=dto.getRecQNum()%>" type="checkbox" value="2" class="txt2" /> 직원추천 </label>
									<label class="checkbox-inline" for="checks-3_<%=dto.getRecQNum()%>">
                              		<input name="checks_<%=dto.getRecQNum()%>" id="checks-3_<%=dto.getRecQNum()%>" type="checkbox" value="3" class="txt2" /> 링크드인 </label>
									<label class="checkbox-inline" for="checks-4_<%=dto.getRecQNum()%>">
                              		<input name="checks_<%=dto.getRecQNum()%>" id="checks-4_<%=dto.getRecQNum()%>" type="checkbox" value="4" class="txt2" /> Agency </label>
                              		<label class="checkbox-inline" for="checks-5_<%=dto.getRecQNum()%>">
                              		<input name="checks_<%=dto.getRecQNum()%>" id="checks-5_<%=dto.getRecQNum()%>" type="checkbox" value="5" class="txt2" /> 유료잡보드 </label>
                              		<label class="checkbox-inline" for="checks-6_<%=dto.getRecQNum()%>">
                              		<input name="checks_<%=dto.getRecQNum()%>" id="checks-6_<%=dto.getRecQNum()%>" type="checkbox" value="6" class="txt2" /> Univ.잡보드 </label>
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
                           <input type="text" id="other-text2" name="data2" placeholder="기타항목을 간단히 작성해주세요." />
                           <input type="text" style="display: none;" /> <input type="text" style="display: none;" />
                        			</div>
                     				</div>
                     <%
							}else if(i==10){
                     %>
                     			<div class="form-group text-left">
                        		<label class="col-md-6 control-label" for="checks_<%=dto.getRecQNum()%>"> <%=dto.getRecQNum()%> . <%=dto.getRecQKr()%></label>
                        		<div class="col-md-6">
                           		<br> <input type="text" id="checks-1_<%=dto.getRecQNum()%>" name="data3" value="" style="height: 30px; width: 588px;" placeholder="직접 작성해주세요." />
                        		</div>
                     			</div>
                     <%
							}else if(i==11){
                     %>
                     			<div class="form-group text-left">
		                        <label class="col-md-6 control-label" for="checks_<%=dto.getRecQNum()%>"> <%=dto.getRecQNum()%> . <%=dto.getRecQKr()%></label>
                        		<div class="col-md-6">
                           		<br> <input type="text"  id="checks-1_<%=dto.getRecQNum()%>" name="data4" value="" style="height: 30px; width: 588px;" placeholder="직접 작성해주세요." />
		                        </div>
                     			</div>
                     <%
							}else{
                     %>
							<div class="form-group">
							<label class="col-md-7 col-xs-4 control-label"	for="radios_<%=dto.getRecQNum()%>"><%=dto.getRecQNum()%> . <%=dto.getRecQKr()%></label>
							<div class="col-md-7 col-xs-4">
							<label class="radio-inline" for="radios-1_<%=dto.getRecQNum()%>">
							<input name="radios_<%=dto.getRecQNum()%>" 	id="radios-1_<%=dto.getRecQNum()%>" type="radio" value="1"	onclick="hide()" required> 매우 아니다	</label>
							<label class="radio-inline" for="radios-2_<%=dto.getRecQNum()%>">
							<input name="radios_<%=dto.getRecQNum()%>"		id="radios-2_<%=dto.getRecQNum()%>" type="radio" value="2"	onclick="hide()"> 아니다 </label>
							<label class="radio-inline" for="radios-3_<%=dto.getRecQNum()%>">
							<input name="radios_<%=dto.getRecQNum()%>"		id="radios-3_<%=dto.getRecQNum()%>" type="radio" value="3"	onclick="hide()"> 보통이다 </label>
							<label class="radio-inline" for="radios-4_<%=dto.getRecQNum()%>">
							<input name="radios_<%=dto.getRecQNum()%>"		id="radios-4_<%=dto.getRecQNum()%>" type="radio" value="4"	onclick="hide()"> 그렇다 </label>
							<label class="radio-inline" for="radios-5_<%=dto.getRecQNum()%>">
							<input name="radios_<%=dto.getRecQNum()%>"		id="radios-5_<%=dto.getRecQNum()%>" type="radio" value="5"	onclick="hide()"> 매우 그렇다	 </label> 
							</div>
							</div>
					<%
						}
							}
					%>
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
									<div class="form-group text-left">
                        			<label class="col-md-6 control-label" for="radios_<%=dto2.getRecQNum()%>"><%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
                        			<div class="col-md-6">
                           			<label class="radio-inline" for="radios-1_<%=dto2.getRecQNum()%>">
                              		<input name="radios_<%=dto2.getRecQNum()%>" id="radios-1_<%=dto2.getRecQNum()%>" type="radio" value="1" class="txt3" required> Strongly Disagree</label>
                              		<label class="radio-inline" for="radios-2_<%=dto2.getRecQNum()%>">
                              		<input name="radios_<%=dto2.getRecQNum()%>" id="radios-2_<%=dto2.getRecQNum()%>" type="radio" value="2" class="txt3"> Disagree </label>
									<label class="radio-inline" for="radios-3_<%=dto2.getRecQNum()%>">
                              		<input name="radios_<%=dto2.getRecQNum()%>"  id="radios-3_<%=dto2.getRecQNum()%>" type="radio" value="3" class="txt3"> Neutral </label>
                              		<label class="radio-inline" for="radios-4_<%=dto2.getRecQNum()%>">
		                            <input name="radios_<%=dto2.getRecQNum()%>"  id="radios-4_<%=dto2.getRecQNum()%>" type="radio" value="4" class="txt3"> Agree </label>
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
                           			<input type="text" id="other-text3" name="data1" placeholder="Please write down the reason." />
                        			</div>
                     				</div>
                     <%
								}else if(i==9){
                     %>
									<div class="form-group text-left">
                        			<label class="col-md-6 control-label" for="checks_<%=dto2.getRecQNum()%>"> <%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
                        			<div class="col-md-6">
                           			<label class="checkbox-inline" for="checks-1_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-1_<%=dto2.getRecQNum()%>" type="checkbox" value="1" class="txt4" required/> GOM </label>
                              		<label class="checkbox-inline" for="checks-2_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-2_<%=dto2.getRecQNum()%>" type="checkbox" value="2" class="txt4" /> Recommendation </label>
									<label class="checkbox-inline" for="checks-3_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-3_<%=dto2.getRecQNum()%>" type="checkbox" value="3" class="txt4" /> LinkedIn </label>
                              		<label class="checkbox-inline" for="checks-4_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-4_<%=dto2.getRecQNum()%>" type="checkbox" value="4" class="txt4" /> Agency </label>
                              		<label class="checkbox-inline" for="checks-5_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-5_<%=dto2.getRecQNum()%>" type="checkbox" value="5" class="txt4" /> Paid Job Board </label>
                              		<label class="checkbox-inline" for="checks-6_<%=dto2.getRecQNum()%>">
                              		<input name="checks_<%=dto2.getRecQNum()%>" id="checks-6_<%=dto2.getRecQNum()%>" type="checkbox" value="6" class="txt4" /> Univ. Job Board </label>
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
                           <input type="text" id="other-text4" name="data2" placeholder="Please write down the other items." />
                           <input type="text"  style="display: none;" /> <input type="text"  style="display: none;" />
                           </div>
	                  		</div>
                     <%
								}else if(i==10){
                     %>
									<div class="form-group text-left">
                        			<label class="col-md-6 control-label" for="checks_<%=dto2.getRecQNum()%>"> <%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
                        			<div class="col-md-6">
                           			<br>
                           			<input name="checks_<%=dto2.getRecQNum()%>" name="data3" id="checks-1_<%=dto2.getRecQNum()%>" type="text" value="" style="height: 30px; width: 500px;" placeholder="Please write down." />
                        			</div>
                     				</div>
                     <%
								}else if(i==11){
                     %>
									<div class="form-group text-left">
                        			<label class="col-md-6 control-label" for="checks_<%=dto2.getRecQNum()%>"> <%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
                        			<div class="col-md-6">
                           			<br> <input name="checks_<%=dto2.getRecQNum()%>" name="data4" id="checks-1_<%=dto2.getRecQNum()%>" type="text" value=""
                             				 style="height: 30px; width: 500px;"placeholder="Please write down." />
                        			</div>
                     				</div>
                     <%
								}else{
                     %>
							<div class="form-group">
							<label class="col-md-7 col-xs-4 control-label"	for="radios_<%=dto2.getRecQNum()%>"><%=dto2.getRecQNum()%> . <%=dto2.getRecQEn()%></label>
							<div class="col-md-7 col-xs-4">
							<label class="radio-inline" for="radios-1_<%=dto2.getRecQNum()%>">
							<input name="radios_<%=dto2.getRecQNum()%>" 	id="radios-1_<%=dto2.getRecQNum()%>" type="radio" value="1"	onclick="hide()" required> Strongly Disagree	</label>
							<label class="radio-inline" for="radios-2_<%=dto2.getRecQNum()%>">
							<input name="radios_<%=dto2.getRecQNum()%>"		id="radios-2_<%=dto2.getRecQNum()%>" type="radio" value="2"	onclick="hide()"> Disagree </label>
							<label class="radio-inline" for="radios-3_<%=dto2.getRecQNum()%>">
							<input name="radios_<%=dto2.getRecQNum()%>"		id="radios-3_<%=dto2.getRecQNum()%>" type="radio" value="3"	onclick="hide()"> Neutral </label>
							<label class="radio-inline" for="radios-4_<%=dto2.getRecQNum()%>">
							<input name="radios_<%=dto2.getRecQNum()%>"		id="radios-4_<%=dto2.getRecQNum()%>" type="radio" value="4"	onclick="hide()"> Agree </label>
							<label class="radio-inline" for="radios-5_<%=dto2.getRecQNum()%>">
							<input name="radios_<%=dto2.getRecQNum()%>"		id="radios-5_<%=dto2.getRecQNum()%>" type="radio" value="5"	onclick="hide()"> Strongly Agree	 </label> 
							</div>
							</div>
					<%
						}
							}
					%>
						
					</fieldset>
					<%
						}
					%>
					<input type="submit" value="survey 완료">
				</form>

			</div>
			<div class="col-sm-1 sidenav"></div>

		</div>
	</div>

	<jsp:include page="Footer.jsp" flush="true" />

</body>
</html>
