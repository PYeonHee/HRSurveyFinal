<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhQEn"%>
<%@ page import="java.util.List"%>
<html>
<head></head>
<title></title>

<body>
	<jsp:include page="Header.jsp" flush="true" />
	
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-1 sidenav">
				<form id="krnh" name="krnh" action="NhQuestionKr" method="post">
					<font color="white"><p>Please</p><p>Select</p><p>Your language</p></font>
					<div class="well">
						<p onclick="document.krnh.submit()">국문</p>
					</div>
				</form>
				<form id="ennh" name="ennh" action="NhQuestionEn" method="post">
					<div class="well">
						<p onclick="document.ennh.submit()">English</p>
					</div>
				</form>
			</div>
			<div class="col-sm-10 text-left" >
				<form class="form-horizontal" action="nhSrvyAct" method="post">
				<%
					if (Integer.parseInt((String) request.getAttribute("lang")) == 1) {
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
								<div class="form-group text-left">
								<label class="col-md-6 control-label" for="radios_<%=dto.getNhQNum()%>"><%=dto.getNhQNum()%> . <%=dto.getNhQKr()%></label>
								<div class="col-md-6">
									<label class="radio-inline" for="radios-1_<%=dto.getNhQNum()%>"><input name="radios_<%=dto.getNhQNum()%>" id="radios-1_<%=dto.getNhQNum()%>" type="radio" value="1" class="multi2" required>	매우 아니다</label>
									<label class="radio-inline" for="radios-2_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-2_<%=dto.getNhQNum()%>" type="radio" value="2" class="multi2"> 아니다</label>
									<label class="radio-inline" for="radios-3_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-3_<%=dto.getNhQNum()%>" type="radio" value="3" class="multi2"> 보통이다</label>
									<label class="radio-inline" for="radios-4_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-4_<%=dto.getNhQNum()%>" type="radio" value="4" class="multi2"> 그렇다</label>
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
									<input type="text" id="other-text1" name="data1" placeholder="이유를 간단히 작성해주세요." />
								</div>
								</div>
					<%
							}else if(i==9){
					%>
								<div class="form-group text-left">
								<label class="col-md-6 control-label" for="radios_<%=dto.getNhQNum()%>"><%=dto.getNhQNum()%> . <%=dto.getNhQKr()%></label>
								<div class="col-md-6">
									<label class="radio-inline" for="radios-1_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-1_<%=dto.getNhQNum()%>" type="radio" value="1" class="multi3" required>	매우 아니다</label>
									<label class="radio-inline" for="radios-2_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-2_<%=dto.getNhQNum()%>"type="radio" value="2" class="multi3"> 아니다</label>
									<label class="radio-inline" for="radios-3_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-3_<%=dto.getNhQNum()%>"type="radio" value="3" class="multi3"> 보통이다	</label>
									<label class="radio-inline" for="radios-4_<%=dto.getNhQNum()%>">	<input name="radios_<%=dto.getNhQNum()%>" id="radios-4_<%=dto.getNhQNum()%>"type="radio" value="4" class="multi3"> 그렇다</label>
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
									<input type="text" id="other-text2" name="data2" placeholder="이유를 간단히 작성해주세요." />
								</div>
								</div>
					<%
					}else{
					%>	
							<div class="form-group">
							<label class="col-md-7 col-xs-4 control-label"	for="radios_<%=dto.getNhQNum()%>"><%=dto.getNhQNum()%> . <%=dto.getNhQKr()%></label>
							<div class="col-md-7 col-xs-4">
							<label class="radio-inline" for="radios-1_<%=dto.getNhQNum()%>">
							<input name="radios_<%=dto.getNhQNum()%>" 	id="radios-1_<%=dto.getNhQNum()%>" type="radio" value="1"	onclick="hide()" required> 매우 아니다	</label>
							<label class="radio-inline" for="radios-2_<%=dto.getNhQNum()%>">
							<input name="radios_<%=dto.getNhQNum()%>"		id="radios-2_<%=dto.getNhQNum()%>" type="radio" value="2"	onclick="hide()"> 아니다 </label>
							<label class="radio-inline" for="radios-3_<%=dto.getNhQNum()%>">
							<input name="radios_<%=dto.getNhQNum()%>"		id="radios-3_<%=dto.getNhQNum()%>" type="radio" value="3"	onclick="hide()"> 보통이다 </label>
							<label class="radio-inline" for="radios-4_<%=dto.getNhQNum()%>">
							<input name="radios_<%=dto.getNhQNum()%>"		id="radios-4_<%=dto.getNhQNum()%>" type="radio" value="4"	onclick="hide()"> 그렇다 </label>
							<label class="radio-inline" for="radios-5_<%=dto.getNhQNum()%>">
							<input name="radios_<%=dto.getNhQNum()%>"		id="radios-5_<%=dto.getNhQNum()%>" type="radio" value="5"	onclick="hide()"> 매우 그렇다	 </label> 
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
						<%
							List<NhQEn> dtos2 = (List<NhQEn>) request.getAttribute("nhqen");
							NhQEn dto2 = null;
							for (int i = 0; i < dtos2.size(); i++) {
								dto2 = dtos2.get(i);
								if(i==8){
						%>
									<div class="form-group">
									<label class="col-md-6 control-label" for="radios_<%=dto2.getNhQNum()%>"><%=dto2.getNhQNum()%> . <%=dto2.getNhQEn()%></label>
									<div class="col-md-6">
									<label class="radio-inline" for="radios-1_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-1_<%=dto2.getNhQNum()%>" type="radio" value="1" class="multi4" required>	Strongly Disagree</label>
									<label class="radio-inline" for="radios-2_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-2_<%=dto2.getNhQNum()%>"type="radio" value="2" class="multi4"> Disagree	</label>
									<label class="radio-inline" for="radios-3_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-3_<%=dto2.getNhQNum()%>"type="radio" value="3" class="multi4"> Neutral</label>
									<label class="radio-inline" for="radios-4_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-4_<%=dto2.getNhQNum()%>"type="radio" value="4" class="multi4"> Agree	</label>
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
									<input type="text" id="other-text1" name="data1" placeholder="Please write down the reason simply" />
								</div>
								</div>
						<%
							}else if(i==9){
						%>
								<div class="form-group">
								<label class="col-md-6 control-label" for="radios_<%=dto2.getNhQNum()%>">	<%=dto2.getNhQNum()%> . <%=dto2.getNhQEn()%></label>
								<div class="col-md-6">
								<label class="radio-inline" for="radios-1_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-1_<%=dto2.getNhQNum()%>"type="radio" value="1" class="multi5" required>Strongly Disagree	</label>
								<label class="radio-inline" for="radios-2_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-2_<%=dto2.getNhQNum()%>"type="radio" value="2" class="multi5"> Disagree	</label>
								<label class="radio-inline" for="radios-3_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-3_<%=dto2.getNhQNum()%>"type="radio" value="3" class="multi5"> Neutral </label>
								<label class="radio-inline" for="radios-4_<%=dto2.getNhQNum()%>"><input name="radios_<%=dto2.getNhQNum()%>" id="radios-4_<%=dto2.getNhQNum()%>"type="radio" value="4" class="multi5"> Agree	</label>
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
								<input type="text" id="other-text2" name="data2" placeholder="Please write down the reason simply" />
								</div>
								</div>	
						<%
							}else{
						%>
								<div class="form-group">
								<label class="col-md-7 col-xs-4 control-label"	for="radios_<%=dto2.getNhQNum()%>"><%=dto2.getNhQNum()%> . <%=dto2.getNhQEn()%></label>
								<div class="col-md-7 col-xs-4">
								<label class="radio-inline" for="radios-1_<%=dto2.getNhQNum()%>">
								<input name="radios_<%=dto2.getNhQNum()%>" 	id="radios-1_<%=dto2.getNhQNum()%>" type="radio" value="1"	onclick="hide()" required> Strongly Disagree	</label>
								<label class="radio-inline" for="radios-2_<%=dto2.getNhQNum()%>">
								<input name="radios_<%=dto2.getNhQNum()%>"	id="radios-2_<%=dto2.getNhQNum()%>" type="radio" value="2"	onclick="hide()"> Disagree </label>
								<label class="radio-inline" for="radios-3_<%=dto2.getNhQNum()%>">
								<input name="radios_<%=dto2.getNhQNum()%>"	id="radios-3_<%=dto2.getNhQNum()%>" type="radio" value="3"	onclick="hide()"> Neutral </label>
								<label class="radio-inline" for="radios-4_<%=dto2.getNhQNum()%>">
								<input name="radios_<%=dto2.getNhQNum()%>"	id="radios-4_<%=dto2.getNhQNum()%>" type="radio" value="4"	onclick="hide()"> Agree </label>
								<label class="radio-inline" for="radios-5_<%=dto2.getNhQNum()%>">
								<input name="radios_<%=dto2.getNhQNum()%>"	id="radios-5_<%=dto2.getNhQNum()%>" type="radio" value="5"	onclick="hide()"> Strong Agree </label> 
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
