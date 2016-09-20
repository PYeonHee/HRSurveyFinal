<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmQEn"%>
<%@ page import="java.util.List"%>
<html>
<head></head>
<title>IBM HR Survey</title>
 

<body>

<jsp:include page="Header.jsp" flush="true" />

   <div class="container-fluid text-center">
      <div class="row content">
         <div class="col-sm-2 sidenav">
            <p>
               <a href="#"></a>
            </p>
            <p>
               <a href="#"></a>
            </p>
            <p>
               <a href="#"></a>
            </p>
         </div>
         <script type="text/javascript">
            function addSrvy() {
         <%HmQEn newDto = null;%>
            }
         </script>
         <div class="form-group col-sm-8 col-md-20 text-left">
            <h1>For Hiring manager</h1>

            <form id="modify" name="modify" action="modComplete" method="post">
               <p>
                  <button type="button" class="btn btn-primary" id="add"
                     onclick="addSrvy" value="Add" >Add</button>
               </p>
               <p>
               <div class="form-group" >
                  <div class="form-group" style="position: left;" id="TextBoxContainer">
                    <%
						List<HmQEn> dtos = (List<HmQEn>) request.getAttribute("hmqen");
						HmQEn dto = null;
						for (int i = 0; i < dtos.size(); i++) {
							dto = dtos.get(i);
					%>
                     <!-- Multiple Radios (inline) -->

                     <label for="radios_<%=dto.getHmQNum()%>">Q<%=dto.getHmQNum()%></label>
                     
                     <input type='textbox' value="<%=dto.getHmQEn()%>" style="width:800px;" id=''>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <button type="button" class="btn btn-danger" id="rm"
                        onclick="delSrvy()">Remove</button>
                     <br>
                     <%
                        } 
                     %>
                     <script type="text/javascript">
                     $(function () {
                      $("#add").bind("click", function () {
                          var div = $("<div />");
                          div.html(GetDynamicTextBox(""));
                          $("#TextBoxContainer").append(div);
                      });
                      $("#btnGet").bind("click", function () {
                          var values = "";
                          $("input[name=DynamicTextBox]").each(function () {
                              values += $(this).val() + "\n";
                          });
                          alert(values);
                      });
                      $("body").on("click", ".remove", function () {
                          $(this).closest("div").remove();
                      });
                  });
                     
                     <%
                     
                     for (int i = dto.getHmQNum(); i < 16; i++) {
                     
                        
                  %>
                  
                  function GetDynamicTextBox(value) { 
                      return  '<label for="radios_<%=i%>">Q<%=i%> </label>'+'<input style = "width:800px;" name = "DynamicTextBox" type="text" value = "' + value + '" />&nbsp;' +
                            '<button type="button" class="btn btn-danger remove" id="rm" onclick="delSrvy()">Remove</button>'
                     
                  }
                  
                   <%
                     
                     }
                  %>
                  </script>
                  </div>
               </div>
               <button type="button" class="btn btn-success">Apply</button>
               
               
      

            </form>
         </div>
         <div class="col-sm-2 sidenav"></div>
      </div>
   </div>

   <jsp:include page="Footer.jsp" flush="true" />



</body>
</html>