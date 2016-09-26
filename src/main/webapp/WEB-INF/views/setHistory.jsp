<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.HmQEn"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.NhQEn"%>
<%@ page import="com.sanhak.hrsurvey.domain.RecQKr"%>
<%@ page import="com.sanhak.hrsurvey.domain.RecQEn"%>
<%@ page import="java.util.List"%>

<html>
<head>
<style>
table {
   margin: auto;
}
</style>
<title>Saved Successfully</title>
</head>

<body>
<%@ include file="Header.jsp"%>
   <div class="container-fluid text-center">
      <div class="row content">
      <div class="col-md-8 col-lg-8 text-center">
            <h1><center>Survey Question Version Management</center></h1>
         
         <br>
         <form id="modify" name="modify" action="./saveHistory" method="post">
            <p>
               Create Question-Version Successfully. <br>
               <b style="color:red">Please Click the 'OK' button below.</b>
               You can check the version of the Survey Question through header menu "Question Version Management"
            </p>

            <%
               List<HmQKr> dtos = (List<HmQKr>) request.getAttribute("hmqkr");
               List<HmQEn> dtos2 = (List<HmQEn>) request.getAttribute("hmqen");
               int cnt = (int) request.getAttribute("cnthmqkr");
               HmQKr dto = null;
               HmQEn dto2 = null;
            %>
            <!-- <div class="form-group" id="total"> -->
            <%
               for (int i = 0; i < cnt; i++) {
                  dto = dtos.get(i);
                  dto2 = dtos2.get(i);
            %>
            <input name="hmqKr<%=dto.getHmQNum()%>" type="hidden"
               value="<%=dto.getHmQKr()%>" style="width: 800px;"> <input
               name="hmqEn<%=dto2.getHmQNum()%>" type="hidden"
               value="<%=dto2.getHmQEn()%>" style="width: 800px;">
            <%
               }
            %>
            <%
               List<NhQKr> dtos3 = (List<NhQKr>) request.getAttribute("nhqkr");
               List<NhQEn> dtos4 = (List<NhQEn>) request.getAttribute("nhqen");
               int cnt2 = (int) request.getAttribute("cntnhqkr");
               NhQKr dto3 = null;
               NhQEn dto4 = null;
            %>
            <!-- <div class="form-group" id="total"> -->
            <%
               for (int i = 0; i < cnt2; i++) {
                  dto3 = dtos3.get(i);
                  dto4 = dtos4.get(i);
            %>
            <input name="nhqKr<%=dto3.getNhQNum()%>" type="hidden"
               value="<%=dto3.getNhQKr()%>" style="width: 800px;"> <input
               name="nhqEn<%=dto4.getNhQNum()%>" type="hidden"
               value="<%=dto4.getNhQEn()%>" style="width: 800px;">
            <%
               }
            %>
            <%
               List<RecQKr> dtos5 = (List<RecQKr>) request.getAttribute("recqkr");
               List<RecQEn> dtos6 = (List<RecQEn>) request.getAttribute("recqen");
               int cnt3 = (int) request.getAttribute("cntrecqkr");
               RecQKr dto5 = null;
               RecQEn dto6 = null;
            %>
            <!-- <div class="form-group" id="total"> -->
            <%
               for (int i = 0; i < cnt3; i++) {
                  dto5 = dtos5.get(i);
                  dto6 = dtos6.get(i);
            %>
            <input name="recqKr<%=dto5.getRecQNum()%>" type="hidden"
               value="<%=dto5.getRecQKr()%>" style="width: 800px;"> <input
               name="recqEn<%=dto6.getRecQNum()%>" type="hidden"
               value="<%=dto6.getRecQEn()%>" style="width: 800px;">
            <%
               }
            %>

            <input type="hidden" name="hmqkrcnt" id="hmqkrcnt" value="">
            <input type="hidden" name="nhqkrcnt" id="nhqkrcnt" value="">
            <input type="hidden" name="recqkrcnt" id="recqkrcnt" value="">
            <br><br>
            <button type="submit"
               onclick='document.getElementById("hmqkrcnt").value = ind + nullcnt;'
               class="btn btn-success">OK</button>
         </form>
      </div></div>
      <div class="col-sm-2 sidenav"></div>
   </div>
</body>

</html>