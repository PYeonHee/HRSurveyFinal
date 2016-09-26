<%@page import="java.util.List"%>
<%@page import="com.sanhak.hrsurvey.domain.SurveyReminderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
th, td {
	border: 1px solid black;
}
</style>
</head>
<title>IBM HR Survey</title>
<meta charset="utf-8">

<body>

	<%@ include file="Header.jsp"%>
	<script>
		function btn() {
			var hmV = "";
			var nhV = "";
			var recV = "";
			var secnt = 0;
			$("input[name=HM]:checked").each(function() {
				hmV += $(this).val();
			});
			$("input[name=NH]:checked").each(function() {
				nhV += $(this).val();
			});
			$("input[name=REC]:checked").each(function() {
				recV += $(this).val();
			});
			alert(nhV);
			alert(hmV);
			alert(recV);
			window.open('./AddTextMail?hm=' + hmV + '&nh=' + nhV + '&rec='
					+ recV + '', 'mailpop', 'width=370', 'height=360',
					'resizable=yes', 'scrollbars=no', 'status=yes');
		}
	</script>

	<div class="container-fluid text-center">
		<div class="row content">
			<h1>Unsurveyed List</h1>

			<div class="form-group col-md-12 col-lg-12 text-center">

				<table
					style="border: 1px solid #ccc; table-layout: fixed; word-break: break-all; margin-left: auto; margin-right: auto; width: 1400px;"
					height="auto">
					<colgroup>
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
					</colgroup>
					<thead style="text-align: center;">
						<tr>
							<th scope="col" style="text-align: center;"><font size="4px">입사일</font></th>
							<th scope="col" style="text-align: center;"><font size="4px">Serial
									No.</font></th>
							<th scope="col" style="text-align: center;"><font size="4px">New
									Hire</font></th>
							<th scope="col" style="text-align: center;"><font size="4px">발송일</font></th>
							<th scope="col" style="text-align: center;"><font size="4px">Hiring
									Manager</font></th>
							<th scope="col" style="text-align: center;"><font size="4px">발송일</font></th>
							<th scope="col" style="text-align: center;"><font size="4px">Recruiter</font></th>
							<th scope="col" style="text-align: center;"><font size="4px">발송일</font></th>
						</tr>
					</thead>
					<tbody>
						<%
							List<SurveyReminderDto> SRdtos = (List<SurveyReminderDto>) request.getAttribute("showList");
							int cnt = SRdtos.size();
							if (cnt != 0) {
								for (int i = 0; i < cnt; i++) {
						%>
						<tr>
							<td><font size="3px"><%=SRdtos.get(i).getNewHireDate()%></font></td>
							<td><font size="3px"><%=SRdtos.get(i).getSerialNo()%></font>
								<input type="hidden" name="serial"
								value="<%=SRdtos.get(i).getSerialNo()%>"></td>
							<%
								if (SRdtos.get(i).getResultCheckNH().equals("Y")) {
							%>
							<td><input type="checkbox" name="NH" id="NH_<%=i%>"
								value="<%=SRdtos.get(i).getNewHireID()%>" disabled="disabled">
								<font size="3px"><%=SRdtos.get(i).getNewHireName()%></font></td>
							<%
								} else {
							%>
							<td><input type="checkbox" name="NH" id="NH_<%=i%>"
								value="<%=SRdtos.get(i).getNewHireID()%>"> <font
								size="3px"><%=SRdtos.get(i).getNewHireName()%></font></td>
							<%
								}
							%>
							<td><font size="3px"><%=SRdtos.get(i).getMailDateNH()%></font></td>
							<%
								if (SRdtos.get(i).getResultCheckHM().equals("Y")) {
							%>
							<td><input type="checkbox" name="HM" id="HM_<%=i%>"
								value="<%=SRdtos.get(i).getHiringManagerID()%>"
								disabled="disabled"> <font size="3px"><%=SRdtos.get(i).getHiringManagerName()%></font></td>
							<%
								} else {
							%>
							<td><input type="checkbox" name="HM" id="HM_<%=i%>"
								value="<%=SRdtos.get(i).getHiringManagerID()%>"> <font
								size="3px"><%=SRdtos.get(i).getHiringManagerName()%></font></td>

							<%
								}
							%>
							<td><font size="3px"><%=SRdtos.get(i).getMailDateHM()%></font></td>
							<%
								if (SRdtos.get(i).getResultCheckREC().equals("Y")) {
							%>
							<td><input type="checkbox" name="REC" id="REC_<%=i%>"
								value="<%=SRdtos.get(i).getRecruiterID()%>" disabled="disabled">
								<font size="3px"><%=SRdtos.get(i).getRecruiterName()%></font></td>
							<%
								} else {
							%>
							<td><input type="checkbox" name="REC" id="REC_<%=i%>"
								value="<%=SRdtos.get(i).getRecruiterID()%>"> <font
								size="3px"><%=SRdtos.get(i).getRecruiterName()%></font></td>

							<%
								}
							%>
							<td><font size="3px"><%=SRdtos.get(i).getMailDateREC()%></font></td>

						</tr>
						<%
							}
							} else {
						%>
						<tr>
							<td colspan="6">No Results.</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<button onclick="btn()">test</button>
			</div>
		</div>
	</div>




</body>
</html>