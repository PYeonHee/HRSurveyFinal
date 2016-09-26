<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhQEn"%>
<%@ page import="java.util.List"%>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<title>IBM HR Survey</title>
<meta charset="utf-8">
</head>

<body>
	<%@ include file="Header.jsp"%>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="form-group col-md-12 col-lg-12 text-left"
				style="margin-left: 50px;">
				<h1>For New Hire</h1>
				<form id="modify" name="modify" action="nhQKrMod" method="post">
					<%
						List<NhQKr> dtos = (List<NhQKr>) request.getAttribute("nhqkr");
						List<NhQEn> dtos2 = (List<NhQEn>) request.getAttribute("nhqen");
						int cnt = (Integer) request.getAttribute("cntnhqkr");
						NhQKr dto = null;
						NhQEn dto2 = null;
					%>
					<p>
						<button type="button"
							class="w3-btn w3-pink w3-border w3-round-large"
							style="color: white;" id="addDefault">Add A Type</button>
						<button type="button"
							class="w3-btn w3-teal w3-border w3-round-large"
							style="color: white;" id="addText">Add B Type</button>
						<button type="button"
							class="w3-btn w3-purple w3-border w3-round-large"
							style="color: white;" id="addC">Add C Type</button>
					<p>
						<script type="text/javascript">
                        var ind =<%=cnt%>;
                         $(function() {
                            $("#addDefault").bind("click", function() {
                               ind = ind + 1;
                               if (ind < 16) {
                                  var div = "<div class='form-group-default' id='TextBoxContainer"+ind+"'>";
                                     div += "<label for='radios_"+ind+"'>Q"+ (ind+nullcnt)
                                           + "&nbsp;KR&nbsp;&nbsp;</label><input style = 'width:800px;' name = 'nhqKr"+(ind+nullcnt)+"' type='text' value = '' /><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>EN</b>&nbsp;&nbsp;<input style = 'width:800px;' name = 'nhqEn"+(ind+nullcnt)+"' type='text' value = ''  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                                           + "<input type='hidden' name='nhqType" + (ind+nullcnt) + "' value='A'>"    
                                           + "<button type='button' class='w3-btn w3-pink w3-border w3-round-large' style='color: white;' id='rm' onclick='delSrvy("+ind+")'>Remove</button></div><br>";
                                     $("#total").append(div);
                                 } else {
                                    ind = 15;
                                 }
                                });
                           $("#addText").bind("click", function() {
                              ind = ind + 1;
                              if (ind < 16) {
                                 var div = "<div class='form-group-text' id='TextBoxContainer"+ind+"'>";
                                    div += "<label for='radios_"+ind+"'>Q"+ (ind+nullcnt)
                                          + "&nbsp;KR&nbsp;&nbsp;</label><input style = 'width:800px;' name = 'nhqKr"+(ind+nullcnt)+"' type='text' value = '' /><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>EN</b>&nbsp;&nbsp;<input style='width: 800px;' name = 'nhqEn"+(ind+nullcnt)+"' type='text' value = '' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                                          + "<input type='hidden' name='nhqType" + (ind+nullcnt) + "' value='B'>"
                                               + "<button class='w3-btn w3-teal w3-border w3-round-large' type='button' id='rm' style='color: white;' onclick='delSrvy("+ind+")'>Remove</button></div><br>";
                                    $("#total").append(div);
                                } else {
                                   ind = 15;
                                }
                               });
                           $("#addC").bind("click", function() {
                               ind = ind + 1;
                               if (ind < 16) {
                                  var div = "<div class='form-group-text' id='TextBoxContainer"+ind+"'>";
                                     div += "<label for='radios_"+ind+"'>Q"+ (ind+nullcnt)
                                           + "&nbsp;KR&nbsp;&nbsp;</label><input style = 'width:800px;' name = 'nhqKr"+(ind+nullcnt)+"' type='text' value = '' /><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>EN</b>&nbsp;&nbsp;<input style='width: 800px;' name = 'nhqEn"+(ind+nullcnt)+"' type='text' value = '' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                                           + "<input type='hidden' name='nhqType" + (ind+nullcnt) + "' value='C'>"
                                                + "<button class='w3-btn w3-purple w3-border w3-round-large' type='button' id='rm' style='color: white;' onclick='delSrvy("+ind+")'>Remove</button></div><br>";
                                     $("#total").append(div);
                                 } else {
                                    ind = 15;
                                 }
                                });
                             });
                     </script>
						<script>
                         var nullcnt = 0;
                        function delSrvy(a){
                           ind = ind - 1;
                           if(ind > 0){
                              var btn = document.getElementById("TextBoxContainer"+a);
                              btn.remove();
                              nullcnt = nullcnt+1;
                            }else{
                               ind = 1;
                            }
                        }
                 </script>
					<div class="form-group" id="total">
						<%
							for (int i = 0; i < cnt; i++) {
								dto = dtos.get(i);
								dto2 = dtos2.get(i);
								if (i < 9) {
						%>
						<div class="form-group" id="TextBoxContainer<%=dto.getNhQNum()%>"
							style="position: left;">
							<!-- Multiple Radios (inline) -->
							<label for="radios_<%=dto.getNhQNum()%>">Q<%=dto.getNhQNum()%></label>&nbsp;&nbsp;
							<b>KR</b>&nbsp;&nbsp;<input name="nhqKr<%=dto.getNhQNum()%>"
								type="text" value="<%=dto.getNhQKr()%>" style="width: 800px;"><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>EN</b>&nbsp;&nbsp;<input
								name="nhqEn<%=dto2.getNhQNum()%>" type="text"
								value="<%=dto2.getNhQEn()%>" style="width: 800px;">
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden"
								name="nhqType<%=dto.getNhQNum()%>" value="<%=dto.getNhQType()%>">
							<%
								if (dto.getNhQType().equals("A")) {
							%>
							<button type="button"
								class="w3-btn w3-pink w3-border w3-round-large" id="rm"
								onclick="delSrvy(<%=dto.getNhQNum()%>)">Remove</button>
							<%
								} else if (dto.getNhQType().equals("B")) {
							%>
							<button type="button"
								class="w3-btn w3-teal w3-border w3-round-large" id="rm"
								onclick="delSrvy(<%=dto.getNhQNum()%>)">Remove</button>
							<%
								} else if (dto.getNhQType().equals("C")) {
							%>
							<button type="button"
								class="w3-btn w3-purple w3-border w3-round-large" id="rm"
								onclick="delSrvy(<%=dto.getNhQNum()%>)">Remove</button>
							<%
								} else {
							%>
							<button type="button"
								class="w3-btn w3-purple w3-border w3-round-large" id="rm"
								onclick="delSrvy(<%=dto.getNhQNum()%>)">Remove</button>
							<%
								}
							%>

							<%
								}
									if (i >= 9) {
							%>

							<div class="form-group" id="TextBoxContainer<%=dto.getNhQNum()%>"
								style="position: left;">
								<!-- Multiple Radios (inline) -->
								<label for="radios_<%=dto.getNhQNum()%>">Q<%=dto.getNhQNum()%></label>
								<b>KR</b>&nbsp;&nbsp;<input name="nhqKr<%=dto.getNhQNum()%>"
									type="text" value="<%=dto.getNhQKr()%>" style="width: 800px;"><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>EN</b>&nbsp;&nbsp;<input
									name="nhqEn<%=dto2.getNhQNum()%>" type="text"
									value="<%=dto2.getNhQEn()%>" style="width: 800px;">
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden"
									name="nhqType<%=dto.getNhQNum()%>"
									value="<%=dto.getNhQType()%>">
								<%
									if (dto.getNhQType().equals("A")) {
								%>
								<button type="button"
									class="w3-btn w3-pink w3-border w3-round-large" id="rm"
									onclick="delSrvy(<%=dto.getNhQNum()%>)">Remove</button>
								<%
									} else if (dto.getNhQType().equals("B")) {
								%>
								<button type="button"
									class="w3-btn w3-teal w3-border w3-round-large" id="rm"
									onclick="delSrvy(<%=dto.getNhQNum()%>)">Remove</button>
								<%
									} else if (dto.getNhQType().equals("C")) {
								%>
								<button type="button"
									class="w3-btn w3-purple w3-border w3-round-large" id="rm"
									onclick="delSrvy(<%=dto.getNhQNum()%>)">Remove</button>
								<%
									} else {
								%>
								<button type="button"
									class="w3-btn w3-purple w3-border w3-round-large" id="rm"
									onclick="delSrvy(<%=dto.getNhQNum()%>)">Remove</button>
								<%
									}
										} else {
										}
								%><br>
							</div>
							<%
								}
							%>
						</div>

						<input type="hidden" name="nhqkrcnt" id="nhqkrcnt" value="">
						<button type="submit"
							onclick='document.getElementById("nhqkrcnt").value = ind + nullcnt;window.open("./askMoreMod", "Saved Successfully","width=150", "height=160", "resizable=yes", "scrollbars=no", "status=yes");'
							class="w3-btn w3-blue w3-border w3-round-large">Apply</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>